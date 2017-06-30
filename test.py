import hashlib
str='123456'
m = hashlib.md5()
m.update(str)
print m.hexdigest()