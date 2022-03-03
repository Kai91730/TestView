//
//  CoordinateResult.swift
//  TestView
//
//  Created by Kai on 2022/3/3.
//

import Foundation

struct GoogleMapGeocodingData: Codable {
    let results: [ResultData]
}

struct ResultData: Codable {
    let geometry: Geometry
}

struct Geometry: Codable {
    let location: Location
}

struct Location: Codable {
    let lat, lng: Double
}
