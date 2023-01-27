//
//  altView.swift
//  swfitdemo
//
//  Created by Sarah Kudrick on 1/27/23.
//

import SwiftUI

struct altView: View {
    var body: some View {
        Text("Hello")
            .font(.largeTitle)
        
        VStack(){
            Spacer()
            HStack(){
                Text("Hello")
                NavigationLink{
                    ContentView()
                } label: {
                    Text("Map")
                }

            }
            .padding(.all)
        }
    }
}

struct altView_Previews: PreviewProvider {
    static var previews: some View {
        altView()
    }
}
