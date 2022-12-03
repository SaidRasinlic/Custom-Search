const appendResults = (data, element) => {
  data.data.forEach((el) => {
    let node = document.createElement("DIV");
    node.classList.add("article");

    let title = document.createElement("H2");
    title.classList.add("title");
    let titleTextNode = document.createTextNode(el.title);
    title.appendChild(titleTextNode);

    let content = document.createElement("P");
    content.classList.add("content");
    let contentTextNode = document.createTextNode(el.content);
    content.appendChild(contentTextNode);

    node.appendChild(title);
    node.appendChild(content);
    element.appendChild(node);
  });
};

const appendError = (data, element) => {
  let noResults = document.createElement("H2");
  let errorTextNode = document.createTextNode(data.errors[0]);
  noResults.appendChild(errorTextNode);
  noResults.classList.add("text-centar");
  noResults.classList.add("error-message");
  element.appendChild(noResults);
};

const displayWelcomeScreen = (welcomeScreen, articles) => {
  welcomeScreen.classList.remove("display-none");
  articles.classList.add("display-none");
};

export {
  appendResults,
  appendError,
  displayWelcomeScreen,
};
