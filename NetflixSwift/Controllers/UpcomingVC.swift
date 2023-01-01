//
//  UpcomingVC.swift
//  NetflixSwift
//
//  Created by Marcelo de Araújo on 22/12/22.
//

import UIKit

class UpcomingVC: UIViewController {
    
    private var movies : [Movie] = [Movie]()
    
    private let upcomingTable : UITableView = {
        let table = UITableView()
        table.register(MovieTableTableViewCell.self,forCellReuseIdentifier: MovieTableTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(upcomingTable)
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
        fetchUpcoming()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
    }
    
    private func fetchUpcoming() {
        ApiCaller.shared.getUpcomingMovies {[weak self] results in
            switch results {
            case.success(let movies):
                self?.movies = movies
                DispatchQueue.main.async { [weak self] in
                    self?.upcomingTable.reloadData()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}

extension UpcomingVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableTableViewCell.identifier, for: indexPath) as? MovieTableTableViewCell else {return UITableViewCell()}
        cell.configure(with: MovieViewModel(titleName: movies[indexPath.row].original_title ?? "", posterUrl: movies[indexPath.row].poster_path ?? ""))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        DispatchQueue.main.async { [weak self] in
            let vc = MovieDetailsVC()
            guard let movie = self?.movies[indexPath.row] else {return}
            vc.configure(with: MoviePreviewViewModel(title: movie.original_title, posterUrl: movie.poster_path, titleOverView: movie.overview))
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
