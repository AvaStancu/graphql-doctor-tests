# Define the BigInt scalar
class Types::BigInt < GraphQL::Schema::Scalar
  description "BigInt type for handling large integers"

  # Coerce input value from variables or arguments
  def self.coerce_input(value, _context)
    Integer(value)
  rescue ArgumentError
    raise GraphQL::CoercionError, "#{value.inspect} is not a valid BigInt"
  end

  # Serialize the output value to the client
  def self.coerce_result(value, _context)
    value.to_s
  end
end
