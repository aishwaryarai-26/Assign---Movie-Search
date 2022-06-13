//
//  SearchMovieView.swift
//  Assignment_MovieSearch
//
//  Created by Aishwarya Rai on 26/05/22.
//

import UIKit

class SearchMovieView: UIViewController, SearchMoviePresenterToView {
    var presenter: SearchMovieViewToPresenter?
    
    
    @IBOutlet weak var searchResultTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var viewInListOrGridSegmentControl: UISegmentedControl!
    
    var searchMovieList = [SearchList]()
    
    var Title: String?
    var Year: String?
    var Rated : String?
    var Released: String?
    var Runtime: String?
    var Genre : String?
    var Director: String?
    var Writer: String?
    var Actors : String?
    var Plot: String?
    var Language: String?
    var Country : String?
    var Awards: String?
    var Poster: String?
    var Ratings : [Ratings]?
    var Metascore: String?
    var imdbRating: String?
    var imdbVotes : String?
    var imdbID : String?
    var Type: String?
    var totalSeasons: String?
    
    init() {
        super.init(nibName: String(describing: SearchMovieView.self), bundle: Bundle(for: SearchMovieView.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let presenter = presenter else { return }
        searchMovieList = presenter.searchMovieList
        presenter.viewDidLoad()
    }
    
    func setUpView() {
        self.title = "Search"
        searchResultTableView.register(UINib(nibName: "SearchMovieTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchMovieTableViewCell")
    
        searchResultTableView.isHidden = true
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        searchBar.keyboardType = UIKeyboardType.namePhonePad
        
        if #available(iOS 15.0, *) {
            searchResultTableView.sectionHeaderTopPadding = 0.0
        } else {
            // Fallback on earlier versions
        }
    }
    
    func setUpSearchResults() {
        guard let presenter = presenter else { return }
        searchMovieList = presenter.searchMovieList
        
        searchMovieList = searchMovieList.filter({$0.Type == "movie"})
        
        searchResultTableView.isHidden = false
        searchResultTableView.reloadData()
    }
}


extension SearchMovieView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == searchResultTableView {
            return searchMovieList.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieDetails = searchMovieList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchMovieTableViewCell", for: indexPath) as! SearchMovieTableViewCell
        cell.movieName = movieDetails.Title
        cell.movieYear = movieDetails.Year
//        cell.movieImage
        return cell
    }
    
}

extension SearchMovieView : UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
     
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchBar.text!.count) > 2{
            print(searchBar.text!)
            presenter?.getMovieSearchServiceCallWith(searchString: searchBar.text!, page: 0)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        self.searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        self.searchBar.resignFirstResponder()
    }
}
