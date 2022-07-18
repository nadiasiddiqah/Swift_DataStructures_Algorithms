import Foundation

// 1. Create BinaryNode class of Element type
public class BinaryNode<Element> {
    
    // 2. Each node contains a value + can have optionally have left + right children
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }
}


// 1. In-order Traversal of Binary Tree
extension BinaryNode {
    
    public func traverseInOrder(visit: (Element) -> Void) {
        // 2. Traverse to the left-most child
        leftChild?.traverseInOrder(visit: visit)
        
        // 3. Visit parent of left-most child
        visit(value)
        
        // 4. Traverse to parent's right child
        rightChild?.traverseInOrder(visit: visit)
    }
}


// 1. Pre-order Traversal of Binary Tree
extension BinaryNode {
    public func traversePreOrder(visit: (Element) -> Void) {
        // 2. Start at root
        visit(value)
        
        // 3. Traverse down to root's left child, or current parent's left child
        leftChild?.traversePreOrder(visit: visit)
        
        // 4. Traverse down to root's right child, or current parent's right child
        rightChild?.traversePreOrder(visit: visit)
    }
}


// 1. Post-order Traversal of Binary Tree
extension BinaryNode {
    public func traversePostOrder(visit: (Element) -> Void) {
        // 2. Traverse down to left-most child
        leftChild?.traversePostOrder(visit: visit)
        
        // 3. Traverse to right child
        rightChild?.traversePostOrder(visit: visit)
        
        // 4. Visit parent (of left / right children)
        visit(value)
    }
}


// Extension to build mental model of Binary tree
extension BinaryNode: CustomStringConvertible {
    public var description: String {
        diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        
        return diagram(for: node.rightChild,
                       top + " ", top + "┌──", top + "│ ")
        + root + "\(node.value)\n"
        + diagram(for: node.leftChild,
                  bottom + "│ ", bottom + "└──", bottom + " ")
    }
    
}
