// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class SignupMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Signup {
      signup {
        __typename
        value
        errors {
          __typename
          code
          message
          description
        }
      }
    }
    """

  public let operationName: String = "Signup"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("signup", type: .nonNull(.object(Signup.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(signup: Signup) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "signup": signup.resultMap])
    }

    public var signup: Signup {
      get {
        return Signup(unsafeResultMap: resultMap["signup"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "signup")
      }
    }

    public struct Signup: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Token"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("value", type: .nonNull(.scalar(String.self))),
          GraphQLField("errors", type: .list(.object(Error.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(value: String, errors: [Error?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Token", "value": value, "errors": errors.flatMap { (value: [Error?]) -> [ResultMap?] in value.map { (value: Error?) -> ResultMap? in value.flatMap { (value: Error) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var value: String {
        get {
          return resultMap["value"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "value")
        }
      }

      public var errors: [Error?]? {
        get {
          return (resultMap["errors"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Error?] in value.map { (value: ResultMap?) -> Error? in value.flatMap { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error?]) -> [ResultMap?] in value.map { (value: Error?) -> ResultMap? in value.flatMap { (value: Error) -> ResultMap in value.resultMap } } }, forKey: "errors")
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ERRORS"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("code", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(code: Int, message: String, description: String) {
          self.init(unsafeResultMap: ["__typename": "ERRORS", "code": code, "message": message, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var code: Int {
          get {
            return resultMap["code"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "code")
          }
        }

        public var message: String {
          get {
            return resultMap["message"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }

        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }
      }
    }
  }
}

public final class SpotsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Spots($deviceLatitude: Float!, $deviceLongitude: Float!, $worktime: Int!, $emotion: Int!) {
      spots(latitude: $deviceLatitude, longitude: $deviceLongitude, worktime: $worktime, emotion: $emotion) {
        __typename
        spots {
          __typename
          id
          name
          image
          description
          locate {
            __typename
            latitude
            longitude
          }
        }
        errors {
          __typename
          code
          message
          description
        }
      }
    }
    """

  public let operationName: String = "Spots"

  public var deviceLatitude: Double
  public var deviceLongitude: Double
  public var worktime: Int
  public var emotion: Int

  public init(deviceLatitude: Double, deviceLongitude: Double, worktime: Int, emotion: Int) {
    self.deviceLatitude = deviceLatitude
    self.deviceLongitude = deviceLongitude
    self.worktime = worktime
    self.emotion = emotion
  }

  public var variables: GraphQLMap? {
    return ["deviceLatitude": deviceLatitude, "deviceLongitude": deviceLongitude, "worktime": worktime, "emotion": emotion]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("spots", arguments: ["latitude": GraphQLVariable("deviceLatitude"), "longitude": GraphQLVariable("deviceLongitude"), "worktime": GraphQLVariable("worktime"), "emotion": GraphQLVariable("emotion")], type: .nonNull(.object(Spot.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(spots: Spot) {
      self.init(unsafeResultMap: ["__typename": "Query", "spots": spots.resultMap])
    }

    public var spots: Spot {
      get {
        return Spot(unsafeResultMap: resultMap["spots"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "spots")
      }
    }

    public struct Spot: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Spots"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("spots", type: .list(.object(Spot.selections))),
          GraphQLField("errors", type: .list(.object(Error.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(spots: [Spot?]? = nil, errors: [Error?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Spots", "spots": spots.flatMap { (value: [Spot?]) -> [ResultMap?] in value.map { (value: Spot?) -> ResultMap? in value.flatMap { (value: Spot) -> ResultMap in value.resultMap } } }, "errors": errors.flatMap { (value: [Error?]) -> [ResultMap?] in value.map { (value: Error?) -> ResultMap? in value.flatMap { (value: Error) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var spots: [Spot?]? {
        get {
          return (resultMap["spots"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Spot?] in value.map { (value: ResultMap?) -> Spot? in value.flatMap { (value: ResultMap) -> Spot in Spot(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Spot?]) -> [ResultMap?] in value.map { (value: Spot?) -> ResultMap? in value.flatMap { (value: Spot) -> ResultMap in value.resultMap } } }, forKey: "spots")
        }
      }

      public var errors: [Error?]? {
        get {
          return (resultMap["errors"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Error?] in value.map { (value: ResultMap?) -> Error? in value.flatMap { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error?]) -> [ResultMap?] in value.map { (value: Error?) -> ResultMap? in value.flatMap { (value: Error) -> ResultMap in value.resultMap } } }, forKey: "errors")
        }
      }

      public struct Spot: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Spot"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("locate", type: .object(Locate.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, name: String, image: String, description: String, locate: Locate? = nil) {
          self.init(unsafeResultMap: ["__typename": "Spot", "id": id, "name": name, "image": image, "description": description, "locate": locate.flatMap { (value: Locate) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var image: String {
          get {
            return resultMap["image"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        public var locate: Locate? {
          get {
            return (resultMap["locate"] as? ResultMap).flatMap { Locate(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "locate")
          }
        }

        public struct Locate: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Locate"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("latitude", type: .nonNull(.scalar(Double.self))),
              GraphQLField("longitude", type: .nonNull(.scalar(Double.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(latitude: Double, longitude: Double) {
            self.init(unsafeResultMap: ["__typename": "Locate", "latitude": latitude, "longitude": longitude])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var latitude: Double {
            get {
              return resultMap["latitude"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "latitude")
            }
          }

          public var longitude: Double {
            get {
              return resultMap["longitude"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "longitude")
            }
          }
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ERRORS"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("code", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(code: Int, message: String, description: String) {
          self.init(unsafeResultMap: ["__typename": "ERRORS", "code": code, "message": message, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var code: Int {
          get {
            return resultMap["code"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "code")
          }
        }

        public var message: String {
          get {
            return resultMap["message"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }

        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }
      }
    }
  }
}
