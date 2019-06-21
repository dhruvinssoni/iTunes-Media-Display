//
//  ViewController.swift
//  iTunes Media
//
//  Created by Dhruvin Soni on 6/21/19.
//  Copyright © 2019 Dhruvin Soni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Constants
    let store = DataStore.sharedInstance
    
    //Variables
    var tableview: UITableView = {
        let myTableView = UITableView()
        myTableView.backgroundColor = UIColor.white
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        
        return myTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        store.getartWorkImages {
            self.tableview.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        tableview.allowsSelection = false
        
        self.view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
            ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return store.applemusic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cellID")
        cell.backgroundColor = UIColor.white
        
        let musicData = store.applemusic[indexPath.row]
        
        cell.textLabel?.text = musicData.artist
        cell.imageView!.image = store.images[indexPath.row]
        cell.detailTextLabel?.text = musicData.album
        return cell
    }
}

