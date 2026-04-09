clear(); clc; clf();

// 1. Define signals (N=5)
x = [1, 2, -3, 2, 1];
h = [1, 0, -1, -1, 1];
N = length(x);

// 2. Matrix Method for Circular Convolution
// Build a circulant matrix for x
X_circ = zeros(N, N);
for n = 1:N
    for k = 1:N
        idx = modulo(n - k, N);
        if idx < 0 then idx = idx + N; end
        X_circ(n, k) = x(idx + 1); // +1 because Scilab index starts at 1
    end
end

y = X_circ * h'; // Compute circular convolution
printf("Circular Convolution Result: ");
disp(y');

// 3. Energy Calculation
energy_x = sum(x.^2);
energy_y = sum(y.^2);

// 4. Plotting
scf(0); clf();

subplot(3, 1, 1);
plot2d3(0:N-1, x);
poly1 = gce(); poly1.children.mark_style = 9;
xtitle("Input Signal x(n)", "n", "Amplitude");

subplot(3, 1, 2);
plot2d3(0:N-1, y);
poly2 = gce(); poly2.children.mark_style = 9;
xtitle("Circular Convolution y(n)", "n", "Amplitude");

subplot(3, 1, 3);
bar([energy_x, energy_y]);
set(gca(), "xtics_labels", ["Energy X", "Energy Y"]);
xtitle("Energy Comparison", "", "Energy Value");
