function abs(x) {
  if (x < 0) {
    return -x;
  } else {
    return x;
  }
}

function average(x, y) {
  return (x + y) / 2;
}

function square(x) {
  return x * x;
}

function cube(x) {
  return x * x * x;
}

/////////////////////////////////////////////////////////////////////

function sum_squares_of_two_biggest(a, b, c) {
  if (a < b && a < c) {
    return (b * b) + (c * c);
  } else if (b < a && b < c) {
    return (a * a) + (c * c);
  } else {
    return (a * a) + (b * b);
  }
}
