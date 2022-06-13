//
//  SearchMoviePresenter.swift
//  Assignment_MovieSearch
//
//  Created by Aishwarya Rai on 26/05/22.
//

import Foundation

class SearchMoviePresenter: SearchMovieViewToPresenter {
    weak var view: SearchMoviePresenterToView?
    var interactor: SearchMoviePresenterToInteractor?
    var router: SearchMoviePresenterToRouter?
    
    var searchMovieList = [SearchList]()
    
    func viewDidLoad() {
        view?.setUpView()
    }
    
    func getMovieSearchServiceCallWith(searchString: String, page: Int) {
        interactor?.getMovieSearchServiceCallWith(searchString: searchString, page: page)
    }
    
    func getMovieDetailsCallWith(imDBId: String){
        interactor?.getMovieDetailsCallWith(imDBId: imDBId)
    }
    
    
}

extension SearchMoviePresenter: SearchMovieInteractorToPresenter {
    
    func successSearch() {
        view?.searchMovieList = self.searchMovieList
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.view?.setUpSearchResults()
        }
    }
    
    func mapMovieSearchList(response: Data?,urlResponse: HTTPURLResponse?) {
        guard let response = response else {return}
        do{
            let dataModel = try JSONDecoder().decode(SearchListModel.self, from: response)
            self.searchMovieList = dataModel.Search!
            self.successSearch()
        } catch let jsonError
        {
            print(jsonError)
        }
    }
    
    func mapMovieDetailsList(response: Data?,urlResponse: HTTPURLResponse?) {
        
    }

}
