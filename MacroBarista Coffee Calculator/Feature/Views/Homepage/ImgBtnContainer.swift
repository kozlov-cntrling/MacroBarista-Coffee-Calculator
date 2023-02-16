//
//  ImgBtnContainer.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 2/1/23.
//

import SwiftUI


struct ButtonView: View {
    
    typealias ActionHandler = () -> Void
    let width: CGFloat
    let title: String
    let sfSymbol: String?
    let handler: ActionHandler
    
    private let cornerRadius: CGFloat = 10
    
    internal init(title: String,
                  sfSymbol: String?,
                  width: CGFloat,
                  handler: @escaping ButtonView.ActionHandler) {
        self.title = title
        self.sfSymbol = sfSymbol
        self.width = width
        self.handler = handler
    }
    
    var body: some View {
        Button(action: handler,
               label: {
            HStack(alignment: .center){
                Text(title)
                    .frame(maxWidth: width, minHeight: 40, alignment: .center)
                if let systemImage =  sfSymbol{
                    Image(systemName: systemImage)
                        .foregroundColor(Color.white.opacity(0.8))
                        .font(.system(size:18, weight: .bold))
                }
            }
            .padding(.horizontal,30)
        })
        .background(.blue)
        .foregroundColor(.white)
        .font(.system(size:20, weight: .bold))
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(lineWidth: 2)
        )
    }
}

struct  ImgButtonView: View {
    
    typealias ActionHandler = () -> Void
    
    let title: String
    let width: CGFloat
    let image: String
    let handler: ActionHandler
    
    
    internal init(title: String,
                  image: String,
                  width: CGFloat,
                  handler: @escaping ButtonView.ActionHandler) {
        self.title = title
        self.image = image
        self.width = width
        self.handler = handler
    }
    
    var body: some View {
        
        Button(action: handler,
               label: {
            VStack(alignment: .center){
                if image != nil{
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: width)
                        .clipShape(Circle())
                }
                Text(title)
            }
        })
    }
}
struct ImgBtnContainer_Previews: PreviewProvider {
    static var previews: some View{
        Group{
            ButtonView(title: "Next", sfSymbol: "arrowshape.turn.up.right", width: 40) { }
        }
        Group{
            ImgButtonView(title: "Frapp", image: "coffee", width: 100) { }
        }
    }
}
