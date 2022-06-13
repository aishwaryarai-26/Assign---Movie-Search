//
//  NetworkManager.swift
//  Assignment_MovieSearch
//
//  Created by Aishwarya Rai on 26/05/22.
//

import Foundation
import Alamofire

class NetworkManager
{
    class var isConnectedToInternet:Bool
    {
        return NetworkReachabilityManager()!.isReachable
    }
    
}
