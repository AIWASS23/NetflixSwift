//
//  MovieTableTableViewCell.swift
//  NetflixSwift
//
//  Created by Marcelo de Araújo on 24/12/22.
//

import UIKit


class MovieTableTableViewCell: UITableViewCell {

   static let identifier = "MovieTableTableViewCell"
    
    private let moviePosterImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(moviePosterImageView)
        contentView.addSubview(titleLabel)
        
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("movie table view cell error")
    }
    
    private func applyConstraints(){
        let moviePosterImageViewConstraints = [
            moviePosterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            moviePosterImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            moviePosterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor,constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(moviePosterImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    public func configure(with model : MovieViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterUrl)") else {return}
        moviePosterImageView.sd_setImage(with: url)
        titleLabel.text = model.titleName
        
    }

}
