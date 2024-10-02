:- dynamic facto_dispara_regras/2.

% Metaknowledge
facto_dispara_regras(localizacao_imovel(_, _), [1]).
facto_dispara_regras(localizacao_info(_, _), [1]).
facto_dispara_regras(preco(_, _), [1]).
facto_dispara_regras(tipo(_, _), [2]).
facto_dispara_regras(tamanho(_, _), [1]).
facto_dispara_regras(jardim(_, _), [1]).
facto_dispara_regras(piscina(_, _), [1]).
