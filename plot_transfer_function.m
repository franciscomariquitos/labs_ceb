function plot_transfer_function(x, y, p)
    % Esta função plota a curva da função de transferência y(x)
    % e sobrepõe a reta ajustada com os coeficientes p (via polyfit).

    figure;
    plot(x, y, 'b.', 'DisplayName', 'Dados originais');
    hold on;

    % Criar reta ajustada usando os coeficientes p
    x_fit = linspace(min(x), max(x), 1000);
    y_fit = polyval(p, x_fit);
    plot(x_fit, y_fit, 'r-', 'LineWidth', 2, 'DisplayName', sprintf('Ajuste linear: y = %.3fx + %.3f', p(1), p(2)));

    grid on;
    xlabel('x (sinal de entrada)');
    ylabel('y (sinal de saída)');
    title('Função de Transferência e Ajuste Linear');
    legend('Location', 'best');
end