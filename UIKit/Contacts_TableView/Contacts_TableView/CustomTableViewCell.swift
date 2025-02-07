//
//  CustomTableViewCell.swift
//  Contacts_TableView
//
//  Created by mayank gour on 28/01/25.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static var identifier : String = "CustomTableViewCell"
    static func nib()-> UINib
    {
        return UINib(nibName: identifier, bundle: nil)
    }
    @IBOutlet weak var labelViewCell: UILabel!
    @IBOutlet weak var imageViewCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
