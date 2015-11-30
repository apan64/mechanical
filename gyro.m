wheelMass = 5; %kg
wheelRadius = .5; %m
wheelInertia = .25 * wheelMass * wheelRadius^2; %I = 1/4 * mr^2

platformMass = 10; %kg
platformRadius = .75; %m
platformInertia = .25 * platformMass * platformRadius^2; %I = 1/4 * mr^2

airViscosity = .00018;

%initials
wheelSpeed = 2; %radians/second
platformSpeed = 0; %radians/second
angle = 0;

wheelMomentum = wheelInertia * wheelSpeed; %angular momentum
wheelMomentumX = wheelInertia * wheelSpeed * sind(angle);
wheelMomentumY = wheelInertia * wheelSpeed * cosd(angle);
platformMomentum = platformInertia * platformSpeed; %angular momentum, only applies in one direction

degreeRange = 180;

platformSpeeds = zeros(1, degreeRange);

for n = 1:degreeRange %making wheel tilt 1 degree per loop, 1 second passes
    angle = n;
    wheelMomentumX = wheelInertia * wheelSpeed * sind(angle);
    platformTorque = wheelInertia * wheelSpeed * cosd(angle);
    platformDrag = 8 * pi * platformRadius^3 * airViscosity * platformSpeed;
    platformSpeed = platformSpeed + (platformTorque - platformDrag) / platformMass;
    %to consider for later: drag force applied rotationally
    %torque = -8pi*R^3 * viscosity * angular velocity
    %viscosity of air is 0.00018
    platformSpeeds(n) = platformSpeed;
end
plot(platformSpeeds);
xlabel('Angle of Wheel to Vertical (degrees)');
ylabel('Speed of Platform (radians/second)');
title('Tilting wheel 1 degree per second');