// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # Binary Search Tree Challenges
 ### #1. Binary Tree or Binary Search Tree?
 
 Create a function that checks if a binary tree is a binary search tree.
 */

import Darwin
var bst = BinarySearchTree<Int>()
bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)

print(bst)

// Your solution here
extension BinaryNode where Element: Comparable {
    var isBinarySearchTree: Bool {
        isBST(self, min: nil, max: nil)
    }
    
    // 1. isBST recursively traverses through tree, checking for BST property
    // Keeps track of progress via reference to a BinaryNode, and min/max values to verify BST property
    private func isBST(_ tree: BinaryNode<Element>?,
                       min: Element?,
                       max: Element?) -> Bool {
        // Base case, if tree is nil, there are no nodes left to inspect
        guard let tree = tree else { return true }
        
        // Bounds check to see if current value exceeds bounds of min/max
        if let min = min, tree.value <= min {
            return false
        } else if let max = max, tree.value > max {
            return false
        }
        
        // Contains recursive calls to traverse through left children, current value is passed in as max value (bc nodes on left side can't be greater than parent)
        return isBST(tree.leftChild, min: min, max: tree.value) &&
        isBST(tree.rightChild, min: tree.value, max: max)
    }
}

//: [Next Challenge](@next)

