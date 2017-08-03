//
//  Receiver.swift
//  Polizeimeldungen
//
//  Created by Philipp Matthes on 02.08.17.
//  Copyright © 2017 Philipp Matthes. All rights reserved.
//

import Foundation

class Receiver {

    func getData() -> [(Double, Double, String, String)] {
        var output = [(Double, Double, String, String)]()
        
        output.append((51.02, 13.44, "Blumentopf aus dem Fenster geworfen.", "Dresden"))
        
        return output
    }
    
}
