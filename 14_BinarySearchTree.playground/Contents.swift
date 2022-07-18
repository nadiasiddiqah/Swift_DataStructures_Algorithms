// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

// MARK: - EXAMPLE 1
var exampleTree: BinarySearchTree<Int> {
  var bst = BinarySearchTree<Int>()
  bst.insert(3)
  bst.insert(1)
  bst.insert(4)
  bst.insert(0)
  bst.insert(2)
  bst.insert(5)
  return bst
}

example(of: "building a BST") {
    print(exampleTree)
}

/*
 ---Example of: building a BST---
  ┌──5
 ┌──4
 │ └──nil
 3
 │ ┌──2
 └──1
  └──0
 */


// MARK: - EXAMPLE 2
example(of: "finding a node") {
    if exampleTree.contains(5) {
        print("Found 5!")
    } else {
        print("Couldn't find 5")
    }
}

// MARK: - EXAMPLE 3
example(of: "removing a node") {
    var tree = exampleTree
    print("Tree before removal:")
    print(tree)
    
    tree.remove(3)
    
    print("Tree after removing root:")
    print(tree)
}

/*
 ---Example of: removing a node---
 Tree before removal:
 ┌──5 ┌──4
 │ └──nil
 3
 │ ┌──2
 └──1
 └──0
 Tree after removing root:
 ┌──5
 4
 │ ┌──2
 └──1 └──0
 */
