//
//  ContentView.swift
//  SafetyToolbox
//
//  Created by Larissa Nogueira da Rocha on 17/3/2024.
//

import SwiftUI

// http://localhost:3000/api/safety-talks

struct ToolBoxListView: View {
    
    @State var toolboxes: [Toolbox] = []
    
    var body: some View {
        let hexColorGreen = "#007F5F"
        let _greenSafety = Color(hex: hexColorGreen)
        VStack {
            HStack {
                Image(systemName: "cross.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .imageScale(.large)
                    .foregroundStyle(_greenSafety)
                Text("ToolBox List")
                    .bold()
                    .font(.title)
            }
        }
        
        NavigationStack{
            if toolboxes.count == 0 {
                VStack{
                    ProgressView()
                        .padding()
                    Text("We're grabbing the talks")
                }
                .onAppear {
                    getToolboxes()
                }
            } else {
                ScrollView{
                    VStack(spacing: 20) {
                        ForEach(toolboxes) { toolbox in
                            ToolboxTileView(toolbox: toolbox)
                        }
                    }
                }
            }
        }
        .navigationTitle("ToolBox")
    }
    
    func getToolboxes(){
        if let apiURL = URL(string: "http://localhost:3000/api/safety-talks") {
            
            var request = URLRequest(url: apiURL)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let toolboxData = data{
                    if let toolboxesFromApi = try? JSONDecoder().decode([Toolbox].self, from: toolboxData){
                        toolboxes = toolboxesFromApi
                        print(toolboxes)
                    }
                }
            }.resume()
        }
    }
}

#Preview {
    ToolBoxListView()
}


