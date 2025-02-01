using System.Net.Http.Headers;
using System.Net.Http.Json;
using Focusly.Models;
using System.Text.Json;
using System.Diagnostics;

namespace Focusly.Services
{
    public class ApiService
    {
        private readonly HttpClient _httpClient;
        private const string BaseUrl = "http://localhost:5001/";

        public ApiService(HttpClient httpClient)
        {
            _httpClient = httpClient;
            _httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        }

        private void SetAuthorization(string token)
        {
            if (!string.IsNullOrEmpty(token))
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
        }

        public async Task<List<TaskModel>> GetTasksAsync(string token)
        {
            try
            {
                SetAuthorization(token);
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
                return response.IsSuccessStatusCode;
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
    }
}