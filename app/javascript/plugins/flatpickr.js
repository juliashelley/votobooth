import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

flatpickr(".datepicker", {
  // enableTime: true,
  minDate: "today",
  disableMobile: "true",
  altInput: true,
  altFormat: "F j, Y",
  dateFormat: "Y-m-d",
  mode: "range",
})
