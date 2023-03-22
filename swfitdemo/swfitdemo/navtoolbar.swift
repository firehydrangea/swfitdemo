//
//  navtoolbar.swift
//  swfitdemo
//
//  Created by Sarah Kudrick on 2/3/23.
//

import SwiftUI

struct navtoolbar: View {
    @State private var showingProfile = false;
    var body: some View {
        NavigationView{
            NavigationLink{
                altView()
            } label: {
                Image(systemName: "heart.fill")
            }
            .toolbar{
                Button{
                    showingProfile.toggle()
                } label: {
                    Image(systemName: "person")
                }
                .sheet(isPresented: $showingProfile){
                    altView()
                }
            }
        }
    }
}

struct navtoolbar_Previews: PreviewProvider {
    static var previews: some View {
        navtoolbar()
    }
}
