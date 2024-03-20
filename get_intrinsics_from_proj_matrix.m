function [K,cRw] = get_intrinsics_from_proj_matrix(P)
% Get left-side 3x3 block of P
M = P(:,1:3);
% Implement the RQ decomposition from QR in matlab
[Q,R] = qr(rot90(M,3));
R = rot90(R,2)';
Q = rot90(Q);
% Check the determinant of Q to make cRw a proper rotation
if det(Q) < 0
    cRw = -Q;
else
cRw = Q;
end
% Get the normalized intrinsics
K = R/R(3,3);


