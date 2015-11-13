wheelMass = 5; %kg
wheelRadius = .5; %m
wheelInertia = .25 * wheelMass * wheelRadius^2; %I = 1/4 * mr^2

platformMass = 10; %kg
platformRadius = .75; %m
platformInertia = .25 * platformMass * platformRadius^2; %I = 1/4 * mr^2

%initial speeds
wheelSpeed = 2; %radians/second
platformSpeed = 0; %radians/second

wheelMomentum = wheelInertia * wheelSpeed; %angular momentum
platformMomentum = platformInertia * platformSpeed; %angular momentum
