//
//  SongsTableViewCell.swift
//  Task.3.Shop
//
//  Created by Natalia Kapusta on 30/05/2017.
//  Copyright © 2017 Natalia Kapusta. All rights reserved.
//

import UIKit

class SongsTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var artistLabel:UILabel!
    @IBOutlet var categoryLabel:UILabel!
    @IBOutlet var musicImageView:UIImageView!
    @IBOutlet var buySongButton:UIButton!
    
    var song:Song = Song(title: "", artist: "", price: 0.0, image: "", song: "")
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    

    
    @IBAction func addSongToCart(sender: UIButton){
        
        var flag:Bool = false

        for song_ in Songs.shared.songsToBuy{
            if song_.image==song.image{
                let alertMessage = UIAlertController(title: ":(", message: "Piosenka jest już w koszyku zakupów.", preferredStyle: .alert)
                alertMessage.addAction(UIAlertAction(title: "AHA", style: .default, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.present(alertMessage, animated: true, completion: nil)
                flag=true
            }
        }
        
        if(flag==false){
            Songs.shared.songsToBuy.append(song)
            Songs.shared.quantity.append(1)
            
            let alertMessage = UIAlertController(title: ":)", message: "Piosenka została dodana do koszyka zakupów.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            UIApplication.shared.keyWindow?.rootViewController?.present(alertMessage, animated: true, completion: nil)
        }
        

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
