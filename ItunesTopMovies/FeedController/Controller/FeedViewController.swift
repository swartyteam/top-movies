//
//  ViewController.swift
//  ItunesTopMovies
//
//  Created by Kirill Verhoturov on 26/02/2019.
//  Copyright © 2019 Kirill Verhoturov. All rights reserved.
//

import UIKit






class ViewController: UIViewController {
    
    
    var viewModel = MovieViewModel()
    var movieArray = [String]()
    
    let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    let myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)



    override func viewDidLoad() {
        super.viewDidLoad()

        
        

        
        
        viewModel.fetchMovies { (success) -> Void in
            if(success){
                DispatchQueue.main.async {
                    self.myActivityIndicator.stopAnimating()
                    self.tableView.isHidden = false
                    self.tableView.reloadData()
                }
            }
            else{
                print("Could not fetch the movies...")
            }
        }

    }
    
    
    
    func setupView(){
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.isHidden = true
        
        
        myActivityIndicator.center = view.center
        
        myActivityIndicator.hidesWhenStopped = true
        
        myActivityIndicator.startAnimating()
        
        view.addSubview(myActivityIndicator)
        view.bringSubviewToFront(myActivityIndicator)
    }



}

