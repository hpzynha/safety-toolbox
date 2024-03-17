//
//  ToolboxTileView.swift
//  SafetyToolbox
//
//  Created by Larissa Nogueira da Rocha on 17/3/2024.
//

import SwiftUI

struct ToolboxTileView: View {
    let toolbox: Toolbox
    var body: some View {
        VStack{
            Spacer()
            HStack {
                Text(toolbox.title)
                    .padding(.vertical,4)
                    .padding(.horizontal)
                    .bold()
                    .foregroundStyle(.white)
                Spacer()
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background {
                Color.purple
                    .opacity(0.5)
            }
        }
    }
}

#Preview {
    ToolboxTileView(toolbox: Toolbox(id: 1, title: "Safety", text: "jkakdjakld"))
}
