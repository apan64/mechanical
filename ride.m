function stuff = ride()
    rideSpeedRad = 1.47; %rad/s
    gravity = 9.81; %m/s^2
    rideRadius = 15.25; %m
    personMass = 80.7; %kg, americans are fat
    angle = 0;
    
    rideSpeed = rideSpeedRad * rideRadius;
    
    bottoms = zeros(80, 80);
    tops = zeros(80, 80);
    
    increment = .05;
    
    for r = 1:80
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
    set(h, 'EdgeColor', 'none');
    xlabel('Angle (degrees)');
    ylabel('Speed (unrelated axis numbers lol)');
end