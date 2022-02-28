import http from 'k6/http';

export const options = {
    scenarios: {
        constant_request_rate: {
            executor: 'constant-arrival-rate',
            rate: 250,
            duration: '5s',
            preAllocatedVUs: 10, // how large the initial pool of VUs would be
            maxVUs: 100, // if the preAllocatedVUs are not enough, we can initialize more
        },
    },
    tlsVersion: 'tls1.2',
};

export default function () {
    http.get(`http://${__ENV.HOSTNAME}/`);
}