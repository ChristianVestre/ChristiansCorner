const { ApolloServer,gql } = require('apollo-server');
const typeDefs = require('./typeDefs.js')
const resolvers = require('./resolvers.js')


console.log(resolvers)
server = new ApolloServer ({
    typeDefs,
    resolvers,
})

server.listen().then(({url}) => {
    console.log(`🚀 Server ready at ${url}`)
});