#!/usr/bin/env python

import os

def get_text_file_contents_as_array (filename):
    f=open(filename,"r")
    ar=f.readlines()
    f.close()

    new_ar=[item.rstrip() for item in ar]
    return new_ar

# may be slow
def is_elem_last_in_list (lst, elem):
    return elem==lst[-1]

total=87

def save_list_as_HTML(f, v, names):
    for i in v:
        if is_elem_last_in_list(v, i):
            sep="."
        else:
            sep="; "
        if i in names:
            name=" ("+names[i]+")"
        else:
            name=""
        f.write ("<a href=\""+str(i)+"\">"+str(i)+name+"</a>"+sep)

def save_tag (lst, t, names):
    f=open(t+".html", "w")
    save_list_as_HTML(f, lst, names)
    f.close()

def add_tags_bar_in_dir(n, tags):
    s=""
    for tag in tags:
        s=s+"<a href=\"https://challenges.re/#tag_"+tag+"\">"+tag+"</a> "
    f=open(str(n)+"/tags.html", "w")
    f.write(s)
    f.close()

tags=["CLR", "JVM", "X86", "X64", "MIPS", "ARM", "ARM64", "SSE", "FPU", "L1", "L2", "L3", "ASM", "EXEC",
        "WINDOWS", "LINUX", "MACOSX", "RASPBERRY", "CRYPTO", "CRACKME"]

lists={}

ALL=[]

names={}

for i in range(total):
    n=i+1
    ALL.append(n)
    ls=os.listdir(str(n))
    tags_for_exercise=[]
    for f in ls:
        if f in tags:
            if f not in lists:
                lists[f]=[]
            lists[f].append(n)
            tags_for_exercise.append(f)
        if f=="NAME":
            names[n]="".join(get_text_file_contents_as_array(str(n)+"/"+f))
    add_tags_bar_in_dir (n, tags_for_exercise)

for tag in lists:
    print tag, lists[tag]
    save_tag (lists[tag], tag, names)

save_tag (ALL, "ALL", names)

