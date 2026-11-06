Com este código, apresenta-se um método mais robusto para estimar o ganho com base nos
dados experimentais da característica de transferência (exportados para CSV). A abordagem
tradicional de estimar o ganho com base em apenas dois pontos (pares de entrada-saída)
da função de transferência muitas vezes não fornece uma estimativa precisa, principalmente
devido ao ruído e possíveis distorções presentes nos dados reais.

O algoritmo apresentado foca-se nos zeros do sinal de entrada (aproveitando a simetria),
especificamente nos índices onde a derivada da função de transferência sugere um comportamento linear (ou seja, dy/dx é diferente de 0), minimizando a interferência das zonas de saturação.
Para cada zero-crossing identificado, o algoritmo extrai uma “janela” de valores de entrada e
saída, atuando assim em pontos onde o comportamento do sistema é tipicamente mais linear.
Através da aplicação de uma regressão linear a este conjunto de pontos selecionados, é possível
obter uma estimativa do ganho que tende a ser mais robusta e precisa.
