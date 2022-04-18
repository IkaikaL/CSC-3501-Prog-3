.global check_cache

check_cache:
        pushl   %ebp ## begin function by initializing cache and addr
        movl    %esp, %ebp ## begin function by initializing cache and addr
        subl    $20, %esp ## begin function by initializing cache and addr
        movl    12(%ebp), %eax ## begin function by initializing cache and addr
        movb    %al, -20(%ebp) ## begin function by initializing cache and addr
        movzbl  -20(%ebp), %eax ## get offset value using the and operator
        andl    $3, %eax ## get offset value using the and operator
        movb    %al, -1(%ebp) ## get offset value using the and operator
        movzbl  -20(%ebp), %eax ## remove offset value from the addr to get index by shifting to the  right by 2
        shrb    $2, %al ## remove offset value from the addr to get index by shifting to the  right by 2
        movb    %al, -2(%ebp) ## remove offset value from the addr to get index by shifting to the  right by 2
        andb    $3, -2(%ebp) ## get index by comparing to 3 with the and operator
        movzbl  -20(%ebp), %eax ## remove index value from the addr to get the tag by shifting to the  right by 2
        shrb    $2, %al ## remove index value from the addr to get the tag by shifting to the  right by 2
        movb    %al, -3(%ebp) ## remove index value from the addr to get the tag by shifting to the  right by 2
        movzbl  -2(%ebp), %edx ## set new offsett as index * 6
        movl    %edx, %eax ## set new offsett as index * 6
        addl    %eax, %eax ## set new offsett as index * 6
        addl    %edx, %eax ## set new offsett as index * 6
        addl    %eax, %eax ## set new offsett as index * 6
        movb    %al, -4(%ebp) ## set new offsett as index * 6
		movl 8(%ebp), %eax ## move to starting address of cache
		addl offset, %eax ## add new offset to cache
		movl (%eax), %edx ## move eax to edx
        movzbl  -2(%ebp), %edx ## check if cache[index] is equal to 0
        movl    %edx, %eax ## check if cache[index].valid is equal to 0
        addl    %eax, %eax ## check if cache[index].valid is equal to 0
        addl    %edx, %eax ## check if cache[index].valid is equal to 0
        addl    %eax, %eax ## check if cache[index].valid is equal to 0
        movl    %eax, %edx ## check if cache[index].valid is equal to 0
        movl    8(%ebp), %eax ## check if cache[index].valid is equal to 0
        addl    %edx, %eax ## check if cache[index].valid is equal to 0
        movzbl  (%eax), %eax ## check if cache[index].valid is equal to 0
        testb   %al, %al ## check if cache[index].valid is equal to 0
        jne     check_tag ## check if cache[index].valid is equal to 0
        movl    $-1, %eax ## return 0xFF if cache[index].valid is equal to 0
        jmp     end ## return 0xFF if cache[index].valid is equal to 0
check_tag:
        movzbl  -2(%ebp), %edx ## check if cache[index].tag is equal to tag
        movl    %edx, %eax ## check if cache[index].tag is equal to tag
        addl    %eax, %eax ## check if cache[index].tag is equal to tag
        addl    %edx, %eax ## check if cache[index].tag is equal to tag
        addl    %eax, %eax ## check if cache[index].tag is equal to tag
        movl    %eax, %edx ## check if cache[index].tag is equal to tag
        movl    8(%ebp), %eax ## check if cache[index].tag is equal to tag
        addl    %edx, %eax ## check if cache[index].tag is equal to tag
        movzbl  1(%eax), %eax ## check if cache[index].tag is equal to tag
        movsbl  %al, %edx ## check if cache[index].tag is equal to tag
        movzbl  -3(%ebp), %eax ## check if cache[index].tag is equal to tag
        cmpl    %eax, %edx ## check if cache[index].tag is equal to tag
        je      return_info ## check if cache[index].tag is equal to tag
        movl    $-1, %eax ## return 0xFF if cache[index].tag is not equal to found tag value
        jmp     end ## return 0xFF if cache[index].tag is not equal to found tag value
return_info:
        movzbl  -2(%ebp), %edx ## return cache[index].block[offset] if values are found in cache
        movl    %edx, %eax ## return cache[index].block[offset] if values are found in cache
        addl    %eax, %eax ## return cache[index].block[offset] if values are found in cache
        addl    %edx, %eax ## return cache[index].block[offset] if values are found in cache
        addl    %eax, %eax ## return cache[index].block[offset] if values are found in cache
        movl    %eax, %edx ## return cache[index].block[offset] if values are found in cache
        movl    8(%ebp), %eax ## return cache[index].block[offset] if values are found in cache
        addl    %eax, %edx ## return cache[index].block[offset] if values are found in cache
        movzbl  -1(%ebp), %eax ## return cache[index].block[offset] if values are found in cache
        movzbl  2(%edx,%eax), %eax ## return cache[index].block[offset] if values are found in cache
end:
        leave ## end function
        ret ## end function