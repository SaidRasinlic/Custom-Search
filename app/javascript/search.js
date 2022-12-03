import {
  appendResults,
  appendError,
  displayWelcomeScreen,
} from './helpers';
import { post } from './request';
import { debounce } from './debounce';

window.onload = () => {
  const searchBox = document.getElementById("index-search-box");
  const welcomeScreen = document.getElementById("index-welcome");
  const articlesContainer = document.getElementById("index-articles-container");
  const token = document.getElementsByName("csrf-token")[0].content;
  let session_identifier = Date.now();

  const updateDom = (data) => {
    articlesContainer.innerHTML = "";
    welcomeScreen.classList.add("display-none");
    articlesContainer.classList.remove("display-none");
    searchBox.value.length === 0
      ? displayWelcomeScreen(welcomeScreen, articlesContainer)
      : data.errors.length > 0
        ? appendError(data, articlesContainer)
        : appendResults(data, articlesContainer);
  };

  console.log("pre debouncer");
  
  const getData = debounce(async () => {
    console.log("getdata search start");
    const result = await post(
      {
        search: searchBox.value.trim().replace(/[?.!]/g, "").toLowerCase(),
        identifier: session_identifier,
      },
      token
    );
    console.log("getdata search end");
    updateDom(result);
  }, 500);

  searchBox.addEventListener("input", function (event) {
    if (event.which != 8) {
      searchBox.value.trim().length > 0
        ? getData()
        : ((session_identifier = Date.now()), updateDom());
    }
  });
}
