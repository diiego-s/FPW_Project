const getAdmin = async() => {
    const response = await fetch('api/admin/');
    return await response.json();
}

export {getAdmin};