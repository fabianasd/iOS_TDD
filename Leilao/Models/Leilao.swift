//
//  Leilao.swift
//  Leilao
//
//  Created by Fabiana Petrovick on 21/12/20.
//  Copyright © 2020 Fabiana Petrovick. All rights reserved.
//

import Foundation

class Leilao {
    
    let descricao:String
    let imagem:String?
    var lances:[Lance]?
    
    init(descricao:String, imagem:String? = nil, lances:[Lance] = []) {
        self.descricao = descricao
        self.imagem = imagem
        self.lances = lances
    }
    
    func propoe(lance:Lance) {
        guard let listaDeLances = lances else { return }
        if listaDeLances.count == 0 || podeDarLance(lance.usuario, listaDeLances){
            lances?.append(lance)
        }
    }
    
    private func ultimoLance(_ lances:[Lance]) -> Lance {
        return lances[lances.count-1]
    }
    
    private func podeDarLance(_ usuario: Usuario, _ listaDeLances:[Lance]) -> Bool {
        return ultimoLance(listaDeLances).usuario != usuario && quantidadeLancesDoUsuario(usuario) < 5
    }
    
    private func quantidadeLancesDoUsuario(_ usuario:Usuario) -> Int {
        guard let listaDeLances = lances else { return 0}
        var total = 0
        for lanceAtual in listaDeLances {
            if lanceAtual.usuario == usuario {
                total+=1
            }
        }
        return total
    }
}


