//
//  Service.swift
//  Randomizer Project
//
//  Created by Sarah Padilla
//

import Foundation

class RandomizerService {
    
    static func getAllRandomizers() -> [RandomizerDO] {
        var fList = [RandomizerDO]()

        fList.append(RandomizerDO(
            name: "Magic 8",
            options: [
                "As I see it, yes.",
                "Ask again later.",
                "Better not tell you now.",
                "Cannot predict now.",
                "Concentrate and ask again.",
                "Don’t count on it.",
                "It is certain.",
                "It is decidedly so.",
                "Most likely.",
                "My reply is no.",
                "My sources say no.",
                "Outlook not so good.",
                "Outlook good.",
                "Reply hazy, try again.",
                "Signs point to yes.",
                "Very doubtful.",
                "Without a doubt.",
                "Yes.",
                "Yes – definitely.",
                "You may rely on it.",],
            view: 1))
        fList.append(RandomizerDO(
            name: "Quarter Toss",
            options: ["Heads", "Tails"],
            view: 2))
        fList.append(RandomizerDO(
            name: "Dice Roll",
            options: ["1", "2", "3", "4", "5", "6"],
            view: 3))
        
        return fList
    }
}
