//
//  ScoreView.swift
//  Quiz App
//
//  Created by Marcus Low on 31/5/23.
//

import SwiftUI

struct ScoreView: View {
    
    var score: Int
    var total: Int
    
    var body: some View {
        VStack {
            Text("Your score is \(score)/\(total)")
                .font(.largeTitle)
            if score < total/2 {
                Text("Wow you're bad at this")
            }
            if score == total {
                Text("Waaaooowwww")
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 3, total: 10)
    }
}
