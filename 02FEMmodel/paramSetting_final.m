%---  ��{�ݒ�@�@----
sr=105e-3;%�v���[�g�̒��S-�����N����
thp=10;%�v���[�g���@(�����N�̈ʒu)

br=105e-3;%�x�[�X�̒��S�[�����N����
thb=10;%�x�[�X���@(�����N�̈ʒu)

pb=[0 0 0.27]';%�x�[�X���W�n�Ō����v���b�g�t�H�[�����S�̃x�N�g��
ph=0;th=0;ps=0;%------�I�C���[�p--------------deg�œ���
		
[sb,bb,sp]=stwertPlatform(sr,thp,br,thb,pb,ph,th,ps);%stwertPlatform��`�悷�邽�߁B�Ȃ��Ă�FEM�̌v�Z�͉\�B



% param1~3=[A I Ip E G alpha rho]
% param1:�e���q���W�̕����l
% param2:�c�����ނ̕����l
% param3�v���[�g���ȂǍ�������

%�c������
r2=0.015/2;
r2_1=r2-1e-3;
A2=pi*(r2^2-r2_1^2);
I2=pi/4*(r2^4-r2_1^4);
Ip2=pi/2*(r2^4-r2_1^4);
E2=72.4*10^9;
G2=E2/(2*(1+0.33));
alpha2=24*10^-6;
rho2=2.7*10^3;%kg/m3


%�e���q���W
r1=3.242/2*10^-3;
r1_1=1.5e-3;
A1=pi*(r1^2-r1_1^2);
I1=pi/4*(r1^4-r1_1^4);
Ip1=pi/2*(r1^4-r1_1^4);;
E1=210*10^9;
G1=E1/(2*(1+0.28));
alpha1=24*10^-6;
rho1=2.7*10^3;%kg/m3


%�v���[�g�Ȃǂ̍�������
r3=r2*10;
A3=pi*r3^2;
I3=pi/4*r3^4;
Ip3=pi/2*r3^4;
E3=E2*100;
G3=G2*100;
alpha3=24*10^-6;
rho3=2.7*10^3;%kg/m3

alphaLeg=1/10;

%���M�v�f�Ɖ��M���x���L������s��
heatedYoso=zeros(2,1);