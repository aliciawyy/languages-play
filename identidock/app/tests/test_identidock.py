from unittest import TestCase
from .. import identidock


class IdentiDockTest(TestCase):
    def setUp(self):
        identidock.app.config["TESTING"] = True
        self.app = identidock.app.test_client()
