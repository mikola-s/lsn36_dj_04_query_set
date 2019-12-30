from django.db import models
from django.contrib.auth.models import AbstractUser


class Author(AbstractUser):
    birth_date = models.DateField(null=True, blank=True)
    create_date_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.get_username()


class Article(models.Model):
    text = models.TextField(max_length=2048)
    title = models.CharField(max_length=256)
    post_time = models.DateTimeField(auto_now_add=True)
    author = models.ForeignKey(Author, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.author}/{self.title}"


class Comment(models.Model):
    pass
    # author = models.ForeignKey(Author, on_delete=models.CASCADE)
    # text = models.TextField(max_length=1024)
    # target = models.ForeignKey(Article, on_delete=models.CASCADE)
    # comment


class Expression(models.Model):
    pass


class ExpressionType(models.Model):
    pass
