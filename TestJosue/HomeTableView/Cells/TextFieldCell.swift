//
//  TextFieldCell.swift
//  TestJosue
//
//  Created by Josue on 30/07/21.
//

import UIKit

class TextFieldCell: UITableViewCell {

    @IBOutlet weak var txtName: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
