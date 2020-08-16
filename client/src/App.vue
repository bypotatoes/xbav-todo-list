<template>
  <div id="app">
    <header>
      <h1>
        xbAV Frontend-Test
      </h1>
    </header>

    <Main/>

    <Footer />
  </div>
</template>

<script>
import Main from './components/Main.vue'
import Footer from './components/Footer.vue'

export default {
  name: 'App',
  components: {
    Main,
    Footer
  }
}
</script>

<style>
body {
  min-height: 100vh;
  /* mobile viewport bug fix */
  min-height: -webkit-fill-available;
  display: flex;
  flex-direction: column;
}

html {
  height: -webkit-fill-available;
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  min-height: 100%;
  flex: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>
