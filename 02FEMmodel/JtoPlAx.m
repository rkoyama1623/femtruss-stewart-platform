function [plAx,V]=JtoPlAx(mat,option,varargin)
% ====
% JtoPlAx
%     [plAx,V]=JtoPlAx(J,option,opt_flag)
%         option:'p1','p2','p3','w1','w2'
%         p:並進移動の可操作楕円体[m]
%         w:回転の可操作楕円体["](グラフはラジアン)
%         1:姿勢または位置の拘束なし
%         2:姿勢または位置の拘束あり
%         p3:z軸周りの回転のみ許容する並進移動
% 
%     ヤコビ行列から可操作楕円体の主軸を求める
%     flag='g'のときグラフ描画
% ====



flag=0;

if nargin>2&strcmp(varargin{1},'g')
    flag=1;
end

%ヤコビ行列の分割(並進と回転)
J1=mat(1:3,:);
J2=mat(4:6,:);

if strcmp(option,'p1')==1
    J1inv=pinv(J1')';%pinvは縦長行列にしか適用できないため、転置の疑似逆行列を求めてから転置している。(freeMat)
    A=J1inv'*J1inv;
    [V,D,plAx]=drawEllipsoid(A,[],flag);
end
if strcmp(option,'p2')==1
    omega=[0 0 0]';
    qsize=1;
    [r,Q]=qIs(J2,omega,qsize);

    J2inv=pinv(J2')';
    tempJ=J1*Q;
    
    tempJinv=pinv(tempJ')';
    A=tempJinv'*tempJinv;
    r0=J1*J2inv*omega;
    [V,D,plAx]=drawEllipsoid(A,r0,flag);
end
if strcmp(option,'p3')==1
    omega=[0 0]';
    qsize=1;
    [r,Q]=qIs(mat(4:5,:),omega,qsize);

    tempJ=J1*Q;
    
    tempJinv=pinv(tempJ')';
    A=tempJinv'*tempJinv;
    [V,D,plAx]=drawEllipsoid(A,0,flag);
end

if strcmp(option,'w1')==1
    J2inv=pinv(J2')';%pinvは縦長行列にしか適用できないため、転置の疑似逆行列を求めてから転置している。(freeMat)
    A=J2inv'*J2inv;
    [V,D,plAx]=drawEllipsoid(A,[],flag);
    
    % rad->秒角変換
    plAx=plAx.*180/pi*3600;
    
end
if strcmp(option,'w2')==1
    omega=[0 0 0]';
    qsize=1;
    [r,Q]=qIs(J1,omega,qsize);

    J1inv=pinv(J1')';
    tempJ=J2*Q;
    
    tempJinv=pinv(tempJ')';
    A=tempJinv'*tempJinv;
    r0=J1*J1inv*omega;
    [V,D,plAx]=drawEllipsoid(A,r0,flag);
    
    % rad->秒角変換
    plAx=plAx.*180/pi*3600;
end


end