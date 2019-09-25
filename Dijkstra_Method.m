
% Cidades:
% 1  - uruguaiana
% 2  - cruz alta
% 3  - santa maria
% 4  - alegrete
% 5  - rosario do sul
% 6  - porto alegre
% 7  - sao gabriel
% 8  - bage
% 9  - cachoeira do sul
% 10 - pelotas

inicio = 1;
final = 5;

uruguaiana       = [0,432,inf,145,inf,inf,inf,inf,inf,inf];
cruz_alta        = [432,0,inf,372,inf,inf,inf,inf,inf,inf];
santa_maria      = [inf,134,0,inf,inf,291,inf,239,inf,inf];
alegrete         = [145,inf,241,0,inf,inf,inf,inf,inf,inf];
rosario_do_sul   = [inf,inf,138,105,0,inf,inf,inf,inf,inf];
porto_alegre     = [inf,346,324,inf,inf,0,inf,inf,200,inf];
sao_gabriel      = [inf,inf,171,inf,63,inf,0,inf,inf,inf];
bage             = [inf,inf,inf,inf,inf,inf,188,0,inf,200];
cachoeira_do_sul = [inf,inf,inf,inf,inf,inf,inf,237,0,291];
pelotas          = [inf,inf,inf,inf,inf,244,inf,inf,inf,0];

cidades = [uruguaiana;cruz_alta;santa_maria;alegrete;rosario_do_sul;porto_alegre;sao_gabriel;bage;cachoeira_do_sul;pelotas];

tamanho = size(cidades,1);
loop(1:tamanho) = 0; 
permanente(1:tamanho) = inf;
anterior(1:tamanho) = tamanho+1;
permanente(inicio) = 0;

while sum(loop) ~= tamanho
    temporario = [];
    for i=1:tamanho
        if loop(i) == 0
            temporario = [temporario permanente(i)];
        else
            temporario = [temporario inf];
        end
    end
    [u_index j] = min(temporario);
    loop(j) = 1;
    for i=1:tamanho
        if(permanente(j) + cidades(j,i)) < permanente(i)
            permanente(i) = permanente(j) + cidades(j,i);
            anterior(i) = j;
        end
    end
end

caminho = [final];

while caminho(1) ~= inicio
    if anterior(caminho(1)) <= tamanho
        caminho = [anterior(caminho(1)) caminho];
    end
end

dimensao = size(caminho,2);
caminhostring = [];
count = 0;

while(count < dimensao)
   count = count + 1;
   show = caminho(count);
   if(show == 1)
       caminhostring = [caminhostring 'Uruguaiana /'];
   elseif(show == 2)
      caminhostring = [caminhostring 'Cruz Alta /'];
   elseif(show == 3)
       caminhostring = [caminhostring 'Santa Maria /'];
   elseif(show == 4)
       caminhostring = [caminhostring 'Alegrete /'];
   elseif(show == 5)
       caminhostring = [caminhostring 'Rosario do Sul /'];
   elseif(show == 6)
       caminhostring = [caminhostring 'Porto Alegre /'];
   elseif(show == 7)
       caminhostring = [caminhostring 'Sao Gabriel /'];
   elseif(show == 8)
       caminhostring = [caminhostring 'Bage /'];
   elseif(show == 9)
       caminhostring = [caminhostring 'Cachoeira do Sul /'];
   elseif(show == 10)
       caminhostring = [caminhostring 'Pelotas /'];
   end
end
    
caminhostring
custo = dist(final)

% -----------------------------------------------------------------


s = [0, 15, Inf, Inf, 9, Inf];
a = [Inf, 0, 35, 3, Inf, Inf];
b = [Inf, 16, 0, 6, Inf, 21];
c = [Inf, Inf, Inf, 0, 2, 7];
d = [Inf, 4, Inf, 2, 0, Inf];
t = [inf, Inf, 5, Inf, Inf, 0];

matriz = [s ; a ; b ; c ; d ; t];

% Colunas:
% 1 - s
% 2 - a
% 3 - b
% 4 - c
% 5 - d
% 6 - t

inicio = 6;
final = 4;

tamanho = size(matriz,1);
loop(1:tamanho) = 0; 
permanente(1:tamanho) = inf;
anterior(1:tamanho) = tamanho+1;
permanente(inicio) = 0;

while sum(loop) ~= tamanho
    temporario = [];
    for i=1:tamanho
        if loop(i) == 0
            temporario = [temporario permanente(i)];
        else
            temporario = [temporario inf];
        end
    end
    [u_index j] = min(temporario);
    loop(j) = 1;
    for i=1:tamanho
        if(permanente(j) + matriz(j,i)) < permanente(i)
            permanente(i) = permanente(j) + matriz(j,i);
            anterior(i) = j;
        end
    end
end

caminho = [final];

while caminho(1) ~= inicio
    if anterior(caminho(1)) <= tamanho
        caminho = [anterior(caminho(1)) caminho];
    end
end

dimensao = size(caminho,2);
caminhostring = [];
count = 0;

while(count < dimensao)
   count = count + 1;
   show = caminho(count);
   if(show == 1)
       caminhostring = [caminhostring 'S /'];
   elseif(show == 2)
      caminhostring = [caminhostring 'A /'];
   elseif(show == 3)
       caminhostring = [caminhostring 'B /'];
   elseif(show == 4)
       caminhostring = [caminhostring 'C /'];
   elseif(show == 5)
       caminhostring = [caminhostring 'D /'];
   elseif(show == 6)
       caminhostring = [caminhostring 'T /'];
   end
end

caminhostring
custo = dist(final)
