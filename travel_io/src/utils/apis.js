const getAdmin = async() => {
    const response = await fetch('api/admin/');
    return await response.json();
}

const getHolidayPackages = async() => {
    const response = await fetch('api/holiday_package/');
    return await response.json();
}

const getUserInfo = async(username) => {
    const response = await fetch(`api/users/${username}`);
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

export {addUser, getHolidayPackages, getAdmin, getUserInfo};