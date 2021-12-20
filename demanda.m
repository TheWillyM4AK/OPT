clear
clc
close all 
%% Velocidad
velocidad=600; %kts
v=velocidad/60; %NM/min
d = 50; %NM
%% Coordenadas de los puntos de entrada
a1=[300 0]; %aeronvía 1 vertical
a2=[400 600]; %aerovía 2 vertical
a3=[0 300]; %aerovía 3 horizontal
a4=[600 400]; %aeronvía 4 horizontal

entradas=[a1; a2; a3; a4];
tmin=10;
matriz=zeros(3);
numeroaviones = 0;
% Cada t son 5 minutos
for t=0:tmin
    xa1=entradas(1,1);
    ya1=entradas(1,2);
    xa2=entradas(2,1);
    ya2=entradas(2,2);
    xa3=entradas(3,1);
    ya3=entradas(3,2);
    xa4=entradas(4,1);
    ya4=entradas(4,2);
   
    n = 4; % However many numbers you want.
    randomNumbers = randi([0, 1], [1, n]);
    
    if randomNumbers(1) == 1
        matriz(numeroaviones + 1,:) = [1 xa1 ya1-d]; 
        numeroaviones = numeroaviones + 1;
    end
    
    if randomNumbers(2) == 1
        matriz(numeroaviones + 1,:) = [2 xa2 ya2+d];
        numeroaviones = numeroaviones + 1;
    end

    if randomNumbers(3) == 1
        matriz(numeroaviones + 1,:) = [3 xa3-d ya3];
        numeroaviones = numeroaviones + 1;
    end

    if randomNumbers(4) == 1
        matriz(numeroaviones + 1,:) = [4 xa4+d ya4];
        numeroaviones = numeroaviones + 1;
    end

    for i=1:length(matriz)
        if matriz(i,1) == 1
            matriz(i,3) = matriz(i,3) + d;
        end
        if matriz(i,1) == 2
            matriz(i,3) = matriz(i,3) - d;
        end
        if matriz(i,1) == 3
            matriz(i,2) = matriz(i,2) + d;
        end
        if matriz(i,1) == 4
            matriz(i,2) = matriz(i,2) - d;
        end
    end

    figure(tmin)
    pause(0.1)
    clf
    hold on
    plot(matriz(:,2), matriz(:,3), 'O')

    xlim([0 600])
    ylim([0 600])

    disp(matriz)
    disp(numeroaviones)
end
