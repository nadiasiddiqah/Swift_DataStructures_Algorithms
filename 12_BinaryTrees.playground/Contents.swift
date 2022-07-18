// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

// MARK: - EXAMPLE 1
var tree: BinaryNode<Int> = {
    let zero = BinaryNode(value: 0)
    let one = BinaryNode(value: 1)
    let five = BinaryNode(value: 5)
    let seven = BinaryNode(value: 7)
    let eight = BinaryNode(value: 8)
    let nine = BinaryNode(value: 9)
    
    seven.leftChild = one
    one.leftChild = zero
    one.rightChild = five
    seven.rightChild = nine
    nine.leftChild = eight
    
    return seven
}()

example(of: "tree diagram") {
    print(tree)
}

/*
 ---Example of tree diagram---
  ┌──nil
 ┌──9
 │ └──8
 7
 │ ┌──5
 └──1
  └──0

 */


// MARK: - EXAMPLE 3
example(of: "in-order traversal") {
    tree.traverseInOrder { nodeValue in
        print(nodeValue)
    }
}

/*
 ---Example of in-order traversal---
 0
 1
 5
 7
 8
 9
*/


// MARK: - EXAMPLE 4
example(of: "pre-order traversal") {
    tree.traversePreOrder { nodeValue in
        print(nodeValue)
    }
}

/*
 ---Example of pre-order traversal---
 7
 1
 0
 5
 9
 8
 */


// MARK: - EXAMPLE 5
example(of: "post-order traversal") {
    tree.traversePostOrder { nodeValue in
        print(nodeValue)
    }
}

/*
 ---Example of post-order traversal---
 0
 5
 1
 8
 9
 7
 */
