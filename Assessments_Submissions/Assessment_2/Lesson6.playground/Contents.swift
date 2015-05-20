//: Playground - noun: a place where people can play

import UIKit

class Player {
    var dmg: Int = 5
    var health: Int = 100
    var name: String
    
    init(name: String){
        self.name = name
    }
    
    func attack() -> Int {
        return dmg
    }
    
    func takeDamage(damageInflicted: Int){
        self.health = self.health - damageInflicted
    }
    
    func isAlive() -> Bool {
        return self.health > 0
    }
}

class GoodPlayer: Player {
    override init(name: String) {
        super.init(name: name)
        self.dmg = 1
    }
    
}

class BadPlayer: Player {
    override init(name: String) {
        super.init(name: name)
        self.dmg = 3
    }
}

class Match{
    var player1: Player
    var player2: Player
    
    init(player1: Player, player2: Player){
        self.player1 = player1
        self.player2 = player2
    }
    
    func playGame() -> String {
        var dmg: Int = 0
        while player1.isAlive() && player2.isAlive() {
            dmg = player1.attack()
            player2.takeDamage(dmg)
            
            dmg = player2.attack()
            player1.takeDamage(dmg)
        }
        
        if player1.isAlive() {
            return player1.name
        } else {
            return player2.name
        }
    }
}

var a = GoodPlayer(name: "Allison")
var b = BadPlayer(name: "Rajan")

var round1 = Match(player1: a, player2: b)
println(round1.playGame())
