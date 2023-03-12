//
//  AboutInfoCell.swift
//  ComplexCollectionView
//
//  Created by Aniket Rao on 02/03/23.
//

import UIKit

class AboutInfoCell: UICollectionViewCell {

    
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization co
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
            setNeedsLayout()
            layoutIfNeeded()
            let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
            var frame = layoutAttributes.frame
            frame.size.height = ceil(size.height)
            layoutAttributes.frame = frame
            return layoutAttributes
        }

}
