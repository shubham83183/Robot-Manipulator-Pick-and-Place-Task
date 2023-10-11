L1 = 50; L2 = 95; L3 = 185; L4=110;

L(1) = Link ( [0 L1 0 pi/2] );
L(2) = Link ( [0 0 L2 0] );
L(3) = Link ( [0 0 L3 0] );
%L(4) = Link ( [0 0 L4 0] );

Rob = SerialLink(L);
Rob.name ='MeSy';
q1=90*pi/180; q2=3*pi/4; q3 = -135*pi/180; q4=0;
Rob.plot([ q1, q2, q3  ])