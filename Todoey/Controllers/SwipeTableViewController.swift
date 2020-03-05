 //
 //  SwipeTableViewController.swift
 //  Todoey
 //
 //  Created by Macbook on 05/03/2020.
 //  Copyright © 2020 Giulia Catalano. All rights reserved.
 //
 
 import UIKit
 import SwipeCellKit
 import ChameleonFramework
 
 class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80.0
    }
    
    //MARK: - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        cell.delegate = self
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            
            self.updateModel(at: indexPath)
         
        }
        
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        return options
    }
    
    func updateModel(at indexPath: IndexPath) {
        //update data model
        
    }
    
    func updateNavBarColor(_ backgroundColor: UIColor) {
         guard let navBar = navigationController?.navigationBar else {fatalError("Navigation Controller does not exist.")}
        
        let contrastOfBackgroundColor = ContrastColorOf(backgroundColor, returnFlat: true)
        
        //small title colors
        navBar.barTintColor = backgroundColor
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: contrastOfBackgroundColor]
        
        //large title colors
        navBar.backgroundColor = backgroundColor
        navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: contrastOfBackgroundColor]
        
        //color the back button and icons
        navBar.tintColor = contrastOfBackgroundColor
    }
    
 }
 
 
