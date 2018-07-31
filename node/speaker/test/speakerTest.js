'use strict';

const expect = require('chai').expect;
const unirest = require('unirest');
const speakerURI = 'http://localhost:5000/speakers';

describe('speakers', function () {
  let req;

  beforeEach(function () {
    req = unirest.get(speakerURI).header('Accept', 'application/json');
  });

  it('should return a 200 response', function (done) {
    req.end(function (res) {
      expect(res.statusCode).to.eql(200);
    })
  });
});
