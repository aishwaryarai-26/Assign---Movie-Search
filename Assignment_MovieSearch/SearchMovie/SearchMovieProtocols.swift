// 
//  SearchMovieProtocols.swift
//  Assignment_MovieSearch
//
//  Created by Aishwarya Rai on 26/05/22.
//

import UIKit

// MARK: View -
protocol SearchMoviePresenterToView: class {
    var presenter: SearchMovieViewToPresenter? { get set }
    
    var searchMovieList : [SearchList] { get set }
    
    func setUpView()
    func setUpSearchResults()
}

// MARK: Interactor -
protocol SearchMoviePresenterToInteractor: class {
    var presenter: SearchMovieInteractorToPresenter? { get set }
    
    func getMovieSearchServiceCallWith(searchString: String, page: Int)
    func getMovieDetailsCallWith(imDBId: String)
}

// MARK: Router -
protocol SearchMoviePresenterToRouter: class {
}

// MARK: Presenter -
protocol SearchMovieViewToPresenter: class {
    var view: SearchMoviePresenterToView? { get set }
    var interactor: SearchMoviePresenterToInteractor? { get set }
    var router: SearchMoviePresenterToRouter? { get set }
    
    var searchMovieList : [SearchList] { get set }
    
    func getMovieSearchServiceCallWith(searchString: String, page: Int)
    func getMovieDetailsCallWith(imDBId: String)
    
    func viewDidLoad()
}

protocol SearchMovieInteractorToPresenter: class {
    func mapMovieSearchList(response: Data?,urlResponse: HTTPURLResponse?)
    func mapMovieDetailsList(response: Data?,urlResponse: HTTPURLResponse?)
}
