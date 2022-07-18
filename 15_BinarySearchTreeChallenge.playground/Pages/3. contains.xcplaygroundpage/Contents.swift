// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ### #3. Comparing Trees
 Create a method that checks if the current tree contains all the elements of another tree.
 */
var bst = BinarySearchTree<Int>()
bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)

var bst2 = BinarySearchTree<Int>()
bst2.insert(2)
bst2.insert(5)
bst2.insert(3)
bst2.insert(1)
bst2.insert(0)
bst2.insert(100)

// Your solution here

// 1. Conform BinarySearchTree element to Hashable protocol
extension BinarySearchTree where Element: Hashable {
    
    // 2. Create contains method that has subtree parameter + bool return type
    public func contains(_ subtree: BinarySearchTree) -> Bool {
        
        // 3. Initialize set var to insert elements into a Set
        var set: Set<Element> = []
        
        // 4. Traverse in order from the root, insert value into set
        root?.traverseInOrder(visit: { value in
            set.insert(value)
        })
        
        // 5. isEqual stores the end result (can't return from closure below)
        var isEqual = true
        
        // 5. Traverse in order from subtree's root, check if set contains value
        subtree.root?.traverseInOrder(visit: { value in
            isEqual = isEqual && set.contains(value)
        })
        
        return isEqual
    }
}


bst.contains(bst2)
