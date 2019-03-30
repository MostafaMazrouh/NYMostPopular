//
//  DetailsViewController.swift
//  NYTimesPopular
//
//  Created by Mostafa on 3/27/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController
{
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var bigImage: UIImageView!
    
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var result: Result?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        setUp()
    }
    
    func setUp()
    {
        title = "Details"
        
        guard let result = result else {
            navigationController?.popViewController(animated: true)
            return }
        
        titleLabel.accessibilityIdentifier = "titleLabelDetail"
        authorLabel.accessibilityIdentifier = "authorLabelDetail"
        dateLabel.accessibilityIdentifier = "dateLabelDetail"
        
        titleLabel.text = result.title
        authorLabel.text = result.byline
        dateLabel.text = result.published_date
        
        detailsLabel.text = result.abstract
        
        guard let bigImageURL = result.bigImage else { return }
        
        bigImage.sd_setImage(with: URL(string: bigImageURL), placeholderImage: nil)
    }
}
