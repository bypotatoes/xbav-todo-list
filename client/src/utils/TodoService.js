const apiBaseUrl = 'http://localhost:4567/todos'

export default {
  getTodos() {
    return fetch(apiBaseUrl).then(response => response.json())
  },
  createTodo(newTodo) {
    return fetch(apiBaseUrl, {
      method: 'POST',
      mode: 'cors',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(newTodo)
    });
  },
  removeTodo(id) {
    return fetch(`${apiBaseUrl}/${id}`, {
      method: 'DELETE',
    });
  }
}
