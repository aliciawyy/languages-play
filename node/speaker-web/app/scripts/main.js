'use strict';

console.log('Hello jQuery!');

$(document).ready(function () {

  function addSpeakersjQuery (speakers) {
    $.each (speakers, function (index, speaker) {
      let tbody = $('#speakers-tbody');
      let tr = $('<tr></tr>');
      let nameCol = $('<td></td>');
      let aboutCol = $('<td></td>');

      nameCol.text(speaker.firstName + ' ' + speaker.lastName);
      aboutCol.text(speaker.about);

      tr.append(nameCol);
      tr.append(aboutCol);
      tr.append(nameCol);
      tbody.append(tr);
    });
  }

  $.getJSON('http://localhost:5000/speakers',
    (data) => addSpeakersjQuery(data.speakers)
  );

});
