//
//  Deck+ViewModifier.swift
//  swiftui-viewmodifier-presentation
//
//  Created by Pascal EDMOND on 09/05/2023.
//

import SwiftUI
import DeckUI

extension Deck {
    static var viewModifier: Deck {
        
        let spacer = Words(" ")
        
        let helloWorld = Text("Hello World")
        let styledHelloWorld = ZStack {
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .fill(.gray.opacity(0.2))
            helloWorld
                .padding(60)
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .stroke(Gradient(colors: [Color.red, .blue, .green, .purple]), lineWidth: 30)
        }
        
        let whisper = Image("whisper")
        let styledWhisper = ZStack {
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .fill(.gray.opacity(0.2))
            whisper
                .padding(60)
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .stroke(Gradient(colors: [Color.red, .blue, .green, .purple]), lineWidth: 30)
        }
        
        return Deck(title: "Tech Friday [05/05/2023]") {
            
            Slide(alignment: .center) {
                Title("Introduction to `SwiftUI.ViewModifier`")
            }
            
            Slide(alignment: .topLeading) {
                Title("Plan")
                Bullets(style: .bullet) {
                    Words("What is a ViewModifier ?")
                    Words("How to use it ?")
                    Words("Tips And Tricks")
                    Words("Real life examples !")
                }
            }
            
            Slide(alignment: .topLeading) {
                Title("What is a ViewModifier ?", subtitle: "The Documentations says:")
                spacer
                Words("A modifier that you apply to a view or another view modifier, producing a different version of the original value.")
                spacer
                Words("Adopt the `ViewModifier` protocol when you want to create a reusable modifier that you can apply to any view.")
            }
            
            Slide(alignment: .topLeading) {
                Title("What is a ViewModifier ?")
                Bullets(style: .bullet) {
                    Words("A Protocol")
                    Words("Takes a 'Content' as an input")
                    Words("Produces a new 'Body: View' as an output")
                }
                spacer
                Code(.swift) {
                        """
                        public protocol ViewModifier {
                            
                            /// The type of view representing the body.
                            associatedtype Body : View
                            
                            /// Gets the current body of the caller.
                            ///
                            /// `content` is a proxy for the view that will have the modifier
                            /// represented by `Self` applied to it.
                            @ViewBuilder @MainActor func body(content: Self.Content) -> Self.Body
                            
                            /// The content view type passed to `body()`.
                            typealias Content
                        }
                        """
                }
            }
            
            Slide(alignment: .topLeading) {
                Title("How to use it ?", subtitle: "Simple Example")
                spacer
                Columns {
                    Column {
                        RawView {
                            VStack(spacing: 50) {
                                helloWorld
                                    .fixedSize()
                                
                                Image(systemName: "chevron.down")
                                    .fixedSize()
                                
                                styledHelloWorld
                                    .fixedSize()
                            }
                            .foregroundColor(.primary)
                            .font(.system(size: 100, weight: .bold, design: .monospaced))
                        }
                    }
                    Column {
                        RawView {
                            VStack(spacing: 50) {
                                whisper
                                    .fixedSize()
                                
                                Image(systemName: "chevron.down")
                                    .fixedSize()
                                
                                styledWhisper
                                    .fixedSize()
                            }
                            .foregroundColor(.primary)
                            .font(.system(size: 100, weight: .bold, design: .monospaced))
                        }
                    }
                }
            }
            
            Slide(alignment: .topLeading) {
                Title("How to use it ?", subtitle: "Simple Example")
                spacer
                
                Columns {
                    Column {
                        Code(.swift) {
                        """
                        Text("Hello World")"
                        """
                        }
                    }
                    Column {
                        Code(.swift) {
                        """
                        ZStack {
                            RoundedRectangle(
                                cornerRadius: 40,
                                style: .continuous
                            )
                            .fill(.gray.opacity(0.2))
                            
                            Text("Hello World") // 👈
                                .padding(60)
                            
                            RoundedRectangle(
                                cornerRadius: 40,
                                style: .continuous
                            )
                            .stroke(
                                Gradient(colors: [Color.red, .blue, .green, .purple]),
                                lineWidth: 30
                            )
                        }
                        """
                        }
                    }
                }
            }
            
            Slide(alignment: .topLeading) {
                Title("How to use it ?", subtitle: "Simple Example")
                spacer
                Columns {
                    Column {
                        Code(.swift) {
                        """
                        Image("whisper")
                        """
                        }
                    }
                    Column {
                        Code(.swift) {
                        """
                        ZStack {
                            RoundedRectangle(
                                cornerRadius: 40,
                                style: .continuous
                            )
                            .fill(.gray.opacity(0.2))
                            
                            Image("whisper") // 👈
                                .padding(60)
                            
                            RoundedRectangle(
                                cornerRadius: 40,
                                style: .continuous
                            )
                            .stroke(
                                Gradient(colors: [Color.red, .blue, .green, .purple]),
                                lineWidth: 30
                            )
                        }
                        """
                        }
                    }
                }
            }
            
            Slide(alignment: .topLeading) {
                Title("How to use it ?", subtitle: "Simple Example")
                spacer
                Words("Welcome RainbowViewModifier")
                
                Code(.swift) {
                    """
                    struct RainbowModifier: ViewModifier {
                        func body(content: Content) -> some View {
                            ZStack {
                                RoundedRectangle(cornerRadius: 40, style: .continuous)
                                    .fill(.gray.opacity(0.2))
                                content // 👈
                                    .padding(60)
                                RoundedRectangle(cornerRadius: 40, style: .continuous)
                                    .stroke(Gradient(colors: [Color.red, .blue, .green, .purple]), lineWidth: 30)
                            }
                        }
                    }
                    """
                }
            }
            
            Slide(alignment: .topLeading) {
                Title("How to use it ?", subtitle: "Simple Example")
                spacer
                Words("Use RainbowViewModifier")
                
                Columns {
                    Column {
                        Code(.swift) {
                        """
                        Text("Hello World")"
                        """
                        }
                    }
                    Column {
                        Code(.swift) {
                        """
                        Text("Hello World")"
                            .modifier(RainbowViewModifier()) // 😍
                        """
                        }
                    }
                }
            }
            
            Slide(alignment: .topLeading) {
                Title("Tips And Tricks")
                spacer
                Bullets {
                    Words("Can have internal state")
                    Words("Can have internal **mutable** state")
                    Words("Can access SwiftUI.Environment")
                    Words("Can add behavior to the content")
                    Words("Can offer great API via extension on View")
                }
            }
            
            Slide(alignment: .topLeading) {
                Title("Tips And Tricks", subtitle: "better API")
                spacer
                Code(.swift) {
                    """
                    extension View {
                        func rainbow(padding: CGFloat) -> some View {
                            modifier(RainbowModifier(padding: padding))
                        }
                    }
                    """
                }
                spacer
                Code(.swift) {
                    """
                    Text("Hello World")
                        .rainbow(padding: 60) // 😍
                    """
                }
            }
            
            Slide(alignment: .topLeading) {
                Title("Tips And Tricks")
                
                Code(.swift) {
                    ##"""
                    struct RainbowModifier: ViewModifier {
                        
                        let padding: CGFloat
                        @State private var rainBowColors = [Color.red, .blue, .green, .purple]
                        @Environment(\.accessibilityEnabled) private var accessibilityEnabled: Bool
                        
                        func body(content: Content) -> some View {
                            if {
                                content
                            } else {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 40, style: .continuous)
                                        .fill(.gray.opacity(0.2))
                                    content
                                        .padding(padding)
                                    RoundedRectangle(cornerRadius: 40, style: .continuous)
                                        .stroke(Gradient(colors: rainBowColors), lineWidth: 30)
                                }
                                .onTapGesture {
                                    rainBowColors.shuffle()
                                }
                            }
                        }
                    }
                    """##
                }
            }
            
            Slide(alignment: .topLeading) {
                Title("Tips And Tricks")
                spacer
                RawView {
                    TappableRainbowView()
                        .font(.system(size: 200, weight: .bold, design: .monospaced))
                }
            }
            
            Slide(alignment: .topLeading) {
                Title("Real life examples !")
            }
            
            Slide(alignment: .center) {
                Title("Made with DeckUI")
                RawView {
                    Text("https://github.com/joshdholtz/deckui")
                        .underline()
                        .font(.system(size: 60, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                }
            }
        }
    }
}

extension View {
    fileprivate func rainbow(rainbowWidth: CGFloat = 30) -> some View {
        modifier(RainbowModifier(rainbowWidth: rainbowWidth))
    }
}

fileprivate struct TappableRainbowView: View {
    var body: some View {
        Text("I'm tappable")
            .modifier(RainbowModifier(rainbowWidth: 100))
            .padding(100)
    }
}

fileprivate struct RainbowModifier: ViewModifier {
    
    let rainbowWidth: CGFloat
    @State private var rainBowColors = [Color.red, .blue, .green, .purple]
    @Environment(\.accessibilityEnabled) private var accessibilityEnabled: Bool
    
    func body(content: Content) -> some View {
        if accessibilityEnabled {
            content
        } else {
            ZStack {
                RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .fill(.gray.opacity(0.2))
                content
                    .padding(60)
                RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .stroke(Gradient(colors: rainBowColors), lineWidth: rainbowWidth)
            }
            .onTapGesture {
                rainBowColors.shuffle()
            }
        }
    }
}
