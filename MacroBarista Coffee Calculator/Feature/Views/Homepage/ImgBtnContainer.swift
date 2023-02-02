//
//  ImgBtnContainer.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 2/1/23.
//

import SwiftUI


struct ImgBtnContainer: View {
    
    typealias ActionHandler = () -> Void
    
    let title: String
    let image: Image
    let handler: ActionHandler
    
    internal init(title: String, image: Image, handler: @escaping ImgBtnContainer.ActionHandler) {
        self.title = title
        self.image = image
        self.handler = handler
    }
    
    var body: some View {
        Button{
            //TODO: Add shadow toggle when user selects option
        } label: {
            image
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 100)
                .clipShape(Circle())
                .shadow(color: .gray, radius: 20, x: 0, y: 2)
            }
        }
}

