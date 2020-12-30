//
//  CriadordeLeilao.swift
//  Leilao
//
//  Created by Fabiana Petrovick on 22/12/20.
//  Copyright © 2020 Fabiana Petrovick. All rights reserved.
//

import UIKit

class CriadorDeLeilao: NSObject {
    
    private var leilao:Leilao!
    
    func para(descricao:String) -> Self {
        leilao = Leilao(descricao: descricao)
        
        return self
    }
    
    func lance(_ usuario:Usuario, _ valor:Double) -> Self {
        leilao.propoe(lance: Lance(usuario, valor))
        
        return self
    }
    
    func constroi() -> Leilao {
        return leilao
    }
}
