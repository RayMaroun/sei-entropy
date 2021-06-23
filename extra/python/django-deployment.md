# Django Deployment

In order to deploy our Django app with a Postgres Database, we're going to utilize a virtual environment inside of Python. 



First thing we're going to do is go into our terminal, and head to the directory with our application in it

Next let's create a virtual environment in here so we can install and list all of the specific packages we need for our applicaitons.  


```bash
python3 -m venv env
```

Now lets start the virtual environment

```bash
# Mac / Linux
source env/bin/activate

# Windows
source env/Scripts/activate
```

Now we install our dependencies in order to deploy to Heroku

```bash
pip3 install django gunicorn whitenoise dj-database-url psycopg2 python-dotenv
```

Then create a [Procfile](https://devcenter.heroku.com/articles/procfile#:~:text=Heroku%20apps%20include%20a%20Procfile,process%2C%20such%20as%20a%20clock), gitignore, env, and a static folder

```bash
touch Procfile .env .gitignore
mkdir static
```

![](../.gitbook/assets/image%20%2892%29.png)

Inside our Procfile add this line so Heroku knows to run our server using `gunicorn` on app startup

```bash
web: gunicorn <nameOfProject>.wsgi --log-file -
```

Now we need to create a `requirements.txt`

Use this command

```bash
pip3 freeze > requirements.txt
```

Your file should look like this, unless you have other packages as well

![](../.gitbook/assets/image%20%2823%29.png)

Add these files to the `.gitignore`

```bash
*.log
*.pot
*.pyc
__pycache__/
local_settings.py
venv/
.env
```

Git add and commit

Now we want to set up the Heroku side of things really quickly, in your terminal run

```bash
heroku create <Your-App>
```

Go to your `settings.py` and add these

```bash
# Make sure this is there
import os

# At the top with the other imports add
import dotenv
import dj_database_url


# Add .env variables before the Secret Key
dotenv_file = os.path.join(BASE_DIR, ".env")
if os.path.isfile(dotenv_file):
    dotenv.load_dotenv(dotenv_file)

# Set your environment variables, make sure you're importing os at the top of settings.py
# This is going to allow us to use an .env
SECRET_KEY = os.environ.get('SECRET_KEY')
EMAIL_HOST_USER = os.environ.get('EMAIL_HOST_USER')
EMAIL_HOST_PASSWORD = os.environ.get('EMAIL_HOST_PASSWORD')


```

Then in the terminal run

```bash
heroku config:set SECRET_KEY=YOUR SECRET KEY --app myappname
```

After we've done that stay in settings.py and change these as well

```bash
# Set debug to False
DEBUG = False

# Allow heroku app to access your application
ALLOWED_HOSTS = ['nameofapp.herokuapp.com', '0.0.0.0', 'localhost', '127.0.0.1']

# Modify Installed Apps to include
INSTALLED_APPS = [
    ...
    'whitenoise.runserver.nostatic',
]

# Modify Middleware to include

MIDDLEWARE = [
    'whitenoise.middleware.WhiteNoiseMiddleware',
]

# Then at the bottom

STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
STATIC_URL = '/static/'

# location where you will store your static files
STATICFILES_DIRS = [
    os.path.join(BASE_DIR,'static')
]
MEDIA_ROOT = os.path.join(BASE_DIR,'media')
MEDIA_URL = '/media/'

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'console': {
            'class': 'logging.StreamHandler',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['console'],
             'level': os.getenv('DJANGO_LOG_LEVEL', 'DEBUG'),
        },
    },
}


```

After databases add

```bash
db_from_env = dj_database_url.config(conn_max_age=600)
DATABASES['default'].update(db_from_env)
```

Now add and commit

Now let's add postgres

The following commands create postgresql database on heroku for you app and fetch its url.

```text
heroku addons:create heroku-postgresql:hobby-dev
heroku config -s | grep DATABASE_URL
```

Lets get the name of our new database

```text
heroku pg:info
```

Now let's push our local database up

```text
PGUSER=<The user needed to enter the database> PGPASSWORD=<The password needed to enter the database> 
heroku pg:push <Your local database name> DATABASE_URL --app postgresql-animate-39502 << Your database will have a different name
```

Now let's disable the last part of development, Static Collecting

```text
heroku config:set DISABLE_COLLECTSTATIC=1

# And push to heroku
git push heroku master
```

