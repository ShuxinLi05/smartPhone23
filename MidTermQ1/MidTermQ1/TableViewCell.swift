//
//  TableViewCell.swift
//  MidTermQ1
//
//  Created by shuxin on 3/18/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var wondersImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
