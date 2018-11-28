//
//  UserTableViewCell.swift
//  LaxmiPrasad_SuryaSoft_Test
//
//  Created by LaxmiPrasad Sahu on 27/11/18.
//  Copyright © 2018 C1X. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img_Profile: UIImageView!
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_emailId: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
