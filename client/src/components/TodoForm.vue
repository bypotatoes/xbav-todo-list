<template>
  <form class="todo-form" v-on:submit.prevent="handleAddNewTodo">
    <div class="input-group">
      <label for="title">Title</label>
      <input
        v-model="todo.title"
        id="title"
        name="title"
        placeholder="Title"
        required
      >
    </div>
    <div class="input-group">
      <label for="description">Description</label>
      <textarea
        v-model="todo.description"
        id="description"
        name="description"
        placeholder="Description"
        required
      >
      </textarea>
    </div>
    <div class="input-group">
      <label for="dueDate">Due Date</label>
      <input
        type="date"
        v-model="todo.dueDate"
        id="Description"
        name="Description"
      >
    </div>

    <button>Add</button>
  </form>
</template>

<script>
export default {
  name: 'TodoForm',
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
