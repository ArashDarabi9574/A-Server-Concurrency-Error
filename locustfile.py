from locust import HttpUser, task, between
import json

class MyUser(HttpUser):
    wait_time = between(1, 5) 

    @task
    def load_test(self):
        with open('request.json') as f:
            data = json.load(f)
            self.client.post("http://localhost:5223/get_sync_subs", json=data) 
