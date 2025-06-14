// Custom function to show alerts
function showCustomAlert(message, type = 'info') {
    const alertDiv = document.createElement('div');
    alertDiv.classList.add('custom-alert');
    alertDiv.classList.add(`alert-${type}`);
    alertDiv.textContent = message;
  
    // Append the alert to the body
    document.body.appendChild(alertDiv);
  
    // Make the alert visible
    setTimeout(() => {
      alertDiv.classList.add('show');
    }, 10);
  
    // Hide the alert after 3 seconds
    setTimeout(() => {
      alertDiv.classList.remove('show');
      // Remove alert after fade-out
      setTimeout(() => {
        alertDiv.remove();
      }, 500);
    }, 3000);
  }
  
  // Override the default window.alert() to use showCustomAlert
  window.alert = function(message) {
    showCustomAlert(message, 'info');  // You can customize the default alert type
  };