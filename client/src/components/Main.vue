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
        @on-remove="onTodoRemove(index, todo.id)"
      ></li>
    </ul>
  </main>
</template>

<script>
import TodoForm from './TodoForm.vue'
import TodoItem from './TodoItem.vue'
import TodoService from '../utils/TodoService.js'

export default {
  name: 'Main',
  components: {
    TodoItem,
    TodoForm,
  },
  mounted() {
    TodoService.getTodos()
      .then(todosData => (this.todos = todosData));
  },
  data: function() {
    return {
      todos: []
    }
  },
  methods: {
    onTodoAdd: function(todo) {
      this.todos.push(todo);

      TodoService.createTodo(todo)
    },
    onTodoRemove: function(index, id) {
      this.todos.splice(index, 1)
      TodoService.removeTodo(id)
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
