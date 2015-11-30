function stuff = ride()
    rideSpeedRad = 1.47; %rad/s
    gravity = 9.81; %m/s^2
    rideRadius = 15.25; %m
    personMass = 80.7; %kg, americans are fat
    angle = 0;
    
    rideSpeed = rideSpeedRad * rideRadius;
    
    bottoms = zeros(80);
    tops = zeros(80);
    
    gForce = rideSpeed^2 / rideRadius;
    
    for n = 1:80
        bottoms(n) = gForce + (gravity * sin(n*pi/180));
        tops(n) = gForce - (gravity * sin(n*pi/180));
    end
    
    plot(bottoms./gravity);
    hold on;
    plot(tops./gravity);
end