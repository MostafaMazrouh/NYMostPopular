//
//  PopularModel.swift
//  NYTimesPopular
//
//  Created by Mostafa on 3/27/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import Foundation

struct Popular: Codable
{
    let num_results: Int?
    let results: [Result]?
    
    init(results: [Result]) {
        self.results = results
        num_results = nil
    }
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
    
    
    init(title: String, abstract: String, published_date: String)
    {
        self.title = title
        self.abstract = abstract
        self.published_date = published_date
        
        (url, adx_keywords, section, byline, type, source, uri, id, asset_id, views, media) =
            (nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil)
    }
    
    var smallImage: String? {
        get {
            guard let media = self.media,
                media.count > 0,
                let mediaMetadata = media[0].mediaMetadata,
                mediaMetadata.count > 0,
                let imageURL = mediaMetadata[0].url
                else { return nil }
            return imageURL
        }
    }
    
    var bigImage: String? {
        get {
            guard let media = self.media,
                media.count > 0,
                let mediaMetadata = media[0].mediaMetadata,
                mediaMetadata.count > 2,
                let imageURL = mediaMetadata[2].url
                else { return nil }
            return imageURL
        }
    }
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

















