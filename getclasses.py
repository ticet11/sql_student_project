import random

students = ['one', 'two', 'three', 'four', 'five']
classes = [
    {
        'id': 1,
        'teacher': 'one',
        'name': 'English'
    },
    {
        'id': 2,
        'teacher': 'one',
        'name': 'Math'
    },
    {
        'id': 3,
        'teacher': 'two',
        'name': 'Science'
    },
    {
        'id': 4,
        'teacher': 'two',
        'name': 'Gym'
    },
    {
        'id': 5,
        'teacher': 'three',
        'name': 'Music'
    },
    {
        'id': 6,
        'teacher': 'three',
        'name': 'English'
    },
    {
        'id': 7,
        'teacher': 'four',
        'name': 'Math'
    },
    {
        'id': 8,
        'teacher': 'four',
        'name': 'Science'
    },
    {
        'id': 9,
        'teacher': 'five',
        'name': 'Gym'
    },
    {
        'id': 10,
        'teacher': 'five',
        'name': 'Music'
    },
]


def classFinder(student, classes):
        class_list = []
        class_name = ''
        while (len(class_list) < 5):
            rand_num = random.randint(0, len(classes) - 1)
            class_list.append(classes[rand_num])
            class_name = classes[rand_num]['name']
            del classes[rand_num]

            def filter_class_names(class_item):
                if class_item['name'] != class_name:
                    return True
                else:
                    return False
            new_classes = filter(filter_class_names, classes)
            classes = []
            for class_item in new_classes:
                classes.append(class_item)

        return f'Student {student} has these classes:\n{class_list}'


print(classFinder(students[0], classes))
# print(classFinder(students[1], classes))
# print(classFinder(students[2], classes))
# print(classFinder(students[3], classes))
# print(classFinder(students[4], classes))
