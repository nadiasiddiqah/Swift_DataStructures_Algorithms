// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ### #2. Equatable
 The binary search tree currently lacks `Equatable` conformance. Your challenge is to conform adopt the `Equatable` protocol.
 */

import Foundation
var bst = BinarySearchTree<Int>()
bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)

print(bst)

var bst2 = BinarySearchTree<Int>()
bst2.insert(2)
bst2.insert(5)
bst2.insert(3)
bst2.insert(1)
bst2.insert(0)
bst2.insert(4)

print(bst2)

// Are bst1 and bst2 equal?

extension BinarySearchTree: Equatable {
    // 1. Required Equatable function (returns result from isEqual helper function)
    public static func == (lhs: BinarySearchTree<Element>,
                           rhs: BinarySearchTree<Element>) -> Bool {
        isEqual(lhs.root, rhs.root)
    }
    
    // isEqual recursively check two nodes and their children for equality
    private static func isEqual<Element: Equatable>(_ node1: BinaryNode<Element>?,
                                                    _ node2: BinaryNode<Element>?) -> Bool {
        
        // Base case: If 1+ nodes are nil, no need to continue checking
        // If both nodes are nil, they are equal. If one is nil, other isn't, they aren't equal.
        guard let firstNode = node1, let secondNode = node2 else {
            return node1 == nil && node2 == nil
        }
        
        // Check the value of left/right nodes for equality
        // Check left and right children for equality
        return firstNode.value == secondNode.value &&
        isEqual(firstNode.leftChild, secondNode.leftChild) &&
        isEqual(firstNode.rightChild, secondNode.rightChild)
    }
    
}

bst == bst2

//: [Next Challenge](@next)
