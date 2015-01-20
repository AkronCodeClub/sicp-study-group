describe("abs", function() {

  it("returns the number when it is positive", function() {
    expect(abs(10)).toBe(10);
  });

  it("returns the positive number when it is negative", function() {
    expect(abs(-10)).toBe(10);
  });

  it("returns zero when given zero", function() {
    expect(abs(0)).toBe(0);
  });
});

describe("sum_squares_of_two_biggest", function() {

  it("returns 2 when given all arguments are 1", function() {
    expect(sum_squares_of_two_biggest(1, 1, 1)).toBe(2);
  });

  it("returns 8 when given all arguments are 2", function() {
    expect(sum_squares_of_two_biggest(2, 2, 2)).toBe(8);
  });

  it("returns 18 when given when given 3, 3, and a smaller number", function() {
    expect(sum_squares_of_two_biggest(3, 3, 2)).toBe(18);
  });

  it("returns 13 when given 1, 2, and 3", function() {
    expect(sum_squares_of_two_biggest(1, 2, 3)).toBe(13);
  });

  it("returns the proper result when the first arg is the smallest", function() {
    expect(sum_squares_of_two_biggest(2, 4, 6)).toBe(52);
  });

  it("returns the proper result when the second arg is the smallest", function() {
    expect(sum_squares_of_two_biggest(4, 2, 6)).toBe(52);
  });

  it("returns the proper result when the first arg is the smallest", function() {
    expect(sum_squares_of_two_biggest(6, 4, 2)).toBe(52);
  });
});
