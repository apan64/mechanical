function stuff = ride()
    rideRPM = 0;
    rideSpeedRad = 0; %rad/s
    gravity = 9.81; %m/s^2
    rideRadius = 15.25; %m
    personMass = 80.7; %kg, americans are fat
    angle = 0;
    
    rideSpeed = rideSpeedRad * rideRadius;
    
    bottoms = zeros(120, 80);
    tops = zeros(120, 80);
    
    increment = 1;
    
    for r = 1:120
        rideRPM = rideRPM + increment;
        rideSpeedRad = rideRPM / 30; %1 rpm = 1/30 rad/s
        rideSpeed = rideSpeedRad * rideRadius;
        gForce = rideSpeed^2 / rideRadius;
        for c = 1:80
            bottoms(r, c) = gForce + (gravity * sin(c*pi/180));
            tops(r, c) = gForce - (gravity * sin(c*pi/180));
        end
    end
    
%     plot(bottoms./gravity);
%     hold on;
%     plot(tops./gravity);
    h = pcolor(bottoms./gravity);
    colorbar;
    axis([1, 80, 1, 120]);
    set(h, 'EdgeColor', 'none');
    xlabel('Angle (degrees)');
    ylabel('Speed (RPM)');
    title('Heat Map of Maximum g-force');
    hold on;
    contour(bottoms./gravity, [17, 46.2], 'LineColor', [0, 0, 0]);
end