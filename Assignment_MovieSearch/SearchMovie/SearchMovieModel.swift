import Foundation

// MARK: - SearchListModel
struct SearchListModel: Codable {
    let Search: [SearchList]?
    let totalResults: String?
    let Response : String?
}

// MARK: SearchListModel convenience initializers and mutators
extension PatientListModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(SearchListModel.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        Search: [SearchList]?? = nil,
        totalResults: String?? = nil,
        Response: String?? = nil
    ) -> SearchListModel {
        return SearchListModel(
            Search: Search ?? self.Search,
            totalResults: totalResults ?? self.totalResults,
            Response: Response ?? self.Response
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}


// MARK: - SearchList
struct SearchList: Codable {
  
    let Title, Year, imdbID, Type, Poster : String?
}

// MARK: BillList convenience initializers and mutators

extension PatientList {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(SearchList.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        Title: String?? = nil,
        Year: String?? = nil,
        imdbID: String?? = nil,
        Type: String?? = nil,
        Poster: String?? = nil
    ) -> SearchList {
        return SearchList(
            Title: Title ?? self.Title,
            Year: Year ?? self.Year,
            imdbID: imdbID ?? self.imdbID,
            Type: Type ?? self.Type,
            Poster: Poster ?? self.Poster
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - MovieDetailsModel
struct MovieDetailsModel: Codable {
    let Title: String?
    let Year: String?
    let Rated : String?
    let Released: String?
    let Runtime: String?
    let Genre : String?
    let Director: String?
    let Writer: String?
    let Actors : String?
    let Plot: String?
    let Language: String?
    let Country : String?
    let Awards: String?
    let Poster: String?
    let Ratings : [Ratings]?
    let Metascore: String?
    let imdbRating: String?
    let imdbVotes : String?
    let imdbID : String?
    let Type: String?
    let totalSeasons: String?
    let Response : String?

}

// MARK: SearchListModel convenience initializers and mutators
extension MovieDetailsModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MovieDetailsModel.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        
     Title: String?? = nil,
     Year: String?? = nil,
     Rated : String?? = nil,
     Released: String?? = nil,
     Runtime: String?? = nil,
     Genre : String?? = nil,
     Director: String?? = nil,
     Writer: String?? = nil,
     Actors : String?? = nil,
     Plot: String?? = nil,
     Language: String?? = nil,
     Country : String?? = nil,
     Awards: String?? = nil,
     Poster: String?? = nil,
     Ratings : [Ratings]?? = nil,
     Metascore: String?? = nil,
     imdbRating: String?? = nil,
     imdbVotes : String?? = nil,
     imdbID : String?? = nil,
     Type: String?? = nil,
     totalSeasons: String?? = nil,
     Response : String?? = nil
    ) -> MovieDetailsModel {
        return MovieDetailsModel(
            Title: Title ?? self.Title,
            Year: Year ?? self.Year,
            Rated: Rated ?? self.Rated,
            Released: Released ?? self.Released,
            Runtime: Runtime ?? self.Runtime,
            Genre: Genre ?? self.Genre,
            Director: Director ?? self.Director,
            Writer: Writer ?? self.Writer,
            Actors: Actors ?? self.Actors,
            
            Plot: Plot ?? self.Plot,
            Language: Language ?? self.Language,
            Country: Country ?? self.Country,
            Awards: Awards ?? self.Awards,
            Poster: Poster ?? self.Poster,
            Ratings: Ratings ?? self.Ratings,
            Metascore: Metascore ?? self.Metascore,
            imdbRating: imdbRating ?? self.imdbRating,
            imdbVotes: imdbVotes ?? self.imdbVotes,
            imdbID: imdbID ?? self.imdbID,
            Type: Type ?? self.Type,
            totalSeasons: totalSeasons ?? self.totalSeasons,
            Response: Response ?? self.Response
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}


// MARK: - Ratings
struct Ratings: Codable {
    let Source, Value : String?
}

// MARK: BillList convenience initializers and mutators

extension Ratings {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Ratings.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        Source: String?? = nil,
        Value : String? = nil
    ) -> Ratings {
        return Ratings(
            Source: Source ?? self.Source,
            Value: Value ?? self.Value
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

