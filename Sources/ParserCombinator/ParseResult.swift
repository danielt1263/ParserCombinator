//
//  ParseResult.swift
//  ParserCombinator
//
//  Created by Liam on 15/02/2017.
//  Copyright © 2017 Tigerpixel Ltd. All rights reserved.
//

public typealias ParseResult<Output> = Result<ParseSuccess<Output>, ParseFailure>

public struct ParseSuccess<Output> {
    let result: Output
    let tail: Substring.SubSequence
}

extension ParseSuccess: Equatable where Output: Equatable { }

public extension ParseSuccess {
    func map<MappedOutput>(_ transform: @escaping (Output) -> MappedOutput) -> ParseSuccess<MappedOutput> {
        ParseSuccess<MappedOutput>(result: transform(result), tail: tail)
    }
}

/**
 A description of a failed parsing operation.
 - insufficiantTokens: There are not enough character tokens remaining to assess the parsing operation.
 - custom: Used to convey custom parse failures when creating custom parsers.
 */
public enum ParseFailure: Equatable, Error {
    case insufficiantTokens
    case unexpectedToken(token: Character, tail: Substring)
    case custom(message: String)
}
