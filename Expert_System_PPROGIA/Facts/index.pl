:- dynamic ultimo_facto/1.
:- dynamic facto/2.

facto(1, localizacao_imovel(imovel1, porto)).
facto(2, localizacao_imovel(imovel2, lisboa)).
facto(3, preco(imovel1, 300000)).
facto(4, preco(imovel2, 150000)).
facto(5, tamanho(imovel1, 120)).
facto(6, tamanho(imovel2, 80)).
facto(7, tipo(imovel1, apartamento)).
facto(8, tipo(imovel2, casa)).
facto(9, piscina(imovel1, nao)).
facto(10, piscina(imovel2, sim)).
facto(11, jardim(imovel1, sim)).
facto(12, jardim(imovel2, nao)).
facto(13, localizacao_info(porto, litoral)).
facto(14, localizacao_info(lisboa, litoral)).
facto(15, localizacao_info(faro, sul)).

ultimo_facto(15).

