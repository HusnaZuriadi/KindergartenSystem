/**
 * 
 */

// Show/hide Teacher Type dropdown
function showTeacherType() {
  const role = document.getElementById("roleSelect").value;
  const teacherType = document.getElementById("teacherType");
  if (role === "Teacher") {
    teacherType.classList.remove("hidden");
  } else {
    teacherType.classList.add("hidden");
  }
}

// Validate password match before submitting
function validateForm() {
  const password = document.getElementById("password").value;
  const confirmPassword = document.getElementById("confirmPassword").value;

  if (password !== confirmPassword) {
    alert("Passwords do not match!");
    return false;
  }
  return true;
}

