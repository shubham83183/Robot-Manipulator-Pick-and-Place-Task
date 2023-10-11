clear all;clc

function home_configuration


mylego = legoev3;  % Set up MATLAB and EV3 communication

%  Set up motor based on your motor port numbers
mymotor1 = motor(mylego, 'C');              
mymotor2 = motor(mylego, 'B');
mymotor3 = motor(mylego, 'A');

start(mymotor1);
start(mymotor2);
start(mymotor3);

mytouch1 = touchSensor(mylego,1);
mytouch2 = touchSensor(mylego,3);

speed1 = 10;
speed2 = -30;

while  readTouch(mytouch1)== 0 | readTouch(mytouch2)== 0
    
    
    mymotor1.Speed = speed1;
    mymotor2.Speed = speed2;
    
    if readTouch(mytouch1) == 1
        stop(mymotor1,1);
    end
    if readTouch(mytouch2) == 1
        stop(mymotor2,1);
    end
    
end
resetRotation(mymotor1);
resetRotation(mymotor2);
end
