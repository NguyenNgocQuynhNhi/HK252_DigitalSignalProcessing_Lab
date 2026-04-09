clear(); clc; clf();

// 1. Define signals
x = [1, 2, -3, 2, 1];
h = [1, 0, -1];

// 2. Compute Linear Convolution using built-in function
y = convol(h, x);

// 3. Compute Energy
// Energy E = sum of squares of all samples
energy_x = sum(x.^2);
energy_y = sum(y.^2);

printf("Energy of x(n): %.2f\n", energy_x);
printf("Energy of y(n): %.2f\n", energy_y);

// 4. Plotting
scf(0); clf();

// Plot x(n)
subplot(3, 1, 1);
n_x = 0:length(x)-1;
plot2d3(n_x, x);
poly1 = gce(); poly1.children.mark_style = 9; // Add dots
xtitle("Input Signal x(n)", "n", "Amplitude");

// Plot y(n)
subplot(3, 1, 2);
n_y = 0:length(y)-1;
plot2d3(n_y, y);
poly2 = gce(); poly2.children.mark_style = 9;
xtitle("Linear Convolution y(n)", "n", "Amplitude");

// Plot Energy Comparison (Bar chart)
subplot(3, 1, 3);
bar([energy_x, energy_y]);
set(gca(), "xtics_labels", ["Energy X", "Energy Y"]);
xtitle("Energy Comparison", "", "Energy Value");
