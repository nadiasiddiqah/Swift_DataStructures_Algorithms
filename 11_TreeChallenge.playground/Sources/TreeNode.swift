// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public class TreeNode<T> {
    
    public var value: T
    public var children: [TreeNode] = []
    
    // Parent is optional bc root node doesn't have one
    // Needs to have weak reference to avoid reference cycle
    // Conventionally, parent should have strong ref to child, but a child should a weak reference to parent
    public weak var parent: TreeNode?
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func add(_ child: TreeNode) {
        children.append(child)
    }
}

extension TreeNode {
  public func forEachDepthFirst(visit: (TreeNode) -> Void) {
    visit(self)
    children.forEach {
      $0.forEachDepthFirst(visit: visit)
    }
  }
}

extension TreeNode {
  public func forEachLevelOrder(visit: (TreeNode) -> Void) {
    visit(self)
    var queue = Queue<TreeNode>()
      
    children.forEach { node in
        queue.enqueue(node)
    }
      
    while let node = queue.dequeue() {
      visit(node)
      node.children.forEach { node in
          queue.enqueue(node)
      }
    }
      
  }
}

extension TreeNode where T: Equatable {
  public func search(_ value: T) -> TreeNode? {
    var result: TreeNode?
    forEachDepthFirst { node in
      if node.value == value {
        result = node
      }
    }
    return result
  }
}
