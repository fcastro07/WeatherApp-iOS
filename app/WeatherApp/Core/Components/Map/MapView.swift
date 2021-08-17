//
//  MapView.swift
//  WeatherApp
//
//  Created by Facundo Castro on 17/8/21.
//

import Foundation
import UIKit
import SwiftUI
import MapKit
import Combine

struct MapView: UIViewRepresentable {
    
    @Binding var annotationLocation: CLLocationCoordinate2D?
    @State private var annotation = MKPointAnnotation()
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = WrappedMap()
        mapView.delegate = context.coordinator
        mapView.onPress = addAnnotation(for:)
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotation(annotation)
    }
    
    func addAnnotation(for coordinate: CLLocationCoordinate2D) {
        let newAnnotation = MKPointAnnotation()
        newAnnotation.coordinate = coordinate
        annotationLocation = coordinate
        annotation = newAnnotation
    }
}

extension MapView {
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        init(_ parent: MapView) {
            self.parent = parent
        }
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

struct MapView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        MapView(annotationLocation: dev.$currentLocation)
            .previewLayout(.sizeThatFits)
    }
}
