//
//  TourismMapModel.swift
//  TourismDicoding
//
//  Created by MuhammadHariyanto on 09/06/22.
//

import Foundation
import MapKit

class TourismMapModel:NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var info:String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
    
}
