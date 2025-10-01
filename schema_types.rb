class Types::User < GraphQL::Schema::Object
  field :id, ID, null: false
  field :username, String, null: false
  field :email, String, null: false
  field :account_balance, Types::BigInt, null: true
end

class Types::Query < GraphQL::Schema::Object
  field :users, [Types::User], null: false
  field :user, Types::User, null: true do
    argument :id, ID, required: true
  end
  field :big_number, Types::BigInt, null: true
end

class MySchema < GraphQL::Schema
  query(Types::Query)
end
