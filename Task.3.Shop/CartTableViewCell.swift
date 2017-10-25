//
//  CartTableViewCell.swift
//  Task.3.Shop
//
//  Created by Natalia Kapusta on 26/05/2017.
//  Copyright © 2017 Natalia Kapusta. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    @IBOutlet var artistL:UILabel!
    @IBOutlet var titleL:UILabel!
    @IBOutlet var categoryL:UILabel!
    @IBOutlet var quantityL:UILabel!
    @IBOutlet var stepper:UIStepper!
    @IBOutlet var priceL:UILabel!
    
    var index:Int=0
    var price:Double=0.0
    
    var cart:CartTableViewController!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        stepper.minimumValue = 1
        stepper.maximumValue = 99
        stepper.isContinuous = false
        
    }
    
    @IBAction func changeQuantity(_ sender:UIStepper){
        quantityL.text = "Ilość - " + String(Int(stepper.value))
        Songs.shared.quantity[index] = Int(stepper.value)
        let price_ = price*Double(Songs.shared.quantity[index])
        priceL.text = String(price_) + "$"
        
        CartTableViewController.priceCalc(instance: cart)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
