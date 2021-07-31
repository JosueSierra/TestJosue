//
//  GenericCell.swift
//  TestJosue
//
//  Created by Josue on 30/07/21.
//

import UIKit

class GenericCell: UITableViewCell {

    @IBOutlet weak var lblDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData( text detailDescription: String) {
        lblDescription.text = detailDescription
    }

}
