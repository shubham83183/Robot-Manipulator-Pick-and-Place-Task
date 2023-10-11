function gripper


%mylego=legoev3;
%mymotor3 = motor(mylego, 'A');
%start(mymotor3);
%resetRotation(mymotor1);

t=0;
speed1= 7;
speed2=-7;
R3 = double(readRotation(mymotor3));
if R3 ==0
    mymotor3.Speed = speed1;
    pause(0.2);
    stop(mymotor3,1);
    
    R3 = double(readRotation(mymotor3));
    
    if R3 == 0
        mymotor3.Speed = speed2;
        pause(0.2);
        stop(mymotor3,1);
    end
    
    
else
    
    start(mymotor3)
    
end
end
