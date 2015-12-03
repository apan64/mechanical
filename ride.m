function stuff = ride()
    rideRPM = 0; %revolutions/minute
    rideSpeedRad = 0; %rad/s
    gravity = 9.81; %m/s^2
    rideRadius = 15.25; %m
    personMass = 80.7; %kg, americans are fat
    angle = 0;
    
    rideSpeed = rideSpeedRad * rideRadius; %calculating speed along the edge of the ride, m/s
    
    bottoms = zeros(120, 80); %matrix for speeds at the bottom of the ride
    tops = zeros(120, 80); %matrix for speeds at the top of the ride
    
    increment = 1; %amount to increase speed
    
    for r = 1:120
        rideRPM = rideRPM + increment; %increment rpm
        rideSpeedRad = rideRPM / 30; %1 rpm = 1/30 rad/s
        rideSpeed = rideSpeedRad * rideRadius; %recalculate speed
        centrifugalA = rideSpeed^2 / rideRadius; %calculate centrifugal acceleration
        for c = 1:80
            bottoms(r, c) = centrifugalA + (gravity * sin(c*pi/180)); %calculate total accelerations at bottom of ride
            tops(r, c) = centrifugalA - (gravity * sin(c*pi/180)); %calculate total accelerations at top of ride
        end
    end

    h = pcolor(bottoms./gravity); %heatmap
    colormap(cool); %cool colors
    colorbar;
    axis([1, 80, 1, 120]);
    set(h, 'EdgeColor', 'none');
    xlabel('Angle (degrees)');
    ylabel('Speed (RPM)');
    title('Heat Map of Maximum g-force');
    hold on;
    contour(bottoms./gravity, [4, 17], 'LineColor', [0, 0, 0]); %contours to display g-force values on heatmap
end