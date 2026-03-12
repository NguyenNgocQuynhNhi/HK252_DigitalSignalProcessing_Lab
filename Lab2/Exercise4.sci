n = -5 : 5;
disp(n);
step_s = bool2s(n >= 0);
disp(step_s);
ramp_s = step_s .* n;
disp(ramp_s);

// ---------- Draw -----------------
clf();
plot2d3(n, ramp_s);
plot(n, ramp_s, "ro"); // Add points to more visible
xtitle("Unit Ramp Signal u_r(n)", "n", "Amplitude");
xgrid();
