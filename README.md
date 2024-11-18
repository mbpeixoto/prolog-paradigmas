# Sistema de Gestão de Funcionários em Prolog

Este programa em Prolog permite gerenciar funcionários de empresas, incluindo cadastro, listagem, cálculo de média salarial e análise de cargos disponíveis. A base de dados é inicializada dinamicamente e manipulável durante a execução.

---

## Funcionalidades Principais

1. **Cadastro de Funcionários**: Adiciona novos funcionários a uma empresa existente.
2. **Listagem de Funcionários**: Exibe detalhes de todos os funcionários.
3. **Cálculo de Média Salarial**: Calcula a média salarial por empresa.
4. **Listagem de Cargos**: Mostra cargos disponíveis em uma empresa.
5. **Funcionários por Cargo**: Lista funcionários de um cargo específico em uma empresa.

---

## Como Usar

1. Salve o código em `gestao_funcionarios.pl`.
2. Carregue no Prolog: `?- [gestao_funcionarios].`
3. Utilize os comandos:
   - **Cadastrar Funcionário**: `?- cadastrar_funcionario.`
   - **Listar Funcionários**: `?- listar_funcionarios.`
   - **Calcular Média**: `?- media_salarial('Empresa A').`
   - **Cargos Disponíveis**: `?- cargos_empresa('Empresa B', Cargos).`
   - **Funcionários por Cargo**: `?- funcionarios_por_cargo('Empresa A', 'Desenvolvedor', Funcionarios).`

---

## Exemplo

Para calcular a média salarial da "Empresa A":

```
?- media_salarial('Empresa A').
```

Saída:

```
A média salarial da empresa Empresa A é 5500.00.
```
Problemas Comuns
- Empresa não existente: Use empresas cadastradas.
- Erro ao listar: Recarregue e inicialize com `?- inicializar_funcionarios.`

