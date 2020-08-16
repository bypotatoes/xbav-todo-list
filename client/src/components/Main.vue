<template>
  <main class="main">
    <h2>
      TODOs
    </h2>

    <ul class="todo-list">
      <li
        is="TodoItem"
        v-for="(todo, index) in todos"
        :key="index"
        :todo="todo"
      ></li>
    </ul>
  </main>
</template>

<script>
import TodoItem from './TodoItem.vue'

export default {
  name: 'Main',
  components: {
    TodoItem,
  },
  data: function() {
    return {
      todos: [
        {
          id: 1,
          title: 'Joy life',
          description: 'til the end',
          dueDate: new Date
        }
      ]
    }
  }
}
</script>

<style scoped>
.main {
  flex: 1;
  min-width: 230px;
  max-width: 550px;
}

h2 {
  margin: 40px 0 0;
}

.todo-list {
  padding: 0;
}
</style>
