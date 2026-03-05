// roomTypes.js

async function loadRoomTypes() {
    console.log("hello worlds");
    try {
        // 1. Fetch data from servlet API
        const response = await fetch("roomType?action=list");
        if (!response.ok) {
            throw new Error("Network response was not ok");
        }

        const roomTypes = await response.json();
        console.log("Fetched room types:", roomTypes);

        // 2. Get container element
        const container = document.getElementById("roomContainer");
        if (!container) {
            console.error("No container found with id 'roomContainer'");
            return;
        }

        // Clear previous content
        container.innerHTML = "";

        // 3. Loop through room types and create cards
        roomTypes.forEach(room => {
            const card = `
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm rounded-4 overflow-hidden room-card">
                    <div class="position-relative">
                        <img src="${room.imageUrl}" class="card-img-top" alt="${room.roomType}">
                        <span class="badge bg-warning text-dark position-absolute top-0 end-0 m-3 p-2">Premium</span>
                    </div>
                    <div class="card-body p-4">
                        <h5 class="card-title fw-bold">${room.roomType}</h5>
                        <p class="text-muted small mb-3">The ultimate luxury experience with a private jacuzzi.</p>
                        <div class="d-flex mb-3 text-primary">
                            <i class="fa-solid fa-wifi me-3"></i>
                            <i class="fa-solid fa-martini-glass-citrus me-3"></i>
                            <i class="fa-solid fa-hot-tub-person me-3"></i>
                            <i class="fa-solid fa-utensils me-3"></i>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <span class="fs-4 fw-bold text-dark">$${room.pricePerNight}</span>
                                <span class="text-muted small">/ night</span>
                            </div>
                           <button onclick="handleBooking('${room.roomType}')" class="btn btn-primary rounded-pill">Book Now</button>
                        </div>
                    </div>
                </div>
            </div>
            `;
            // Append card to container
            container.insertAdjacentHTML("beforeend", card);
        });

    } catch (error) {
        console.error("Error loading room types:", error);
    }
}

// Call the function after page load
document.addEventListener("DOMContentLoaded", loadRoomTypes);
