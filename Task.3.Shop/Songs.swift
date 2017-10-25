//
//  Songs.swift
//  Task.3.Shop
//
//  Created by Natalia Kapusta on 27/06/2017.
//  Copyright © 2017 Natalia Kapusta. All rights reserved.
//

import Foundation

class Songs{
    
    static let shared = Songs()
    
    var songsToBuy:[Song]
    var quantity:[Int]
    
    init(){
        songsToBuy=[]
        quantity=[]
    }
    
    
}
