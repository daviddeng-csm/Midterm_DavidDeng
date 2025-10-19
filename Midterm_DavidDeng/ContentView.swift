//
//  ContentView.swift
//  Midterm_DavidDeng
//
//  Midterm Programming Assignment
//  David Deng - 10/14/25
//  Retro Console Collection App
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
                NavigationLink(destination: DetailView(subject: subject)) {
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
            }
            .navigationTitle("David's Retro Consoles")
        }
    }
}

struct DetailView: View {
    let subject: Subject
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Large console image
                Image(subject.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 220)
                    .cornerRadius(12)
                
                // Console name
                Text(subject.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // Console details
                VStack(alignment: .leading, spacing: 8) {
                    Text("Release: \(subject.releaseDate)")
                    Text("Manufacturer: \(subject.manufacturer)")
                    Text("Type: \(subject.type.capitalized)")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                // Description
                Text(subject.description)
                    .font(.body)
                    .lineSpacing(4)
                
                Divider()
                
                // Notable games
                VStack(alignment: .leading, spacing: 8) {
                    Text("Notable Games:")
                        .font(.headline)
                    Text(subject.notableGames)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
