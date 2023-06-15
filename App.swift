//
//  swiftui_viewmodifier_presentationApp.swift
//  swiftui-viewmodifier-presentation
//
//  Created by Pascal EDMOND on 09/05/2023.
//

import SwiftUI
@testable import DeckUI

@main
struct PresentationApp: App {
    
    let deck = Deck.demo
    @State var showCamera = false
    
    var body: some Scene {
        WindowGroup {
            Presenter(deck: deck, showCamera: showCamera)
                .toolbar {
                    ToolbarItemGroup {
                        Button {
                            showCamera = !showCamera
                        } label: {
                            Image(systemName: "camera.fill")
                        }
                    }
                }
        }
    }
}
