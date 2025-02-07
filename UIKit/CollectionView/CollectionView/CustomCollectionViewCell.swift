//
//  CustomCollectionViewCell.swift
//  CollectionView
//
//  Created by mayank gour on 28/01/25.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    static let identifier = "CustomCollectionViewCell"
    static func nib() -> UINib
    {
        return UINib(nibName: identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with image: String)
    {
        imageView.image = UIImage(named: image)
    }

}
