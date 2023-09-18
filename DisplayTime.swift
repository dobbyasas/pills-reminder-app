import Foundation
import AppKit

let calendar = Calendar.current

func typeText(_ text: String) {
    let source = CGEventSource(stateID: .hidSystemState)
    
    for character in text {
        let keyCode = character.keyCode
        if let code = keyCode {
            let keyDown = CGEvent(keyboardEventSource: source, virtualKey: code, keyDown: true)
            let keyUp = CGEvent(keyboardEventSource: source, virtualKey: code, keyDown: false)
            keyDown?.post(tap: .cghidEventTap)
            keyUp?.post(tap: .cghidEventTap)
        }
    }
    
    // Simulate Enter key press
    let enterKeyCode: CGKeyCode = 36
    let keyDown = CGEvent(keyboardEventSource: source, virtualKey: enterKeyCode, keyDown: true)
    let keyUp = CGEvent(keyboardEventSource: source, virtualKey: enterKeyCode, keyDown: false)
    keyDown?.post(tap: .cghidEventTap)
    keyUp?.post(tap: .cghidEventTap)
}

extension Character {
    var keyCode: CGKeyCode? {
        switch self {
        case "a": return 0
        case "b": return 11
        case "c": return 8
        case "d": return 2
        case "e": return 14
        case "f": return 3
        case "g": return 5
        case "h": return 4
        case "i": return 34
        case "j": return 38
        case "k": return 40
        case "l": return 37
        case "m": return 46
        case "n": return 45
        case "o": return 31
        case "p": return 35
        case "q": return 12
        case "r": return 15
        case "s": return 1
        case "t": return 17
        case "u": return 32
        case "v": return 9
        case "w": return 13
        case "x": return 7
        case "y": return 16
        case "z": return 6
        case " ": return 49 // space
        case ",": return 43 // comma
        default: return nil
        }
    }
}


Timer.scheduledTimer(withTimeInterval: 60.0, repeats: true) { timer in
    let date = Date()
    let hour = calendar.component(.hour, from: date)
    let minute = calendar.component(.minute, from: date)
    
    switch (hour, minute) {
    case (6, 30): typeText("antibiotika, antikoncepce, antidepresiva")
    case (8, 30): typeText("probiotika")
    case (13, 30): typeText("antibiotika")
    case (13, 37): typeText("test")
    case (21, 30): typeText("antibiotika")
    default: break
    }
}

RunLoop.main.run()

