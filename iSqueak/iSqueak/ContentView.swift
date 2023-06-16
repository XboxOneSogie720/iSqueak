//
//  ContentView.swift
//  iSqueak
//
//  Created by Karson Eskind on 6/14/23.
//

import SwiftUI
import AVFoundation
import AVKit

class RandomSoundPlayer {
    @State private var showingAlert = false
    private var player: AVAudioPlayer?
    
    func playRandomSound(from files: [String]) {
        guard let randomFile = files.randomElement() else {
            return
        }
        
        guard let url = Bundle.main.url(forResource: randomFile, withExtension: ".mp3") else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            return
        }
    }
}

struct ContentView: View {
    /* Player Artifacts */
    let audioPlayer = RandomSoundPlayer()
    let SOUNDS = ["_1", "_2", "_3"]
    
    
    var body: some View {
        GeometryReader { geometry in
            
            let CENTER_X = geometry.size.width/2
            let CENTER_Y = geometry.size.height/2
            let BIG_OL_TEXT = geometry.size.width/4
            
            VStack {
                Text("Squeak!\n ⬇️⬇️⬇️")
                    .font(.system(size: BIG_OL_TEXT))
                    .bold()
                ZStack {
                    Rectangle()
                        .frame(width: CENTER_X/BIG_OL_TEXT*115, height: CENTER_Y/BIG_OL_TEXT*35)
                        .cornerRadius(35)
                    Text("🐶🔉")
                        .font(.system(size: BIG_OL_TEXT))
                }
                .onTapGesture {
                    audioPlayer.playRandomSound(from: SOUNDS)
                }
            }
            .position(x: CENTER_X, y: CENTER_Y)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
