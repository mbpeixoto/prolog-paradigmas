:- dynamic(funcionarios/1).

% Fatos: empresa(nome).
empresa('Empresa A').
empresa('Empresa B').
empresa('Empresa C').

% Inicializa a lista de funcionários com valores padrão
funcionarios_iniciais([
    funcionario('Lucas', 'Desenvolvedor', 5000, 'Empresa A'),
    funcionario('Mateus', 'Gerente', 7000, 'Empresa A'),
    funcionario('Marco', 'Analista', 4500, 'Empresa A'),
    funcionario('Ana', 'Desenvolvedor', 4800, 'Empresa B'),
    funcionario('João', 'Analista', 4700, 'Empresa B'),
    funcionario('Maria', 'Gerente', 8000, 'Empresa B'),
    funcionario('Paulo', 'Estagiário', 2000, 'Empresa C'),
    funcionario('Clara', 'Desenvolvedor', 5100, 'Empresa C')
]).

% Inicializa a lista dinâmica de funcionários
inicializar_funcionarios :-
    retractall(funcionarios(_)),
    funcionarios_iniciais(FuncionariosAtuais),
    assertz(funcionarios(FuncionariosAtuais)).

% Função para cadastrar um novo funcionário
cadastrar_funcionario :-
    write('Nome do Funcionario (entre aspas): '), flush_output, read(Nome),
    write('Cargo do Funcionario (entre aspas): '), flush_output, read(Cargo),
    write('Salario do Funcionario: '), flush_output, read(Salario),
    write('Empresa do Funcionario (entre aspas): '), flush_output, read(Empresa),
    (empresa(Empresa) ->
        funcionarios(FuncionariosAtuais),
        append(FuncionariosAtuais, [funcionario(Nome, Cargo, Salario, Empresa)], NovosFuncionarios),
        retractall(funcionarios(_)),
        assertz(funcionarios(NovosFuncionarios)),
        format('Funcionario ~w cadastrado com sucesso na empresa ~w!~n', [Nome, Empresa]);
        format('Erro: A empresa ~w nao existe!~n', [Empresa])
    ).

% Função para listar todos os funcionários
listar_funcionarios :-
    funcionarios(FuncionariosAtuais),
    (FuncionariosAtuais = [] ->
        write('Nenhum funcionário encontrado!'), nl;
        listar_funcionarios(FuncionariosAtuais)
    ).

listar_funcionarios([]).
listar_funcionarios([funcionario(Nome, Cargo, Salario, Empresa) | Resto]) :-
    format('Nome: ~w, Cargo: ~w, Salario: ~w, Empresa: ~w~n', [Nome, Cargo, Salario, Empresa]),
    listar_funcionarios(Resto).

% Função para calcular a média salarial dos funcionários de uma empresa
soma_salarios_empresa(Empresa, Soma, Contagem) :-
    findall(Salario, funcionario(_, _, Salario, Empresa), Salarios),
    somar_lista(Salarios, Soma),
    length(Salarios, Contagem).

media_salarial(Empresa, Media) :-
    soma_salarios_empresa(Empresa, Soma, Contagem),
    (Contagem > 0 ->
        Media is Soma / Contagem,
        format('A média salarial da empresa ~w é ~2f.~n', [Empresa, Media]);
        format('Nenhum funcionário encontrado na empresa ~w.~n', [Empresa])
    ).

% Regra para listar os cargos disponíveis em uma empresa
cargos_empresa(Empresa, Cargos) :-
    findall(Cargo, funcionario(_, Cargo, _, Empresa), ListaCargos),
    sort(ListaCargos, Cargos),
    format('Cargos disponíveis na empresa ~w: ~w~n', [Empresa, Cargos]).

% Regra para listar todos os funcionários de um cargo em uma empresa
funcionarios_por_cargo(Empresa, Cargo, Funcionarios) :-
    findall(Nome, funcionario(Nome, Cargo, _, Empresa), Funcionarios),
    (Funcionarios = [] ->
        format('Nenhum funcionário encontrado no cargo ~w na empresa ~w.~n', [Cargo, Empresa]);
        format('Funcionários no cargo ~w na empresa ~w: ~w~n', [Cargo, Empresa, Funcionarios])
    ).

% Função auxiliar para somar os elementos de uma lista
somar_lista([], 0).
somar_lista([H | T], Soma) :-
    somar_lista(T, SomaT),
    Soma is H + SomaT.

% Inicializa a lista ao carregar o código
:- initialization(inicializar_funcionarios).