//
//  SearchResultsVC.swift
//  NetflixSwift
//
//  Created by Marcelo de Araújo on 31/12/22.
//

import UIKit

protocol SearchResultsVCDelegate : AnyObject {
    func searchResultsViewControllerDidTapItem(_ viewModel : MoviePreviewViewModel)
}

class SearchResultsVC: UIViewController {
    
    public var movies : [Movie] = [Movie]()
    
    public weak var delegate : SearchResultsVCDelegate?
        
    public let searchResultsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width/3)-10, height: 180)
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        return collectionView;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(searchResultsCollectionView)
        searchResultsCollectionView.delegate = self
        searchResultsCollectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultsCollectionView.frame = view.bounds
    }

}

extension SearchResultsVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {return UICollectionViewCell()}
        let movie = movies[indexPath.row]
        cell.configure(with: movie.poster_path ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view tapped")
        let movie = movies[indexPath.row]
        collectionView.deselectItem(at: indexPath, animated: true)
        self.delegate?.searchResultsViewControllerDidTapItem(MoviePreviewViewModel(title: movie.original_title, posterUrl: movie.poster_path, titleOverView: movie.overview))
    }
    
    
}
