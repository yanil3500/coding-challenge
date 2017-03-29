import UIKit

/*Moves in squared strings (II)

You are given a string of n lines, each substring being n characters long: For example:

s = "abcd\nefgh\nijkl\nmnop"

We will study some transformations of this square of strings.
 */

/*
 -Clock rotation 180 degrees: rot
    * rot(s) => "ponm\nlkji\nhgfe\ndcba"
 -selfie_and_rot(s) (or selfieAndRot or selfie-and-rot) It is initial string + string obtained by clock rotation 180 degrees with dots interspersed in order (hopefully) to better show the rotation when printed.
    * s = "abcd\nefgh\nijkl\nmnop" -->
    * "abcd....\nefgh....\nijkl....\nmnop....\n....ponm\n....lkji\n....hgfe\n....dcba"
**/

/*
Task:

Write these two functions rotand selfie_and_rot
and

high-order function oper(fct, s) where

fct is the function of one variable f to apply to the string s (fct will be one of rot, selfie_and_rot)
*/


func rot(_ s: String) -> String {
    return s.characters.reversed().map({ (character) -> String in
        String(character)
    }).joined()
}
func selfieAndRot(_ s: String) -> String {
    let targetString = s.components(separatedBy: "\n")
    var ellipses = Array(repeating: ".", count: Int((targetString.first?.characters.count)!))
    ellipses.append("\n")
    return targetString.joined(separator: ellipses.joined()) + ellipses.joined() + ellipses.dropLast().joined() + rot(targetString.joined(separator: ellipses.joined()))
}

func oper(_ function:(String) -> String, _ s: String) -> String {
    return function(s)
}

print("Test Values:\n\(oper(selfieAndRot, "EPzAYqxr\nvPonWoev\nzYlBupAu\nCAhBQpgx\nTeDegwcH\nxZhnzDpZ\nTguzIdlh\ndPZXeqmj"))")


