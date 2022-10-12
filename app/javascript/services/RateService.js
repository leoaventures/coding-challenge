export async function getAllRates() {

    const response = await fetch('/api/rates');
    return await response.json();
}

export async function updateRate(rate) {
    const response = await fetch(`/api/rates/${rate.id}`, {
        method: 'PUT',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({rate: rate})
      })
    return await response.json();
}