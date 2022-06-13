//
//  WebserviceHandler.swift
//  Assignment_MovieSearch
//
//  Created by Aishwarya Rai on 26/05/22.
//

import Foundation
import Alamofire

class WebserviceHandler
{
    
    func createHeader() -> HTTPHeaders
    {
        let headers = HTTPHeaders.init(["Content-Type": "application/json",
                                        "accept": "application/json"])
        
        return headers
    }
    
    // MARK: POST and Other Requests
    func post(url: String, methodType: HTTPMethod, parameter: [String: Any]?, completion: @escaping (Bool, AFDataResponse<Any>) -> ()){
        
        makeAPICall(request: createRequestnew(url: url, methodType: methodType, parameter: parameter), completion: completion)
    }
    
    func makeAPIRequest(url: String, methodType: HTTPMethod, parameter: [String: Any]?, completion: @escaping (Bool, AFDataResponse<Any>) -> ())
    {
        makeAPICall(request: createRequest(url: url, methodType: methodType, parameter: parameter), completion: completion)
    }
    
    // MARK : Get Request
    func get(url: String, parameter: [String: AnyObject]?, completion: @escaping (Bool, AFDataResponse<Any>) -> ()){
        
        let urlString = url+"?"+createGetParameterString(params: parameter)
        let request = AF.request(urlString, headers: createHeader())
        
        makeAPICall(request: request, completion: completion)
    }
    
    // MARK: Create GET URL
    func createGetParameterString(params: [String: AnyObject]?) -> String {
        var paramString = ""
        if let params = params {
            
            for (key, var value) in params
            {
                if value is Int
                {
                    let valueInt: Int = value as! Int
                    let valueString = String(valueInt)
                    value = valueString as AnyObject
                }
                
                let escapedKey = key.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
                let escapedValue = value.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
                paramString += "\(escapedKey)=\(escapedValue)&"
                
            }
        }
        return paramString
    }
    
    // MARK: POST Request
    func createRequest(url: String, methodType: HTTPMethod, parameter: [String: Any]?) -> DataRequest{
        
        return AF.request(url, method: methodType, parameters: parameter, encoding: JSONEncoding.default, headers: createHeader())
    }
    
    func createRequestnew(url: String, methodType: HTTPMethod, parameter: [String: Any]?) -> DataRequest
    {
        return AF.request(url, method: methodType, parameters: parameter, encoding: URLEncoding.httpBody)
        
    }
    
    // MARK: Get Response
    func makeAPICall(request: DataRequest, completion: @escaping (Bool, AFDataResponse<Any>) -> ())
    {

        request.validate(statusCode: 200..<600).responseJSON { responseData in
            
            guard responseData.error == nil else
            {
                print(responseData.error!)
                return completion(false, responseData)
            }
            
            return completion(true, responseData)
        }
        
    }
    
    
//    func createListHeader() -> HTTPHeaders{
//        let headers = HTTPHeaders.init(["Content-Type": "multipart/form-data",
//                                        "accept": "application/json"])
//        
//        return headers
//    }
//    
//    // MARK : Get List Request
//    func getList(url: String, parameter: [String: AnyObject]?, completion: @escaping (Bool, AFDataResponse<Any>) -> ()){
//        
//        let urlString = url+"?"+createGetListParameterString(params: parameter)
//        let request = AF.request(urlString, headers: createListHeader())
//        
//        makeAPICall(request: request, completion: completion)
//    }
//    
//    // MARK: Create GET URL
//    func createGetListParameterString(params: [String: AnyObject]?) -> String {
//        var paramString = ""
//        if let params = params {
//            
//            for (key, var value) in params
//            {
//                if value is Int
//                {
//                    let valueInt: Int = value as! Int
//                    let valueString = String(valueInt)
//                    value = valueString as AnyObject
//                }
//                
//                let escapedKey = key.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
//                let escapedValue = value.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
//                paramString += "\(escapedKey)=\(escapedValue)&"
//                
//            }
//        }
//        return paramString
//    }
}
