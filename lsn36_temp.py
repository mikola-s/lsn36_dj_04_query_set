from django.db import *
from blog.models import Comment, Author, Article
from django.db.models import Q, F, CheckConstraint
from django.utils import timezone
from django.utils.timezone import now
from datetime import timedelta


qs_all = Comment.objects.all().order_by('pk')
print(qs_all, sep='\n')

# task 01 01
qs = Comment.objects.all()

print(*qs, sep='\n')

# task 01 02
qs = Comment.objects.filter(author__username='user1')

# task 01 03

qs = Comment.objects.filter(author__article__expression__expression_type__name='like')

# task 01 04

qs = Comment.objects.exclude(author__article__expression__isnull=True)

# task 01 05

qs = Comment.objects.filter(author__article__expression__isnull=True)

# task 01 06

qs = Comment.objects.filter(pk__lte=3)

# task 01 07

qs = Comment.objects.filter(pk__gt=3).order_by('pk')

# task 01 08

qs = Comment.objects.filter(pk__range=[1, 3])

# task 01 09

qs = Comment.objects.filter(text__contains='user2')

# task 01 10

qs = Comment.objects.filter(target__author__username='irina').order_by('pk')


Comment.objects.create(author=Author.objects.get(username="irina"), text='one year before', target=Article.objects.get(pk=1))


qs = Comment.objects.get(pk=15).post_time.replace(year=2019)

# def save(self, **kwargs):
#     if not self.pk:
#         self.post_time = timezone.now() - timedelta(days=365)
#     super().save(**kwargs)


Comment.objects.create(
    author=Author.objects.get(username="irina"),
    text='one year before',
    target=Article.objects.get(pk=1)
)


start = Comment.objects.filter(text__contains='Start').update(text="Start is update")
middle = Comment.objects.filter(text__contains='Middle').update(text="Middle is update")
finish = Comment.objects.filter(text__contains='Finish').update(text="Finish is update")

qs = Comment.objects.filter(text__contains='k')
print(*qs, sep='\n')
qs = qs.exclude(text__contains='c')

qs = Comment.objects.order_by('target__author__username').last()

ar = Article.objects.order_by('author__username').last()

qs = Comment.objects.filter(target__author__username=Comment.objects.order_by('target__author__username').last())
qs = Comment.objects.order_by('target__author__username').filter(target__author__username=Comment.objects.order_by('target__author__username').last())

qs = Comment.objects.order_by('target__author__username').last()
qs.ta

last_author = Comment.objects.order_by('target__author__username').last().target.author.username
qs = Comment.objects.filter(target__author__username=last_author).order_by('post_time')[:2:]