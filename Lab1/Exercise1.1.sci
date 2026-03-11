clear;
clc;
// Task 1: Vector plus constant
x = 1:4;
disp(x);    
v1 = x + 1;
disp(v1);

// Task 2: Element-wise multiplication
x = 1:4;
disp(x);
y = 5:8;
disp(y);
v2 = x .* y;    // Nhân x1*y1, x2*y2...
disp(v2);

// Task 3: Sine of linearly spaced vector
x = linspace(0, %pi, 10);
v3 = sin(x);
disp(v3);

