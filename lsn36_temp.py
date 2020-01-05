from blog.models import Comment

qs = Comment.objects.all()

print(qs, sep='\n')

