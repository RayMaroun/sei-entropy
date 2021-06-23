# Role: Places Model

## Can Talk To

- Places Controller

## Description

The Places Model is responsible for directly interacting with the data store,
reading and writing data as directed by a Controller. The data store for
'Places' can be found in
[this Google Sheet](https://docs.google.com/spreadsheets/d/1Xcv7P8vqP33w_MkyD8FY9wnqzAdAMMljPRtxkVtZXAg/edit?usp=sharing)
. Record your information in the tab associated with your group number found at
the bottom of this spreadsheet.

Any time that you get a direction, do your best to follow it, but do so as
literally as possible.

- When asked for data, you should copy the line(s) that are requested and
    send back the data to whoever asked for it.
- When asked to make a change (e.g. creating or updating) to a specific row,
    if the change is successful, send back the newly created/updated row.
- When asked to delete a row, send back the confirmation "Place with ID: (id)
    deleted."

## Errors

- If you're asked to retrieve data on a particular Place, and there is no
    Place with that ID, send back "No Place Found."
- If you're told to create or update a particular record, but the data you
    try to enter is invalid, send back "Invalid Data."
