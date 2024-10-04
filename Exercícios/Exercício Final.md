### Exercício 2º: Cálculo do VPL no R

**Objetivo:** Utilizar o método recursivo para cálculo financeiro de Valor Presente Líquido 

**Linguagem:** Utilizar o R.

O Valor Presente Líquido (VPL) é uma medida financeira que calcula o valor total, no presente, de uma série de fluxos de caixa futuros, descontados a uma taxa de desconto específica. É comumente usado para avaliar a viabilidade de investimentos ou projetos.

**Descrição Detalhada:**
Para este exercício, você deve criar uma função recursiva em **R** que calcule o VPL de uma série de fluxos de caixa. A função receberá uma lista de fluxos de caixa e uma taxa de desconto anual; ela deve retornar o valor presente líquido desses fluxos. 

Você deve comparar o VPL do mesmo fluxo de caixa para 10 taxas de desconto distintas: de 0.01 a 0.10. Para fazer isso, salve o resultado de cada chamada da função em uma variável (matriz). Nesta matriz, a primeira coluna deve conter a taxa de desconto e a segunda deve conter o VPL - dica: use um loop para chamar a função e armazenar o resultado na matriz. 

O fluxo de caixa deve ser um vetor de tamanho 100. Use dados simulados, gerados aleatoriamente de uma distribuição normal, com média 5000 e desvio padrão de 1000 - dica: use rnorm().


### Exercício 2º: Sistema de Gerenciamento de Portfólio de Investimentos

**Objetivo:**
Desenvolver um programa em Python usando programação orientada a objetos para simular a gestão de um portfólio de investimentos, incluindo a compra, venda e avaliação de diferentes tipos de ativos financeiros.

**Linguagem:** Python

**Descrição do Exercício:**
Você irá criar um sistema que permite aos usuários gerenciar um portfólio de investimentos. O sistema deve permitir adicionar e remover investimentos, como ações, títulos e fundos mútuos, e calcular o valor total do portfólio.

**Entidades do Sistema:**
1. **Investimento**: Classe base para diferentes tipos de investimentos. Deve incluir atributos como nome do investimento, quantidade possuída e valor por unidade.
2. **Ação**: Subclasse de Investimento. Pode incluir atributos ou métodos específicos para ações, como dividendos.
3. **Título**: Subclasse de Investimento, representando títulos ou bonds, com atributos específicos como taxa de juro.
4. **Fundo Mútuo**: Subclasse de Investimento, para representar investimentos em fundos mútuos.
5. **Portfólio**: Classe que gerencia uma coleção de investimentos. Deve ser capaz de adicionar e remover investimentos, calcular o valor total do portfólio, e possivelmente gerar relatórios sobre o desempenho do portfólio.

**Funcionalidades Esperadas:**
- **Adicionar/Remover Investimentos**: O portfólio deve permitir adicionar e remover diferentes tipos de investimentos.
- **Cálculo do Valor Total**: O sistema deve ser capaz de calcular o valor total do portfólio, somando o valor de todos os investimentos.
- **Relatórios**: O sistema pode oferecer uma funcionalidade para imprimir um resumo do portfólio, incluindo a distribuição dos tipos de investimento e o valor total.

**Passos Recomendados para Resolução:**
1. **Definição de Classes**: Defina as classes Investimento, Ação, Título, Fundo Mútuo e Portfólio com os atributos e métodos necessários.
2. **Implementação de Métodos**: Implemente métodos para adicionar e remover investimentos do portfólio, calcular o valor total, e gerar relatórios.
3. **Simulação e Testes**: Crie um script que use essas classes para criar um portfólio, adicionar diversos investimentos e exibir informações sobre o portfólio.

**Exemplo de Estrutura de Classe Inicial:**

```{python}
class Investimento:
    def __init__(self, nome, quantidade, valor_unitario):
        self.nome = nome
        self.quantidade = quantidade
        self.valor_unitario = valor_unitario

    def valor_total(self):
        return self.quantidade * self.valor_unitario

class Acao(Investimento):
    # Métodos específicos para Ações
    # Retire a palavra-chave pass depois de definir o método
    pass

class Titulo(Investimento):
    # Métodos específicos para Títulos
    # Retire a palavra-chave pass depois de definir o método
    pass

class FundoMutuo(Investimento):
    # Métodos específicos para Fundos Mútuos
    # Retire a palavra-chave pass depois de definir o método
    pass

class Portfolio:
    def __init__(self):
        self.investimentos = []

    def adicionar_investimento(self, investimento):
        self.investimentos.append(investimento)

    def remover_investimento(self, investimento):
        self.investimentos.remove(investimento)

    def valor_total_portfolio(self):
        return sum(invest.valor_total() for invest in self.investimentos)

# Uso das classes
meu_portfolio = Portfolio()
meu_portfolio.adicionar_investimento(Acao("AAPL", 10, 150))
meu_portfolio.adicionar_investimento(Titulo("US Treasury", 5, 1000))
print("Valor total do portfólio:", meu_portfolio.valor_total_portfolio())
```

**Instruções Adicionais:**
- Opcionalmente, expanda o sistema com mais funcionalidades.
- Documente seu código adequadamente e teste várias configurações do portfólio.
- Salve seu código em um arquivo local e torne a sua pasta um repositório do Git. Faça o push para o GitHub. Envie o link do seu repositório do GitHub para o professor.
- Use nomes de variáveis, classes e objetos diferentes dos nomes de exemplo.

**Dicas:**
- Cuidado com a indentação no Python.
- Utilize o Google Colab para executar o código. Mas depois salve o código em um arquivo local.
- Trabalhe em conjunto com os seus colegas.


