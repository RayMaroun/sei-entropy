### Lab: Model Shapes Using Classes

A `Rectangle` is a `Shape`, and a `Square` is a `Rectangle`.

#### Creating a 'Shape' Class

Define a Shape class with the following:
- `num_sides`: set during instantiation, read-only.
- `side_length`: set during instantiation, readable and writable.
- `color`: NOT set during instantiation, readable and writable.
- `Shape.new(num_sides, side_length)` should create a shape.
- `calculate_area` methodwhich calculates the area of a 'regular' shape (all sides equal) for the given side length. The mathematical formula for this is:
```
area = num_sides * length * length / (4 * tangent(PI/num_sides))
```

#### Creating a Rectangle Class

- Rectangles should be instantiated with `Rectangle.new(3, 4)` to create a rectangle with a length of 3 and a width of 4.
- Instances of Rectangle should respond to the `#calculate_area` method and give the correct result.

#### Creating a Square Class

- Squares should be instantiated with `Square.new(4)` to create a square with all sides equal to 4.
- Instances of Square should respond to the `#calculate_area` method and give the correct result.
