const apiUrl = `https://${process.env.GITHUB_API_URL}/api/http_trigger`;
async function fetchData() {
    try {
        const response = await fetch(apiUrl);
        const data = await response.json();
        // Update the HTML with the received data
        document.getElementById('visitorCount').textContent = data;
    } catch (error) {
        console.error('Error fetching data from the API:', error);
    }
}

window.onload = fetchData;