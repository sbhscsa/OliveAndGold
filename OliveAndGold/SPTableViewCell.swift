//
//  SPTableViewCell.swift
//  OliveAndGold
//
//  Created by Mobile on 1/13/17.
//  Copyright © 2017 com.4myeecc. All rights reserved.
//

import UIKit

class SPTableViewCell: UITableViewCell {

    @IBOutlet var specialPLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
