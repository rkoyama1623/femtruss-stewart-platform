function dL=nobi(yosoi)
% ========================================================================
% file name:nobi
% detail:要素iの伸びを返します。
% syntax:
% dL=extention(i)    i番目の要素の伸びをdLに渡します。[m]
% ========================================================================

global yoso;
global nobi;

dij=displacement(yosoi,'local');

% x方向変位を取得
ui=dij(1);
uj=dij(7);

% x方向変位の差＝伸びを求める
dL=uj-ui;

end