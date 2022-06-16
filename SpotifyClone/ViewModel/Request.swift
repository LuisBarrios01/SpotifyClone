//
//  Request.swift
//  SpotifyClone
//
//  Created by MAC37 on 18/05/22.
//

import Foundation

class Request {
    
    let token = "BQBhZiifu49ct_X8retpvMJnScz89qcXoyskCYUoY3rEfuJ2o_mPJ0A1gfFFY9LZ9lGgE1S7jthOZhoulCYNUsNeh7LNSx4A4GQGW_nzsec1FHfUpqD8MD8EOAJqaJmczhluKfIDujIh8SXcDJ8ZWbrkxoG-uhnLXejxVxe6eSuTcxx5yXPck0N32Tr9blszy6wY"
    
    let BASE_URL = "https://api.spotify.com/v1/"
    
    func getDataFromAPI(url: String) async -> Data? {
        do {
            var request = URLRequest(url: HelperString.getURLFromString(url: "\(BASE_URL)\(url)")!)
            request.httpMethod = "GET"
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            return data
        } catch {
            return nil
        }
    }
    
}
