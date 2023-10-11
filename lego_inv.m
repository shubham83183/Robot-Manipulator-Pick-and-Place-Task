  function  lego_inv(x , y , z)

[th1,th3] = inverse_kin( x, y ,z)
%th1=30;
%th3=-70;

th_1 = -th1;
th_3 = -th3;

mylego = legoev3;                           % Set up MATLAB and EV3 communication
% Change based on your motor port numbers
mymotor1 = motor(mylego, 'C');              % Set up motor
mymotor2 = motor(mylego, 'B');

% Application parameters
Kp1=0.35;     Kd1=0.9;   Ki1=0.02;
Kp2=0.03;     Kd2=1;   Ki2=0.01;
Kp3=1.2;       Kd3=0.8;   Ki3=0.4;
Int_error = [0 0];      last_error = [0 0];
a = 0;
%-------------------------------------------
start(mymotor1);
start(mymotor2);


%% Operations %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%R1 = double(readRotation(mymotor1));            % Read rotation counter in degrees
%R2 = double(readRotation(mymotor2));
%Th=[linspace(R1,th_1, 5); linspace(R2,th_2,5)];

while true
    
    r1 =double( readRotation(mymotor1))*12/36            % Read rotation counter in degrees
    r2 = double(readRotation(mymotor2))*8/40 +44.86
    
    error = ([th_1, th_3]-[r1, r2]);
    Int_error = Int_error + error;
    Der_error = (error - last_error);
    last_error = error;
    
    
    output1 = error(1,1)*Kp1 + Int_error(1,1)*Ki1 + Der_error(1,1)*Kd1;
    
    if error(1,2)>=0
        output2 = error(1,2)*Kp2 + Int_error(1,2)*Ki2 + Der_error(1,2)*Kd2;
    elseif error(1,2) <0
        output2 = error(1,2)*Kp3 + Int_error(1,2)*Ki3 + Der_error(1,2)*Kd3;
        
        
        if output2 >=-25
            output2 = -25;
        end
    end
    
    
    mymotor1.Speed = output1;
    mymotor2.Speed = output2;
    pause(0.08)
    output1
    output2
    
    if abs(error(1,1))<=1
        stop(mymotor1,1);
    end
    if abs(error(1,2))<2
        stop(mymotor2,1);
    end
    
    if abs(error(1,1))<=1 & abs(error(1,2))<2
        break
    end
  
end
end
