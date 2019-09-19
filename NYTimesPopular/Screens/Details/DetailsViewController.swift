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
    @IBOutlet weak var randomColor: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var bigImage: UIImageView!
    
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var result: Result?
    
    let viewModel = DetailsViewModel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        setUp()
        bindViewModelValues()
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
    
    func bindViewModelValues() {
        viewModel.colorRGB.bind { [weak self] colorRGB in
            guard let colorRGB = colorRGB else {
                return
            }
            
            let color = UIColor(red: CGFloat(colorRGB.0), green: CGFloat(colorRGB.1), blue: CGFloat(colorRGB.2), alpha: 1)
            
            DispatchQueue.main.async {
                self?.randomColor.backgroundColor = color
            }
        }
    }
}


// MARK: - Actions

extension DetailsViewController {
    
    @IBAction func randomColorAction(_ sender: UIButton) {
        
        viewModel.getRandomColorRGB()
    }
    
}






















