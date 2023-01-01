//
//  MovieDetailsVC.swift
//  NetflixSwift
//
//  Created by Marcelo de Araújo on 31/12/22.
//

import UIKit


class MovieDetailsVC: UIViewController {
    private let bannerImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.image = UIImage(named: "heroImage")
        return image
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "Harry Potter"
        return label
    }()
    
    private let overViewLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18)
        label.text = "This is a dummy text for overview of amovie "
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(bannerImage)
        view.addSubview(titleLabel)
        view.addSubview(overViewLabel)
        
        configureConstraints()

    }
    
    private func configureConstraints(){
        let bannerImageConstraints = [
            bannerImage.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
            bannerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bannerImage.heightAnchor.constraint(equalToConstant: 300)
        ]
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: bannerImage.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: bannerImage.leadingAnchor,constant: 20)
        ]
        let overViewLabelConstraints = [
            overViewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 30),
            overViewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            overViewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20)
        ]
        
        NSLayoutConstraint.activate(bannerImageConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(overViewLabelConstraints)
    }
    
    public func configure(with viewModel : MoviePreviewViewModel){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(viewModel.posterUrl ?? "")") else {return}
        titleLabel.text = viewModel.title
        bannerImage.sd_setImage(with: url)
        overViewLabel.text = viewModel.titleOverView
        
    }
    

    

}
