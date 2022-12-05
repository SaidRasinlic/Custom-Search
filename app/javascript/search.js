import { post } from './request';
import { debounce } from './debounce';

window.onload = () => {
  const searchBox = document.getElementById("index-search-box");
  const token = document.getElementsByName("csrf-token")[0].content;
  let identifier = Date.now();

  const getData = debounce(async () => {
    const result = await post(
      {
        search: searchBox.value.trim().replace(/[?.!]/g, "").toLowerCase(),
        identifier: identifier,
      },
      token
    );
  }, 500);

  if (searchBox) {
    searchBox.addEventListener("input", function (event) {
      if (event.which != 8) {
        searchBox.value.trim().length > 0
          ? getData()
          : ((identifier = Date.now()));
      }
    });
  }
}
