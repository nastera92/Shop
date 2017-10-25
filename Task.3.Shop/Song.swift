//
//  Song.swift
//  Task.3.Shop
//
//  Created by Natalia Kapusta on 25/05/2017.
//  Copyright © 2017 Natalia Kapusta. All rights reserved.
//

import Foundation

struct Song{
    
    var title:String = ""
    var artist:String = ""
    var price:Double = 0.0
    var image:String = ""
    var song:String = ""
    
    init(title:String, artist:String, price:Double, image:String, song:String){
        self.title = title
        self.artist = artist
        self.price = price
        self.image = image
        self.song = song
    }
    
}
