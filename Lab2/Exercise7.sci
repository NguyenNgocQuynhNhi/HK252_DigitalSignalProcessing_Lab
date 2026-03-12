clear; clc; clf();

n = -1:3;
x1 = [0, 0, 1, 3, -2]; 
x2 = [0, 1, 2, 3, 0];  
y  = x1 .* x2; 

f = gcf(); f.background = color('white');

// Draw x1(n)
subplot(3, 1, 1);
plot2d3(n, x1); h1=gce(); h1.children.thickness=3; h1.children.foreground=color('red');
plot(n, x1, "ro"); h2=gce(); h2.children.mark_size=10;
title("Signal x1(n)", "fontsize", 4); xlabel("n"); ylabel("Amplitude"); xgrid(color('gray'));

// Draw x2(n)
subplot(3, 1, 2);
plot2d3(n, x2); h3=gce(); h3.children.thickness=3; h3.children.foreground=color('blue');
plot(n, x2, "bo"); h4=gce(); h4.children.mark_size=10;
title("Signal x2(n)", "fontsize", 4); xlabel("n"); ylabel("Amplitude"); xgrid(color('gray'));

// Draw y(n)
subplot(3, 1, 3);
plot2d3(n, y); h5=gce(); h5.children.thickness=3; h5.children.foreground=color('darkmagenta');
plot(n, y, "mo"); h6=gce(); h6.children.mark_size=10;
title("Product Signal y(n) = x1(n) .* x2(n)", "fontsize", 4); xlabel("n"); ylabel("Amplitude"); xgrid(color('gray'));
