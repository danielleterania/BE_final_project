// Import the Pusher library (adjust based on your setup)
// If you are using Webpack, ensure you have the pusher-js package installed: `npm install pusher-js`
import Pusher from "pusher-js";

// Initialize Pusher with your app key and cluster
const pusher = new Pusher("cef106527e36c9be4f31", {
  cluster: "ap1", // Replace with your actual cluster
  encrypted: true,
});

// Subscribe to the complaints channel
const channel = pusher.subscribe("complaints-channel");

// Handle new complaints
channel.bind("new-complaint", function (data) {
  console.log("New complaint received:", data);

  // Update the UI to show the new complaint
  const complaintsList = document.getElementById("complaints-list");
  if (complaintsList) {
    const newComplaint = document.createElement("div");
    newComplaint.classList.add("complaint");
    newComplaint.dataset.id = data.complaint_id; // Add ID for later reference
    newComplaint.innerHTML = `
      <p><strong>Complaint ID:</strong> ${data.complaint_id}</p>
      <p><strong>Content:</strong> ${data.content}</p>
      <p><strong>Response:</strong> No response yet</p> <!-- Default message until response is updated -->
    `;
    complaintsList.appendChild(newComplaint);
  }
});

// Handle updated complaints
channel.bind("complaint-updated", function (data) {
  console.log("Complaint updated:", data);

  // Update the UI to reflect the updated complaint
  const complaintElement = document.querySelector(
    `.complaint[data-id="${data.complaint_id}"]`
  );
  if (complaintElement) {
    complaintElement.innerHTML = `
      <p><strong>Complaint ID:</strong> ${data.complaint_id}</p>
      <p><strong>Content:</strong> ${data.content}</p>
      <p><strong>Response:</strong> ${data.response}</p>
    `;
  }
});
