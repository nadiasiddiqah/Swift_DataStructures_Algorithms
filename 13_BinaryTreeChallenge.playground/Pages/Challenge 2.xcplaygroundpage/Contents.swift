// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## #2. Serialization
 
 A common task in software development is serializing an object into another
 data type. This process is known as serialization, and allows custom types to
 be used in systems that only support a closed set of data types.
 
 An example of serialization is JSON. Your task is to devise a way to serialize
 a binary tree into an array, and a way to deserialize the array back into
 the same binary tree.
 
 To clarify this problem, consider the following binary tree:
 
 ![Binary Tree](binary-tree.png)
 
 A particular algorithm may output the serialization as
 `[15, 10, 5, nil, nil, 12, nil, nil, 25, 17, nil, nil, nil]`.
 The deserialization process should transform the array back into the same
 binary tree. Note that there are many ways to perform serialization.
 You may choose any way you wish.
 */

import Foundation
import Darwin

var tree: BinaryNode<Int> = {
  
  let root = BinaryNode(value: 15)
  let ten = BinaryNode(value: 10)
  let five = BinaryNode(value: 5)
  let twelve = BinaryNode(value: 12)
  let twentyFive = BinaryNode(value: 25)
  let seventeen = BinaryNode(value: 17)
  
  root.leftChild = ten
  root.rightChild = twentyFive
  ten.leftChild = five
  ten.rightChild = twelve
  twentyFive.leftChild = seventeen
  
  return root
}()

print(tree)

// O(n): Creating new array to store values of the tree in preoorder
func serialize<T>(_ node: BinaryNode<T>) -> [T?] {
    var array = [T?]()
    
    node.traversePreOrder(visit: { value in
        array.append(value)
    })

    return array
}

serialize(tree)


// 1. To deserialize take in inout array of values (allows you to mutate the array in each recursive step)
func deserialize<T>(_ array: inout [T?]) -> BinaryNode<T>? {
    // 2. Base case to end recursion (if removeFirst returns nil, there's no more element in array)
    guard let value = array.removeFirst() else {
        return nil
    }

    // Create node based on current value
    let node = BinaryNode(value: value)

    // Recursively assign node to left and right children
    node.leftChild = deserialize(&array)
    node.rightChild = deserialize(&array)

    return node
}


// MARK: - TEST CASES
var array = serialize(tree)
print(array)

let node = deserialize(&array)
print(node!)





