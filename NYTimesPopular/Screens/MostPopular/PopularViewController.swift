//
//  PopularViewController.swift
//  NYTimesPopular
//
//  Created by Mostafa on 3/27/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit
import Toast_Swift


class PopularViewController: UIViewController
{
    let popularViewModel = PopularViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setUp()
        getData()
    }
    
    private func setUp()
    {
        title = "NY Times Most Popular"
        tableView.accessibilityIdentifier = "PopularTableView"
        
        popularViewModel.results.bind { [weak self] (results) in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        popularViewModel.error?.bind(listener: { [weak self] (errorString) in
            DispatchQueue.main.async {
                self?.view.makeToast(errorString)
            }
        })
        
        popularViewModel.loading.bind { [weak self] (isLoading) in
            
            DispatchQueue.main.async {
                if isLoading {
                    self?.view.makeToastActivity(.center)
                } else {
                    self?.view.hideToastActivity()
                }
            }
        }
    }
    
    private func getData()
    {
        popularViewModel.loadResult()
    }
}

extension PopularViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.popularViewModel.results.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellId = PopularCell.cellId
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PopularCell
        
        let result = self.popularViewModel.results.value[indexPath.row]
        cell.setUp(result: result)
        
        cell.accessibilityIdentifier = "\(indexPath.row)"
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        let result = self.popularViewModel.results.value[indexPath.row]
        detailsViewController.result = result
        
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
