const apiBaseUrl = 'http://localhost:4567/todos'

export default {
  getTodos() {
    return fetch(apiBaseUrl).then(response => response.json())
  }
}
