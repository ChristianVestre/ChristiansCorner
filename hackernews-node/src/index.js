const { GraphQLServer } = require('graphql-yoga')
const { Prisma } = require("prisma-binding")

const Query = require('./resolvers/Query')
const Mutation = require('./resolvers/Mutation')
const AuthPayload = require('./resolvers/AuthPayload')
const Subscription = require('./resolvers/Subscription')
const Feed = require('./resolvers/Feed')

require("babel-polyfill")


// 1
/*const typeDefs = `
type Query {
    info: String!
    feed:[Link!]!
}

type Mutation {
    post(url:String!, description: String!): Link!
}

type Link {
    id: ID!
    description: String!
    url: String!
}
`*/



// 2
const resolvers = {
    Query,
    Mutation,
    AuthPayload,
    Subscription,
    Feed,
}

// 3
const server = new GraphQLServer({
    typeDefs: './src/schema.graphql',
    resolvers,
    context: req => ({
        ...req,
        db: new Prisma({
            typeDefs:'src/generated/prisma.graphql',
            endpoint:'https://eu1.prisma.sh/public-swampwizard-389/hackernews-node/dev',
            secret: 'mysecret123',
            debug: true,
        }),
    }),
})
server.start(() => console.log('Server is running on http://localhost:4000'))