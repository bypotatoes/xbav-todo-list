<template>
  <li class="todo-item">
    <h3 class="title">
      {{todo.title}}
      <span class="due-date">{{todo.dueDate}}</span>
    </h3>
    <p class="description">{{todo.description}}</p>
  </li>
</template>

<script>
export default {
  name: 'TodoItem',
  props: [
    'todo',
  ]
}
</script>

<style scoped>
.todo-item {
  text-align: left;
  display: block;
  border-top: 1px solid lightgrey;
}

.title {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 0;
}

.due-date {
  opacity: 60%;
  font-size: 14px;
  font-weight: 500;
}
</style>
