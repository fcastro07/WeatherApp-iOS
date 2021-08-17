//
//  WrappedMap.swift
//  WeatherApp
//
//  Created by Facundo Castro on 17/8/21.
//

import Foundation
import MapKit

final class WrappedMap: MKMapView {
    
    var onPress: (CLLocationCoordinate2D) -> Void = { _ in }
    
    init() {
        super.init(frame: .zero)
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let location = sender.location(in: self)
            let coordinate = convert(location, toCoordinateFrom: self)
            onPress(coordinate)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
