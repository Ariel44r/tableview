//
//  viewcontrollerTableViewCell.swift
//  tableview_cells
//
//  Created by Ariel Ramírez on 05/09/17.
//  Copyright © 2017 Ariel Ramírez. All rights reserved.
//

import UIKit

class viewcontrollerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!   
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
