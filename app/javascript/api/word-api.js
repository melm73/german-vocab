
export const getWords = (searchText, callback) => {
  fetch(`/api/v1/words?search=${searchText}`)
    .then((response) => {return response.json()})
    .then((words) => callback(words));
};

export const getAllWords = () => {
  console.log('GET /api/v1/words');

  return fetch(`/api/v1/words`)
    .then((response) => response.json());
};

export const getWord = (id, callback) => {
  fetch(`/api/v1/words/${id}`)
    .then((response) => {return response.json()})
    .then((word) => callback(word));
};
