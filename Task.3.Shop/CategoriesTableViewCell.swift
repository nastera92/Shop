//
//  CategoriesTableViewCell.swift
//  Task.3.Shop
//
//  Created by Natalia Kapusta on 25/05/2017.
//  Copyright © 2017 Natalia Kapusta. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    @IBOutlet var categoryImageView: UIImageView?
    @IBOutlet var categoryNameLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
