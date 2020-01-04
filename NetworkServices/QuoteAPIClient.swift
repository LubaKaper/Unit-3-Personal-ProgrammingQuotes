//
//  QuoteAPIClient.swift
//  Unit-3-Personal-ProgrammingQuotes
//
//  Created by Liubov Kaper  on 1/4/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import Foundation

struct QuoteAPIClient {
    
    static func fetchQuote (competion: @escaping (Result <[Quote], AppError>) ->()) {
        let quoteURLString = "https://programming-quotes-api.herokuapp.com/quotes"
        
        guard let url = URL(string: quoteURLString) else {
            competion(.failure(.badURL(quoteURLString)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                competion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let quotes = try JSONDecoder().decode([Quote].self, from: data)
                    competion(.success(quotes))
                } catch {
                    competion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
