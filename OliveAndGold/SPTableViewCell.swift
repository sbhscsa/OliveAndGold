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
    
    var data:Pathway!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(_ src:Pathway){
        data = src
        
        specialPLabel.text = data.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
