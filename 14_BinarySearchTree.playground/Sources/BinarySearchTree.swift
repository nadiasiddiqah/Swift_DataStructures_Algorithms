import Foundation

// 1. Create BinarySearchTree struct of Element: Comparable type
// BST can only hold values that are comparable
public struct BinarySearchTree<Element: Comparable> {
    
    // 2. Create root var of BinaryNode<Element> type
    // This means root is public but can only be set privately
    public private(set) var root: BinaryNode<Element>?
    
    public init() {}
}

// Insert elements in BST
extension BinarySearchTree {
    
    // 1. Public method exposd to users
    public mutating func insert(_ value: Element) {
        // 2. Uses recursion to insert new value
        root = insert(from: root, value: value)
    }
    
    // 1. Private helper method
    private func insert(from node: BinaryNode<Element>?,
                        value: Element) -> BinaryNode<Element> {
        
        // 2. Base case to terminate recursion (when currentNode is nil)
        guard let currentNode = node else {
            // a. If currentNode is nil, you found insertion point + return new BinaryNode
            return BinaryNode(value: value)
        }
      
        if value < currentNode.value {
            // 3. If insertion value < currentNode's value
                // a. Recursively, call insert from currentNode's left child
            currentNode.leftChild = insert(from: currentNode.leftChild,
                                           value: value)
        } else {
            // 4. If insertion value >= currentNode's value
                // a. Recursively, call insert from currentNode's right child
            currentNode.rightChild = insert(from: currentNode.rightChild,
                                            value: value)
        }
        
        // 5. Return currentNode to the public insert function
        return currentNode
    }
}


// Find element in BST - O(log n)
extension BinarySearchTree {
    public func contains(_ value: Element) -> Bool {
        // 1. Set current to root node
        var currentNode = root
        
        // 2. While current is not nil, check the current node's value
        while let current = currentNode {
            // 3. If ==, return true
            if current.value == value {
                return true
            }
            
            if value < current.value {
                // 4. If value < current, update currentNode = current.leftChild
                currentNode = current.leftChild
            } else {
                // 5. Else value > current, update currentNode = current.rightChild
                currentNode = current.rightChild
            }
        }
        
        // 6. Value is not in the tree
        return false
    }
}


// Remove element from BST
extension BinaryNode {
    
    // 1. Recursive min proprety to find min node in tree
    var min: BinaryNode {
        leftChild?.min ?? self
    }
}

extension BinarySearchTree {
    // 2. Public remove method
    public mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    
    // 3. Private recursive remove method (return new tree)
    private func remove(node: BinaryNode<Element>?,
                        value: Element) -> BinaryNode<Element>? {
        
        // 4. Check if currentNode exists, if not, nil
        guard let currentNode = node else {
            return nil
        }
        
        // 5. Check if currentNode's value == given remove value
        if value == currentNode.value {
            // Case 1: currentNode is a leaf node (no children)
            // -> return nil to remove currentNode
            if currentNode.leftChild == nil && currentNode.rightChild == nil {
                return nil
            }
            
            // Case 2: currentNode has no left child
            // -> return currentNode's rightChild to reconnect the right subtree + remove currentNode
            if currentNode.leftChild == nil {
                return currentNode.rightChild
            }
            
            // Case 3: currentNode has no right child
            // -> return currentNode's leftChild to reconnect the left subtree + remove currentNode
            if currentNode.rightChild == nil {
                return currentNode.leftChild
            }
            
            // Case 4: currentNode has both children
            // To remove currentNode, swap its value with the smallest value from the right subtree
            // Then, call remove on the right child to remove this swapped value
            currentNode.value = currentNode.rightChild!.min.value
            currentNode.rightChild = remove(node: currentNode.rightChild,
                                            value: currentNode.value)
            
        } else if value < currentNode.value {
            // Go recursively down the left subtree until we find the value we want to delete
            currentNode.leftChild = remove(node: currentNode.leftChild, value: value)
        } else {
            // Go recursively down the right subtree until we find the value we want to delete
            currentNode.rightChild = remove(node: currentNode.rightChild, value: value)
        }
        
        return currentNode
    }
}


extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        guard let root = root else { return "empty tree" }
        
        return String(describing: root)
    }
}
