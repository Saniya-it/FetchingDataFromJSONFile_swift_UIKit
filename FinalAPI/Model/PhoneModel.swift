//
//  PhoneModel.swift
//  FinalAPI
//
//  Created by Dauletkhanova Saniya
//

import Foundation
import UIKit

struct PhoneModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [Articles]
}

struct Articles: Codable {
    
    let source: Source?
    let author: String?
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
        
    init(title: String, description: String?, url: String?, urlToImage: String?, publishedAt: String?, content: String?, author: String?, source: Source?) {
        self.title = title
        self.description = description ?? ""
        self.url = url ?? ""
        self.urlToImage = urlToImage ?? ""
        self.publishedAt = publishedAt ?? ""
        self.content = content ?? ""
        self.author = author ?? ""
        self.source = source
    }
}

struct Source: Codable {
    let id: String?
    let name: String?
    
    init(id: String?, name: String?) {
            self.id = id ?? ""
            self.name = name ?? ""
        }
}




