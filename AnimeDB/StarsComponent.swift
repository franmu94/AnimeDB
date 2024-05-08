//
//  StarsComponent.swift
//  AnimeDB
//
//  Created by Fran Malo on 16/4/24.
//

import SwiftUI

struct StarsComponent: View {
    let anime: Anime
    
    var valorDecimal: Double {
        Double(anime.rateStart) ?? 0.0
        
    }
    
    var parteEntera: Int {
        Int(valorDecimal)
    }
    
    var parteDecimal: Double {
        valorDecimal - Double(parteEntera)
    }

    var array: [Double] {
        var r = Array(repeating: 1.0, count: parteEntera)
        if r.count < 5 {
            r.append(parteDecimal)
        }
        while r.count < 5 {
            r.append(0)
        }
        return r
    }

    
    var body: some View {
        //Text("\(array)")
        HStack(spacing: 4){
            ForEach(0...4, id: \.self) { index in
                let n = array[index]
                    var dCorregido: Double {
                    switch n {
                    case 0.999 ... 1.0: 0
                    case 0.85 ... 0.99: 0.25
                    case 0.75 ... 0.84: 0.33
                    case 0.65 ... 0.74: 0.4
                    case 0.55 ... 0.64: 0.455
                    case 0.45 ... 0.54: 0.5
                    case 0.35 ... 0.44: 0.545
                    case 0.25 ... 0.34: 0.585
                    case 0.15 ... 0.24: 0.66
                    case 0.05 ... 0.14: 0.74
                    default: 1
                    }
                }
                
                    Image(systemName: "star.fill")
                        .foregroundColor(.clear)
                        .background() {
                            Rectangle()
                                .foregroundColor(.yellow)
                                .offset(x: -22 * dCorregido )
                                .mask(Image(systemName: "star.fill"))
                        }
                        .overlay {
                            Image(systemName: "star")
                                .foregroundColor(.secondary.opacity(0.4))                        }
            }
        }
    }
    
    
    }

#Preview {
    StarsComponent(anime: Anime.previewAnime)
}

