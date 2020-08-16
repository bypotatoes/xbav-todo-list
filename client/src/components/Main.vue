<template>
  <main class="main">
    <h2>
      Create New Todo
    </h2>

    <TodoForm @on-todo-add="onTodoAdd"/>

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
import TodoForm from './TodoForm.vue'
import TodoItem from './TodoItem.vue'

export default {
  name: 'Main',
  components: {
    TodoItem,
    TodoForm,
  },
  data: function() {
    return {
      todos: [
        {
          id: 1,
          title: 'Joy life',
          description: 'til the end',
          dueDate: '2020-12-31'
        }
      ]
    }
  },
  methods: {
    onTodoAdd: function(todo) {
      this.todos.push(todo);
    }
  }
}
</script>

<style scoped>
.main {
  flex: 1;
  min-width: 290px;
  max-width: 550px;
}

h2 {
  margin: 40px 0 20px 0;
}

.todo-list {
  padding: 0;
}
</style>
