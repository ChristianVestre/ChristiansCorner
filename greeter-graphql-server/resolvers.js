const resolvers = {
    Query: {
        hello: () => 'world',
        firstName: () => 'Christian',
        lastName: () => 'Vestre',
        id: () => 1234
    },
};

module.exports = resolvers