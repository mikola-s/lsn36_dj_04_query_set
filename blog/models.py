from django.db import models
from django.db.models import Q, CheckConstraint
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
    author = models.ForeignKey(to=Author, on_delete=models.CASCADE)
    text = models.TextField(max_length=1024)
    target = models.ForeignKey(to=Article, on_delete=models.CASCADE)
    comment = models.ForeignKey(
        to='blog.Comment',
        on_delete=models.CASCADE,
        related_name='comments',
        null=True,
        blank=True,
    )

    @staticmethod
    def short_comment(text: str):
        return text if len(text) < 40 else f"{text[:21]}..."

    def __str__(self):
        comment_from = f"COMMENT ({self.author}/{self.short_comment(self.text)}) "
        if self.comment is not None:
            comment_to_comment = f"TO ({self.comment.author}/{self.short_comment(self.comment.text)}) "
        else:
            comment_to_comment = " "
        comment_to_article = f"TO ({self.target.author}/{self.target.title})"
        return f"{comment_from}{comment_to_comment}{comment_to_article}"


class ExpressionType(models.Model):
    name = models.CharField(max_length=20)

    def __str__(self):
        return self.name


class Expression(models.Model):
    expression_type = models.ForeignKey(
        to=ExpressionType,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
    )
    author = models.ForeignKey(
        to=Author,
        on_delete=models.CASCADE,
    )
    comment = models.ForeignKey(
        to=Comment,
        on_delete=models.CASCADE,
        null=True,
        blank=True,
    )
    article = models.ForeignKey(
        to=Article,
        on_delete=models.CASCADE,
        null=True,
        blank=True,
    )

    class Meta:
        unique_together = ['author', 'comment', 'article']
        constraints = [
            CheckConstraint(
                check=Q(comment__isnull=True) & Q(article__isnull=False) |
                      Q(comment__isnull=False) & Q(article__isnull=True),
                name='check_expression_target',
            ),
        ]
