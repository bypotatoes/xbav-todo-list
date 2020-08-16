<template>
  <footer>
    © {{currentYear}} Ilya Hrytsuk
  </footer>
</template>

<script>
export default {
  name: 'Footer',
  data: function () {
    return {
      currentYear: (new Date()).getFullYear()
    }
  }
}
</script>
