//
//  Game.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 5/11/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

class CurrentGame: NSObject {
    
    private var game : Game
    
    class var sharedInstance: CurrentGame {
    
        struct Static {
            static var instance : CurrentGame?
            static var token: dispatch_once_t = 0
        }
    
        dispatch_once(&Static.token) {
            Static.instance = CurrentGame()
        }
    
        return Static.instance!
    }
    
    override init() {
        game = Game()
    }
    
    func setGame(mygame : Game) {
        self.game = mygame
    }
    
    func getGame() -> Game {
        return self.game
    }
    
    
}
