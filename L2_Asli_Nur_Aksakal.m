f1 = 1;
f2 = 2;
Fs = 100;
Ts = 1/Fs;
t = 0:Ts:1;
duration = 1;
n = duration * Fs;
x = sin(2*pi*f1*t) .* cos(2*pi*f2*t);

figure(1)
plot(t,x)
xlabel('Time')
ylabel('Message Signal')

x_hat = zeros(1,n);
error = zeros(1, n);
eq = zeros(1, n);
xq = zeros(1,n+1);
xq(1) = 0;
xen = zeros(1,n+1);

for k=2:n

     error(k) = x(k) - x_hat(k-1);  
     if error(k) < 0
         eq(k) = -0.05;
         x_hat(k) = xq(k-1);  
         xq(k) = eq(k) + x_hat(k);

         xen(k) = 0;  

     else
         eq(k) = 0.05;
         x_hat(k) = xq(k-1);
         xq(k) = eq(k) + x_hat(k);

         xen(k) = 1; 
     end
end

figure(2)
plot(t,x)
hold on
stairs(t,xq)  
xlabel('Time')
ylabel('Signal')
legend('Original Signal', 'Quantized Signal')

figure(3)
stem(t,xen)  
xlabel('Time')
ylabel('Quantization Levels')

x_hat2 = zeros(1,n);
error2 = zeros(1, n);
eq2 = zeros(1, n);
xq2 = zeros(1,n+1);
xq2(1) = 0;
xen2 = zeros(1,n+1);

for k=2:n
     
     error2(k) = x(k) - x_hat2(k-1);  
     if error2(k) < 0
         eq2(k) = -0.2;  
         x_hat2(k) = xq2(k-1);
         xq2(k) = eq2(k) + x_hat2(k);
         xen2(k) = 0;  
     
     else 
         eq2(k) = 0.2;  
         x_hat2(k) = xq2(k-1);
         xq2(k) = eq2(k) + x_hat2(k);
         xen2(k) = 1;   
     end
end

figure(4)
plot(t,x)
hold on
stairs(t,xq2)  
xlabel('Time')
ylabel('Signal')
legend('Original Signal', 'Quantized Signal')

figure(5)
stem(t,xen2) 
xlabel('Time')
ylabel('Quantization Levels')

x_hat3 = zeros(1,n);
error3 = zeros(1, n);
eq3 = zeros(1, n);
xq3 = zeros(1,n+1);
xq3(1) = 0;


for k=2:n
    error3(k) = x(k) - x_hat3(k-1);  
    if error3(k) < -0.1
        eq3(k) = -0.15;  
        x_hat3(k) = xq3(k-1);
        xq3(k) = eq3(k) + x_hat3(k); 

    elseif (error3(k) >= -0.1) && (error3(k) <= 0)
        eq3(k) = -0.05;
        x_hat3(k) = xq3(k-1);
        xq3(k) = eq3(k) + x_hat3(k);

    elseif (error3(k) > 0) && (error3(k) <= 0.1)
        eq3(k) = 0.05;
        x_hat3(k) = xq3(k-1);
        xq3(k) = eq3(k) + x_hat3(k);

    else  
        eq3(k) = 0.15;
        x_hat3(k) = xq3(k-1);
        xq3(k) = eq3(k) + x_hat3(k);
    end
end

figure (6)
plot(t,x)
hold on
stairs(t,xq3)  
xlabel('Time')
ylabel('Signal')
legend('Original Signal', 'Quantized Signal')