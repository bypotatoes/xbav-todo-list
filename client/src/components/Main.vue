<template>
  <main class="main">
    <h2>
      Create New Todo
    </h2>

    <TodoForm @on-todo-add="onTodoAdd"/>

    <h2>
      TODOs
    </h2>

    <Filters @on-filter-change="onFilterChange"/>

    <ul class="todo-list">
      <li
        is="TodoItem"
        v-for="(todo, index) in filteredTodos"
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
import Filters from './Filters.vue'

import TodoService from '../utils/TodoService.js'

export default {
  name: 'Main',
  components: {
    TodoItem,
    TodoForm,
    Filters,
  },
  mounted() {
    TodoService.getTodos()
      .then(todosData => (this.todos = todosData));
  },
  data: function() {
    return {
      todos: [],
      filterText: ''
    }
  },
  computed: {
    filteredTodos: function() {
      return this.todos.filter(todo => {
        if (!this.filterText) return true

        return todo.title.toUpperCase().indexOf(this.filterText.toUpperCase()) > -1
      })
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
    },
    onFilterChange: function(filterText) {
      this.filterText = filterText
    }
  }
}
</script>

<style scoped>
.main {
  flex: 1;
  min-width: 290px;
  max-width: 550px;
  width: 100%;
}

h2 {
  margin: 40px 0 20px 0;
}

.todo-list {
  padding: 0;
}
</style>
