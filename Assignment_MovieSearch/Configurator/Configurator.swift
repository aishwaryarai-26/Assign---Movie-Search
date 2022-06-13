//
//  Configurator.swift
//  CrelioHealth
//
//  Created by Aishwarya on 03/11/21.
//

import Foundation
import UIKit

class Configurator{
    public static var shared = Configurator()
    
    public func createSearchMovieModule() -> UIViewController {
        let view: UIViewController & SearchMoviePresenterToView = SearchMovieView()
        let presenter: SearchMovieViewToPresenter & SearchMovieInteractorToPresenter = SearchMoviePresenter()
        let interactor: SearchMoviePresenterToInteractor = SearchMovieInteractor()
        let router: SearchMoviePresenterToRouter = SearchMovieRouter()
       
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
       
        return view
    }
    
    //    func createSomeScreen(context: Modelname?) -> UIViewController {
//  }

}
