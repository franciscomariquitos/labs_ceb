 
 % dá load na data do .CSV 
 data = readtable("scope_1.csv", 'VariableNamingRule', 'preserve');
 x = data{:,2}; % input signal
 y = data{:,3}; % output signal

 % derivada
 dy = diff(y) ./ diff(x);
 abs_dy = abs(dy);

 % Encontra o ponto onde a derivada não é nula (i.e., qd não é constante)
 is_not_constant = abs_dy > 1e-2; % Tem em conta pequenas oscilações
 idx = find(is_not_constant); % converte índices lógicos para numéricos

 % extrair janelas ao redor das passagens por zero do sinal de entrada
% estas regiões costumam apresentar um comportamento mais linear, sendo mais adequadas
 x_linear = []; y_linear = [];
 zero_crossings = find(diff(sign(x(idx)))~=0); % detect zero-crossings
 window_size = 35; % (how many points to take around each zero crossing)

 for i = 1:length(zero_crossings)
 window_start = max(1, zero_crossings(i) - window_size);
 window_end = min(length(x(idx)), zero_crossings(i) + window_size);
 window_indices = window_start:window_end;

  % garantir que os índices da janela não ultrapassem os limites do vetor
 window_indices = window_indices(window_indices <= length(x(idx)));

 x_linear = [x_linear; x(idx(window_indices))];
 y_linear = [y_linear; y(idx(window_indices))];
 end

 % aplica uma regressão linear a essas regiões para estimar o ganho
 p = polyfit(x_linear, y_linear, 1); 
 slope = p(1);

 % plot
 plot_transfer_function(x,y,p);
 fprintf('The slope of the linear part of the transfer function is: %.3f.\n', slope);
 