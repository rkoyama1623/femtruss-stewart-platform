function Klocal=bae2(i)
%�v�f�ԍ���^����ƁA���̂΂ˍs��(local���W)��Ԃ��܂�
% syntax: K_local=bane2(yoso_i)
%bane�ɎQ�Ƃ���Ă��܂�
global yoso;

L=yoso(3,i);
A=yoso(4,i);
I=yoso(5,i);
Ip=yoso(6,i);
E=yoso(7,i);
G=yoso(8,i);
alpha=yoso(9,i);

if L==0
    fprintf('\n K of yoso %d is 0! L was replaced to 10^-10.\n',i);
    L=10^-10;
end

    Klocal=...
    [(A*E)/L,0,0,0,0,0,-(A*E)/L,0,0,0,0,0;... 
    0,(12*E*I)/L^3,0,0,0,(6*E*I)/L^2,0,-(12*E*I)/L^3,0,0,0,(6*E*I)/L^2;... 
    0,0,(12*E*I)/L^3,0,-(6*E*I)/L^2,0,0,0,-(12*E*I)/L^3,0,-(6*E*I)/L^2,0;... 
    0,0,0,(Ip*G)/L,0,0,0,0,0,-(Ip*G)/L,0,0;... 
    0,0,-(6*E*I)/L^2,0,(4*E*I)/L,0,0,0,(6*E*I)/L^2,0,(2*E*I)/L,0;... 
    0,(6*E*I)/L^2,0,0,0,(4*E*I)/L,0,-(6*E*I)/L^2,0,0,0,(2*E*I)/L;... 
    -(A*E)/L,0,0,0,0,0,(A*E)/L,0,0,0,0,0;... 
    0,-(12*E*I)/L^3,0,0,0,-(6*E*I)/L^2,0,(12*E*I)/L^3,0,0,0,-(6*E*I)/L^2;... 
    0,0,-(12*E*I)/L^3,0,(6*E*I)/L^2,0,0,0,(12*E*I)/L^3,0,(6*E*I)/L^2,0;... 
    0,0,0,-(Ip*G)/L,0,0,0,0,0,(Ip*G)/L,0,0;... 
    0,0,-(6*E*I)/L^2,0,(2*E*I)/L,0,0,0,(6*E*I)/L^2,0,(4*E*I)/L,0;... 
    0,(6*E*I)/L^2,0,0,0,(2*E*I)/L,0,-(6*E*I)/L^2,0,0,0,(4*E*I)/L] ;



end