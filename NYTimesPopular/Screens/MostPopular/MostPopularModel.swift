//
//  MostPopularModel.swift
//  NYTimesPopular
//
//  Created by Mostafa on 3/27/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import Foundation


struct MostPopular: Codable
{
    let num_results: Int?
    let results: [Result]?
}

struct Result: Codable
{
    let url: String?
    let adx_keywords: String?
    let section: String?
    let byline: String?
    let type: String?
    let title: String?
    let abstract: String?
    let published_date: String?
    let source: String?
    let id: Int?
    let asset_id: Int?
    let views: Int?
    
    let uri: String?
    
    let media: [Media]?
    
}

struct Media: Codable
{
    let type: String?
    let subtype: String?
    let caption: String?
    let copyright: String?
    let approvedForSyndication: Int?
    
    let mediaMetadata: [Metadata]?
    
    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

struct Metadata: Codable
{
    let url: String?
    let format: String?
    let height: Int?
    let width: Int?
}

















