// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

var quill = new Quill('#editor', {
  theme: 'snow'
});

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

// page elements
const list = document.getElementById('note-list-js');
const noteSubmit = document.getElementById('note-submit-js');

// functions
const getNoteType = () => {
  return 'general';
};

// async calls
const headers = new Headers();
headers.set('Accept', 'application/json');
headers.set('Content-Type', 'application/json');
noteSubmit.onclick = () => {
  fetch('/api/notes', {
    method: 'POST',
    headers,
    body: JSON.stringify({
      note: {
        body: quill.getText(),
        mentorship_id: 1,
        user_id: 2,
        note_type: getNoteType()
      }
    })
  }).then(() => window.location.reload());
}
