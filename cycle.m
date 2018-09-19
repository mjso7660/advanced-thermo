function [eta, m_f, w]= cycle(r,AFR, cv_percent)
Q_LHV = 42.5e6; %J/KG
Cp = 1.01e3; %J/(kg*K)
rho_a = 1.225; %kg/m^3
gamma = 1.4;
Cv = Cp/gamma;
%% State 1
P1 = 101.3e3; %Pa
V1 = 1/1000; %m^3
T1 = 300; %K
adb_const = P1*V1^gamma;

%% State 2
V2 = V1/r;
P2 = adb_const / V2^gamma;
T2 = T1*(r^(gamma-1));

%% State 3a
Qin1_overMa = cv_percent/100 /AFR *Q_LHV;
T3a = Qin1_overMa/Cv+T2;
P3a = P2/T2*T3a;
V3a = V2;

%% State 3b
Qin2_overMa = (100-cv_percent)/100 /AFR *Q_LHV;
T3b = Qin2_overMa/Cp+T3a;
V3b = V3a/T3a*T3b;

%% Efficiency Equation
alpha = P3a/P2;
beta  = V3b/V3a;
eta   = 1-(1/(r^(gamma-1))*(alpha*beta^gamma -1)/(alpha*gamma*(beta-1)+(alpha-1)));
m_f= V1*4*rho_a/AFR; %kg
w = m_f * Q_LHV * eta;
end