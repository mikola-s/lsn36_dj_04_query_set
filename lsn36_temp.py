from blog.models import Comment

qs = Comment.objects.all()

print(qs, sep='\n')


qs = Comment.objects.filter(author__username='user1')


