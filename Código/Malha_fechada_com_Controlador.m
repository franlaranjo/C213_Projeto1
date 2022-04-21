%% Aplicando o algoritmo para verificar a saída do sistema em malha fechada com controlador PI
a1 = 0.9945;
b1 = 0.0133;
T = 0.1;

%Definindo pv como sendo a saída do sistema
pv(1)=0;

% Definindo cont como a saída do controlador PI
cont(1)=0;

%%Definindo a ação proporcional do sitema
P(1)=0;

%%Definindo a ação integral do sistema
I(1)=0;
sp=50;

%%Definindo o ganho proporcional do sistema
Kp= 2.5839;

%%Definindo o ganho integral do sistema
Ki=0.8586;

M = 1500;
%%Implementando a malha fechada do sistema com controlador PI
%% Por meio da utilização da equação a diferenças do sistema

for i=2:1:M+1
  pv(i)=a1*pv(i-1)+b1*cont(i-1); %% Saída instantanea do sistema
  erro(i)=sp - pv(i); %% Erro instataneo do sistema
  P(i)=Kp*erro(i); %% Ação proporcioanl
  I(i)=I(i-1)+Ki*erro(i)*T; %Ação Integral
  cont(i)=P(i)+I(i); %%Ação do controlador PI saida
  t(i)=T*i; %%variável de tempo
end

%%Plotando os gráficos de entrada e saída do sistema
plot(t,pv,'r')
hold on
plot(t,sp,'b')
grid on