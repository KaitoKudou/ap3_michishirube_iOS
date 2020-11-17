// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class AddEvaluationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AddEvaluation($spotid: String!, $emotion: Int!, $status: Boolean!) {
      addEvaluation(spotid: $spotid, emotion: $emotion, status: $status) {
        __typename
        status
        errors {
          __typename
          code
          message
          description
        }
      }
    }
    """

  public let operationName: String = "AddEvaluation"

  public var spotid: String
  public var emotion: Int
  public var status: Bool

  public init(spotid: String, emotion: Int, status: Bool) {
    self.spotid = spotid
    self.emotion = emotion
    self.status = status
  }

  public var variables: GraphQLMap? {
    return ["spotid": spotid, "emotion": emotion, "status": status]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("addEvaluation", arguments: ["spotid": GraphQLVariable("spotid"), "emotion": GraphQLVariable("emotion"), "status": GraphQLVariable("status")], type: .nonNull(.object(AddEvaluation.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addEvaluation: AddEvaluation) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addEvaluation": addEvaluation.resultMap])
    }

    public var addEvaluation: AddEvaluation {
      get {
        return AddEvaluation(unsafeResultMap: resultMap["addEvaluation"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "addEvaluation")
      }
    }

    public struct AddEvaluation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Result"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("status", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("errors", type: .list(.object(Error.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: Bool, errors: [Error?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Result", "status": status, "errors": errors.flatMap { (value: [Error?]) -> [ResultMap?] in value.map { (value: Error?) -> ResultMap? in value.flatMap { (value: Error) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: Bool {
        get {
          return resultMap["status"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
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

public final class AddSpotMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AddSpot($name: String!, $description: String!, $image: String!, $latitude: Float!, $longitude: Float!) {
      addSpot(name: $name, description: $description, image: $image, latitude: $latitude, longitude: $longitude) {
        __typename
        status
        errors {
          __typename
          code
          message
          description
        }
      }
    }
    """

  public let operationName: String = "AddSpot"

  public var name: String
  public var description: String
  public var image: String
  public var latitude: Double
  public var longitude: Double

  public init(name: String, description: String, image: String, latitude: Double, longitude: Double) {
    self.name = name
    self.description = description
    self.image = image
    self.latitude = latitude
    self.longitude = longitude
  }

  public var variables: GraphQLMap? {
    return ["name": name, "description": description, "image": image, "latitude": latitude, "longitude": longitude]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("addSpot", arguments: ["name": GraphQLVariable("name"), "description": GraphQLVariable("description"), "image": GraphQLVariable("image"), "latitude": GraphQLVariable("latitude"), "longitude": GraphQLVariable("longitude")], type: .nonNull(.object(AddSpot.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addSpot: AddSpot) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addSpot": addSpot.resultMap])
    }

    public var addSpot: AddSpot {
      get {
        return AddSpot(unsafeResultMap: resultMap["addSpot"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "addSpot")
      }
    }

    public struct AddSpot: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Result"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("status", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("errors", type: .list(.object(Error.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: Bool, errors: [Error?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Result", "status": status, "errors": errors.flatMap { (value: [Error?]) -> [ResultMap?] in value.map { (value: Error?) -> ResultMap? in value.flatMap { (value: Error) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: Bool {
        get {
          return resultMap["status"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
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
        spot {
          __typename
          id
          name
          locate {
            __typename
            latitude
            longitude
          }
        }
        detour {
          __typename
          id
          name
          image
          Description
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
          GraphQLField("spot", type: .object(Spot.selections)),
          GraphQLField("detour", type: .list(.object(Detour.selections))),
          GraphQLField("errors", type: .list(.object(Error.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(spot: Spot? = nil, detour: [Detour?]? = nil, errors: [Error?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Spots", "spot": spot.flatMap { (value: Spot) -> ResultMap in value.resultMap }, "detour": detour.flatMap { (value: [Detour?]) -> [ResultMap?] in value.map { (value: Detour?) -> ResultMap? in value.flatMap { (value: Detour) -> ResultMap in value.resultMap } } }, "errors": errors.flatMap { (value: [Error?]) -> [ResultMap?] in value.map { (value: Error?) -> ResultMap? in value.flatMap { (value: Error) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var spot: Spot? {
        get {
          return (resultMap["spot"] as? ResultMap).flatMap { Spot(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "spot")
        }
      }

      public var detour: [Detour?]? {
        get {
          return (resultMap["detour"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Detour?] in value.map { (value: ResultMap?) -> Detour? in value.flatMap { (value: ResultMap) -> Detour in Detour(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Detour?]) -> [ResultMap?] in value.map { (value: Detour?) -> ResultMap? in value.flatMap { (value: Detour) -> ResultMap in value.resultMap } } }, forKey: "detour")
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
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("locate", type: .object(Locate.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, name: String, locate: Locate? = nil) {
          self.init(unsafeResultMap: ["__typename": "Spot", "id": id, "name": name, "locate": locate.flatMap { (value: Locate) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
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

      public struct Detour: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Detour"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .nonNull(.scalar(String.self))),
            GraphQLField("Description", type: .nonNull(.scalar(String.self))),
            GraphQLField("locate", type: .object(Locate.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, name: String, image: String, description: String, locate: Locate? = nil) {
          self.init(unsafeResultMap: ["__typename": "Detour", "id": id, "name": name, "image": image, "Description": description, "locate": locate.flatMap { (value: Locate) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
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
            return resultMap["Description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "Description")
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
