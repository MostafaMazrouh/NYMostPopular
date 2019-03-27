//
//  MostPopularView.swift
//  NYTimesPopular
//
//  Created by Mostafa on 3/27/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit

class MostPopularCell: UITableViewCell
{
    static let cellId = "MostPopularCell"
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
    
    func setUp(result: Result, indexPath: IndexPath, viewModel: MostPopularViewModel)
    {
        titleLabel.text = result.title
        authorLabel.text = result.byline
        dateLabel.text = result.published_date
        
        guard let id = result.id else { return }
        
        if let image = viewModel.popularImages[id]
        {
            cellImage.image = image
        } else {
            viewModel.loadMostPopularImage(result: result, indexPath: indexPath)
        }
        
        
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














