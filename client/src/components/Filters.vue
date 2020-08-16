<template>
  <div class="filters">
    <input
      type="search"
      v-on:keyup="$emit('on-filter-change', $event.target.value)"
      v-on:search="$emit('on-filter-change', $event.target.value)"
      placeholder="Filter by title"
    />
  </div>
</template>

<script>
export default {
  name: 'Filters',
  data: function() {
    return {
      todo: {}
    }
  },
  methods: {
    handleAddNewTodo: function() {
      this.$emit('on-todo-add', this.todo)
      this.todo = {}
    }
  }
}
</script>

<style scoped>
.input-group {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  padding-bottom: 10px;
}

label {
  font-weight: 600;
}

input, textarea {
  width: 100%;
}

button {
  width: 50%;
  height: 20px;
}
</style>
