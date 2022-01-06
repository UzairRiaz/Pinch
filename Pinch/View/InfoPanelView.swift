//
//  InfoPanelView.swift
//  Pinch
//
//  Created by Uzair Riaz on 06/01/2022.
//

import SwiftUI

struct InfoPanelView: View {
    //MARK: - PROPERTIES
    var scale: CGFloat
    var offset: CGSize
    
    @State private var isInfoPanelVisible: Bool = false
    
    var body: some View {
        HStack{
            //MARK: - HOTSPOT
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
                .onLongPressGesture(minimumDuration: 1){
                    withAnimation(.easeOut){
                        isInfoPanelVisible.toggle()
                    }
                }
            Spacer()
            
            //MARK: - INFO PANEL
            HStack(spacing: 2){
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                Spacer()
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                Spacer()
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                Spacer()
            }
            .font(.footnote)
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxHeight: 120)
            .opacity(isInfoPanelVisible ? 1 : 0)
            Spacer()
            
        }//: HSTACK
    }
}

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView(scale: 1, offset: .zero)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
