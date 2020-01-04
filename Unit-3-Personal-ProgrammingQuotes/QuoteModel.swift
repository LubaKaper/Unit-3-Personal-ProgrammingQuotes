//
//  QuoteModel.swift
//  Unit-3-Personal-ProgrammingQuotes
//
//  Created by Liubov Kaper  on 1/4/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import Foundation
struct Quote: Decodable {
    let en: String
    let author: String
    let rating: Double?
}
