//
//  Pawn.swift
//  Swifty Chess
//
//  Created by Mikael Mukhsikaroyan on 10/28/16.
//  Copyright © 2016 MSquaredmm. All rights reserved.
//

import UIKit

class Pawn: ChessPiece {

    var tryingToAdvanceBy2 = false
    
    init(row: Int, column: Int, color: UIColor) {
        
        super.init(row: row, column: column)
        self.color = color
        symbol = "♟"
        
    }
    
    /** Checks to see if the direction the piece is moving is the way this piece type is allowed to move. Doesn't take into account the sate of the board */
    func isMovementAppropriate(toIndex dest: BoardIndex) -> Bool {
        
        // is it advancing by 2
        // check if the move is in the same column
        if self.col == dest.column {
            // can only move 2 forward if first time moving pawn
            if (self.row == 1 && dest.row == 3 && color == .white) || (self.row == 6 && dest.row == 4 && color == .black) {
                tryingToAdvanceBy2 = true
                return true
            }
        }
        
        tryingToAdvanceBy2 = false
        
        // the move direction depends on the color of the piece
        let moveDirection = color == .black ? -1 : 1
        // if the movement is only 1 row up/down
        if dest.row == self.row + moveDirection {
            // check for diagonal movement and forward movement
            if (dest.column == self.col - 1) || (dest.column == self.col) || (dest.column == self.col + 1) {
                return true
            }
        }
        return false
    }
    
}
