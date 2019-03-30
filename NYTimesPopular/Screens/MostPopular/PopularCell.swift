//
//  PopularView.swift
//  NYTimesPopular
//
//  Created by Mostafa on 3/27/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit
import SDWebImage

class PopularCell: UITableViewCell
{
    static let cellId = "PopularCell"
    static let height: CGFloat = 200
    
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib()
    {
        contentView.backgroundColor = UIColor.clear
        cellImage.setRounded()
    }
    
    func setUp(result: Result)
    {
        titleLabel.accessibilityIdentifier = "titleLabel"
        authorLabel.accessibilityIdentifier = "authorLabel"
        dateLabel.accessibilityIdentifier = "dateLabel"
        
        titleLabel.text = result.title
        authorLabel.text = result.byline
        dateLabel.text = result.published_date
        
        guard let smallImage = result.smallImage else { return }
        
        cellImage.sd_setImage(with: URL(string: smallImage), placeholderImage: nil)
    }

}

extension UIView
{
    func setRounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue; layer.masksToBounds = newValue > 0 }
    }
}














