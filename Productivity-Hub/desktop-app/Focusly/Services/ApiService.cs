using System.Net.Http.Headers;
using System.Net.Http.Json;
using Focusly.Models;
using System.Text.Json;
using System.Diagnostics;
using Newtonsoft.Json;

namespace Focusly.Services
{
    public class ApiService
    {
        private readonly HttpClient _httpClient;
        private const string BaseUrl = "http://localhost:5001";

        public ApiService(HttpClient httpClient)
        {
            _httpClient = httpClient;
            _httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        }

        private void SetAuthorization(string token)
        {

            // Debug.WriteLine($"Bearer Token: {token}");
            if (!string.IsNullOrEmpty(token))
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            else
                _httpClient.DefaultRequestHeaders.Authorization = null;
        }
        public async Task<UserModel?> GetCurrentUserAsync(string token)
        {
            Debug.WriteLine("getting_currentUser");
            try
            {
                SetAuthorization(token);
                var user = await _httpClient.GetFromJsonAsync<UserModel>($"{BaseUrl}/auth/me");
                return user;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"❌ Error fetching user: {ex.Message}");
                return null;
            }
        }
        public async Task<bool> UpdateTaskAsync(TaskModel task, string token)
        {
            try
            {
                SetAuthorization(token); // Set the token in headers

                // Log the request body for debugging
                var taskJson = JsonConvert.SerializeObject(task);
                Debug.WriteLine($"Sending task to update: {taskJson}");

                var response = await _httpClient.PutAsJsonAsync($"{BaseUrl}/tasks/{task.Id}", task);

                // Log response status and content for debugging
                var responseContent = await response.Content.ReadAsStringAsync();
                Debug.WriteLine($"API Response Status: {response.StatusCode}");
                Debug.WriteLine($"API Response Content: {responseContent}");

                if (response.IsSuccessStatusCode)
                {
                    Debug.WriteLine($"✅ Task '{task.Text}' updated successfully.");
                    return true;
                }
                else
                {
                    Debug.WriteLine($"❌ Failed to update task. Status Code: {response.StatusCode}");
                    return false;
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"❌ Exception while updating task: {ex.Message}");
                return false;
            }
        }

        public async Task<List<TaskModel>> GetTasksAsync(string token)
        {
            try
            {
                SetAuthorization(token);
                // Debug.WriteLine($"Saved token: {token}");
                return await _httpClient.GetFromJsonAsync<List<TaskModel>>($"{BaseUrl}/tasks") ?? new List<TaskModel>();
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"❌ Error fetching tasks: {ex.Message}");
                return new List<TaskModel>();
            }
        }

        public async Task<List<HabitModel>> GetHabitsAsync(string token)
        {
            try
            {
                SetAuthorization(token);
                return await _httpClient.GetFromJsonAsync<List<HabitModel>>($"{BaseUrl}/habits") ?? new List<HabitModel>();
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"❌ Error fetching habits: {ex.Message}");
                return new List<HabitModel>();
            }
        }

        public async Task<bool> AddTaskAsync(TaskModel task, string token)
        {
            try
            {
                SetAuthorization(token);
                var response = await _httpClient.PostAsJsonAsync($"{BaseUrl}/tasks", task);
                Debug.WriteLine($"API Response Status: {response.StatusCode}");

                if (response.IsSuccessStatusCode)
                {
                    var createdTask = await response.Content.ReadFromJsonAsync<TaskModel>();
                    task.Id = createdTask.Id; // 🔥 Get the correct ID from backend
                    Debug.WriteLine($"✅ Task Created with ID: {task.Id}");
                    return true;
                }
                else
                {
                    Debug.WriteLine("❌ Task not added");
                    return false;
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"❌ Error adding task: {ex.Message}");
                return false;
            }
        }

        public async Task<bool> AddHabitAsync(HabitModel habit, string token)
        {
            try
            {
                SetAuthorization(token);
                var response = await _httpClient.PostAsJsonAsync($"{BaseUrl}/habits", habit);
                return response.IsSuccessStatusCode;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"❌ Error adding habit: {ex.Message}");
                return false;
            }
        }
        public async Task<bool> DeleteTaskAsync(TaskModel task, string token)
        {
            try
            {
                // Ensure your API base address is set
                var request = new HttpRequestMessage(HttpMethod.Delete, $"{BaseUrl}/tasks/{task.Id}")  // Replace with the correct relative URI
                {
                    Headers =
            {
                Authorization = new AuthenticationHeaderValue("Bearer", token)  // Attach the token for authentication
            }
                };

                var response = await _httpClient.SendAsync(request);  // Send the delete request
                if (response.IsSuccessStatusCode)
                {
                    // Task deleted successfully
                    return true;
                }
                else
                {
                    // Something went wrong
                    Debug.WriteLine($"❌ Failed to delete task. Status Code: {response.StatusCode}");
                    return false;
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions that may occur
                Debug.WriteLine($"❌ Error deleting task: {ex.Message}");
                return false;
            }
        }
        public async Task<bool> DeleteHabitAsync(HabitModel habit, string token)
        {
            try
            {
                // Ensure your API base address is set
                var request = new HttpRequestMessage(HttpMethod.Delete, $"{BaseUrl}/habits/{habit.Id}")  // Replace with the correct relative URI
                {
                    Headers =
            {
                Authorization = new AuthenticationHeaderValue("Bearer", token)  // Attach the token for authentication
            }
                };

                var response = await _httpClient.SendAsync(request);  // Send the delete request
                if (response.IsSuccessStatusCode)
                {
                    // Task deleted successfully
                    return true;
                }
                else
                {
                    // Something went wrong
                    Debug.WriteLine($"❌ Failed to delete habit. Status Code: {response.StatusCode}");
                    return false;
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions that may occur
                Debug.WriteLine($"❌ Error deleting habit: {ex.Message}");
                return false;
            }
        }
        public async Task<bool> UpdateHabitAsync(HabitModel habit, string token)
        {
            Debug.WriteLine($"Sending Habit Update Request for {habit.Text}");
            try
            {
                SetAuthorization(token);

                var habitJson = JsonConvert.SerializeObject(habit);
                Debug.WriteLine($"Request JSON: {habitJson}");

                var response = await _httpClient.PutAsJsonAsync($"{BaseUrl}/habits/{habit.Id}", habit);

                var responseContent = await response.Content.ReadAsStringAsync();
                Debug.WriteLine($"API Response: {response.StatusCode}, {responseContent}");

                return response.IsSuccessStatusCode;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"❌ API Exception: {ex.Message}");
                return false;
            }
        }
    }
}