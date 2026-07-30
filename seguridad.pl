% =========================================================
% Tema elegido: Empleados y niveles de acceso: Control de acceso en un entorno corporativo 
% =========================================================

% Hechos - Relación 1: empleado(Nombre, Departamento)
empleado(luis, seguridad).
empleado(maria, finanzas).
empleado(carlos, desarrollo).
empleado(ana, seguridad).
empleado(pedro, finanzas).
empleado(sofia, desarrollo).

% Hechos - Relación 2: nivel_acceso(Nombre, Nivel) (Escala de 1 a 5)
nivel_acceso(luis, 4).
nivel_acceso(maria, 3).
nivel_acceso(carlos, 2).
nivel_acceso(ana, 5).
nivel_acceso(pedro, 1).
nivel_acceso(sofia, 2).

% Hechos - Departamentos considerados críticos
departamento_critico(seguridad).
departamento_critico(finanzas).


% Reglas con variables
acceso_alto(Nombre) :-      % Acceso alto si el nivel es mayor o igual a 3
    nivel_acceso(Nombre, Nivel),
    Nivel >= 3.

empleado_critico(Nombre) :-  % Un empleado es "crítico" si pertenece a un departamento crítico
    empleado(Nombre, Departamento),
    departamento_critico(Departamento).

mismo_departamento(X, Y) :-   % Dos empleados distintos pertenecen al mismo departamento
    empleado(X, Departamento),
    empleado(Y, Departamento),
    X \= Y.







% Consultas de ejemplo para ejecutar en la consola de SWI-Prolog
% ?- empleado(luis, seguridad).
% true.
%
% ?- acceso_alto(X).
% X = luis ;
% X = maria ;
% X = ana.
%
% ?- mismo_departamento(luis, ana).
% true.
%
% ?- mismo_departamento(luis, maria).
% false.