<template>
  <li class="todo-item">
    <h3 class="title">
      <span class="title__text">{{todo.title}}</span>
      <span class="due-date">{{todo.dueDate}}</span>
      <button @click="$emit('on-remove')">Remove</button>
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

.title__text {
  flex: 1;
}

.due-date {
  opacity: 60%;
  font-size: 14px;
  font-weight: 500;
  padding: 0 5px;
}
</style>
