//
//  MapView.swift
//  BucketList
//
//  Created by Yuki Shinohara on 2020/04/12.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import SwiftUI
import MapKit

//struct MapView: UIViewRepresentable {
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
////
////    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
////        let mapView = MKMapView()
////        mapView.delegate = context.coordinator
////        return mapView
////    }
//
//    func makeUIView(context: Context) -> MKMapView {
//        let mapView = MKMapView()
//        mapView.delegate = context.coordinator
//
//        let annotation = MKPointAnnotation()
//        annotation.title = "London"
//        annotation.subtitle = "Capital of England"
//        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: 0.13)
//        mapView.addAnnotation(annotation)
//
//        return mapView
//    }
//
////    func mapView(_ mapView: MKMapView, vi。
//
//    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapView>) {
//    }
//
//    class Coordinator: NSObject, MKMapViewDelegate {
//        var parent: MapView
//
//        init(_ parent: MapView) {
//            self.parent = parent
//        }
//
//        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
//            print(mapView.centerCoordinate)
//        }
//    }
//}
//
//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
//
////              ContentView
////MapView()
////       .edgesIgnoringSafeArea(.all)
