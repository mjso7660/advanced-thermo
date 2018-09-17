close all; clear all; clc;

% Advanced Thermo HW #1

%% parameters
Q_LHV = 42500; %MJ/kg
V_1 = 4; %L
P_1 = 101.3; %kPa
T_1 = 300; % K
g = 1.4;
C_p = 1.101; %J/kg*K

%% Variables
% AFR = 15;
% r_c = 10;
% Q_in_CV = 50; % percent

%% Otto Cycle
AFR = linspace(1,20,20);
r = linspace(1,20,20);
nu_o = 1-1./(r.^(g-1));

%% Disel Cycle
AFR = linspace(1,20,20);
r = linspace(1,20,20);

% Find V_2
%P_2 = (V_2/V_1)^g*P_1;
T_2 = T_1.*(r.^(g-1));
%V_2 = P_1*V_1/T_1*T_2/P_2;
V_2 = (V_1/T_1.*T_2.*(V_1^g)).^(1/(1+g));

% Find V_3
temp = Q_LHV/C_p+AFR.'*T_2;
T_3 = temp./AFR.';
%T_3 = Q_LHV/AFR/C_p+T_2;
V_3 = V_2./T_2.*T_3;

r_c = V_3./V_2;

nu_d = 1-1./(r.^(g-1)).*((r_c.^g-1)./(g.*(r_c-1)));

%% Dual Cycle
AFR = linspace(1,20,20);
r_c = linspace(1,20,20);




