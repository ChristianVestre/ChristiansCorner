// GENERATED CODE -- DO NOT EDIT!

'use strict';
var grpc = require('grpc');
var helloworld_pb = require('./helloworld_pb.js');

function serialize_helloworld_FirstNameReply(arg) {
  if (!(arg instanceof helloworld_pb.FirstNameReply)) {
    throw new Error('Expected argument of type helloworld.FirstNameReply');
  }
  return new Buffer(arg.serializeBinary());
}

function deserialize_helloworld_FirstNameReply(buffer_arg) {
  return helloworld_pb.FirstNameReply.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_helloworld_FirstNameRequest(arg) {
  if (!(arg instanceof helloworld_pb.FirstNameRequest)) {
    throw new Error('Expected argument of type helloworld.FirstNameRequest');
  }
  return new Buffer(arg.serializeBinary());
}

function deserialize_helloworld_FirstNameRequest(buffer_arg) {
  return helloworld_pb.FirstNameRequest.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_helloworld_HelloReply(arg) {
  if (!(arg instanceof helloworld_pb.HelloReply)) {
    throw new Error('Expected argument of type helloworld.HelloReply');
  }
  return new Buffer(arg.serializeBinary());
}

function deserialize_helloworld_HelloReply(buffer_arg) {
  return helloworld_pb.HelloReply.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_helloworld_HelloRequest(arg) {
  if (!(arg instanceof helloworld_pb.HelloRequest)) {
    throw new Error('Expected argument of type helloworld.HelloRequest');
  }
  return new Buffer(arg.serializeBinary());
}

function deserialize_helloworld_HelloRequest(buffer_arg) {
  return helloworld_pb.HelloRequest.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_helloworld_LastNameReply(arg) {
  if (!(arg instanceof helloworld_pb.LastNameReply)) {
    throw new Error('Expected argument of type helloworld.LastNameReply');
  }
  return new Buffer(arg.serializeBinary());
}

function deserialize_helloworld_LastNameReply(buffer_arg) {
  return helloworld_pb.LastNameReply.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_helloworld_LastNameRequest(arg) {
  if (!(arg instanceof helloworld_pb.LastNameRequest)) {
    throw new Error('Expected argument of type helloworld.LastNameRequest');
  }
  return new Buffer(arg.serializeBinary());
}

function deserialize_helloworld_LastNameRequest(buffer_arg) {
  return helloworld_pb.LastNameRequest.deserializeBinary(new Uint8Array(buffer_arg));
}


var GreeterService = exports.GreeterService = {
  sayHello: {
    path: '/helloworld.Greeter/SayHello',
    requestStream: false,
    responseStream: false,
    requestType: helloworld_pb.HelloRequest,
    responseType: helloworld_pb.HelloReply,
    requestSerialize: serialize_helloworld_HelloRequest,
    requestDeserialize: deserialize_helloworld_HelloRequest,
    responseSerialize: serialize_helloworld_HelloReply,
    responseDeserialize: deserialize_helloworld_HelloReply,
  },
  giveFirstName: {
    path: '/helloworld.Greeter/GiveFirstName',
    requestStream: false,
    responseStream: false,
    requestType: helloworld_pb.FirstNameRequest,
    responseType: helloworld_pb.FirstNameReply,
    requestSerialize: serialize_helloworld_FirstNameRequest,
    requestDeserialize: deserialize_helloworld_FirstNameRequest,
    responseSerialize: serialize_helloworld_FirstNameReply,
    responseDeserialize: deserialize_helloworld_FirstNameReply,
  },
  giveLastName: {
    path: '/helloworld.Greeter/GiveLastName',
    requestStream: false,
    responseStream: false,
    requestType: helloworld_pb.LastNameRequest,
    responseType: helloworld_pb.LastNameReply,
    requestSerialize: serialize_helloworld_LastNameRequest,
    requestDeserialize: deserialize_helloworld_LastNameRequest,
    responseSerialize: serialize_helloworld_LastNameReply,
    responseDeserialize: deserialize_helloworld_LastNameReply,
  },
};

exports.GreeterClient = grpc.makeGenericClientConstructor(GreeterService);
