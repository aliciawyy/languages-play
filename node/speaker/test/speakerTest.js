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
      expect(res.headers['content-type']).to.eql(
        'application/json; charset=utf-8');
      done();
    });
  });

  it('should return all speakers', function (done) {
    /*
    * req.end() executes the Unirest GET request asynchronously, the
    * callback processed the HTTP response from the API call */
    req.end(res => {
      let speakers = res.body;
      expect(speakers.length).to.eql(3);

      let speaker3 = speakers[2];
      expect(speaker3.company).to.eql('Talkola');
      expect(speaker3.lastName).to.eql('Fisher');
      expect(speaker3.tags).to.eql(['Java', 'Spring', 'Maven', 'REST']);
      done();
    });
  })
});
