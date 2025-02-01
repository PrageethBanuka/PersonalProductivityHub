using System.Net.Http.Headers;
using System.Net.Http.Json;
using Focusly.Models;

namespace Focusly.Services
{
    public class ApiService
    {
        private readonly HttpClient _httpClient;
        private const string BaseUrl = "http://localhost:5001";

        public ApiService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<List<TaskModel>> GetTasksAsync(string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            return await _httpClient.GetFromJsonAsync<List<TaskModel>>($"{BaseUrl}/tasks");
        }

        public async Task<List<HabitModel>> GetHabitsAsync(string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            return await _httpClient.GetFromJsonAsync<List<HabitModel>>($"{BaseUrl}/habits");
        }

        public async Task<bool> AddTaskAsync(TaskModel task, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.PostAsJsonAsync($"{BaseUrl}/tasks", task);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> AddHabitAsync(HabitModel habit, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.PostAsJsonAsync($"{BaseUrl}/habits", habit);
            return response.IsSuccessStatusCode;
        }
    }
}