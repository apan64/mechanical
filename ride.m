function stuff = ride()
    rideSpeedRad = 0; %rad/s
    gravity = 9.81; %m/s^2
    rideRadius = 15.25; %m
    personMass = 80.7; %kg, americans are fat
    angle = 0;
    
    rideSpeed = rideSpeedRad * rideRadius;
    
    bottoms = zeros(60, 80);
    tops = zeros(60, 80);
    
    increment = .1;
    
    for r = 1:60
        rideSpeedRad = rideSpeedRad + increment;
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
    axis([1, 80, 1, 60]);
    set(h, 'EdgeColor', 'none');
    xlabel('Angle (degrees)');
    ylabel('Speed (radians/10 seconds)');
    title('Heat Map of Maximum g-force');
    hold on;
    contour(bottoms./gravity, [17, 46.2], 'LineColor', [0, 0, 0]);
end