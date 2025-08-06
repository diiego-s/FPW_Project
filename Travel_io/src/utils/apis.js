const getAdmin = async() => {
    const response = await fetch('api/admin/');
    return await response.json();
}

const addUser = async(username, password, name, surname, email, city, favcity) => {
    const response = await fetch('api/users/', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({username, password, name, surname, email, city, favcity}),
    });
    return await response.json();
}

export {addUser, getAdmin};