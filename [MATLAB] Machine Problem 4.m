y0 = input('Enter initial height:  ');
v0 = input('Enter velocity:  ');
angle = input('Enter angle (with respect to x-axis): ');
ax = input('Enter initial acceleration in x:  ');
ay = input('Enter initial acceleration in y:  ');

if ay == 0
    error('Error. There is no vertical acceleration.')

else
    x0 = 0;
    vx_initial = v0 * cosd(angle);
    vy_initial = v0 * sind(angle);
    tf = roots([(1/2)*ay, vy_initial, y0]);
    tf = max(tf);
    t = [0:0.1:tf];
    x = x0 + vx_initial .* t + (1/2) * ax .* t .^2;
    y = y0 + vy_initial .* t + (1/2) * ay .* t .^2;
    
    plot(x, y, 'LineWidth', 2);
    title ('Projectile Trajectory');
    xlabel('Horizontal distance (in meters)');
    ylabel('Height (in meters)');
    grid on;
    axis tight;
    axis equal;
    hold on
    
    ax_ideal = 0;
    ay_ideal = -9.8;
    x_ideal = x0 + vx_initial .* t;
    y_ideal = y0 + vy_initial .* t + (1/2) * ay_ideal .* t .^2;
    
    plot(x_ideal, y_ideal, '-r', 'LineWidth', 2)
    legend('Non-ideal Trajectory','Ideal Trajectory')
 
end