// 
//  SearchMovieInteractor.swift
//  Assignment_MovieSearch
//
//  Created by Aishwarya Rai on 26/05/22.
//

import Foundation

class SearchMovieInteractor: SearchMoviePresenterToInteractor {
    weak var presenter: SearchMovieInteractorToPresenter?
        
    func getMovieSearchServiceCallWith(searchString: String, page: Int){
        if !NetworkManager.isConnectedToInternet
        {
            print("Internet not working")
            return
        }
        let parameterDictionary = ["apikey":WebServiceUrls().API_KEY, "s":searchString, "page":page] as [String : AnyObject]
        
        let urlString = WebServiceUrls().BaseURL
        
        WebserviceHandler().get(url: urlString, parameter: parameterDictionary) { (flag, responseData) in
            DispatchQueue.main.async(execute:
                {
                self.mapMovieSearchList(response: responseData.data, urlResponse: responseData.response)
            })
        }
    }
    
    func mapMovieSearchList(response: Data?,urlResponse: HTTPURLResponse?)
    {
        presenter?.mapMovieSearchList(response: response, urlResponse: urlResponse)
    }
    
    func getMovieDetailsCallWith(imDBId: String){
        if !NetworkManager.isConnectedToInternet
        {
            print("Internet not working")
            return
        }
        let parameterDictionary = ["apikey":WebServiceUrls().API_KEY, "i":imDBId] as [String : AnyObject]
        
        let urlString = WebServiceUrls().BaseURL
        
        WebserviceHandler().get(url: urlString, parameter: parameterDictionary) { (flag, responseData) in
            DispatchQueue.main.async(execute:
                {
                self.mapMovieDetailsList(response: responseData.data, urlResponse: responseData.response)
            })
        }

    }
    
    func mapMovieDetailsList(response: Data?,urlResponse: HTTPURLResponse?)
    {
        presenter?.mapMovieTestList(response: response, urlResponse: urlResponse)
    }
}
