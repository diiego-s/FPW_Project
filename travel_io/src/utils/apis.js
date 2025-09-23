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

const addUser = async(username, password, name, surname, email, city, favcity, age) => {
    const response = await fetch('api/users/', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({username, password, name, surname, email, city, favcity, age}),
    });
    return await response.json();
}

const addHolidayPackage = async(destination, price, departure, info, days) => {
    const response = await fetch('api/holiday_package/', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({destination, price, departure, info, days}),
    });
    return await response.json();
}

export {addUser, getHolidayPackages, getAdmin, getUserInfo, addHolidayPackage};