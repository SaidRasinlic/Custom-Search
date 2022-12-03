export const debounce = (callback, time) => {
  let interval;
  return (...args) => {
    clearTimeout(interval);
    interval = setTimeout(() => {
      interval = null;
      callback(...args);
    }, time);
  };
};

// export const debounce = (func, wait, immediate) => {
//   let timeout;
//   return () => {
//     console.log("debounce start");
//     let context = this,
//       args = console.log(arguments);
//     const later = function () {
//       timeout = null;
//       if (!immediate) func.apply(context, args);
//     };
//     let callNow = immediate && !timeout;
//     clearTimeout(timeout);
//     timeout = setTimeout(later, wait);
//     if (callNow) func.apply(context, args);
//   };
// };


// export const debounce = (func, wait, immediate) => {
//   let timeout;
//   return (...args) => {
//     let context = this,
//       args = args;
//     const later = function () {
//       timeout = null;
//       if (!immediate) func.apply(context, args);
//     };
//     let callNow = immediate && !timeout;
//     clearTimeout(timeout);
//     timeout = setTimeout(later, wait);
//     if (callNow) func.apply(context, args);
//   };
// };

// export const debounce = (func, wait, immediate=false) => {
//   let timeout;
//   return (...args) => {
//       const later = () => {
//           timeout = null; // added this to set same behaviour as ES5
//           if (!immediate) func(...args); // this is called conditionally, just like in the ES5 version
//       };
//       const callNow = immediate && !timeout;
//       clearTimeout(timeout);
//       timeout = setTimeout(later, wait);
//       if (callNow) func(...args);
//   };
// };