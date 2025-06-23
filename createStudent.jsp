<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ms">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Registration</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
  <link rel="stylesheet" href="cs/StudentP.css">
</head>
<body>

<header>
  <button class="navSidebar" onclick="toggleSidebar()"><i class="fa-solid fa-bars"></i></button>
  <div class="logo">
    <img src="images/LOGO-AL-KAUTHAR-EDUQIDS.png" alt="ALKAUTHAR EDUQIDS">
  </div>
</header>

<!-- Sidebar -->
<div class="sidebar" id="sidebar">
  <div class="profile">
    <img src="images/parent.jpg" alt="Parent Profile">
    <h3><%= session.getAttribute("parentName") %></h3>
    <p>Parent</p>
  </div>
  <a href="#">Dashboard</a>
  <a href="#">Students</a>
  <a href="#">Teachers</a>
  <a href="#">Accounts</a>
  <a href="#">Logout</a>
</div>

<!-- Main Container -->
<div class="container">
  <h2>Student Registration</h2>
  <button class="btn" onclick="toggleForm()">New Student</button>

  <!-- Form Section -->
  <div class="form-section" id="formSection" style="display: none;">
    <form id="childForm" action="createStudentController" method="post" enctype="multipart/form-data">
      <input type="hidden" id="numChild" name="numChild">

      <label>Parent Name</label>
      <input type="text" value="<%= session.getAttribute("parentName") %>" readonly>

      <label>Full Name</label>
      <input type="text" name="name" required>

      <label for="dob">Date of Birth</label>
      <input type="date" id="dob" name="dob" required onchange="calculateAge()">

      <label>Gender</label>
      <select name="gender" required>
        <option value="" disabled selected>Choose Gender</option>
        <option value="male">Male</option>
        <option value="female">Female</option>
      </select>

      <label for="age">Age</label>
      <input type="number" id="age" name="age" readonly required>

      <label>Address</label>
      <textarea name="address" rows="2"></textarea>

      <label>Child's Photo</label>
      <input type="file" name="photo" accept=".pdf,image/*" required>

      <label>Birth Certificate</label>
      <input type="file" name="birthCert" accept=".pdf,image/*" required>

      <button class="btn" type="submit">Submit</button>
      <button class="btn" type="button" onclick="cancelForm()">Cancel</button>
    </form>
  </div>
</div>

<!-- JS Below -->
<script>
  function toggleSidebar() {
    document.getElementById("sidebar").classList.toggle("show");
  }

  function toggleForm() {
    const formSection = document.getElementById("formSection");
    const form = document.getElementById("childForm");
    if (form) form.reset();
    formSection.style.display = "block";
  }

  function cancelForm() {
    const formSection = document.getElementById("formSection");
    const form = document.getElementById("childForm");
    if (form) form.reset();
    formSection.style.display = "none";
  }

  function calculateAge() {
    const dobInput = document.getElementById("dob");
    const ageInput = document.getElementById("age");

    if (!dobInput.value) {
      ageInput.value = '';
      return;
    }

    const dob = new Date(dobInput.value);
    const today = new Date();

    let age = today.getFullYear() - dob.getFullYear();
    const monthDiff = today.getMonth() - dob.getMonth();
    const dayDiff = today.getDate() - dob.getDate();

    if (monthDiff < 0 || (monthDiff === 0 && dayDiff < 0)) {
      age--;
    }

    ageInput.value = age >= 0 ? age : '';
  }

  document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("childForm");
    form.addEventListener("submit", function (e) {
      const name = form.name.value.trim();
      const photo = form.photo.files[0];

      if (!name) {
        alert("Please enter the student's name.");
        e.preventDefault();
        return;
      }

      if (!photo) {
        const proceed = confirm("No photo uploaded. Continue?");
        if (!proceed) e.preventDefault();
      }
    });
  });
</script>

</body>
</html>
