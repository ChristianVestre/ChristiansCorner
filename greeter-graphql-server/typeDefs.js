const {gql} = require('apollo-server')
typeDefs = gql`
type Query {
    hello : String
    firstName : String
    lastName : String
    id : ID!
}
`;

module.exports = typeDefs