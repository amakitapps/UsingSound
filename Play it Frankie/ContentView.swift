//
//  ContentView.swift
//  Play it Frankie
//
//  Created by Mark Nair on 5/25/23.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer!
    @State private var lastSoundNumber = 0
    
    var body: some View {
        VStack {
            Button {
                playIt()
            } label: {
                Image(systemName: "music.note")
                    .font(.system(size: 100))
                    .foregroundColor(.green)
            }
        }
        .padding()
        
    }
    
    func playIt() {
        var soundNumber: Int
        
        repeat {
            soundNumber = Int.random(in: 1...5)
        } while soundNumber == lastSoundNumber
        
        lastSoundNumber = soundNumber
        let soundName = "sound\(soundNumber)"

        guard let soundFile = NSDataAsset(name: soundName) else {
            print("💩 I can't find the sound file.")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("Error!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
