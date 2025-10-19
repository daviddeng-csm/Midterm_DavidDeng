//
//  ContentView.swift
//  Midterm_DavidDeng
//
//  Midterm Programming Assignment
//
//  Created by David Deng on 10/14/25.
//

import SwiftUI

struct ContentView: View {
    // Load data from JSON file using the Helper.swift extension
    let subjects: [Subject] = Bundle.main.decode([Subject].self, from: "Data.json")
    
    var body: some View {
        NavigationView {
            List(subjects) { subject in
                HStack {
                    // Console icon images
                    Image(subject.imageName + "-icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .cornerRadius(8)
                    
                    // Console name
                    Text(subject.name)
                        .font(.headline)
                        .padding(.leading, 8)
                }
                .padding(.vertical, 8)
            }
            .navigationTitle("David's Retro Consoles")
        }
    }
}

#Preview {
    ContentView()
}
