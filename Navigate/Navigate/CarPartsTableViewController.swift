//
//  CarPartsTableViewController.swift
//  Navigate
//
//  Created by Tan Tran on 2017-10-19.
//  Copyright © 2017 Dream Chasers. All rights reserved.
//

import UIKit

class CarPartsTableViewController: UITableViewController,UISearchResultsUpdating {
 
    //--------------------Variables -------------------------
    var carParts = ["Brakes","Tires", "Windsheild"]
    var filteredCarParts = [String]()
    var searchController: UISearchController!
    
    var resultsController = UITableViewController()
    //---------------------Main ------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultsController.tableView.dataSource = self
        self.resultsController.tableView.delegate = self
        
        self.searchController = UISearchController(searchResultsController: self.resultsController)
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
      
        //unDims Background for search
        self.searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
       
    }
    
    //---------------------Function -------------------------
    
    func updateSearchResults(for searchController: UISearchController) {
        // Filter through array of car-parts
        self.filteredCarParts = self.carParts.filter{ (carParts:String) -> Bool in
            if carParts.lowercased().contains(self.searchController.searchBar.text!.lowercased()){
                return true
            }
            else{
                return false
            }
        }
        //Update results on TableView
        self.resultsController.tableView.reloadData()
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView{
            return self.carParts.count
        }
        else{
            return self.filteredCarParts.count
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if tableView == self.tableView{
                cell.textLabel?.text = self.carParts[indexPath.row]
        }
        else{
                cell.textLabel?.text = self.filteredCarParts[indexPath.row]
        }
        
        return cell
    }
    
    
}
