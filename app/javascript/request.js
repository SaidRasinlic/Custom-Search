const URL = "/search";

export const post = (data, token) => {
  return fetch(URL, {
    method: "post",
    headers: {
      "Content-Type": "application/json",
      "X-CSRF-Token": token,
    },
    body: JSON.stringify(data),
  })
    .then((res) => res.json())
    .then((res) => res);
};