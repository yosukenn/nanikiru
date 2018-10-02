<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
      <a class="navbar-brand" href="#">NANIKIRU?</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item active">
          <router-link to="/" class="nav-link">
            Coordinates
            <span class="sr-only">
              (current)
            </span>
          </router-link>
        </li>
        <li class="nav-item">
          <router-link to="/mycoorde" class="nav-link">
            MyCoorde
          </router-link>
        </li>
        <li class="nav-item">
          <router-link to="/about" class="nav-link">
            About
          </router-link>
        </li>
      </ul>
    </div>
  </nav>
</template>
