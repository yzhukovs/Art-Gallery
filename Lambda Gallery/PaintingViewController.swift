//
//  PaintingViewController.swift
//  Lambda Gallery
//
//  Created by Yvette Zhukovsky on 10/3/18.
//  Copyright © 2018 Yvette Zhukovsky. All rights reserved.
//
import UIKit

class PaintingViewController: UIViewController {
   
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    
}



