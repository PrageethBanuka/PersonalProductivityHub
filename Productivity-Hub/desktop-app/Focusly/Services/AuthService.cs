using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Text.Json;
using Focusly.Models;
using System.Diagnostics;

namespace Focusly.Services
{
    public class AuthService
    {
        private readonly HttpClient _httpClient;
        private const string BaseUrl = "http://localhost:5001/auth";  // Replace with your machine's IP address

        public AuthService(HttpClient httpClient)
        {
            _httpClient = httpClient;
            _httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        }

        public async Task<string> LoginAsync(string email, string password)
        {
            try
            {
                var response = await _httpClient.PostAsJsonAsync($"{BaseUrl}/login", new { email, password });

                if (!response.IsSuccessStatusCode)
                {
                    Debug.WriteLine($"❌ Login failed. Status Code: {response.StatusCode}");
                    return null;
                }

                var jsonResponse = await response.Content.ReadAsStringAsync();
                Debug.WriteLine($"✅ API Response: {jsonResponse}");

                try
                {
                    var authResult = JsonSerializer.Deserialize<AuthResponse>(jsonResponse, new JsonSerializerOptions { PropertyNameCaseInsensitive = true });
                    return authResult?.Token;
                }
                catch (JsonException jsonEx)
                {
                    Debug.WriteLine($"❌ JSON Parsing Error: {jsonEx.Message}");
                    return null;
                }
            }
            catch (HttpRequestException httpEx)
            {
                Debug.WriteLine($"❌ HTTP Request Error: {httpEx.Message}");
                return null;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"❌ Unexpected Error: {ex.Message}");
                return null;
            }
        }
    }

    public class AuthResponse
    {
        public string Token { get; set; }
        public UserModel User { get; set; }
    }
}