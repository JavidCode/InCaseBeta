//
//  AssetTableViewCell.swift
//  InCaseBeta
//
//  Created by Javid Beykzadeh on 11/11/15.
//  Copyright © 2015 JavidCode. All rights reserved.
//

import UIKit

class AssetTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descBox: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
