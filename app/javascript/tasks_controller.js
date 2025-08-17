document.addEventListener("ajax:success", function(event) {
  const [data, status, xhr] = event.detail;
  const taskDiv = document.getElementById(`task_${data.id}`);
  if (taskDiv) taskDiv.remove();
});
