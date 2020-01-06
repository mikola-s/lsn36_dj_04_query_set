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
# filter(author__article__expression__expression_type__name='like')
