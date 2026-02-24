const nameInput = document.getElementById("name");
const emailInput = document.getElementById("email");
const submitBtn = document.getElementById("submitBtn");

// 🔹 Reusable validation function
function validateNotEmpty(input, errorElement, message) {
    if (input.value.trim() === "") {
        errorElement.textContent = message;
        return false;
    } else {
        errorElement.textContent = "";
        return true;
    }
}

// 🔹 Validate on keypress
nameInput.addEventListener("keyup", function() {
    validateNotEmpty(nameInput, document.getElementById("nameError"), "Name is required");
});

emailInput.addEventListener("keyup", function() {
    validateNotEmpty(emailInput, document.getElementById("emailError"), "Email is required");
});

// 🔹 Double click event for confirmation
submitBtn.addEventListener("click", function() {
    const validName = validateNotEmpty(nameInput, document.getElementById("nameError"), "Name is required");
    const validEmail = validateNotEmpty(emailInput, document.getElementById("emailError"), "Email is required");

    if (validName && validEmail) {
        document.getElementById("confirmation").textContent = "Feedback Submitted Successfully ✅";
    }
});