//
//  MoviesResponse.swift
//  NetflixSwift
//
//  Created by Marcelo de Araújo on 23/12/22.
//

import Foundation

struct MoviesModel : Codable{
    let results : [Movie]
}

struct Movie : Codable {
    let id : Int
    let original_title : String?
    let overview : String?
    let poster_path : String?
    let release_date : String?
    let popularity : Double
    let vote_count : Int
    let vote_average : Double
}
