//
//  MovieCell.swift
//  MVVMTableView
//
//  Created by Hiren Patel on 10/9/18.
//  Copyright © 2018 com.hiren. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    
    let movieLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    let coverImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.masksToBounds = true
        img.layer.cornerRadius = 20
        img.backgroundColor = UIColor(white: 0.95, alpha: 1)
        return img
    }()
    

    
    static var cellId = "cellId"
    
    let padding: CGFloat = 15
    
    func movieData(movie:Movie){
        self.movieLabel.text = movie.name
        
        addSubview(movieLabel)
        addSubview(coverImageView)
        
        coverImageView.anchores(top: topAnchor, left: leftAnchor, paddingTop: padding, paddingLeft: padding, width: 40, height: 40)
        movieLabel.anchores(left: coverImageView.rightAnchor, paddingLeft: padding)
        
        movieLabel.centerYAnchor.constraint(equalTo: coverImageView.centerYAnchor).isActive = true
        
        self.coverImageView.image = UIImage(named: "movie")
        let imgURL = URL(string: movie.artworkURL!)
        self.coverImageView.downloaded(from: imgURL!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

        
        
        
        
    }
    
    
}


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
