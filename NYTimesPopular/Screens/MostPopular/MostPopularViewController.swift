//
//  MostPopularViewController.swift
//  NYTimesPopular
//
//  Created by Mostafa on 3/27/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit
import Toast_Swift

class MostPopularViewController: UIViewController
{
    let viewModel = MostPopularViewModel()
    
    @IBOutlet weak var tabelView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        viewModel.viewController = self
        
        setUp()
        getData()
    }
    
    private func setUp()
    {
        title = "NY Times Most Popular"
    }
    
    private func getData()
    {
        viewModel.getMostPopular { [weak self] (success, errorMessage) in
            
            guard success
            else {
                self?.view.makeToast(errorMessage ?? Constants.errorMessage)
                return
            }
        }
    }
}


extension MostPopularViewController: MostPopularProtocol
{
    func reloadAllCells()
    {
        DispatchQueue.main.async {
            self.tabelView.reloadData()
        }
    }
    
    func reloadCell(indexPath: IndexPath)
    {
        DispatchQueue.main.async {
            self.tabelView.reloadRows(at: [indexPath], with: .none)
        }
    }
}

extension MostPopularViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.viewModel.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellId = MostPopularCell.cellId
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MostPopularCell
        
        let result = self.viewModel.results[indexPath.row]
        cell.setUp(result: result, indexPath: indexPath, viewModel: viewModel)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        let result = self.viewModel.results[indexPath.row]
        detailsViewController.result = result
        
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
