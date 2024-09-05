// app/javascript/channels/announcements.js

import Pusher from "pusher-js";
import "./channels/announcements";

// Initialize Pusher with your app key and cluster
const pusher = new Pusher("cef106527e36c9be4f31", {
  cluster: "ap1", // Replace with your actual cluster
  // 'encrypted' is deprecated in recent versions, you can omit this
});

// Subscribe to the announcements channel
const announcementsChannel = pusher.subscribe("announcements-channel");

// Handle new announcements
announcementsChannel.bind("new-announcement", function (data) {
  console.log("New announcement received:", data);

  // Update the UI to show the new announcement
  const announcementsList = document.getElementById("announcements-list");
  if (announcementsList) {
    const newAnnouncement = document.createElement("div");
    newAnnouncement.classList.add("announcement");
    newAnnouncement.innerHTML = `
      <h2>${data.title}</h2>
      <p>${data.content}</p>
    `;
    announcementsList.appendChild(newAnnouncement);
  }
});
