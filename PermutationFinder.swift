//
//  PermutationFinder.swift
//  
//
//  Created by Jack Tregurtha on 5/21/16.
//
//

import UIKit

class PermutationFinder {
    
    /*
    Finds all the possible permutations of the list
    */
    func findPermutations(list: [Int])->[[Int]] {
        let num = list[0]
        let theRest = Array(list[1...list.count-1])
        let perms = permutations(num, theRest: theRest)
        return perms
    }
    
    func permutations(current: Int, theRest: [Int])->[[Int]] {
        var result : [[Int]] = []
        if theRest.count == 1 {
            result.append([current, theRest[0]])
            result.append([theRest[0], current])
        }
        else {
            
            // loop through theRest to see keep track of where to insert the i value
            for i in 0...theRest.count-1 {
                var theRestPerms = permutations(theRest[i], theRest: removeElementAtIndex(i, list: theRest))
                
                // loop through every possible permutation in theRestPerms
                for x in 0...theRestPerms.count-1 {
                    if (i == theRest.count-1) {
                        var lastTemp = theRestPerms[x]
                        lastTemp.append(current)
                        result.append(lastTemp)
                    }
                    theRestPerms[x].insert(current, atIndex: i)
                    result.append(theRestPerms[x])
                }
            }
        }
        return result
    }
    
    func removeElementAtIndex(index: Int, list: [Int])->[Int] {
        var copy = list
        copy.removeAtIndex(index)
        return copy
    }
}


// an example of how you would call the function

let z = PermutationFinder()
let list = [1,2,3,4,5,6,7]
let listPerms = z.findPermutations(list)
print(listPerms.count)
