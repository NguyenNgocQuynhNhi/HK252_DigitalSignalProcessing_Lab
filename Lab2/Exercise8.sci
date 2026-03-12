clear; clc;

// Original Signal
nx = -2:1;
x  = [1, -2, 3, 6];

// --- Question a: y1(n) = x(-n) ---
ny1 = -1:2;
y1  = [6, 3, -2, 1]; 
scf(0); clf(); f=gcf(); f.background=color('white');
subplot(2,1,1); plot2d3(nx, x); h=gce(); h.children.thickness=3;
title("Original x(n)");
xlabel("n"); ylabel("Amplitude");

subplot(2,1,2); plot2d3(ny1, y1); h=gce(); h.children.thickness=3; h.children.foreground=color('red'); 
title("y1(n) = x(-n)");
xlabel("n"); ylabel("Amplitude");

// --- Question b: y2(n) = x(n+3) ---
ny2 = -5:-2;
y2  = x; 
scf(1); clf(); f=gcf(); f.background=color('white');
subplot(2,1,1); plot2d3(nx, x); h=gce(); h.children.thickness=3; 
title("Original x(n)");
xlabel("n"); ylabel("Amplitude");

subplot(2,1,2); plot2d3(ny2, y2); h=gce(); h.children.thickness=3; h.children.foreground=color('blue'); 
title("y2(n) = x(n+3)");
xlabel("n"); ylabel("Amplitude");

// --- Question c: y3(n) = 2x(-n-2) ---
ny3 = -3:0;
y3  = [12, 6, -4, 2];
scf(2); clf(); f=gcf(); f.background=color('white');
subplot(2,1,1); plot2d3(nx, x); h=gce(); h.children.thickness=3; 
title("Original x(n)");
xlabel("n"); ylabel("Amplitude");

subplot(2,1,2); plot2d3(ny3, y3); h=gce(); h.children.thickness=3; h.children.foreground=color('darkgreen'); 
title("y3(n) = 2x(-n-2)");
xlabel("n"); ylabel("Amplitude");
