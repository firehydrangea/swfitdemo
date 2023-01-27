//
//  ContentView.swift
//  swfitdemo
//
//  Created by Sarah Kudrick on 1/27/23.
//

import SwiftUI
import Foundation
import MapKit


struct ContentView: View {
    //@EnvironmentObject private var vm: LocationsViewModel
    //@State private var mapRegion: MKCoordinateRegion = MKCoordinateRegion(
    @State private var region = MKCoordinateRegion(

        center: CLLocationCoordinate2D(latitude: 40.2942, longitude: -79.4001),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        ZStack{
            //Map(coordinateRegion: $mapRegion)
            Map(coordinateRegion: $region)
                .ignoresSafeArea()
            Text("Saint Vincent College")
                .font(.title)
        }
    }
}

struct mapview_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 11")
        }
    }
}
