const dispatcher = document.getElementById('dispatcher');
const closeButton = document.getElementById('closeButton');

function openDispatcher() {
    dispatcher.classList.remove('hidden');
}

function closeDispatcher() {
    dispatcher.classList.add('hidden');
}

window.addEventListener('message', (event) => {
    const data = event.data;

    if (data.action === 'openDispatcher') {
        openDispatcher();
    }

    if (data.action === 'closeDispatcher') {
        closeDispatcher();
    }
});

closeButton.addEventListener('click', () => {
    fetch(`https://${GetParentResourceName()}/closeDispatcher`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
});

document.addEventListener('keydown', (event) => {
    if (event.key !== 'Escape') {
        return;
    }

    fetch(`https://${GetParentResourceName()}/closeDispatcher`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
});