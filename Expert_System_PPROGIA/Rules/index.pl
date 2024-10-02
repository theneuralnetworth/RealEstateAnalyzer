regra 1 
    se [localizacao_imovel(Imovel, porto)] 
    entao [cria_facto(imovel_litoral(Imovel))].

regra 2
    se [tipo(Imovel,apartamento)]
    entao [cria_facto(imovel_apartamento(Imovel))].
