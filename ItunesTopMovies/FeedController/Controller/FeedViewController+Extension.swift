//
//  ViewController+Extension.swift
//  ItunesTopMovies
//
//  Created by Kirill Verhoturov on 26/02/2019.
//  Copyright © 2019 Kirill Verhoturov. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MovieCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieCell
        let movie = viewModel.movie[indexPath.row]
        cell.movieData(movie: movie)
        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movie = viewModel.movie[indexPath.row]
        
        guard let url = URL(string: movie.link!) else { return }
        UIApplication.shared.open(url)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    



}
