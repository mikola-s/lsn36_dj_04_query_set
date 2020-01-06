from django.db import *
from blog.models import Comment, Author, Article

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

qs = Comment.objects.filter(pk__range=[1,3])

# task 01 09

qs = Comment.objects.filter(text__contains='user2')

# task 01 10

qs = Comment.objects.filter(author__article__expression__isnull=True)


