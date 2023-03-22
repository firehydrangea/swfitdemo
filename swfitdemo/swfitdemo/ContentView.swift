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
    let oMapSymbol=Image(systemName: "mappin.circle")
    let oAnnouncementsSymbol=Image(systemName: "megaphone")
    let oSettingsSymbol=Image(systemName: "gearshape")
    let places = [
        IdentifiablePlace(name: "Dupre", lat: 40.2941_775, long: -79.4001)]
    
    @State private var region = MKCoordinateRegion(

        center: CLLocationCoordinate2D(latitude: 40.2942, longitude: -79.4001),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        announcementsView()
        
    }
    var settingsSubView: some View {
        VStack{
            HStack{
                Text("Settings")
                    .frame(height: 100, alignment: .bottom)
            }
            Spacer()
            HStack{
                Image(systemName: "megaphone.fill")
                    .font(.system(size: 50))
                    .foregroundColor(Color("iconColor"))
                    .frame(maxWidth: .infinity)
                    .background(Color("highlight"))
                Image(systemName: "mappin.circle.fill")
                    .font(.system(size: 51))
                    .foregroundColor(Color("iconColor"))
                    .frame(maxWidth: .infinity)
                    .background(Color("highlight"))
                Image(systemName: "gearshape.fill")
                    .font(.system(size: 50))
                    .foregroundColor(Color("iconColor"))
                    .frame(maxWidth: .infinity)
                    .background(Color("selected"))
            }
        }.ignoresSafeArea()
    }
}

struct mapview_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 11")
                .previewInterfaceOrientation(.landscapeRight)
            
        }
    }
}

struct mapView: View {
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
            HStack{
                Spacer()
                VStack{
                    Image(systemName: "megaphone.fill")
                        .font(.system(size: 50))
                        .foregroundColor(Color("iconColor"))
                        .frame(maxHeight: .infinity)
                        .background(Color("highlight"))
                    Image(systemName: "mappin.circle.fill")
                        .font(.system(size: 51))
                        .foregroundColor(Color("iconColor"))
                        .frame(maxHeight: .infinity)
                        .background(Color("selected"))
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 50))
                        .foregroundColor(Color("iconColor"))
                        .frame(maxHeight: .infinity)
                        .background(Color("highlight"))
                }
            }
            
                
        }//end of zstack
        .ignoresSafeArea()
        .onTapGesture{
            print(places[0].name)
        }
    }
}




struct announcementsView: View {
    @State var status = "nothing pressed"
    var body: some View {
        VStack{
            HStack{
                Text("Announcements")
                    .frame(height: 100, alignment: .bottom)

                Text(status)
                    .frame(height: 100, alignment: .bottom)

            }
            Spacer()
            HStack{
                Button {
                    self.status="button 1 pressed"
                } label: {
                    Image(systemName: "megaphone.fill")
                        .font(.system(size: 75))
                        .foregroundColor(Color("iconColor"))
                        .frame(maxWidth: .infinity, alignment: .bottom)
                        .background(Color("selected"))
                        .padding(.all, 0) //these lines don't do anything
                }
                Button {
                    self.status="button 2 pressed"

                } label: {
                    Image(systemName: "mappin.circle.fill")
                        .font(.system(size: 77))
                    //mappin.circle seems to be a different sized icon than the other two.
                    //a bigger size makes the buttons more aligned.
                        .foregroundColor(Color("iconColor"))
                        .frame(maxWidth: .infinity, alignment: .bottom)
                        .background(Color("highlight"))
                        .padding(.all, 0)
                }
                Button {
                    self.status="button 3 pressed"
                    //settingsSubView
                } label: {
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 76))
                        .foregroundColor(Color("iconColor"))
                        .frame(maxWidth: .infinity, alignment: .bottom)
                        .background(Color("highlight"))
                        .padding(.all, 0)
                }
            }
        }.ignoresSafeArea()
    }
    var settingsSubView: some View {
        VStack{
            HStack{
                Text("Settings")
                    .frame(height: 100, alignment: .bottom)
            }
            Spacer()
            HStack{
                Image(systemName: "megaphone.fill")
                    .font(.system(size: 50))
                    .foregroundColor(Color("iconColor"))
                    .frame(maxWidth: .infinity)
                    .background(Color("highlight"))
                Image(systemName: "mappin.circle.fill")
                    .font(.system(size: 51))
                    .foregroundColor(Color("iconColor"))
                    .frame(maxWidth: .infinity)
                    .background(Color("highlight"))
                Image(systemName: "gearshape.fill")
                    .font(.system(size: 50))
                    .foregroundColor(Color("iconColor"))
                    .frame(maxWidth: .infinity)
                    .background(Color("selected"))
            }
        }.ignoresSafeArea()
    }
}

struct oldSettingsView: View {
    var body: some View {
            VStack{
                HStack{
                    Text("Settings")
                        .frame(height: 100, alignment: .bottom)
                }
                Spacer()
                HStack{
                    Image(systemName: "megaphone.fill")
                        .font(.system(size: 50))
                        .foregroundColor(Color("iconColor"))
                        .frame(maxWidth: .infinity)
                        .background(Color("highlight"))
                    Image(systemName: "mappin.circle.fill")
                        .font(.system(size: 51))
                        .foregroundColor(Color("iconColor"))
                        .frame(maxWidth: .infinity)
                        .background(Color("highlight"))
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 50))
                        .foregroundColor(Color("iconColor"))
                        .frame(maxWidth: .infinity)
                        .background(Color("selected"))
                }
            }.ignoresSafeArea()
        
    }
}
