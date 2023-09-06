//
//  RealmModel.swift
//  BookWarm
//
//  Created by 이승현 on 2023/09/04.
//

import Foundation
import RealmSwift

class MovieTable: Object {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var movieTitle: String
    @Persisted var movieRate: String
    @Persisted var movieLike: Bool
    @Persisted var movieRuntime: String
    @Persisted var Overview: String?
    @Persisted var movieSummary: String?

    convenience init(movieTitle: String, movieRate: String, movieLike: Bool, movieRuntime: String, Overview: String, movieSummary: String) {
        self.init()
        
        self.movieTitle = movieTitle
        self.movieRate = movieRate
        self.movieLike = false
        self.movieRuntime = movieRuntime
        self.Overview = Overview
        self.movieSummary = movieSummary
    }
}
