//
//  StarsViewComponent.swift
//  AnimeDB
//
//  Created by Fran Malo on 13/4/24.
//

import SwiftUI

struct StarsViewComponent: View {
    let anime: Anime

    @State private var isPressed = false
    
    var rate: Double {
        Double(anime.rateStart) ?? 0.0
        }
    
    var numeros: [String] {
        anime.rateStart.components(separatedBy: ".")
    }
    
    var parteEntera: Int {
        Int(rate)
    }
    
    var parteDecimal: Double {
        rate - Double(parteEntera)
        
    }
    
    let gradient = LinearGradient(
        gradient: Gradient(colors: [.red, .blue]), // Cambia los colores según tu preferencia
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    var array: [String] {
        var r = Array(repeating: "1", count: parteEntera)
        r.append("0.\(numeros[1])")
        while r.count < 5 {
            r.append("0.0")
        }
        return r
    }
    var body: some View {
        
        HStack(spacing: 4){
            ForEach(array, id: \.self) { n in
                /* if d < 1.0 {
                    let offSetValue = 16 * d
                    Image(systemName: "star.fill")
                        .foregroundColor(d > 0.0 ? .yellow : .white)
                        .overlay {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .offset(x: 3 + offSetValue)
                                }
                        .overlay {
                            Image(systemName: "star")
                                .foregroundColor(.secondary.opacity(0.4))
                            
                        }
                } else {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .overlay {
                            Image(systemName: "star")
                                .foregroundColor(.secondary.opacity(0.4))
                            
                        }
                } */
                
                var dCorregido: Double {
                    switch n {
                    case "0.9": 0.25
                    case "0.8": 0.33
                    case "0.7": 0.4
                    case "0.6": 0.455
                    case "0.5": 0.5
                    case "0.4": 0.545
                    case "0.3": 0.585
                    case "0.2": 0.66
                    case "0.1": 0.8
                    case "0.0": 1
                    case "1": 0
                        
                    default: 0.5
                    }
                }
                
                ZStack{
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.clear)
                        .overlay {
                            Rectangle()
                                .foregroundColor(.yellow)
                                .offset(x: -22 * dCorregido)
                                .mask(Image(systemName: "star.fill"))
                            
                            
                            Image(systemName: "star")
                                .foregroundColor(.secondary.opacity(0.4))
                            
                            
                        }
                }
                
            }
            
        }
    }
}

#Preview {
    StarsViewComponent(anime: Anime.previewAnime)
}
