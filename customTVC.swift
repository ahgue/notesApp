//
//  customTVC.swift
//  notesApp
//
//  Created by Alex Salgado on 9/8/16.
//  Copyright © 2016 Alex Salgado. All rights reserved.
//

import UIKit

class customTVC: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
