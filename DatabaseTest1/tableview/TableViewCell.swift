//
//  TableViewCell.swift
//  DatabaseTest1
//
//  Created by 李昀璋 on 2024/4/19.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var lblName:UILabel!
    @IBOutlet var lblTele:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
