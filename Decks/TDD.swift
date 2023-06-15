//
//  TDD.swift
//  presentations
//
//  Created by Hugues Telolahy on 15/06/2023.
//

import SwiftUI
import DeckUI

extension Deck {
    static var tdd: Deck {
        Deck(title: "Tech Friday 20230616") {

            Slide(alignment: .center) {
                RawView {
                    Text("Kata TDD")
                        .font(.system(size: 200, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                        .padding(60)
                        .border(.white.opacity(0.5), width: 20)
                }
            }

            Slide {
                Title("Introduction", subtitle: "Qu’est ce que le TDD?")

                Columns {
                    Column {
                        Bullets(style: .dash) {
                            Words("Une approche de développement logiciel qui met l'accent sur la création de tests automatisés avant l'écriture du code de production.")
                            Words("Un cycle de développement itératif qui repose sur le principe \"Red-Green-Refactor\"")
                        }
                    }

                    Column {
                        Media(.bundleImage("test-driven-development"))
                    }
                }
            }

            Slide {
                Title("Mais pourquoi?", subtitle: "Car elle offre de nombreux avantages")

                Columns {
                    Column {
                        Bullets(style: .bullet) {
                            Words("Meilleure qualité du code")
                            Words("Réduction des bugs")
                            Words("Productivité accrue")
                            Words("Confiance dans le logiciel")
                        }
                    }

                    Column {
                        Media(.bundleImage("tdd-velocity"))
                    }
                }
            }

            Slide(alignment: .center, comment: "The presenter notes are back!") {
                Title("Mise en pratique")
            }

            Slide(alignment: .center) {
                Title("Roman Numerals")
                Media(.bundleImage("Roman-Numerals-chart"))
            }

            Slide(alignment: .center) {
                RawView {
                    Text("https://github.com/DIFA-DOJO")
                        .underline()
                        .font(.system(size: 60, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                }
            }
        }
    }
}

extension Theme {
    fileprivate static let venonat: Theme = Theme(
        background: Color(hex: "#624a7b"),
        title: Foreground(
            color: Color(hex: "#ff5a5a"),
            font: Font.system(size: 80,
                              weight: .bold,
                              design: .default)
        ),
        subtitle: Foreground(
            color: Color(hex: "#a48bbd"),
            font: Font.system(size: 50,
                              weight: .light,
                              design: .default).italic()
        ),
        body: Foreground(
            color: Color(hex: "#FFFFFF"),
            font: Font.system(size: 50,
                              weight: .regular,
                              design: .default)
        ),
        code: Foreground(
            color: Color(hex: "#FFFFFF"),
            font: Font.system(size: 26,
                              weight: .regular,
                              design: .monospaced)
        ),
        codeHighlighted: (Color(hex: "#312952"), Foreground(
            color: Color(hex: "#FFFFFF"),
            font: Font.system(size: 26,
                              weight: .heavy,
                              design: .monospaced)
        ))
    )
}

fileprivate struct CounterView: View {
    @State var count = 0

    var body: some View {
        Button {
            self.count += 1
        } label: {
            Text("Press me - \(self.count)")
                .font(.system(size: 60))
                .padding(.horizontal, 40)
                .padding(.vertical, 20)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.white, lineWidth: 2)
                )
        }.buttonStyle(.plain)
    }
}
