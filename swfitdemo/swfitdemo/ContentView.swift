//
//  ContentView.swift
//  swfitdemo
//
//  Created by Sarah Kudrick on 1/27/23.
//

import SwiftUI
import Foundation
import MapKit

struct IdentifiablePlace: Identifiable {
    let id: UUID
    
    let location: CLLocationCoordinate2D
    let name: String
    
    init(id: UUID = UUID(), name: String, lat: Double, long: Double){
        self.id = id
        self.name = name
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
    }
    
}


struct ContentView: View {
    //@EnvironmentObject private var vm: LocationsViewModel
    //@State private var mapRegion: MKCoordinateRegion = MKCoordinateRegion(
    let places = [
        IdentifiablePlace(name: "Dupre", lat: 40.2941_775, long: -79.4001)]
    
    @State private var region = MKCoordinateRegion(

        center: CLLocationCoordinate2D(latitude: 40.2942, longitude: -79.4001),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        ZStack{
            //Map(coordinateRegion: $mapRegion)
            Map(coordinateRegion: $region,
            annotationItems: places)
            { place in
                MapMarker(coordinate: place.location)
            }
                .ignoresSafeArea()
            Text("Saint Vincent College")
                .font(.title)
        }
        .onTapGesture{
            print(places[0].name)
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
