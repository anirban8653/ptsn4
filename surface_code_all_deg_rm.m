(* ::Package:: *)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
tic

%% KGRID
nbasis = 84;
NN = 4; 
kx1 = linspace(-pi,pi,NN);
kz1 = linspace(-pi,pi,NN);

[kx,kz] = meshgrid(kx1,kz1);

% ky = 0*ones(1,NN*NN);


kpts = [kx(:),kz(:)];

nkpt = 1:length(kpts);



%% Eigenvalue and Eigenvector

hr1 = load('hjfile_ypalne _ 0_deg _rm . dat'); % hr text file
% energy = [];
d = '/home/lsc/Desktop/ptsn4/updated_v1/data';
parfor k = nkpt
    H = zeros(nbasis,nbasis);
    for i = 1:length(hr1)
        hr = hr1(i,:);
        recip1 = [hr(1),hr(3)];
        t = (hr(6)+1j*hr(7));
        H(hr(4),hr(5)) = H(hr(4),hr(5)) + t*exp(1j*dot(kpts(k,:),recip1));
    end
    filename1 = sprintf('hopping_ky _ 0plane_r _ % d . csv',k);
    writematrix(real(H),fullfile(d,filename1))
    filename2 = sprintf('hopping_ky _ 0plane_i _ % d . csv',k);
    writematrix(imag(H),fullfile(d,filename2))
end


toc



tic

hr1 = load('hjfile_ypalne _ 1_deg _rm . dat'); % hr text file
% energy = [];
d = '/home/lsc/Desktop/ptsn4/updated_v1/data';
parfor k = nkpt
    H = zeros(nbasis,nbasis);
    for i = 1:length(hr1)
        hr = hr1(i,:);
        recip1 = [hr(1),hr(3)];
        t = (hr(6)+1j*hr(7));
        H(hr(4),hr(5)) = H(hr(4),hr(5)) + t*exp(1j*dot(kpts(k,:),recip1));
    end
    filename1 = sprintf('hopping_ky _ 1plane_r _ % d . csv',k);
    writematrix(real(H),fullfile(d,filename1))
    filename2 = sprintf('hopping_ky _ 1plane_i _ % d . csv',k);
    writematrix(imag(H),fullfile(d,filename2))
end

toc

tic

hr1 = load('hjfile_ypalne _ 2_deg _rm . dat'); % hr text file
% energy = [];
d = '/home/lsc/Desktop/ptsn4/updated_v1/data';
parfor k = nkpt
    H = zeros(nbasis,nbasis);
    for i = 1:length(hr1)
        hr = hr1(i,:);
        recip1 = [hr(1),hr(3)];
        t = (hr(6)+1j*hr(7));
        H(hr(4),hr(5)) = H(hr(4),hr(5)) + t*exp(1j*dot(kpts(k,:),recip1));
    end
    filename1 = sprintf('hopping_ky _ 2plane_r _ % d . csv',k);
    writematrix(real(H),fullfile(d,filename1))
    filename2 = sprintf('hopping_ky _ 2plane_i _ % d . csv',k);
    writematrix(imag(H),fullfile(d,filename2))
end

toc


tic

hr1 = load('hjfile_ypalne _-1_deg _rm . dat'); % hr text file
% energy = [];
d = '/home/lsc/Desktop/ptsn4/updated_v1/data';
parfor k = nkpt
    H = zeros(nbasis,nbasis);
    for i = 1:length(hr1)
        hr = hr1(i,:);
        recip1 = [hr(1),hr(3)];
        t = (hr(6)+1j*hr(7));
        H(hr(4),hr(5)) = H(hr(4),hr(5)) + t*exp(1j*dot(kpts(k,:),recip1));
    end
    filename1 = sprintf('hopping_ky _m1plane _r _ % d . csv',k);
    writematrix(real(H),fullfile(d,filename1))
    filename2 = sprintf('hopping_ky _m1plane _i _ % d . csv',k);
    writematrix(imag(H),fullfile(d,filename2))
end

toc


tic

hr1 = load('hjfile_ypalne _-2_deg _rm . dat'); % hr text file
% energy = [];
d = '/home/lsc/Desktop/ptsn4/updated_v1/data';
parfor k = nkpt
    H = zeros(nbasis,nbasis);
    for i = 1:length(hr1)
        hr = hr1(i,:);
        recip1 = [hr(1),hr(3)];
        t = (hr(6)+1j*hr(7));
        H(hr(4),hr(5)) = H(hr(4),hr(5)) + t*exp(1j*dot(kpts(k,:),recip1));
    end
    filename1 = sprintf('hopping_ky _m2plane _r _ % d . csv',k);
    writematrix(real(H),fullfile(d,filename1))
    filename2 = sprintf('hopping_ky _m2plane _i _ % d . csv',k);
    writematrix(imag(H),fullfile(d,filename2))
end

toc


