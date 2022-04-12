	.file	"main.c"
	.text
	.type	bsW, @function
bsW:
.LFB49:
	.cfi_startproc
.L2:
	movl	644(%rdi), %eax
	movl	640(%rdi), %r8d
	cmpl	$7, %eax
	jle	.L5
	movslq	116(%rdi), %rax
	movq	80(%rdi), %rcx
	shrl	$24, %r8d
	movb	%r8b, (%rcx,%rax)
	incl	116(%rdi)
	subl	$8, 644(%rdi)
	sall	$8, 640(%rdi)
	jmp	.L2
.L5:
	movl	$32, %ecx
	subl	%eax, %ecx
	addl	%esi, %eax
	subl	%esi, %ecx
	movl	%eax, 644(%rdi)
	sall	%cl, %edx
	orl	%r8d, %edx
	movl	%edx, 640(%rdi)
	ret
	.cfi_endproc
.LFE49:
	.size	bsW, .-bsW
	.type	bsPutUInt32, @function
bsPutUInt32:
.LFB50:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%esi, %edx
	movl	%esi, %ebx
	movl	$8, %esi
	shrl	$24, %edx
	call	bsW
	movl	%ebx, %edx
	movl	$8, %esi
	shrl	$16, %edx
	movzbl	%dl, %edx
	call	bsW
	movzbl	%bh, %edx
	movl	$8, %esi
	call	bsW
	movzbl	%bl, %edx
	movl	$8, %esi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	bsW
	.cfi_endproc
.LFE50:
	.size	bsPutUInt32, .-bsPutUInt32
	.type	bsPutUChar, @function
bsPutUChar:
.LFB51:
	.cfi_startproc
	movzbl	%sil, %edx
	movl	$8, %esi
	jmp	bsW
	.cfi_endproc
.LFE51:
	.size	bsPutUChar, .-bsPutUChar
	.type	add_pair_to_block, @function
add_pair_to_block:
.LFB66:
	.cfi_startproc
	movl	92(%rdi), %eax
	movl	96(%rdi), %edx
	xorl	%r8d, %r8d
	leaq	BZ2_crc32Table(%rip), %r9
	movzbl	%al, %r10d
.L10:
	cmpl	%r8d, %edx
	jle	.L18
	movl	648(%rdi), %ecx
	incl	%r8d
	movl	%ecx, %esi
	sall	$8, %ecx
	shrl	$24, %esi
	xorl	%r10d, %esi
	xorl	(%r9,%rsi,4), %ecx
	movl	%ecx, 648(%rdi)
	jmp	.L10
.L18:
	movl	%eax, %ecx
	movb	$1, 128(%rdi,%rcx)
	movslq	108(%rdi), %rcx
	addq	64(%rdi), %rcx
	cmpl	$2, %edx
	je	.L12
	cmpl	$3, %edx
	je	.L13
	cmpl	$1, %edx
	jne	.L14
	movb	%al, (%rcx)
	jmp	.L16
.L12:
	movb	%al, (%rcx)
	jmp	.L17
.L13:
	movb	%al, (%rcx)
	movl	108(%rdi), %esi
	movq	64(%rdi), %rcx
	leal	1(%rsi), %edx
	movl	%edx, 108(%rdi)
	movslq	%edx, %rdx
	movb	%al, (%rcx,%rdx)
.L17:
	movl	108(%rdi), %esi
	movq	64(%rdi), %rcx
	leal	1(%rsi), %edx
	movl	%edx, 108(%rdi)
	movslq	%edx, %rdx
	movb	%al, (%rcx,%rdx)
	jmp	.L16
.L14:
	subl	$4, %edx
	movslq	%edx, %rdx
	movb	$1, 128(%rdi,%rdx)
	movb	%al, (%rcx)
	movl	108(%rdi), %esi
	movq	64(%rdi), %rcx
	leal	1(%rsi), %edx
	movl	%edx, 108(%rdi)
	movslq	%edx, %rdx
	movb	%al, (%rcx,%rdx)
	movl	108(%rdi), %esi
	movq	64(%rdi), %rcx
	leal	1(%rsi), %edx
	movl	%edx, 108(%rdi)
	movslq	%edx, %rdx
	movb	%al, (%rcx,%rdx)
	movl	108(%rdi), %esi
	movq	64(%rdi), %rcx
	leal	1(%rsi), %edx
	movl	%edx, 108(%rdi)
	movslq	%edx, %rdx
	movb	%al, (%rcx,%rdx)
	movl	108(%rdi), %eax
	movb	96(%rdi), %sil
	movq	64(%rdi), %rcx
	incl	%eax
	movl	%eax, 108(%rdi)
	leal	-4(%rsi), %edx
	cltq
	movb	%dl, (%rcx,%rax)
.L16:
	incl	108(%rdi)
	ret
	.cfi_endproc
.LFE66:
	.size	add_pair_to_block, .-add_pair_to_block
	.type	setExit, @function
setExit:
.LFB120:
	.cfi_startproc
	cmpl	%edi, exitValue(%rip)
	jge	.L19
	movl	%edi, exitValue(%rip)
.L19:
	ret
	.cfi_endproc
.LFE120:
	.size	setExit, .-setExit
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s: %s is redundant in versions 0.9.5 and above\n"
	.text
	.type	redundant, @function
redundant:
.LFB148:
	.cfi_startproc
	movq	%rdi, %r8
	movq	progName(%rip), %rcx
	movl	$1, %esi
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	leaq	.LC0(%rip), %rdx
	jmp	__fprintf_chk@PLT
	.cfi_endproc
.LFE148:
	.size	redundant, .-redundant
	.section	.rodata.str1.1
.LC1:
	.string	"1.0.2, 30-Dec-2001"
.LC2:
	.ascii	"bzip2, a block-sorting file compressor.  Version %s.\n   \n "
	.ascii	"  Copyright (C) 1996-2002 by Julian Seward.\n   \n   This pr"
	.ascii	"ogram is free software; you can redistribute it and/or modif"
	.ascii	"y\n   it under the terms set out in the LICENSE file, which "
	.ascii	"is included\n   in the bzip2-1.0 sourc"
	.string	"e distribution.\n   \n   This program is distributed in the hope that it will be useful,\n   but WITHOUT ANY WARRANTY; without even the implied warranty of\n   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n   LICENSE file for more details.\n   \n"
	.text
	.type	license, @function
license:
.LFB146:
	.cfi_startproc
	movq	stderr(%rip), %rdi
	leaq	.LC1(%rip), %rcx
	leaq	.LC2(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	jmp	__fprintf_chk@PLT
	.cfi_endproc
.LFE146:
	.size	license, .-license
	.section	.rodata.str1.1
.LC3:
	.ascii	"bzip2, a block-sorting file compressor.  Version %s.\n\n   u"
	.ascii	"sage: %s [flags and input files in any order]\n\n   -h --hel"
	.ascii	"p           print this message\n   -d --decompress     force"
	.ascii	" decompression\n   -z --compress       force compression\n  "
	.ascii	" -k --keep           keep (don't delete) input files\n   -f "
	.ascii	"--force          overwrite existing output files\n   -t --te"
	.ascii	"st           test compressed file integrity\n   -c --stdout "
	.ascii	"        output to standard out\n   -q --quiet          suppr"
	.ascii	"ess noncritical error messages\n   -v --verbose        be ve"
	.ascii	"rbose (a 2nd -v gives more)\n   -L --license        display "
	.ascii	"software version & license\n   -V --version        display s"
	.ascii	"oftware version & license\n   -s --small          use less m"
	.ascii	"emory (at most 2500k)\n   -1 .. -9            set block size"
	.ascii	" to 100k .. 900k\n   --fast              alias for -1\n   --"
	.ascii	"best              alias for -9\n\n   If invoked as `bzip2', "
	.ascii	"default action is to compress.\n              as `bunzip2', "
	.ascii	" default action is to decompress.\n"
	.string	"              as `bzcat', default action is to decompress to stdout.\n\n   If no file names are given, bzip2 compresses or decompresses\n   from standard input to standard output.  You can combine\n   short flags, so `-v -4' means the same as -v4 or -4v, &c.\n\n"
	.text
	.type	usage, @function
usage:
.LFB147:
	.cfi_startproc
	movq	%rdi, %r8
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rcx
	leaq	.LC3(%rip), %rdx
	jmp	__fprintf_chk@PLT
	.cfi_endproc
.LFE147:
	.size	usage, .-usage
	.section	.rodata.str1.1
.LC4:
	.string	"bzip2: I'm not configured correctly for this platform!\n\tI require Int32, Int16 and Char to have sizes\n\tof 4, 2 and 1 bytes to run properly, and they don't.\n\tProbably you can fix this by defining them correctly,\n\tand recompiling.  Bye!\n"
	.text
	.type	configError, @function
configError:
.LFB131:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	leaq	.LC4(%rip), %rdi
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	stderr(%rip), %rsi
	call	fputs@PLT
	movl	$3, %edi
	call	setExit
	movl	exitValue(%rip), %edi
	call	exit@PLT
	.cfi_endproc
.LFE131:
	.size	configError, .-configError
	.type	default_bzfree, @function
default_bzfree:
.LFB61:
	.cfi_startproc
	endbr64
	movq	%rsi, %rdi
	testq	%rsi, %rsi
	je	.L26
	jmp	free@PLT
.L26:
	ret
	.cfi_endproc
.LFE61:
	.size	default_bzfree, .-default_bzfree
	.type	default_bzalloc, @function
default_bzalloc:
.LFB60:
	.cfi_startproc
	endbr64
	imull	%edx, %esi
	movslq	%esi, %rdi
	jmp	malloc@PLT
	.cfi_endproc
.LFE60:
	.size	default_bzalloc, .-default_bzalloc
	.type	myfeof, @function
myfeof:
.LFB79:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	call	fgetc@PLT
	movl	%eax, %edi
	movb	$1, %al
	cmpl	$-1, %edi
	je	.L29
	movq	%rbp, %rsi
	call	ungetc@PLT
	xorl	%eax, %eax
.L29:
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE79:
	.size	myfeof, .-myfeof
	.section	.rodata.str1.1
.LC5:
	.string	"rb"
	.text
	.type	fileExists, @function
fileExists:
.LFB134:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	.LC5(%rip), %rsi
	call	fopen@PLT
	testq	%rax, %rax
	setne	%r12b
	je	.L34
	movq	%rax, %rdi
	call	fclose@PLT
.L34:
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE134:
	.size	fileExists, .-fileExists
	.type	hasSuffix, @function
hasSuffix:
.LFB141:
	.cfi_startproc
	orq	$-1, %r9
	xorl	%eax, %eax
	movq	%rdi, %r8
	movq	%r9, %rcx
	repnz scasb
	movq	%rsi, %rdi
	notq	%rcx
	leaq	-1(%rcx), %rdx
	movq	%r9, %rcx
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	decq	%rax
	cmpl	%eax, %edx
	jl	.L43
	cltq
	movslq	%edx, %rdx
	pushq	%rcx
	.cfi_def_cfa_offset 16
	subq	%rax, %rdx
	leaq	(%r8,%rdx), %rdi
	call	strcmp@PLT
	popq	%rsi
	.cfi_def_cfa_offset 8
	testl	%eax, %eax
	sete	%r9b
	movl	%r9d, %eax
	ret
.L43:
	xorl	%r9d, %r9d
	movl	%r9d, %eax
	ret
	.cfi_endproc
.LFE141:
	.size	hasSuffix, .-hasSuffix
	.section	.rodata.str1.1
.LC6:
	.string	"%s: Deleting output file %s, if it exists.\n"
.LC7:
	.string	"%s: WARNING: deletion of output file (apparently) failed.\n"
.LC8:
	.string	"%s: WARNING: deletion of output file suppressed\n"
.LC9:
	.string	"%s:    since input file no longer exists.  Output file\n"
.LC10:
	.string	"%s:    `%s' may be incomplete.\n"
.LC11:
	.string	"%s:    I suggest doing an integrity test (bzip2 -tv) of it.\n"
.LC12:
	.string	"%s: WARNING: some files have not been processed:\n%s:    %d specified on command line, %d not processed yet.\n\n"
	.text
	.type	cleanUpAndFail, @function
cleanUpAndFail:
.LFB123:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%edi, %ebp
	subq	$160, %rsp
	.cfi_def_cfa_offset 176
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	cmpl	$3, srcMode(%rip)
	jne	.L50
	cmpl	$3, opMode(%rip)
	je	.L50
	cmpb	$0, deleteOutputOnInterrupt(%rip)
	je	.L50
	leaq	8(%rsp), %rsi
	leaq	inName(%rip), %rdi
	call	stat@PLT
	testl	%eax, %eax
	jne	.L52
	cmpb	$0, noisy(%rip)
	je	.L53
	movq	progName(%rip), %rcx
	movq	stderr(%rip), %rdi
	leaq	outName(%rip), %r8
	leaq	.LC6(%rip), %rdx
	movl	$1, %esi
	call	__fprintf_chk@PLT
.L53:
	movq	outputHandleJustInCase(%rip), %rdi
	testq	%rdi, %rdi
	je	.L54
	call	fclose@PLT
.L54:
	leaq	outName(%rip), %rdi
	call	remove@PLT
	movq	progName(%rip), %rcx
	leaq	.LC7(%rip), %rdx
	testl	%eax, %eax
	je	.L50
	jmp	.L64
.L52:
	movq	progName(%rip), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC8(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movq	progName(%rip), %rcx
	movl	$1, %esi
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	leaq	.LC9(%rip), %rdx
	call	__fprintf_chk@PLT
	movq	progName(%rip), %rcx
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	leaq	.LC10(%rip), %rdx
	leaq	outName(%rip), %r8
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movq	progName(%rip), %rcx
	leaq	.LC11(%rip), %rdx
.L64:
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
.L50:
	cmpb	$0, noisy(%rip)
	je	.L55
	movl	numFileNames(%rip), %r9d
	testl	%r9d, %r9d
	jle	.L55
	movl	numFilesProcessed(%rip), %eax
	cmpl	%eax, %r9d
	jle	.L55
	pushq	%rdx
	.cfi_def_cfa_offset 184
	movl	%r9d, %edx
	movl	$1, %esi
	movq	progName(%rip), %rcx
	subl	%eax, %edx
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	pushq	%rdx
	.cfi_def_cfa_offset 192
	movq	%rcx, %r8
	leaq	.LC12(%rip), %rdx
	call	__fprintf_chk@PLT
	popq	%rcx
	.cfi_def_cfa_offset 184
	popq	%rsi
	.cfi_def_cfa_offset 176
.L55:
	movl	%ebp, %edi
	call	setExit
	movl	exitValue(%rip), %edi
	call	exit@PLT
	.cfi_endproc
.LFE123:
	.size	cleanUpAndFail, .-cleanUpAndFail
	.section	.rodata.str1.1
.LC13:
	.string	"\n%s: Control-C or similar caught, quitting.\n"
	.text
	.type	mySignalCatcher, @function
mySignalCatcher:
.LFB128:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	leaq	.LC13(%rip), %rdx
	movl	$1, %esi
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	movq	progName(%rip), %rcx
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	cleanUpAndFail
	.cfi_endproc
.LFE128:
	.size	mySignalCatcher, .-mySignalCatcher
	.type	mainGtU, @function
mainGtU:
.LFB38:
	.cfi_startproc
	movl	%esi, %eax
	movl	%edi, %r10d
	movb	(%rdx,%rax), %al
	cmpb	%al, (%rdx,%r10)
	jne	.L105
	leal	1(%rsi), %r10d
	leal	1(%rdi), %eax
	movb	(%rdx,%r10), %r11b
	cmpb	%r11b, (%rdx,%rax)
	jne	.L105
	leal	2(%rsi), %r10d
	leal	2(%rdi), %eax
	movb	(%rdx,%r10), %r11b
	cmpb	%r11b, (%rdx,%rax)
	jne	.L105
	leal	3(%rsi), %r10d
	leal	3(%rdi), %eax
	movb	(%rdx,%r10), %r11b
	cmpb	%r11b, (%rdx,%rax)
	jne	.L105
	leal	4(%rsi), %r10d
	leal	4(%rdi), %eax
	movb	(%rdx,%r10), %r11b
	cmpb	%r11b, (%rdx,%rax)
	jne	.L105
	leal	5(%rsi), %r10d
	leal	5(%rdi), %eax
	movb	(%rdx,%r10), %r11b
	cmpb	%r11b, (%rdx,%rax)
	jne	.L105
	leal	6(%rsi), %r10d
	leal	6(%rdi), %eax
	movb	(%rdx,%r10), %r11b
	cmpb	%r11b, (%rdx,%rax)
	jne	.L105
	leal	7(%rsi), %r10d
	leal	7(%rdi), %eax
	movb	(%rdx,%r10), %r11b
	cmpb	%r11b, (%rdx,%rax)
	jne	.L105
	leal	8(%rsi), %r10d
	leal	8(%rdi), %eax
	movb	(%rdx,%r10), %r11b
	cmpb	%r11b, (%rdx,%rax)
	jne	.L105
	leal	9(%rsi), %r10d
	leal	9(%rdi), %eax
	movb	(%rdx,%r10), %r11b
	cmpb	%r11b, (%rdx,%rax)
	jne	.L105
	leal	10(%rsi), %r10d
	leal	10(%rdi), %eax
	movb	(%rdx,%r10), %r11b
	cmpb	%r11b, (%rdx,%rax)
	jne	.L105
	leal	11(%rsi), %r10d
	leal	11(%rdi), %eax
	movb	(%rdx,%r10), %r11b
	cmpb	%r11b, (%rdx,%rax)
	je	.L80
.L105:
	seta	%al
	ret
.L80:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	addl	$12, %edi
	addl	$12, %esi
	leal	8(%r8), %eax
.L99:
	movl	%esi, %r10d
	movl	%edi, %r11d
	movb	(%rdx,%r10), %bl
	cmpb	%bl, (%rdx,%r11)
	jne	.L104
	movw	(%rcx,%r10,2), %bx
	cmpw	%bx, (%rcx,%r11,2)
	jne	.L104
	leal	1(%rsi), %r10d
	leal	1(%rdi), %r11d
	movb	(%rdx,%r10), %bl
	cmpb	%bl, (%rdx,%r11)
	jne	.L104
	movw	(%rcx,%r10,2), %bx
	cmpw	%bx, (%rcx,%r11,2)
	jne	.L104
	leal	2(%rsi), %r10d
	leal	2(%rdi), %r11d
	movb	(%rdx,%r10), %bl
	cmpb	%bl, (%rdx,%r11)
	jne	.L104
	movw	(%rcx,%r10,2), %bx
	cmpw	%bx, (%rcx,%r11,2)
	jne	.L104
	leal	3(%rsi), %r10d
	leal	3(%rdi), %r11d
	movb	(%rdx,%r10), %bl
	cmpb	%bl, (%rdx,%r11)
	jne	.L104
	movw	(%rcx,%r10,2), %bx
	cmpw	%bx, (%rcx,%r11,2)
	jne	.L104
	leal	4(%rsi), %r10d
	leal	4(%rdi), %r11d
	movb	(%rdx,%r10), %bl
	cmpb	%bl, (%rdx,%r11)
	jne	.L104
	movw	(%rcx,%r10,2), %bx
	cmpw	%bx, (%rcx,%r11,2)
	jne	.L104
	leal	5(%rsi), %r10d
	leal	5(%rdi), %r11d
	movb	(%rdx,%r10), %bl
	cmpb	%bl, (%rdx,%r11)
	jne	.L104
	movw	(%rcx,%r10,2), %bx
	cmpw	%bx, (%rcx,%r11,2)
	jne	.L104
	leal	6(%rsi), %r10d
	leal	6(%rdi), %r11d
	movb	(%rdx,%r10), %bl
	cmpb	%bl, (%rdx,%r11)
	jne	.L104
	movw	(%rcx,%r10,2), %bx
	cmpw	%bx, (%rcx,%r11,2)
	jne	.L104
	leal	7(%rsi), %r10d
	leal	7(%rdi), %r11d
	movb	(%rdx,%r10), %bl
	cmpb	%bl, (%rdx,%r11)
	jne	.L104
	movw	(%rcx,%r10,2), %bx
	cmpw	%bx, (%rcx,%r11,2)
	je	.L96
.L104:
	seta	%al
	jmp	.L67
.L96:
	addl	$8, %edi
	addl	$8, %esi
	cmpl	%edi, %r8d
	ja	.L97
	subl	%r8d, %edi
.L97:
	cmpl	%esi, %r8d
	ja	.L98
	subl	%r8d, %esi
.L98:
	decl	(%r9)
	subl	$8, %eax
	jns	.L99
	xorl	%eax, %eax
.L67:
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE38:
	.size	mainGtU, .-mainGtU
	.type	uInt64_toAscii.isra.0, @function
uInt64_toAscii.isra.0:
.LFB155:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$10, %r9d
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	leaq	-8(%rsp), %r11
	movq	%rsi, (%rsp)
	leaq	8(%rsp), %r8
	xorl	%esi, %esi
.L109:
	movq	%rsp, %rbp
	movl	%esi, %ecx
	movl	%esi, %r10d
	xorl	%edx, %edx
	movq	%rbp, %rbx
.L107:
	movzbl	7(%rbp), %eax
	sall	$8, %edx
	decq	%rbp
	addl	%edx, %eax
	xorl	%edx, %edx
	divl	%r9d
	movb	%al, 8(%rbp)
	cmpq	%rbp, %r11
	jne	.L107
	addl	$48, %edx
	leal	1(%rcx), %eax
	movb	%dl, (%rsi,%r8)
	xorl	%edx, %edx
.L110:
	cmpb	$0, (%rbx,%rdx)
	je	.L108
	incq	%rsi
	jmp	.L109
.L108:
	incq	%rdx
	cmpq	$8, %rdx
	jne	.L110
	cltq
	movl	$1, %edx
	movb	$0, (%rdi,%rax)
	addq	%r8, %rax
.L112:
	movq	%rdx, %rcx
	negq	%rcx
	movb	(%rax,%rcx), %cl
	movb	%cl, -1(%rdi,%rdx)
	incq	%rdx
	leal	-2(%rdx), %ecx
	cmpl	%ecx, %r10d
	jg	.L112
	movq	40(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L113
	call	__stack_chk_fail@PLT
.L113:
	addq	$56, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE155:
	.size	uInt64_toAscii.isra.0, .-uInt64_toAscii.isra.0
	.section	.rodata.str1.1
.LC14:
	.string	"\nIt is possible that the compressed file(s) have become corrupted.\nYou can use the -tvv option to test integrity of such files.\n\nYou can use the `bzip2recover' program to attempt to recover\ndata from undamaged sections of corrupted files.\n\n"
	.text
	.type	cadvise, @function
cadvise:
.LFB121:
	.cfi_startproc
	cmpb	$0, noisy(%rip)
	je	.L120
	movq	stderr(%rip), %rsi
	leaq	.LC14(%rip), %rdi
	jmp	fputs@PLT
.L120:
	ret
	.cfi_endproc
.LFE121:
	.size	cadvise, .-cadvise
	.section	.rodata.str1.1
.LC15:
	.string	"\tInput file = %s, output file = %s\n"
	.text
	.type	showFileNames, @function
showFileNames:
.LFB122:
	.cfi_startproc
	cmpb	$0, noisy(%rip)
	je	.L122
	movq	stderr(%rip), %rdi
	leaq	outName(%rip), %r8
	xorl	%eax, %eax
	leaq	inName(%rip), %rcx
	leaq	.LC15(%rip), %rdx
	movl	$1, %esi
	jmp	__fprintf_chk@PLT
.L122:
	ret
	.cfi_endproc
.LFE122:
	.size	showFileNames, .-showFileNames
	.section	.rodata.str1.1
.LC16:
	.ascii	"\n%s: Caught a SIGSEGV or SIGBUS whilst compressing.\n\n   P"
	.ascii	"ossible causes are (most likely first):\n   (1) This compute"
	.ascii	"r has unreliable memory or cache hardware\n       (a surpris"
	.ascii	"ingly common problem; try a different machine.)\n   (2) A bu"
	.ascii	"g in the compiler used to create this executable\n       (un"
	.ascii	"likely, if you didn't compile bzip2 yourself.)\n   (3) A rea"
	.ascii	"l bug in bzip2 -- I hope this should never be the case.\n   "
	.ascii	"The user's manual, Section 4.3, has more info on (1) and (2)"
	.ascii	".\n   \n   If you suspect this is a bug in bzip2, or are uns"
	.ascii	"ure about (1)\n   or (2), feel free to report it to me at: j"
	.ascii	"seward@acm.org.\n   Sect"
	.string	"ion 4.3 of the user's manual describes the info a useful\n   bug report should have.  If the manual is available on your\n   system, please try and read it before mailing me.  If you don't\n   have the manual or can't be bothered to read it, mail me anyway.\n\n"
.LC17:
	.ascii	"\n%s: Caught a SIGSEGV or SIGBUS whilst decompressing.\n\n  "
	.ascii	" Possible causes are (most likely first):\n   (1) The compre"
	.ascii	"ssed data is corrupted, and bzip2's usual checks\n       fai"
	.ascii	"led to detect this.  Try bzip2 -tvv my_file.bz2.\n   (2) Thi"
	.ascii	"s computer has unreliable memory or cache hardware\n       ("
	.ascii	"a surprisingly common problem; try a different machine.)\n  "
	.ascii	" (3) A bug in the compiler used to create this executable\n "
	.ascii	"      (unlikely, if you didn't compile bzip2 yourself.)\n   "
	.ascii	"(4) A real bug in bzip2 -- I hope this should never be the c"
	.ascii	"ase.\n   The user's manual, Section 4.3, has more info on (2"
	.ascii	") and (3).\n   \n   If you suspect this is a bug in bzip2, o"
	.ascii	"r are unsure about (2)\n   or (3), feel free to report it to"
	.ascii	" me at: jseward@acm.org.\n   Sect"
	.string	"ion 4.3 of the user's manual describes the info a useful\n   bug report should have.  If the manual is available on your\n   system, please try and read it before mailing me.  If you don't\n   have the manual or can't be bothered to read it, mail me anyway.\n\n"
	.text
	.type	mySIGSEGVorSIGBUScatcher, @function
mySIGSEGVorSIGBUScatcher:
.LFB129:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	leaq	.LC16(%rip), %rdx
	pushq	%rax
	.cfi_def_cfa_offset 16
	cmpl	$1, opMode(%rip)
	movq	progName(%rip), %rcx
	movq	stderr(%rip), %rdi
	je	.L129
	leaq	.LC17(%rip), %rdx
.L129:
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	call	showFileNames
	cmpl	$1, opMode(%rip)
	movl	$3, %edi
	je	.L130
	call	cadvise
	movl	$2, %edi
.L130:
	call	cleanUpAndFail
	.cfi_endproc
.LFE129:
	.size	mySIGSEGVorSIGBUScatcher, .-mySIGSEGVorSIGBUScatcher
	.section	.rodata.str1.1
.LC18:
	.string	"\n%s: couldn't allocate enough memory\n"
	.text
	.type	outOfMemory, @function
outOfMemory:
.LFB130:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	leaq	.LC18(%rip), %rdx
	movl	$1, %esi
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	movq	progName(%rip), %rcx
	call	__fprintf_chk@PLT
	call	showFileNames
	movl	$1, %edi
	call	cleanUpAndFail
	.cfi_endproc
.LFE130:
	.size	outOfMemory, .-outOfMemory
	.section	.rodata.str1.1
.LC19:
	.string	"\n%s: PANIC -- internal consistency error:\n\t%s\n\tThis is a BUG.  Please report it to me at:\n\tjseward@acm.org\n"
	.text
	.type	panic, @function
panic:
.LFB124:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	leaq	.LC19(%rip), %rdx
	movl	$1, %esi
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, %r8
	movq	progName(%rip), %rcx
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	call	__fprintf_chk@PLT
	call	showFileNames
	movl	$3, %edi
	call	cleanUpAndFail
	.cfi_endproc
.LFE124:
	.size	panic, .-panic
	.section	.rodata.str1.1
.LC20:
	.string	"\n%s: I/O or other error, bailing out.  Possible reason follows.\n"
	.text
	.type	ioError, @function
ioError:
.LFB127:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	leaq	.LC20(%rip), %rdx
	movl	$1, %esi
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	progName(%rip), %rcx
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	call	__fprintf_chk@PLT
	movq	progName(%rip), %rdi
	call	perror@PLT
	call	showFileNames
	movl	$1, %edi
	call	cleanUpAndFail
	.cfi_endproc
.LFE127:
	.size	ioError, .-ioError
	.section	.rodata.str1.1
.LC21:
	.string	"bzip2: file name\n`%s'\nis suspiciously (more than %d chars) long.\nTry using a reasonable file name instead.  Sorry! :-)\n"
	.text
	.type	copyFileName, @function
copyFileName:
.LFB133:
	.cfi_startproc
	pushq	%rdx
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	movq	%rdi, %r8
	orq	$-1, %rcx
	movq	%rsi, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	decq	%rax
	cmpq	$1024, %rax
	jbe	.L138
	movq	stderr(%rip), %rdi
	movq	%rsi, %rcx
	xorl	%eax, %eax
	movl	$1, %esi
	movl	$1024, %r8d
	leaq	.LC21(%rip), %rdx
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	setExit
	movl	exitValue(%rip), %edi
	call	exit@PLT
.L138:
	movl	$1024, %edx
	movq	%r8, %rdi
	call	strncpy@PLT
	movb	$0, 1024(%rax)
	popq	%rax
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE133:
	.size	copyFileName, .-copyFileName
	.type	applySavedMetaInfoToOutputFile.constprop.0, @function
applySavedMetaInfoToOutputFile.constprop.0:
.LFB176:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movl	24+fileMetaInfo(%rip), %esi
	leaq	outName(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movq	72+fileMetaInfo(%rip), %rax
	movq	%rax, 8(%rsp)
	movq	88+fileMetaInfo(%rip), %rax
	movq	%rax, 16(%rsp)
	call	chmod@PLT
	testl	%eax, %eax
	je	.L141
.L142:
	call	ioError
.L141:
	leaq	8(%rsp), %rsi
	leaq	outName(%rip), %rdi
	call	utime@PLT
	testl	%eax, %eax
	jne	.L142
	movl	32+fileMetaInfo(%rip), %edx
	movl	28+fileMetaInfo(%rip), %esi
	leaq	outName(%rip), %rdi
	call	chown@PLT
	movq	24(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L143
	call	__stack_chk_fail@PLT
.L143:
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE176:
	.size	applySavedMetaInfoToOutputFile.constprop.0, .-applySavedMetaInfoToOutputFile.constprop.0
	.type	notAStandardFile.constprop.0, @function
notAStandardFile.constprop.0:
.LFB173:
	.cfi_startproc
	subq	$168, %rsp
	.cfi_def_cfa_offset 176
	leaq	inName(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	leaq	8(%rsp), %rsi
	call	lstat@PLT
	movl	%eax, %r8d
	movb	$1, %al
	testl	%r8d, %r8d
	jne	.L145
	movl	32(%rsp), %eax
	andl	$61440, %eax
	cmpl	$32768, %eax
	setne	%al
.L145:
	movq	152(%rsp), %rdx
	xorq	%fs:40, %rdx
	je	.L147
	call	__stack_chk_fail@PLT
.L147:
	addq	$168, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE173:
	.size	notAStandardFile.constprop.0, .-notAStandardFile.constprop.0
	.type	pad.constprop.0, @function
pad.constprop.0:
.LFB172:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	inName(%rip), %r12
	xorl	%eax, %eax
	orq	$-1, %rcx
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%r12, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	decq	%rax
	cmpl	%eax, longestFileName(%rip)
	jle	.L151
	movl	$1, %ebx
	orq	$-1, %rbp
.L152:
	xorl	%eax, %eax
	movq	%rbp, %rcx
	movq	%r12, %rdi
	repnz scasb
	movl	longestFileName(%rip), %eax
	leal	2(%rax,%rcx), %eax
	cmpl	%eax, %ebx
	jg	.L151
	movq	stderr(%rip), %rsi
	movl	$32, %edi
	incl	%ebx
	call	fputc@PLT
	jmp	.L152
.L151:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE172:
	.size	pad.constprop.0, .-pad.constprop.0
	.type	snocString, @function
snocString:
.LFB151:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	testq	%rdi, %rdi
	jne	.L170
	movl	$16, %edi
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L161
.L162:
	call	outOfMemory
.L161:
	movq	$0, (%rax)
	movq	%rbp, %rdi
	orq	$-1, %rcx
	movq	$0, 8(%rax)
	xorl	%eax, %eax
	repnz scasb
	notq	%rcx
	leal	4(%rcx), %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L162
	movq	%rax, (%r12)
	movq	%rbp, %rsi
	call	strcpy@PLT
	jmp	.L159
.L170:
	movq	%rdi, %r12
	movq	%rdi, %rax
.L160:
	movq	%rax, %rbx
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L160
	movq	%rbp, %rsi
	xorl	%edi, %edi
	call	snocString
	movq	%rax, 8(%rbx)
.L159:
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE151:
	.size	snocString, .-snocString
	.type	addFlagsFromEnvVar, @function
addFlagsFromEnvVar:
.LFB152:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	tmpName(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12
	movq	%rsi, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	pushq	%rdx
	.cfi_def_cfa_offset 48
	call	getenv@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L172
.L173:
	addq	%rbp, %rbx
	cmpb	$0, (%rbx)
	je	.L172
	call	__ctype_b_loc@PLT
	movq	(%rax), %rcx
.L175:
	movsbq	(%rbx), %rax
	testb	$32, 1(%rcx,%rax,2)
	je	.L193
	incq	%rbx
	jmp	.L175
.L193:
	xorl	%edx, %edx
.L178:
	movsbq	(%rbx,%rdx), %rax
	movslq	%edx, %rbp
	testb	%al, %al
	je	.L177
	incq	%rdx
	testb	$32, 1(%rcx,%rax,2)
	je	.L178
.L177:
	testl	%ebp, %ebp
	je	.L173
	cmpl	$1024, %ebp
	movl	$1024, %eax
	cmovle	%rbp, %rax
	xorl	%edx, %edx
.L180:
	movb	(%rbx,%rdx), %cl
	movb	%cl, 0(%r13,%rdx)
	incq	%rdx
	cmpl	%edx, %eax
	jg	.L180
	movb	$0, 0(%r13,%rax)
	movq	(%r12), %rdi
	movq	%r13, %rsi
	call	snocString
	movq	%rax, (%r12)
	jmp	.L173
.L172:
	popq	%rax
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE152:
	.size	addFlagsFromEnvVar, .-addFlagsFromEnvVar
	.globl	BZ2_hbAssignCodes
	.type	BZ2_hbAssignCodes, @function
BZ2_hbAssignCodes:
.LFB45:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
.L195:
	cmpl	%ecx, %edx
	jg	.L200
	xorl	%r9d, %r9d
.L198:
	cmpl	%r9d, %r8d
	jle	.L201
	movzbl	(%rsi,%r9), %r10d
	cmpl	%edx, %r10d
	jne	.L196
	movl	%eax, (%rdi,%r9,4)
	incl	%eax
.L196:
	incq	%r9
	jmp	.L198
.L201:
	addl	%eax, %eax
	incl	%edx
	jmp	.L195
.L200:
	ret
	.cfi_endproc
.LFE45:
	.size	BZ2_hbAssignCodes, .-BZ2_hbAssignCodes
	.globl	BZ2_hbCreateDecodeTables
	.type	BZ2_hbCreateDecodeTables, @function
BZ2_hbCreateDecodeTables:
.LFB46:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%r8d, %r10d
	xorl	%r11d, %r11d
.L203:
	xorl	%eax, %eax
	cmpl	%r9d, %r10d
	jg	.L207
.L206:
	cmpl	%eax, 16(%rsp)
	jle	.L221
	movzbl	(%rcx,%rax), %ebx
	cmpl	%r10d, %ebx
	jne	.L204
	movslq	%r11d, %rbx
	incl	%r11d
	movl	%eax, (%rdx,%rbx,4)
.L204:
	incq	%rax
	jmp	.L206
.L221:
	incl	%r10d
	jmp	.L203
.L207:
	movl	$0, (%rsi,%rax,4)
	incq	%rax
	cmpq	$23, %rax
	jne	.L207
	xorl	%eax, %eax
.L208:
	cmpl	%eax, 16(%rsp)
	jle	.L222
	movzbl	(%rcx,%rax), %edx
	incq	%rax
	incl	4(%rsi,%rdx,4)
	jmp	.L208
.L222:
	xorl	%eax, %eax
.L210:
	movl	(%rsi,%rax), %edx
	addl	%edx, 4(%rsi,%rax)
	addq	$4, %rax
	cmpq	$88, %rax
	jne	.L210
	xorl	%eax, %eax
.L211:
	movl	$0, (%rdi,%rax,4)
	incq	%rax
	cmpq	$23, %rax
	jne	.L211
	movslq	%r8d, %rdx
	xorl	%eax, %eax
.L212:
	cmpl	%edx, %r9d
	jl	.L223
	addl	4(%rsi,%rdx,4), %eax
	subl	(%rsi,%rdx,4), %eax
	leal	-1(%rax), %ecx
	addl	%eax, %eax
	movl	%ecx, (%rdi,%rdx,4)
	incq	%rdx
	jmp	.L212
.L223:
	incl	%r8d
	movslq	%r8d, %r8
.L214:
	cmpl	%r8d, %r9d
	jl	.L224
	movl	-4(%rdi,%r8,4), %eax
	leal	2(%rax,%rax), %eax
	subl	(%rsi,%r8,4), %eax
	movl	%eax, (%rsi,%r8,4)
	incq	%r8
	jmp	.L214
.L224:
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE46:
	.size	BZ2_hbCreateDecodeTables, .-BZ2_hbCreateDecodeTables
	.globl	BZ2_bsInitWrite
	.type	BZ2_bsInitWrite, @function
BZ2_bsInitWrite:
.LFB47:
	.cfi_startproc
	endbr64
	movq	$0, 640(%rdi)
	ret
	.cfi_endproc
.LFE47:
	.size	BZ2_bsInitWrite, .-BZ2_bsInitWrite
	.section	.rodata.str1.1
.LC22:
	.ascii	"\n\nbzip2/libbzip2: internal error number %d.\nThis is a bug"
	.ascii	" in bzip2/libbzip2, %s.\nPlease report it to me at: jseward@"
	.ascii	"acm.org.  If this happened\nwhen you were using some program"
	.ascii	" which use"
	.string	"s libbzip2 as a\ncomponent, you should also report this bug to the author(s)\nof that program.  Please make an effort to report this bug;\ntimely and accurate bug reports eventually lead to higher\nquality software.  Thanks.  Julian Seward, 30 December 2001.\n\n"
.LC23:
	.ascii	"\n*** A special note about internal error number 1007 ***\n\n"
	.ascii	"Experience suggests that a common cause of i.e. 1007\nis unr"
	.ascii	"eliable memory or other hardware.  The 1007 assertion\njust "
	.ascii	"happens to cross-check the results of huge numbers of\nmemor"
	.ascii	"y reads/writes, and so acts (unintendedly) as a stress\ntest"
	.ascii	" of your memory system.\n\nI suggest the following: try comp"
	.ascii	"ressing the file again,\npossibly monitoring progress in det"
	.ascii	"ail with the -vv flag.\n\n* If the error cannot be reproduce"
	.ascii	"d, and/or happens at different\n  points in compression, you"
	.ascii	" may have a flaky memory system.\n  Try a memory-test progra"
	.ascii	"m.  I have used Memtest86\n  (www.memtest86.com).  At the ti"
	.ascii	"me of writing it is free (GPLd).\n  Memtest86 tests memory m"
	.ascii	"uch more thorougly than your BIOSs\n  power-on test, and may"
	.ascii	" find failures that the BIOS doesn't"
	.string	".\n\n* If the error can be repeatably reproduced, this is a bug in\n  bzip2, and I would very much like to hear about it.  Please\n  let me know, and, ideally, save a copy of the file causing the\n  problem -- without which I will be unable to investigate it.\n\n"
	.text
	.globl	BZ2_bz__AssertH__fail
	.type	BZ2_bz__AssertH__fail, @function
BZ2_bz__AssertH__fail:
.LFB58:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ecx
	movl	%edi, %ebx
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	leaq	.LC1(%rip), %r8
	movl	$1, %esi
	leaq	.LC22(%rip), %rdx
	call	__fprintf_chk@PLT
	cmpl	$1007, %ebx
	jne	.L227
	movq	stderr(%rip), %rsi
	leaq	.LC23(%rip), %rdi
	call	fputs@PLT
.L227:
	movl	$3, %edi
	call	exit@PLT
	.cfi_endproc
.LFE58:
	.size	BZ2_bz__AssertH__fail, .-BZ2_bz__AssertH__fail
	.section	.rodata.str1.1
.LC24:
	.string	"        bucket sorting ...\n"
.LC25:
	.string	"        depth %6d has "
.LC26:
	.string	"%6d unresolved strings\n"
.LC27:
	.string	"        reconstructing block ...\n"
	.text
	.type	fallbackSort, @function
fallbackSort:
.LFB37:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%ecx, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$2936, %rsp
	.cfi_def_cfa_offset 2992
	movl	%r8d, 32(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 2920(%rsp)
	xorl	%eax, %eax
	cmpl	$3, %r8d
	jle	.L230
	movq	stderr(%rip), %rsi
	leaq	.LC24(%rip), %rdi
	call	fputs@PLT
.L230:
	xorl	%eax, %eax
	leaq	1892(%rsp), %rsi
.L231:
	movl	$0, (%rsi,%rax,4)
	incq	%rax
	cmpq	$257, %rax
	jne	.L231
	xorl	%eax, %eax
.L232:
	cmpl	%eax, %r14d
	jle	.L328
	movzbl	(%r12,%rax), %edx
	incq	%rax
	incl	1892(%rsp,%rdx,4)
	jmp	.L232
.L328:
	xorl	%eax, %eax
.L234:
	movl	(%rsi,%rax), %edx
	movl	%edx, 868(%rsp,%rax)
	addq	$4, %rax
	cmpq	$1024, %rax
	jne	.L234
	movq	%rsi, %rax
	leaq	2916(%rsp), %rdx
.L235:
	movl	(%rax), %ecx
	addl	%ecx, 4(%rax)
	addq	$4, %rax
	cmpq	%rax, %rdx
	jne	.L235
	xorl	%edx, %edx
.L236:
	cmpl	%edx, %r14d
	jle	.L329
	movzbl	(%r12,%rdx), %ecx
	movl	1892(%rsp,%rcx,4), %eax
	decl	%eax
	movl	%eax, 1892(%rsp,%rcx,4)
	cltq
	movl	%edx, (%rbx,%rax,4)
	incq	%rdx
	jmp	.L236
.L329:
	movl	%r14d, %eax
	movl	$32, %ecx
	cltd
	idivl	%ecx
	xorl	%edx, %edx
	addl	$2, %eax
.L238:
	cmpl	%edx, %eax
	jle	.L330
	movl	$0, 0(%rbp,%rdx,4)
	incq	%rdx
	jmp	.L238
.L330:
	xorl	%eax, %eax
	movl	$1, %edi
.L240:
	movl	(%rsi,%rax,4), %ecx
	movl	%edi, %r10d
	incq	%rax
	movl	%ecx, %edx
	sall	%cl, %r10d
	sarl	$5, %edx
	movslq	%edx, %rdx
	orl	%r10d, 0(%rbp,%rdx,4)
	cmpq	$256, %rax
	jne	.L240
	movl	%r14d, %eax
	leal	64(%r14), %edi
	movl	$1, %esi
.L241:
	movl	%eax, %edx
	movl	%eax, %ecx
	movl	%esi, %r15d
	movl	%esi, %r10d
	sarl	$5, %edx
	sall	%cl, %r15d
	leal	1(%rax), %ecx
	addl	$2, %eax
	movslq	%edx, %rdx
	sall	%cl, %r10d
	orl	%r15d, 0(%rbp,%rdx,4)
	movl	%ecx, %edx
	movl	%r10d, %ecx
	sarl	$5, %edx
	notl	%ecx
	movslq	%edx, %rdx
	andl	%ecx, 0(%rbp,%rdx,4)
	cmpl	%eax, %edi
	jne	.L241
	movl	$1, 16(%rsp)
.L301:
	cmpl	$3, 32(%rsp)
	jle	.L242
	movl	16(%rsp), %ecx
	movq	stderr(%rip), %rdi
	leaq	.LC25(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
.L242:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
.L243:
	cmpl	%ecx, %r14d
	jle	.L331
	movl	%ecx, %eax
	movl	%esi, %edi
	sarl	$5, %eax
	sall	%cl, %edi
	cltq
	testl	%edi, 0(%rbp,%rax,4)
	movl	(%rbx,%rcx,4), %eax
	cmovne	%ecx, %edx
	subl	16(%rsp), %eax
	jns	.L245
	addl	%r14d, %eax
.L245:
	cltq
	incq	%rcx
	movl	%edx, (%r12,%rax,4)
	jmp	.L243
.L331:
	leaq	-16(%rbx), %rax
	movl	$0, 20(%rsp)
	movq	%rax, 48(%rsp)
	leaq	-4(%rbx), %rax
	movl	$-1, 8(%rsp)
	movq	%rax, 56(%rsp)
.L247:
	movl	8(%rsp), %eax
.L250:
	incl	%eax
	movl	$1, %edi
	movl	%eax, %edx
	movl	%eax, %esi
	movl	%eax, %ecx
	sarl	$5, %edx
	andl	$31, %esi
	sall	%cl, %edi
	movslq	%edx, %rdx
	testl	%edi, 0(%rbp,%rdx,4)
	je	.L249
	testl	%esi, %esi
	jne	.L250
.L251:
	movl	%eax, %edx
	sarl	$5, %edx
	movslq	%edx, %rdx
	cmpl	$-1, 0(%rbp,%rdx,4)
	jne	.L253
	addl	$32, %eax
	jmp	.L251
.L253:
	movl	%eax, %edx
	movl	$1, %esi
	movl	%eax, %ecx
	sarl	$5, %edx
	sall	%cl, %esi
	movslq	%edx, %rdx
	testl	%esi, 0(%rbp,%rdx,4)
	je	.L249
	incl	%eax
	jmp	.L253
.L249:
	leal	-1(%rax), %esi
	movl	%esi, 36(%rsp)
	cmpl	%esi, %r14d
	jle	.L255
	movl	%eax, %ecx
.L256:
	movl	%ecx, %edx
	movl	%ecx, %esi
	movl	$1, %edi
	sarl	$5, %edx
	andl	$31, %esi
	sall	%cl, %edi
	movslq	%edx, %rdx
	testl	%edi, 0(%rbp,%rdx,4)
	jne	.L257
	testl	%esi, %esi
	je	.L259
	incl	%ecx
	jmp	.L256
.L259:
	movl	%ecx, %edx
	sarl	$5, %edx
	movslq	%edx, %rdx
	cmpl	$0, 0(%rbp,%rdx,4)
	jne	.L261
	addl	$32, %ecx
	jmp	.L259
.L261:
	movl	%ecx, %edx
	movl	$1, %esi
	sarl	$5, %edx
	sall	%cl, %esi
	movslq	%edx, %rdx
	testl	%esi, 0(%rbp,%rdx,4)
	jne	.L257
	incl	%ecx
	jmp	.L261
.L257:
	leal	-1(%rcx), %esi
	movl	%esi, 8(%rsp)
	cmpl	%esi, %r14d
	jle	.L255
	cmpl	%ecx, %eax
	jge	.L247
	subl	%eax, %ecx
	movl	20(%rsp), %eax
	movl	%esi, 468(%rsp)
	movl	$0, 44(%rsp)
	leal	1(%rax,%rcx), %eax
	movl	$1, 28(%rsp)
	movl	%eax, 20(%rsp)
	movl	36(%rsp), %eax
	movl	%eax, 68(%rsp)
.L264:
	movl	28(%rsp), %eax
	decl	%eax
	movl	%eax, 12(%rsp)
	cltq
	movl	468(%rsp,%rax,4), %ecx
	movl	68(%rsp,%rax,4), %esi
	movl	%ecx, %eax
	subl	%esi, %eax
	cmpl	$9, %eax
	jg	.L265
	cmpl	%ecx, %esi
	je	.L266
	cmpl	$3, %eax
	jg	.L267
.L274:
	leal	-1(%rcx), %eax
	cltq
	jmp	.L268
.L267:
	leal	-4(%rcx), %eax
	cltq
.L269:
	cmpl	%eax, %esi
	jg	.L274
	movslq	(%rbx,%rax,4), %rdx
	movl	(%r12,%rdx,4), %r11d
	movq	%rdx, %rdi
	leaq	4(%rax), %rdx
.L270:
	movq	48(%rsp), %r15
	leaq	(%r15,%rdx,4), %r9
	cmpl	%edx, %ecx
	jl	.L271
	movl	(%rbx,%rdx,4), %r10d
	addq	$4, %rdx
	movq	%r10, %r8
	cmpl	(%r12,%r10,4), %r11d
	jbe	.L271
	movl	%r8d, -32(%rbx,%rdx,4)
	jmp	.L270
.L271:
	movl	%edi, (%r9)
	decq	%rax
	jmp	.L269
.L332:
	movl	(%rbx,%rdx,4), %r10d
	incq	%rdx
	movq	%r10, %r8
	cmpl	(%r12,%r10,4), %r11d
	jbe	.L276
	movl	%r8d, -8(%rbx,%rdx,4)
.L275:
	movq	56(%rsp), %r15
	leaq	(%r15,%rdx,4), %r9
	cmpl	%edx, %ecx
	jge	.L332
.L276:
	movl	%edi, (%r9)
	decq	%rax
.L268:
	cmpl	%eax, %esi
	jg	.L266
	movslq	(%rbx,%rax,4), %rdx
	movl	(%r12,%rdx,4), %r11d
	movq	%rdx, %rdi
	leaq	1(%rax), %rdx
	jmp	.L275
.L265:
	imull	$7621, 44(%rsp), %eax
	movl	$3, %edi
	xorl	%edx, %edx
	incl	%eax
	andl	$32767, %eax
	movl	%eax, 44(%rsp)
	divl	%edi
	movslq	%esi, %rax
	testl	%edx, %edx
	je	.L326
	decl	%edx
	movslq	%ecx, %rax
	jne	.L326
	leal	(%rsi,%rcx), %eax
	sarl	%eax
	cltq
.L326:
	movl	(%rbx,%rax,4), %eax
	movslq	%esi, %r10
	movl	%ecx, %r9d
	movl	%esi, %edx
	leaq	(%rbx,%r10,4), %rdi
	movl	%ecx, %r8d
	movl	(%r12,%rax,4), %eax
	movl	%eax, 24(%rsp)
	movl	%esi, %eax
.L282:
	cmpl	%r8d, %eax
	jg	.L283
	movl	(%rdi), %r11d
	movq	%r11, %r15
	movl	(%r12,%r11,4), %r11d
	subl	24(%rsp), %r11d
	testl	%r11d, %r11d
	jne	.L284
	movslq	%edx, %r11
	incl	%edx
	leaq	(%rbx,%r11,4), %r11
	movl	(%r11), %r13d
	movl	%r13d, (%rdi)
	movl	%r15d, (%r11)
.L285:
	incl	%eax
	addq	$4, %rdi
	jmp	.L282
.L284:
	jle	.L285
	movslq	%r8d, %r11
	leaq	(%rbx,%r11,4), %r11
.L286:
	movl	(%r11), %r15d
	movl	24(%rsp), %r13d
	decl	%r8d
	movl	%r15d, 40(%rsp)
	cmpl	%r13d, (%r12,%r15,4)
	jne	.L287
	movslq	%r9d, %r15
	decl	%r9d
	leaq	(%rbx,%r15,4), %r15
	movl	(%r15), %r13d
	movl	%r13d, (%r11)
	movl	40(%rsp), %r13d
	movl	%r13d, (%r15)
.L288:
	subq	$4, %r11
	cmpl	%r8d, %eax
	jle	.L286
	jmp	.L283
.L287:
	jns	.L288
	movl	(%rdi), %r15d
	movl	40(%rsp), %r13d
	movl	%r13d, (%rdi)
	movl	%r15d, (%r11)
	jmp	.L285
.L283:
	cmpl	%r9d, %edx
	jg	.L266
	movl	%eax, %r11d
	movl	%edx, %edi
	subl	%edx, %r11d
	subl	%esi, %edi
	cmpl	%edi, %r11d
	cmovle	%r11d, %edi
	movl	%eax, %r11d
	subl	%edi, %r11d
	addl	%esi, %edi
	movslq	%r11d, %r11
.L290:
	movl	%edi, %r13d
	subl	%r10d, %r13d
	testl	%r13d, %r13d
	jle	.L333
	movl	(%rbx,%r10,4), %r13d
	movl	(%rbx,%r11,4), %r15d
	movl	%r15d, (%rbx,%r10,4)
	incq	%r10
	movl	%r13d, (%rbx,%r11,4)
	incq	%r11
	jmp	.L290
.L333:
	movl	%r9d, %r10d
	movl	%ecx, %edi
	subl	%r8d, %r10d
	movl	%ecx, %r8d
	subl	%r9d, %r8d
	movslq	%eax, %r9
	cmpl	%r10d, %r8d
	cmovg	%r10d, %r8d
	subl	%r8d, %edi
	addl	%eax, %r8d
	incl	%edi
	movslq	%edi, %rdi
.L292:
	movl	%r8d, %r11d
	subl	%r9d, %r11d
	testl	%r11d, %r11d
	jle	.L334
	movl	(%rbx,%r9,4), %r11d
	movl	(%rbx,%rdi,4), %r13d
	movl	%r13d, (%rbx,%r9,4)
	incq	%r9
	movl	%r11d, (%rbx,%rdi,4)
	incq	%rdi
	jmp	.L292
.L334:
	addl	%esi, %eax
	movl	28(%rsp), %edi
	movl	%ecx, %r8d
	subl	%edx, %eax
	movl	%ecx, %edx
	decl	%eax
	subl	%r10d, %edx
	incl	%edi
	incl	%edx
	movl	%eax, %r9d
	subl	%esi, %r9d
	subl	%edx, %r8d
	cmpl	%r8d, %r9d
	movslq	12(%rsp), %r8
	movslq	28(%rsp), %r9
	jle	.L294
	movl	%eax, 468(%rsp,%r8,4)
	movl	%edx, 68(%rsp,%r9,4)
	movl	%ecx, 468(%rsp,%r9,4)
	jmp	.L295
.L294:
	movl	%edx, 68(%rsp,%r8,4)
	movl	%eax, 468(%rsp,%r9,4)
	movl	%esi, 68(%rsp,%r9,4)
	jmp	.L295
.L266:
	cmpl	$0, 12(%rsp)
	je	.L335
.L296:
	movl	12(%rsp), %eax
	movl	%eax, 28(%rsp)
	jmp	.L264
.L335:
	movslq	36(%rsp), %rax
	orl	$-1, %edx
.L297:
	movl	%eax, %ecx
	cmpl	%eax, 8(%rsp)
	jl	.L247
	movl	(%rbx,%rax,4), %esi
	movl	(%r12,%rsi,4), %esi
	cmpl	%esi, %edx
	je	.L298
	movl	%ecx, %edx
	movl	$1, %edi
	sarl	$5, %edx
	sall	%cl, %edi
	movslq	%edx, %rdx
	orl	%edi, 0(%rbp,%rdx,4)
.L298:
	incq	%rax
	movl	%esi, %edx
	jmp	.L297
.L255:
	cmpl	$3, 32(%rsp)
	jle	.L300
	movl	20(%rsp), %ecx
	movq	stderr(%rip), %rdi
	leaq	.LC26(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
.L300:
	sall	16(%rsp)
	cmpl	16(%rsp), %r14d
	jl	.L310
	cmpl	$0, 20(%rsp)
	jne	.L301
.L310:
	cmpl	$3, 32(%rsp)
	jle	.L303
	movq	stderr(%rip), %rsi
	leaq	.LC27(%rip), %rdi
	call	fputs@PLT
.L303:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
.L304:
	cmpl	%ecx, %r14d
	jle	.L306
	movslq	%edx, %rax
.L305:
	movl	%eax, %edx
	incq	%rax
	movl	864(%rsp,%rax,4), %esi
	testl	%esi, %esi
	je	.L305
	movslq	%edx, %rax
	decl	%esi
	movl	%esi, 868(%rsp,%rax,4)
	movl	(%rbx,%rcx,4), %eax
	incq	%rcx
	movb	%dl, (%r12,%rax)
	jmp	.L304
.L306:
	cmpl	$255, %edx
	jle	.L229
	movl	$1005, %edi
.L327:
	call	BZ2_bz__AssertH__fail
.L295:
	cmpl	$99, %edi
	jle	.L336
	movl	$1004, %edi
	jmp	.L327
.L336:
	movl	%edi, 12(%rsp)
	jmp	.L296
.L229:
	movq	2920(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L309
	call	__stack_chk_fail@PLT
.L309:
	addq	$2936, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE37:
	.size	fallbackSort, .-fallbackSort
	.globl	BZ2_hbMakeCodeLengths
	.type	BZ2_hbMakeCodeLengths, @function
BZ2_hbMakeCodeLengths:
.LFB44:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4152
	orq	$0, (%rsp)
	subq	$1112, %rsp
	.cfi_def_cfa_offset 5264
	movq	%rdi, (%rsp)
	movl	%edx, %edi
	movl	%ecx, 12(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 5192(%rsp)
	xorl	%eax, %eax
.L338:
	cmpl	%eax, %edi
	jle	.L369
	movl	(%rsi,%rax,4), %ecx
	movl	$256, %edx
	testl	%ecx, %ecx
	je	.L339
	movl	%ecx, %edx
	sall	$8, %edx
.L339:
	movl	%edx, 1068(%rsp,%rax,4)
	incq	%rax
	jmp	.L338
.L369:
	movb	$1, %r12b
.L362:
	movl	$0, 24(%rsp)
	movl	$1, %eax
	movl	$0, 1064(%rsp)
	movl	$-2, 3128(%rsp)
.L341:
	movl	%eax, %r8d
	cmpl	%eax, %edi
	jl	.L370
	movl	%eax, 24(%rsp,%rax,4)
	movl	1064(%rsp,%rax,4), %r10d
	movslq	%eax, %rdx
	movl	$-1, 3128(%rsp,%rax,4)
.L342:
	movl	%edx, %esi
	sarl	%esi
	movslq	%esi, %rcx
	movslq	24(%rsp,%rcx,4), %r9
	movq	%r9, %rcx
	cmpl	1064(%rsp,%r9,4), %r10d
	jge	.L371
	movl	%ecx, 24(%rsp,%rdx,4)
	movslq	%esi, %rdx
	jmp	.L342
.L371:
	movl	%r8d, 24(%rsp,%rdx,4)
	incq	%rax
	jmp	.L341
.L370:
	testl	%edi, %edi
	movl	$0, %eax
	movslq	%edi, %r9
	cmovns	%edi, %eax
	leal	-1(%rax), %edx
	leal	-2(%rax), %r10d
	movslq	%edx, %rdx
.L345:
	leal	2(%r10), %ecx
	decl	%ecx
	jle	.L372
	movl	28(%rsp), %ebx
	movslq	28(%rsp,%rdx,4), %rbp
	movslq	%edx, %r8
	movl	$1, %ecx
	movl	%ebx, 8(%rsp)
	movq	%rbp, %r11
	movl	%ebp, 28(%rsp)
.L348:
	leal	(%rcx,%rcx), %esi
	cmpl	%edx, %esi
	jg	.L346
	jge	.L347
	leal	1(%rsi), %ebx
	movslq	%ebx, %r13
	movslq	24(%rsp,%r13,4), %r14
	movslq	%esi, %r13
	movslq	24(%rsp,%r13,4), %r13
	movl	1064(%rsp,%r13,4), %r15d
	cmpl	%r15d, 1064(%rsp,%r14,4)
	cmovl	%ebx, %esi
.L347:
	movslq	%esi, %rbx
	movslq	24(%rsp,%rbx,4), %r13
	movl	1064(%rsp,%r13,4), %r15d
	cmpl	%r15d, 1064(%rsp,%rbp,4)
	jl	.L346
	movl	%r13d, 24(%rsp,%rcx,4)
	movslq	%esi, %rcx
	jmp	.L348
.L346:
	movl	%r11d, 24(%rsp,%rcx,4)
	movslq	24(%rsp,%rdx,4), %r13
	movl	$1, %ecx
	movslq	28(%rsp), %r11
	movl	%r13d, 28(%rsp)
	movq	%r13, %rbx
.L351:
	leal	(%rcx,%rcx), %esi
	cmpl	%r10d, %esi
	jg	.L349
	jge	.L350
	leal	1(%rsi), %ebp
	movslq	%ebp, %r14
	movslq	24(%rsp,%r14,4), %r15
	movslq	%esi, %r14
	movslq	24(%rsp,%r14,4), %r14
	movl	1064(%rsp,%r14,4), %r14d
	cmpl	%r14d, 1064(%rsp,%r15,4)
	cmovl	%ebp, %esi
.L350:
	movslq	%esi, %rbp
	movslq	24(%rsp,%rbp,4), %r14
	movl	1064(%rsp,%r14,4), %r15d
	cmpl	%r15d, 1064(%rsp,%r13,4)
	jl	.L349
	movl	%r14d, 24(%rsp,%rcx,4)
	movslq	%esi, %rcx
	jmp	.L351
.L349:
	movl	%ebx, 24(%rsp,%rcx,4)
	movslq	8(%rsp), %rcx
	leal	1(%r9), %ebx
	movl	%ebx, 3128(%rsp,%r11,4)
	movl	1064(%rsp,%rcx,4), %esi
	movl	%ebx, 3128(%rsp,%rcx,4)
	movl	1064(%rsp,%r11,4), %ecx
	movl	%ebx, 24(%rsp,%rdx,4)
	movl	$-1, 3132(%rsp,%r9,4)
	movzbl	%sil, %ebp
	movzbl	%cl, %r11d
	cmpl	%ebp, %r11d
	cmovl	%ebp, %r11d
	xorb	%sil, %sil
	xorb	%cl, %cl
	addl	%esi, %ecx
	incl	%r11d
	orl	%r11d, %ecx
	movl	%ecx, 1068(%rsp,%r9,4)
.L352:
	movl	%r8d, %r11d
	sarl	%r11d
	movslq	%r11d, %rsi
	movslq	24(%rsp,%rsi,4), %rbp
	movq	%rbp, %rsi
	cmpl	1064(%rsp,%rbp,4), %ecx
	jge	.L373
	movl	%esi, 24(%rsp,%r8,4)
	movslq	%r11d, %r8
	jmp	.L352
.L373:
	movl	%ebx, 24(%rsp,%r8,4)
	incq	%r9
	decq	%rdx
	decl	%r10d
	jmp	.L345
.L372:
	decl	%eax
	movl	$0, %edx
	testl	%edi, %edi
	cmovle	%edx, %eax
	addl	%edi, %eax
	cmpl	$515, %eax
	jle	.L365
	movl	$2002, %edi
	call	BZ2_bz__AssertH__fail
.L365:
	movl	$1, %eax
	xorl	%esi, %esi
.L355:
	movslq	%eax, %rdx
	cmpl	%eax, %edi
	jl	.L374
	xorl	%ecx, %ecx
.L358:
	movslq	3128(%rsp,%rdx,4), %rdx
	testl	%edx, %edx
	js	.L375
	incl	%ecx
	jmp	.L358
.L375:
	movq	(%rsp), %rbx
	cmpl	12(%rsp), %ecx
	cmovg	%r12d, %esi
	movb	%cl, -1(%rbx,%rax)
	incq	%rax
	jmp	.L355
.L374:
	testb	%sil, %sil
	je	.L337
	xorl	%ecx, %ecx
.L360:
	incq	%rcx
	cmpl	%ecx, %edi
	jle	.L362
	leaq	1064(%rsp), %rsi
	movl	$2, %ebx
	movl	(%rsi,%rcx,4), %eax
	sarl	$8, %eax
	cltd
	idivl	%ebx
	incl	%eax
	sall	$8, %eax
	movl	%eax, (%rsi,%rcx,4)
	jmp	.L360
.L337:
	movq	5192(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L363
	call	__stack_chk_fail@PLT
.L363:
	addq	$5208, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE44:
	.size	BZ2_hbMakeCodeLengths, .-BZ2_hbMakeCodeLengths
	.section	.rodata.str1.1
.LC28:
	.string	"        main sort initialise ...\n"
.LC29:
	.string	"        qsort [0x%x, 0x%x]   done %d   this %d\n"
.LC30:
	.string	"        %d pointers, %d sorted, %d scanned\n"
	.text
	.type	mainSort, @function
mainSort:
.LFB42:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4152
	orq	$0, (%rsp)
	subq	$632, %rsp
	.cfi_def_cfa_offset 4784
	movq	4784(%rsp), %rax
	movq	%rdx, 8(%rsp)
	movq	%rdi, %rbx
	movq	%rsi, %r15
	movq	%rcx, %r13
	movl	%r8d, 20(%rsp)
	movl	%r9d, 96(%rsp)
	movq	%rax, 40(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 4712(%rsp)
	xorl	%eax, %eax
	cmpl	$3, %r9d
	jle	.L377
	movq	stderr(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	call	fputs@PLT
.L377:
	movl	$65536, %eax
.L378:
	movl	$0, 0(%r13,%rax,4)
	decq	%rax
	cmpq	$-1, %rax
	jne	.L378
	movl	20(%rsp), %esi
	movzbl	(%r15), %eax
	decl	%esi
	sall	$8, %eax
	movl	%esi, 104(%rsp)
	movslq	%esi, %rbp
	movq	%rbp, %rdx
.L379:
	cmpl	$2, %edx
	jle	.L493
	movq	8(%rsp), %rsi
	sarl	$8, %eax
	movw	$0, (%rsi,%rdx,2)
	movzbl	(%r15,%rdx), %ecx
	sall	$8, %ecx
	orl	%ecx, %eax
	movslq	%eax, %rcx
	sarl	$8, %eax
	incl	0(%r13,%rcx,4)
	movl	%eax, %ecx
	movw	$0, -2(%rsi,%rdx,2)
	movzbl	-1(%r15,%rdx), %eax
	sall	$8, %eax
	orl	%ecx, %eax
	movslq	%eax, %rcx
	sarl	$8, %eax
	incl	0(%r13,%rcx,4)
	movl	%eax, %ecx
	movw	$0, -4(%rsi,%rdx,2)
	movzbl	-2(%r15,%rdx), %eax
	sall	$8, %eax
	orl	%ecx, %eax
	movslq	%eax, %rcx
	sarl	$8, %eax
	incl	0(%r13,%rcx,4)
	movl	%eax, %ecx
	movw	$0, -6(%rsi,%rdx,2)
	movzbl	-3(%r15,%rdx), %eax
	subq	$4, %rdx
	sall	$8, %eax
	orl	%ecx, %eax
	movslq	%eax, %rcx
	incl	0(%r13,%rcx,4)
	jmp	.L379
.L493:
	movslq	%edx, %rdx
.L381:
	testl	%edx, %edx
	js	.L494
	movq	8(%rsp), %rsi
	sarl	$8, %eax
	movw	$0, (%rsi,%rdx,2)
	movzbl	(%r15,%rdx), %ecx
	decq	%rdx
	sall	$8, %ecx
	orl	%ecx, %eax
	movslq	%eax, %rcx
	incl	0(%r13,%rcx,4)
	jmp	.L381
.L494:
	movslq	20(%rsp), %rdx
	xorl	%eax, %eax
	leaq	(%rdx,%rdx), %rcx
	addq	%r15, %rdx
	addq	8(%rsp), %rcx
.L383:
	movb	(%r15,%rax), %sil
	movb	%sil, (%rdx,%rax)
	movw	$0, (%rcx,%rax,2)
	incq	%rax
	cmpq	$34, %rax
	jne	.L383
	cmpl	$3, 96(%rsp)
	jle	.L384
	movq	stderr(%rip), %rsi
	leaq	.LC24(%rip), %rdi
	call	fputs@PLT
.L384:
	xorl	%eax, %eax
.L385:
	movl	0(%r13,%rax), %edx
	addl	%edx, 4(%r13,%rax)
	addq	$4, %rax
	cmpq	$262144, %rax
	jne	.L385
	movzbl	(%r15), %eax
	sall	$8, %eax
.L386:
	movslq	%ebp, %rcx
	cmpl	$2, %ebp
	jle	.L388
	movzbl	(%r15,%rbp), %ecx
	shrw	$8, %ax
	sall	$8, %ecx
	orl	%ecx, %eax
	movzwl	%ax, %edx
	shrw	$8, %ax
	leaq	0(%r13,%rdx,4), %rcx
	movl	(%rcx), %esi
	leal	-1(%rsi), %edx
	movl	%edx, (%rcx)
	movslq	%edx, %rdx
	movl	%ebp, (%rbx,%rdx,4)
	movzbl	-1(%r15,%rbp), %ecx
	sall	$8, %ecx
	orl	%eax, %ecx
	movzwl	%cx, %eax
	shrw	$8, %cx
	leaq	0(%r13,%rax,4), %rdx
	movl	(%rdx), %eax
	decl	%eax
	movl	%eax, (%rdx)
	leal	-1(%rbp), %edx
	cltq
	movl	%edx, (%rbx,%rax,4)
	movzbl	-2(%r15,%rbp), %edx
	sall	$8, %edx
	orl	%ecx, %edx
	movzwl	%dx, %eax
	shrw	$8, %dx
	leaq	0(%r13,%rax,4), %rcx
	movl	(%rcx), %eax
	decl	%eax
	movl	%eax, (%rcx)
	leal	-2(%rbp), %ecx
	cltq
	movl	%ecx, (%rbx,%rax,4)
	movzbl	-3(%r15,%rbp), %eax
	sall	$8, %eax
	orl	%edx, %eax
	movzwl	%ax, %edx
	leaq	0(%r13,%rdx,4), %rcx
	movl	(%rcx), %esi
	leal	-1(%rsi), %edx
	movl	%edx, (%rcx)
	leal	-3(%rbp), %ecx
	movslq	%edx, %rdx
	subq	$4, %rbp
	movl	%ecx, (%rbx,%rdx,4)
	jmp	.L386
.L388:
	testl	%ecx, %ecx
	js	.L495
	movzbl	(%r15,%rcx), %edx
	shrw	$8, %ax
	sall	$8, %edx
	orl	%edx, %eax
	movzwl	%ax, %edx
	leaq	0(%r13,%rdx,4), %rsi
	movl	(%rsi), %edi
	leal	-1(%rdi), %edx
	movl	%edx, (%rsi)
	movslq	%edx, %rdx
	movl	%ecx, (%rbx,%rdx,4)
	decq	%rcx
	jmp	.L388
.L495:
	xorl	%eax, %eax
.L390:
	movb	$0, 4456(%rsp,%rax)
	movl	%eax, 1384(%rsp,%rax,4)
	incq	%rax
	cmpq	$256, %rax
	jne	.L390
	movl	$5, %ecx
	movl	$1, %edx
.L391:
	leal	(%rdx,%rdx,2), %edx
	incl	%edx
	decl	%ecx
	jne	.L391
.L397:
	movl	%edx, %eax
	movl	$3, %esi
	cltd
	idivl	%esi
	movslq	%eax, %rdi
	movl	%edi, %r8d
	movq	%rdi, 24(%rsp)
	movq	%rdi, %rdx
	movq	%rdi, %rcx
	negl	%r8d
	movslq	%r8d, %rsi
	movq	%rsi, (%rsp)
.L392:
	cmpl	$255, %ecx
	jg	.L496
	movl	1384(%rsp,%rcx,4), %r11d
	movq	%rcx, %r10
	subq	24(%rsp), %r10
	leal	1(%r11), %esi
	movl	%r11d, %edi
	sall	$8, %esi
	sall	$8, %edi
	movslq	%esi, %rsi
	movslq	%edi, %rdi
	movl	0(%r13,%rsi,4), %ebp
	movq	%rcx, %rsi
	subl	0(%r13,%rdi,4), %ebp
.L393:
	leaq	1384(%rsp), %r8
	movslq	%r10d, %r9
	movl	(%r8,%r10,4), %r14d
	leal	1(%r14), %edi
	movl	%r14d, %r12d
	sall	$8, %edi
	sall	$8, %r12d
	movslq	%edi, %rdi
	movslq	%r12d, %r12
	movl	0(%r13,%rdi,4), %edi
	subl	0(%r13,%r12,4), %edi
	cmpl	%ebp, %edi
	jbe	.L497
	movl	%r14d, (%r8,%rsi,4)
	addq	(%rsp), %rsi
	addq	(%rsp), %r10
	cmpl	%esi, %eax
	jle	.L393
	jmp	.L394
.L497:
	movslq	%esi, %r9
.L394:
	movl	%r11d, 1384(%rsp,%r9,4)
	incq	%rcx
	jmp	.L392
.L496:
	decl	%eax
	jne	.L397
	movq	$0, 64(%rsp)
	movl	$0, 52(%rsp)
.L464:
	movq	64(%rsp), %rax
	movl	$0, 56(%rsp)
	movl	1384(%rsp,%rax,4), %eax
	movl	%eax, 24(%rsp)
	sall	$8, %eax
	movl	%eax, 100(%rsp)
.L444:
	movl	56(%rsp), %esi
	cmpl	%esi, 24(%rsp)
	je	.L398
	movl	100(%rsp), %eax
	addl	%esi, %eax
	cltq
	salq	$2, %rax
	leaq	0(%r13,%rax), %rsi
	movl	(%rsi), %r12d
	movq	%rsi, 128(%rsp)
	btl	$21, %r12d
	jc	.L399
	movl	4(%r13,%rax), %ebp
	andl	$-2097153, %r12d
	andl	$-2097153, %ebp
	decl	%ebp
	cmpl	%ebp, %r12d
	jge	.L399
	movl	%ebp, %eax
	subl	%r12d, %eax
	cmpl	$3, 96(%rsp)
	movl	%eax, 144(%rsp)
	jle	.L400
	pushq	%rax
	.cfi_def_cfa_offset 4792
	movl	152(%rsp), %eax
	movl	$1, %esi
	leaq	.LC29(%rip), %rdx
	movq	stderr(%rip), %rdi
	incl	%eax
	pushq	%rax
	.cfi_def_cfa_offset 4800
	movl	68(%rsp), %r9d
	xorl	%eax, %eax
	movl	72(%rsp), %r8d
	movl	40(%rsp), %ecx
	call	__fprintf_chk@PLT
	popq	%rdx
	.cfi_def_cfa_offset 4792
	popq	%rcx
	.cfi_def_cfa_offset 4784
.L400:
	movl	%r12d, 184(%rsp)
	movl	$1, %r14d
	movl	%ebp, 584(%rsp)
	movl	$2, 984(%rsp)
.L401:
	leal	-1(%r14), %eax
	movl	%eax, 48(%rsp)
	cltq
	movl	584(%rsp,%rax,4), %r10d
	movl	184(%rsp,%rax,4), %edi
	movl	984(%rsp,%rax,4), %r11d
	movl	%r10d, %eax
	movl	%edi, (%rsp)
	subl	%edi, %eax
	cmpl	$14, %r11d
	jg	.L471
	cmpl	$19, %eax
	jg	.L402
.L471:
	incl	%eax
	xorl	%edx, %edx
	cmpl	$1, %eax
	jg	.L404
.L421:
	movq	40(%rsp), %rax
	cmpl	$0, (%rax)
	jns	.L489
	jmp	.L419
.L404:
	movl	%edx, %ecx
	leaq	incs(%rip), %rdi
	incq	%rdx
	cmpl	(%rdi,%rdx,4), %eax
	jg	.L404
	movslq	%ecx, %rax
	movq	%rax, 72(%rsp)
	movslq	(%rsp), %rax
	movq	%rax, 152(%rsp)
.L407:
	cmpl	$-1, 72(%rsp)
	je	.L421
	movq	72(%rsp), %rcx
	leaq	incs(%rip), %rax
	movl	(%rax,%rcx,4), %eax
	movl	%eax, 32(%rsp)
	movl	(%rsp), %eax
	addl	32(%rsp), %eax
	movl	%eax, 60(%rsp)
	movslq	%eax, %r12
	movslq	32(%rsp), %rax
	movq	%rax, 80(%rsp)
	movq	152(%rsp), %rax
	leaq	8(%rbx,%rax,4), %rax
	movq	%rax, 88(%rsp)
	imulq	$-4, 80(%rsp), %rax
	addq	%rbx, %rax
	movq	%rax, 112(%rsp)
	movl	32(%rsp), %eax
	negl	%eax
	movslq	%eax, %rdx
	movl	%eax, 160(%rsp)
	leaq	0(,%rdx,4), %rcx
	movq	%rcx, 120(%rsp)
.L418:
	cmpl	%r12d, %r10d
	jl	.L408
	movl	(%rbx,%r12,4), %eax
	movq	%r12, %rbp
	movl	%eax, 108(%rsp)
	movslq	160(%rsp), %rax
	movq	%rax, 136(%rsp)
	movl	108(%rsp), %eax
	leal	(%rax,%r11), %esi
.L409:
	movq	112(%rsp), %rax
	movq	40(%rsp), %r9
	movl	%r11d, %edi
	movq	%r15, %rdx
	movl	20(%rsp), %r8d
	movq	8(%rsp), %rcx
	movl	%r10d, 168(%rsp)
	movl	%ebp, %r14d
	addl	(%rax,%rbp,4), %edi
	movl	%r11d, 164(%rsp)
	movl	%esi, 148(%rsp)
	subl	32(%rsp), %r14d
	call	mainGtU
	movl	148(%rsp), %esi
	movl	164(%rsp), %r11d
	testb	%al, %al
	movl	168(%rsp), %r10d
	je	.L498
	movq	112(%rsp), %rax
	movl	(%rax,%rbp,4), %eax
	movl	%eax, (%rbx,%rbp,4)
	addq	136(%rsp), %rbp
	cmpl	%ebp, 60(%rsp)
	jle	.L409
	jmp	.L410
.L498:
	movl	%ebp, %r14d
.L410:
	movl	108(%rsp), %eax
	movslq	%r14d, %r14
	leal	1(%r12), %ebp
	movl	%r12d, 136(%rsp)
	movl	%eax, (%rbx,%r14,4)
	cmpl	%ebp, %r10d
	jl	.L408
	movl	4(%rbx,%r12,4), %eax
	movl	%eax, 108(%rsp)
	movq	88(%rsp), %rax
	leaq	-4(%rax), %r14
	movl	108(%rsp), %eax
	leal	(%r11,%rax), %esi
.L412:
	movq	40(%rsp), %r9
	movl	20(%rsp), %r8d
	movl	%r11d, %edi
	movq	%r15, %rdx
	movq	8(%rsp), %rcx
	addl	(%r14), %edi
	movl	%r10d, 172(%rsp)
	movl	%ebp, 148(%rsp)
	subl	32(%rsp), %ebp
	movl	%r11d, 168(%rsp)
	movl	%esi, 164(%rsp)
	call	mainGtU
	movl	164(%rsp), %esi
	movl	168(%rsp), %r11d
	testb	%al, %al
	movl	172(%rsp), %r10d
	je	.L499
	movl	(%r14), %eax
	movq	80(%rsp), %rdi
	movl	%eax, (%r14,%rdi,4)
	addq	120(%rsp), %r14
	cmpl	%ebp, 60(%rsp)
	jle	.L412
	jmp	.L413
.L499:
	movl	148(%rsp), %ebp
.L413:
	movl	108(%rsp), %eax
	movslq	%ebp, %rbp
	movl	%eax, (%rbx,%rbp,4)
	movl	136(%rsp), %ebp
	addl	$2, %ebp
	cmpl	%ebp, %r10d
	jl	.L408
	movl	8(%rbx,%r12,4), %eax
	movq	88(%rsp), %r14
	movl	%eax, 108(%rsp)
	leal	(%r11,%rax), %esi
.L415:
	movq	40(%rsp), %r9
	movl	20(%rsp), %r8d
	movl	%r11d, %edi
	movq	%r15, %rdx
	movq	8(%rsp), %rcx
	addl	(%r14), %edi
	movl	%r10d, 168(%rsp)
	movl	%ebp, 136(%rsp)
	subl	32(%rsp), %ebp
	movl	%r11d, 164(%rsp)
	movl	%esi, 148(%rsp)
	call	mainGtU
	movl	148(%rsp), %esi
	movl	164(%rsp), %r11d
	testb	%al, %al
	movl	168(%rsp), %r10d
	je	.L500
	movl	(%r14), %eax
	movq	80(%rsp), %rcx
	movl	%eax, (%r14,%rcx,4)
	addq	120(%rsp), %r14
	cmpl	%ebp, 60(%rsp)
	jle	.L415
	jmp	.L416
.L500:
	movl	136(%rsp), %ebp
.L416:
	movl	108(%rsp), %eax
	movslq	%ebp, %rbp
	addq	$12, 88(%rsp)
	addq	$3, %r12
	movl	%eax, (%rbx,%rbp,4)
	movq	40(%rsp), %rax
	cmpl	$0, (%rax)
	jns	.L418
	jmp	.L419
.L408:
	decq	72(%rsp)
	jmp	.L407
.L489:
	cmpl	$0, 48(%rsp)
	jne	.L443
.L419:
	movl	52(%rsp), %eax
	movl	144(%rsp), %esi
	leal	1(%rax,%rsi), %eax
	movl	%eax, 52(%rsp)
	movq	40(%rsp), %rax
	cmpl	$0, (%rax)
	jns	.L399
	jmp	.L376
.L402:
	movl	(%rsp), %eax
	movl	%r11d, %edi
	addl	%r10d, %eax
	sarl	%eax
	cltq
	addl	(%rbx,%rax,4), %edi
	movslq	%r10d, %rax
	movb	(%r15,%rdi), %cl
	movl	%r11d, %edi
	addl	(%rbx,%rax,4), %edi
	movslq	(%rsp), %rax
	movb	(%r15,%rdi), %r8b
	leaq	(%rbx,%rax,4), %rdx
	movq	%rax, 32(%rsp)
	movl	%r11d, %eax
	addl	(%rdx), %eax
	movb	(%r15,%rax), %al
	cmpb	%al, %r8b
	jnb	.L423
	movl	%eax, %edi
	movl	%r8d, %eax
	movl	%edi, %r8d
.L423:
	cmpb	%r8b, %cl
	jnb	.L424
	cmpb	%al, %cl
	cmovnb	%ecx, %eax
	movl	%eax, %r8d
.L424:
	movzbl	%r8b, %eax
	movl	%r10d, %edi
	movl	%r10d, %r8d
	movl	%eax, 60(%rsp)
	movl	(%rsp), %eax
	movl	%eax, %ecx
.L425:
	cmpl	%edi, %eax
	jg	.L426
	movl	(%rdx), %ebp
	leal	(%r11,%rbp), %r9d
	movzbl	(%r15,%r9), %r9d
	subl	60(%rsp), %r9d
	testl	%r9d, %r9d
	jne	.L427
	movslq	%ecx, %r9
	incl	%ecx
	leaq	(%rbx,%r9,4), %r9
	movl	(%r9), %r12d
	movl	%r12d, (%rdx)
	movl	%ebp, (%r9)
.L428:
	incl	%eax
	addq	$4, %rdx
	jmp	.L425
.L427:
	jle	.L428
	movslq	%edi, %r9
	leaq	(%rbx,%r9,4), %r9
.L429:
	movl	(%r9), %ebp
	decl	%edi
	leal	(%r11,%rbp), %r12d
	movzbl	(%r15,%r12), %r12d
	cmpl	60(%rsp), %r12d
	jne	.L430
	movslq	%r8d, %r12
	decl	%r8d
	leaq	(%rbx,%r12,4), %r12
	movl	(%r12), %esi
	movl	%esi, (%r9)
	movl	%ebp, (%r12)
.L431:
	subq	$4, %r9
	cmpl	%edi, %eax
	jle	.L429
	jmp	.L426
.L430:
	jns	.L431
	movl	(%rdx), %r12d
	movl	%ebp, (%rdx)
	movl	%r12d, (%r9)
	jmp	.L428
.L426:
	leal	1(%r11), %ebp
	cmpl	%r8d, %ecx
	jle	.L433
	movslq	48(%rsp), %rax
	movl	%r14d, 48(%rsp)
	movl	%ebp, 984(%rsp,%rax,4)
	jmp	.L434
.L433:
	movl	%eax, %r9d
	movl	%ecx, %edx
	subl	(%rsp), %edx
	subl	%ecx, %r9d
	cmpl	%edx, %r9d
	cmovle	%r9d, %edx
	movl	%eax, %r9d
	subl	%edx, %r9d
	addl	(%rsp), %edx
	movl	%edx, 60(%rsp)
	movslq	%r9d, %r9
.L435:
	movl	60(%rsp), %r12d
	subl	32(%rsp), %r12d
	testl	%r12d, %r12d
	jle	.L501
	movq	32(%rsp), %rsi
	movq	32(%rsp), %rdx
	incq	32(%rsp)
	movl	(%rbx,%rsi,4), %r12d
	movl	(%rbx,%r9,4), %esi
	movl	%esi, (%rbx,%rdx,4)
	movl	%r12d, (%rbx,%r9,4)
	incq	%r9
	jmp	.L435
.L501:
	movl	%r8d, %esi
	movl	%r10d, %edx
	subl	%edi, %esi
	movl	%r10d, %edi
	subl	%r8d, %edi
	movslq	%eax, %r8
	cmpl	%esi, %edi
	cmovg	%esi, %edi
	subl	%edi, %edx
	addl	%eax, %edi
	incl	%edx
	movslq	%edx, %rdx
.L437:
	movl	%edi, %r9d
	subl	%r8d, %r9d
	testl	%r9d, %r9d
	jle	.L502
	movl	(%rbx,%r8,4), %r9d
	movl	(%rbx,%rdx,4), %r12d
	movl	%r12d, (%rbx,%r8,4)
	incq	%r8
	movl	%r9d, (%rbx,%rdx,4)
	incq	%rdx
	jmp	.L437
.L502:
	addl	(%rsp), %eax
	movl	%r10d, %edi
	subl	%esi, %edi
	subl	%ecx, %eax
	leal	1(%rdi), %edx
	leal	-1(%rax), %ecx
	movl	%edi, %esi
	movl	%r10d, %edi
	movl	%ecx, %r8d
	subl	%edx, %edi
	subl	(%rsp), %r8d
	cmpl	%edi, %r8d
	jge	.L439
	movl	%ecx, %edi
	movl	%r10d, %ecx
	movl	%edi, %r10d
	movl	(%rsp), %edi
	movl	%edx, (%rsp)
	movl	%edi, %edx
.L439:
	movl	%r10d, %r9d
	movl	%esi, %r8d
	movl	%r11d, %edi
	subl	%edx, %r9d
	subl	%eax, %r8d
	cmpl	%r8d, %r9d
	jge	.L440
	movl	%r10d, %r8d
	movl	%esi, %r10d
	movl	%ebp, %edi
	movl	%r11d, %ebp
	movl	%r8d, %esi
	movl	%edx, %r8d
	movl	%eax, %edx
	movl	%r8d, %eax
.L440:
	movl	%r10d, %r8d
	movl	%ecx, %r9d
	subl	(%rsp), %r9d
	subl	%edx, %r8d
	cmpl	%r8d, %r9d
	jge	.L441
	movl	%r11d, %r8d
	movl	%edi, %r11d
	movl	%r8d, %edi
	movl	%ecx, %r8d
	movl	%r10d, %ecx
	movl	%r8d, %r10d
	movl	(%rsp), %r8d
	movl	%edx, (%rsp)
	movl	%r8d, %edx
.L441:
	movslq	48(%rsp), %r8
	movl	(%rsp), %r9d
	movl	%ecx, 584(%rsp,%r8,4)
	movslq	%r14d, %rcx
	movl	%r9d, 184(%rsp,%r8,4)
	movl	%edx, 184(%rsp,%rcx,4)
	leal	1(%r14), %edx
	movslq	%edx, %rdx
	movl	%r11d, 984(%rsp,%r8,4)
	movl	%eax, 184(%rsp,%rdx,4)
	leal	2(%r14), %eax
	movl	%r10d, 584(%rsp,%rcx,4)
	movl	%edi, 984(%rsp,%rcx,4)
	movl	%esi, 584(%rsp,%rdx,4)
	movl	%ebp, 984(%rsp,%rdx,4)
	movl	%eax, 48(%rsp)
.L434:
	cmpl	$99, 48(%rsp)
	jle	.L443
	movl	$1001, %edi
	jmp	.L491
.L443:
	movl	48(%rsp), %r14d
	jmp	.L401
.L399:
	movq	128(%rsp), %rax
	orl	$2097152, (%rax)
.L398:
	incl	56(%rsp)
	cmpl	$256, 56(%rsp)
	jne	.L444
	movslq	24(%rsp), %rax
	cmpb	$0, 4456(%rsp,%rax)
	je	.L445
	movl	$1006, %edi
.L491:
	call	BZ2_bz__AssertH__fail
.L445:
	leaq	0(%r13,%rax,4), %rcx
	xorl	%eax, %eax
	movq	%rcx, %rsi
.L446:
	movl	(%rsi), %edx
	addq	$1024, %rsi
	andl	$-2097153, %edx
	movl	%edx, 2408(%rsp,%rax)
	movl	-1020(%rsi), %edx
	andl	$-2097153, %edx
	decl	%edx
	movl	%edx, 3432(%rsp,%rax)
	addq	$4, %rax
	cmpq	$1024, %rax
	jne	.L446
	movslq	100(%rsp), %rax
	movslq	24(%rsp), %r8
	leaq	0(%r13,%rax,4), %r10
	movl	(%r10), %eax
	andl	$-2097153, %eax
	cltq
.L447:
	movl	2408(%rsp,%r8,4), %edi
	cmpl	%eax, %edi
	jle	.L503
	movl	(%rbx,%rax,4), %edx
	decl	%edx
	jns	.L448
	addl	20(%rsp), %edx
.L448:
	movslq	%edx, %rsi
	movzbl	(%r15,%rsi), %edi
	cmpb	$0, 4456(%rsp,%rdi)
	jne	.L449
	movslq	2408(%rsp,%rdi,4), %rsi
	leal	1(%rsi), %r9d
	movl	%edx, (%rbx,%rsi,4)
	movl	%r9d, 2408(%rsp,%rdi,4)
.L449:
	incq	%rax
	jmp	.L447
.L503:
	movl	24(%rsp), %eax
	movslq	24(%rsp), %r11
	incl	%eax
	sall	$8, %eax
	cltq
	leaq	0(%r13,%rax,4), %r9
	movl	(%r9), %eax
	andl	$-2097153, %eax
	decl	%eax
	cltq
.L451:
	movl	3432(%rsp,%r11,4), %edx
	cmpl	%eax, %edx
	jge	.L504
	movl	(%rbx,%rax,4), %edx
	decl	%edx
	jns	.L452
	addl	20(%rsp), %edx
.L452:
	movslq	%edx, %rsi
	movzbl	(%r15,%rsi), %r8d
	cmpb	$0, 4456(%rsp,%r8)
	jne	.L453
	movslq	3432(%rsp,%r8,4), %rsi
	leal	-1(%rsi), %ebp
	movl	%edx, (%rbx,%rsi,4)
	movl	%ebp, 3432(%rsp,%r8,4)
.L453:
	decq	%rax
	jmp	.L451
.L504:
	leal	-1(%rdi), %eax
	cmpl	%eax, %edx
	je	.L470
	testl	%edi, %edi
	jne	.L472
	cmpl	104(%rsp), %edx
	je	.L470
.L472:
	movl	$1007, %edi
	jmp	.L491
.L470:
	movl	$256, %eax
.L457:
	orl	$2097152, (%rcx)
	addq	$1024, %rcx
	decl	%eax
	jne	.L457
	cmpq	$255, 64(%rsp)
	movslq	24(%rsp), %rax
	movb	$1, 4456(%rsp,%rax)
	je	.L458
	movl	(%r10), %esi
	movl	(%r9), %eax
	xorl	%ecx, %ecx
	andl	$-2097153, %esi
	andl	$-2097153, %eax
	subl	%esi, %eax
.L459:
	movl	%eax, %edx
	sarl	%cl, %edx
	cmpl	$65534, %edx
	jle	.L505
	incl	%ecx
	jmp	.L459
.L505:
	leal	-1(%rax), %edx
	movslq	%esi, %rsi
	movslq	%edx, %rdi
	leaq	(%rbx,%rsi,4), %rsi
.L461:
	testl	%edi, %edi
	js	.L506
	movslq	(%rsi,%rdi,4), %r9
	movq	8(%rsp), %r14
	movl	%edi, %r8d
	sarl	%cl, %r8d
	movw	%r8w, (%r14,%r9,2)
	movq	%r9, %rax
	cmpl	$33, %r9d
	jg	.L462
	addl	20(%rsp), %eax
	cltq
	movw	%r8w, (%r14,%rax,2)
.L462:
	decq	%rdi
	jmp	.L461
.L506:
	movl	%edx, %eax
	sarl	%cl, %eax
	cmpl	$65535, %eax
	jle	.L458
	movl	$1002, %edi
	jmp	.L491
.L458:
	incq	64(%rsp)
	cmpq	$256, 64(%rsp)
	jne	.L464
	cmpl	$3, 96(%rsp)
	jle	.L376
	movq	4712(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L492
	movl	20(%rsp), %r9d
	movl	20(%rsp), %ecx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	52(%rsp), %r8d
	movq	stderr(%rip), %rdi
	leaq	.LC30(%rip), %rdx
	subl	52(%rsp), %r9d
	addq	$4728, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	__fprintf_chk@PLT
.L376:
	.cfi_restore_state
	movq	4712(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L466
.L492:
	call	__stack_chk_fail@PLT
.L466:
	addq	$4728, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE42:
	.size	mainSort, .-mainSort
	.section	.rodata.str1.1
.LC31:
	.string	"      %d work, %d block, ratio %5.2f\n"
.LC32:
	.string	"    too repetitive; using fallback sorting algorithm\n"
	.text
	.globl	BZ2_blockSort
	.type	BZ2_blockSort, @function
BZ2_blockSort:
.LFB43:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	108(%rdi), %r12d
	movq	56(%rdi), %r14
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	40(%rdi), %r13
	movl	656(%rdi), %r15d
	cmpl	$9999, %r12d
	jle	.L512
	xorl	%ecx, %ecx
	testb	$1, %r12b
	movl	$100, %eax
	movl	$1, %ebx
	setne	%cl
	movq	64(%rdi), %rsi
	movl	%r15d, %r9d
	movl	%r12d, %r8d
	addl	%r12d, %ecx
	addl	$34, %ecx
	cmpl	$100, 88(%rdi)
	cmovle	88(%rdi), %eax
	movl	$3, %edi
	testl	%eax, %eax
	cmovle	%ebx, %eax
	decl	%eax
	cltd
	idivl	%edi
	movslq	%ecx, %rdx
	movq	%r14, %rdi
	movq	%r13, %rcx
	addq	%rsi, %rdx
	imull	%r12d, %eax
	movl	%eax, 4(%rsp)
	movl	%eax, %ebx
	pushq	%rax
	.cfi_def_cfa_offset 88
	leaq	12(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 96
	call	mainSort
	popq	%rdx
	.cfi_def_cfa_offset 88
	popq	%rcx
	.cfi_def_cfa_offset 80
	cmpl	$2, %r15d
	jle	.L511
	subl	4(%rsp), %ebx
	cvtsi2ssl	%r12d, %xmm1
	movl	%r12d, %r8d
	movb	$1, %al
	cvtsi2ssl	%ebx, %xmm0
	movq	stderr(%rip), %rdi
	movl	%ebx, %ecx
	leaq	.LC31(%rip), %rdx
	movl	$1, %esi
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	__fprintf_chk@PLT
.L511:
	cmpl	$0, 4(%rsp)
	jns	.L509
	cmpl	$1, %r15d
	jle	.L512
	movq	stderr(%rip), %rsi
	leaq	.LC32(%rip), %rdi
	call	fputs@PLT
.L512:
	movq	32(%rbp), %rsi
	movq	24(%rbp), %rdi
	movl	%r15d, %r8d
	movl	%r12d, %ecx
	movq	%r13, %rdx
	call	fallbackSort
.L509:
	movl	$-1, 48(%rbp)
	movl	108(%rbp), %edx
	xorl	%eax, %eax
.L513:
	movl	%eax, %ecx
	cmpl	%eax, %edx
	jle	.L522
	incq	%rax
	cmpl	$0, -4(%r14,%rax,4)
	jne	.L513
	movl	%ecx, 48(%rbp)
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L515
	call	__stack_chk_fail@PLT
.L522:
	movl	$1003, %edi
	call	BZ2_bz__AssertH__fail
.L515:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE43:
	.size	BZ2_blockSort, .-BZ2_blockSort
	.section	.rodata.str1.1
.LC33:
	.string	"    block %d: crc = 0x%8x, combined CRC = 0x%8x, size = %d\n"
.LC34:
	.string	"      %d in block, %d after MTF & 1-2 coding, %d+2 syms in use\n"
.LC36:
	.string	"      initial group %d, [%d .. %d], has %d syms (%4.1f%%)\n"
.LC37:
	.string	"      pass %d: size is %d, grp uses are "
.LC38:
	.string	"%d "
.LC39:
	.string	"      bytes: mapping %d, "
.LC40:
	.string	"selectors %d, "
.LC41:
	.string	"code lengths %d, "
.LC42:
	.string	"codes %d\n"
.LC43:
	.string	"    final combined CRC = 0x%x\n   "
	.text
	.globl	BZ2_compressBlock
	.type	BZ2_compressBlock, @function
BZ2_compressBlock:
.LFB55:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$376, %rsp
	.cfi_def_cfa_offset 432
	movl	%esi, 56(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 360(%rsp)
	xorl	%eax, %eax
	movl	108(%rdi), %eax
	testl	%eax, %eax
	jle	.L524
	movl	648(%rdi), %r8d
	movl	652(%rdi), %r9d
	movl	660(%rdi), %ecx
	notl	%r8d
	roll	%r9d
	xorl	%r8d, %r9d
	movl	%r8d, 648(%rdi)
	movl	%r9d, 652(%rdi)
	cmpl	$1, %ecx
	jle	.L525
	movl	$0, 116(%rdi)
.L525:
	cmpl	$1, 656(%rbx)
	jle	.L526
	pushq	%rsi
	.cfi_def_cfa_offset 440
	movq	stderr(%rip), %rdi
	leaq	.LC33(%rip), %rdx
	movl	$1, %esi
	pushq	%rax
	.cfi_def_cfa_offset 448
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	popq	%rdi
	.cfi_def_cfa_offset 440
	popq	%r8
	.cfi_def_cfa_offset 432
.L526:
	movq	%rbx, %rdi
	call	BZ2_blockSort
.L524:
	movslq	108(%rbx), %rax
	addq	32(%rbx), %rax
	cmpl	$1, 660(%rbx)
	movq	%rax, 80(%rbx)
	jne	.L527
	movq	$0, 640(%rbx)
	movq	%rbx, %rdi
	movl	$66, %esi
	call	bsPutUChar
	movl	$90, %esi
	call	bsPutUChar
	movl	$104, %esi
	call	bsPutUChar
	movb	664(%rbx), %al
	leal	48(%rax), %esi
	movzbl	%sil, %esi
	call	bsPutUChar
.L527:
	cmpl	$0, 108(%rbx)
	jle	.L528
	movq	%rbx, %rdi
	movl	$49, %esi
	call	bsPutUChar
	movl	$65, %esi
	call	bsPutUChar
	movl	$89, %esi
	call	bsPutUChar
	movl	$38, %esi
	call	bsPutUChar
	movl	$83, %esi
	call	bsPutUChar
	movl	$89, %esi
	call	bsPutUChar
	movl	648(%rbx), %esi
	call	bsPutUInt32
	xorl	%edx, %edx
	movl	$1, %esi
	call	bsW
	movl	48(%rbx), %edx
	movl	$24, %esi
	call	bsW
	movq	56(%rbx), %rdi
	movq	64(%rbx), %r10
	xorl	%eax, %eax
	movl	$0, 124(%rbx)
	movq	72(%rbx), %rbp
.L530:
	cmpb	$0, 128(%rbx,%rax)
	je	.L529
	movl	124(%rbx), %edx
	movb	%dl, 384(%rbx,%rax)
	incl	%edx
	movl	%edx, 124(%rbx)
.L529:
	incq	%rax
	cmpq	$256, %rax
	jne	.L530
	movl	124(%rbx), %r9d
	xorl	%eax, %eax
	leal	1(%r9), %esi
.L531:
	cmpl	%eax, %esi
	jl	.L695
	movl	$0, 672(%rbx,%rax,4)
	incq	%rax
	jmp	.L531
.L695:
	xorl	%eax, %eax
.L533:
	cmpl	%eax, %r9d
	jle	.L696
	movb	%al, 104(%rsp,%rax)
	incq	%rax
	jmp	.L533
.L696:
	movl	108(%rbx), %ecx
	xorl	%edx, %edx
	xorl	%r8d, %r8d
	xorl	%eax, %eax
	leaq	104(%rsp), %r11
.L535:
	cmpl	%edx, %ecx
	jle	.L697
	movl	(%rdi,%rdx,4), %r12d
	decl	%r12d
	jns	.L536
	addl	%ecx, %r12d
.L536:
	movslq	%r12d, %r12
	movzbl	(%r10,%r12), %r12d
	movb	384(%rbx,%r12), %r12b
	cmpb	104(%rsp), %r12b
	jne	.L537
	incl	%eax
	jmp	.L538
.L537:
	testl	%eax, %eax
	je	.L539
	decl	%eax
	movslq	%r8d, %r13
.L542:
	leal	1(%r13), %r8d
	testb	$1, %al
	je	.L540
	movw	$1, 0(%rbp,%r13,2)
	incl	676(%rbx)
	jmp	.L541
.L540:
	movw	$0, 0(%rbp,%r13,2)
	incl	672(%rbx)
.L541:
	incq	%r13
	cmpl	$1, %eax
	jle	.L539
	subl	$2, %eax
	sarl	%eax
	jmp	.L542
.L539:
	movb	104(%rsp), %al
	movb	105(%rsp), %r13b
	movb	%al, 105(%rsp)
	leaq	105(%rsp), %rax
.L543:
	cmpb	%r13b, %r12b
	je	.L698
	movb	1(%rax), %r14b
	incq	%rax
	movb	%r13b, (%rax)
	movl	%r14d, %r13d
	jmp	.L543
.L698:
	subq	%r11, %rax
	movb	%r12b, 104(%rsp)
	movslq	%r8d, %r12
	incl	%r8d
	leal	1(%rax), %r13d
	cltq
	movw	%r13w, 0(%rbp,%r12,2)
	incl	676(%rbx,%rax,4)
	xorl	%eax, %eax
.L538:
	incq	%rdx
	jmp	.L535
.L697:
	testl	%eax, %eax
	je	.L546
	decl	%eax
	movslq	%r8d, %rdx
.L549:
	leal	1(%rdx), %r8d
	testb	$1, %al
	je	.L547
	movw	$1, 0(%rbp,%rdx,2)
	incl	676(%rbx)
	jmp	.L548
.L547:
	movw	$0, 0(%rbp,%rdx,2)
	incl	672(%rbx)
.L548:
	incq	%rdx
	cmpl	$1, %eax
	jle	.L546
	subl	$2, %eax
	sarl	%eax
	jmp	.L549
.L546:
	movslq	%r8d, %rax
	incl	%r8d
	movw	%si, 0(%rbp,%rax,2)
	movslq	%r9d, %rax
	incl	676(%rbx,%rax,4)
	cmpl	$2, 656(%rbx)
	movl	%r8d, 668(%rbx)
	jle	.L550
	movq	stderr(%rip), %rdi
	leaq	.LC34(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
.L550:
	movl	124(%rbx), %r11d
	movq	%rbx, 24(%rsp)
	leaq	1548(%rbx), %rcx
	movq	%rbx, %rdx
	leal	2(%r11), %eax
	movl	%eax, 4(%rsp)
.L551:
	xorl	%eax, %eax
.L554:
	cmpl	%eax, 4(%rsp)
	jle	.L699
	movb	$15, 37708(%rdx,%rax)
	incq	%rax
	jmp	.L554
.L699:
	addq	$258, %rdx
	cmpq	%rdx, %rcx
	jne	.L551
	movl	668(%rbx), %r13d
	movl	$3001, %edi
	testl	%r13d, %r13d
	jle	.L694
	movl	$2, %r14d
	cmpl	$199, %r13d
	jle	.L556
	movl	$3, %r14d
	cmpl	$599, %r13d
	jle	.L556
	movl	$4, %r14d
	cmpl	$1199, %r13d
	jle	.L556
	xorl	%r14d, %r14d
	cmpl	$2400, %r13d
	setge	%r14b
	addl	$5, %r14d
.L556:
	movslq	%r14d, %r10
	movl	%r14d, %r12d
	xorl	%r8d, %r8d
	imulq	$258, %r10, %r10
	addq	%rbx, %r10
.L566:
	movl	%r13d, %eax
	xorl	%r15d, %r15d
	leal	1(%r11), %ecx
	cltd
	idivl	%r12d
	leal	-1(%r8), %edx
	movslq	%edx, %rdx
.L557:
	movl	%edx, %r9d
	cmpl	%r15d, %eax
	jle	.L558
	cmpl	%edx, %ecx
	jle	.L558
	addl	676(%rbx,%rdx,4), %r15d
	incq	%rdx
	jmp	.L557
.L558:
	cmpl	%r8d, %r9d
	setg	%dl
	cmpl	%r12d, %r14d
	setne	%al
	testb	%al, %dl
	je	.L560
	cmpl	$1, %r12d
	je	.L560
	movl	%r14d, %eax
	subl	%r12d, %eax
	testb	$1, %al
	je	.L560
	movslq	%r9d, %rax
	decl	%r9d
	subl	672(%rbx,%rax,4), %r15d
.L560:
	cmpl	$2, 656(%rbx)
	jle	.L561
	cvtsi2ssl	%r15d, %xmm0
	movq	%r10, 32(%rsp)
	movl	%r12d, %ecx
	movl	$1, %esi
	cvtsi2ssl	668(%rbx), %xmm1
	movl	%r11d, 16(%rsp)
	leaq	.LC36(%rip), %rdx
	pushq	%rax
	.cfi_def_cfa_offset 440
	movq	stderr(%rip), %rdi
	movb	$1, %al
	pushq	%r15
	.cfi_def_cfa_offset 448
	cvtss2sd	%xmm0, %xmm0
	mulsd	.LC35(%rip), %xmm0
	cvtss2sd	%xmm1, %xmm1
	movl	%r9d, 28(%rsp)
	movl	%r8d, 24(%rsp)
	divsd	%xmm1, %xmm0
	call	__fprintf_chk@PLT
	popq	%rdx
	.cfi_def_cfa_offset 440
	popq	%rcx
	.cfi_def_cfa_offset 432
	movq	32(%rsp), %r10
	movl	16(%rsp), %r11d
	movl	12(%rsp), %r9d
	movl	8(%rsp), %r8d
.L561:
	movq	%r10, %rdx
	xorl	%eax, %eax
.L562:
	cmpl	%eax, 4(%rsp)
	jle	.L700
	cmpl	%r8d, %eax
	jl	.L563
	cmpl	%eax, %r9d
	jl	.L563
	movb	$0, 37450(%rdx)
	jmp	.L564
.L563:
	movb	$15, 37450(%rdx)
.L564:
	incl	%eax
	incq	%rdx
	jmp	.L562
.L700:
	leal	1(%r9), %r8d
	subl	%r15d, %r13d
	subq	$258, %r10
	decl	%r12d
	jne	.L566
	movl	$0, 16(%rsp)
.L567:
	xorl	%eax, %eax
.L568:
	movl	$0, 80(%rsp,%rax,4)
	incq	%rax
	cmpl	%eax, %r14d
	jg	.L568
	movl	$0, 8(%rsp)
	movq	%rbx, %rdx
.L569:
	xorl	%eax, %eax
.L572:
	cmpl	%eax, 4(%rsp)
	jle	.L701
	movl	$0, 45448(%rdx,%rax,4)
	incq	%rax
	jmp	.L572
.L701:
	movl	8(%rsp), %eax
	addq	$1032, %rdx
	leal	1(%rax), %r13d
	cmpl	%r13d, %r14d
	je	.L571
	movl	%r13d, 8(%rsp)
	jmp	.L569
.L571:
	cmpl	$6, %r14d
	jne	.L573
	leaq	51640(%rbx), %rdx
	xorl	%eax, %eax
	jmp	.L574
.L573:
	movl	668(%rbx), %r11d
	movl	$0, 32(%rsp)
	xorl	%esi, %esi
	xorl	%r15d, %r15d
	leal	-1(%r11), %eax
	movl	%eax, 40(%rsp)
	jmp	.L575
.L574:
	cmpl	%eax, 4(%rsp)
	jle	.L573
	movzbl	37966(%rbx,%rax), %ecx
	movzbl	37708(%rbx,%rax), %esi
	addq	$16, %rdx
	sall	$16, %ecx
	orl	%esi, %ecx
	movl	%ecx, -16(%rdx)
	movzbl	38482(%rbx,%rax), %ecx
	movzbl	38224(%rbx,%rax), %esi
	sall	$16, %ecx
	orl	%esi, %ecx
	movl	%ecx, -12(%rdx)
	movzbl	38998(%rbx,%rax), %ecx
	movzbl	38740(%rbx,%rax), %esi
	incq	%rax
	sall	$16, %ecx
	orl	%esi, %ecx
	movl	%ecx, -8(%rdx)
	jmp	.L574
.L579:
	movw	$0, 68(%rsp,%rax,2)
	incq	%rax
	cmpl	%eax, %r13d
	jg	.L579
	cmpl	$6, %r13d
	movslq	%esi, %rax
	jne	.L583
	movl	%edi, %edx
	subl	%esi, %edx
	cmpl	$49, %edx
	jne	.L583
	movzwl	2(%rbp,%rax,2), %r10d
	movzwl	4(%rbp,%rax,2), %edx
	leaq	(%rax,%rax), %rcx
	movzwl	0(%rbp,%rcx), %r9d
	movq	%r10, %r8
	movq	%rdx, %rax
	salq	$4, %r10
	salq	$4, %r8
	salq	$4, %rax
	addq	%rbx, %r10
	movl	51640(%rax,%rbx), %eax
	salq	$4, %rdx
	addl	51640(%rbx,%r8), %eax
	movq	%r9, %r8
	salq	$4, %r9
	salq	$4, %r8
	addq	%rbx, %rdx
	addq	%rbx, %r9
	addl	51640(%rbx,%r8), %eax
	movl	51644(%rdx), %r8d
	movl	51648(%rdx), %edx
	addl	51644(%r10), %r8d
	addl	51648(%r10), %edx
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	6(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	8(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	10(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	12(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	14(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	16(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	18(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	20(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	22(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	24(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	26(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	28(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	30(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	32(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	34(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	36(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	38(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	40(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	42(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	44(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	46(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	48(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51648(%r9), %edx
	addl	51644(%r9), %r8d
	movzwl	50(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	52(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	54(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	56(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	58(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	60(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	62(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	64(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	66(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	68(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	70(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	72(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	74(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	76(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	78(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	80(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	82(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	84(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	86(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	88(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	90(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	92(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	94(%rbp,%rcx), %r9d
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movzwl	96(%rbp,%rcx), %r9d
	movzwl	98(%rbp,%rcx), %ecx
	movq	%r9, %r10
	salq	$4, %r10
	movq	%r10, %r9
	addl	51640(%rbx,%r10), %eax
	addq	%rbx, %r9
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movq	%rcx, %r9
	salq	$4, %rcx
	salq	$4, %r9
	addl	51640(%rbx,%rcx), %eax
	addq	%rbx, %r9
	movl	%eax, 68(%rsp)
	addl	51644(%r9), %r8d
	addl	51648(%r9), %edx
	movl	%r8d, 72(%rsp)
	movl	%edx, 76(%rsp)
.L581:
	xorl	%edx, %edx
	orq	$-1, %rax
	leaq	68(%rsp), %r9
	movl	$999999999, %ecx
.L586:
	movzwl	(%r9,%rdx,2), %r8d
	cmpl	%ecx, %r8d
	jge	.L585
	movl	%r8d, %ecx
	movslq	%edx, %rax
.L585:
	incq	%rdx
	cmpl	%edx, %r13d
	jg	.L586
	addl	%ecx, 32(%rsp)
	movslq	%eax, %rcx
	movslq	%esi, %rdx
	incl	80(%rsp,%rcx,4)
	cmpl	$6, %r13d
	movb	%al, 1704(%rbx,%r15)
	jne	.L587
	movl	%edi, %r8d
	subl	%esi, %r8d
	cmpl	$49, %r8d
	jne	.L587
	addq	%rdx, %rdx
	imulq	$258, %rcx, %rcx
	movzwl	0(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	2(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	4(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	6(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	8(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	10(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	12(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	14(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	16(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	18(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	20(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	22(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	24(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	26(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	28(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	30(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	32(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	34(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	36(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	38(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	40(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	42(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	44(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	46(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	48(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	50(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	52(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	54(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	56(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	58(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	60(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	62(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	64(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	66(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	68(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	70(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	72(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	74(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	76(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	78(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	80(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	82(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	84(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	86(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	88(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	90(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	92(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	94(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	96(%rbp,%rdx), %eax
	addq	%rcx, %rax
	incl	45448(%rbx,%rax,4)
	movzwl	98(%rbp,%rdx), %eax
	addq	%rax, %rcx
	incl	45448(%rbx,%rcx,4)
.L588:
	leal	1(%rdi), %esi
	incq	%r15
.L575:
	movl	%r15d, 12(%rsp)
	cmpl	%esi, %r11d
	jle	.L577
	leal	49(%rsi), %edi
	cmpl	%edi, %r11d
	cmovle	40(%rsp), %edi
	xorl	%eax, %eax
	jmp	.L579
.L582:
	movzbl	37708(%rcx), %r8d
	addw	%r8w, 68(%rsp,%rdx,2)
	incq	%rdx
	addq	$258, %rcx
	cmpl	%edx, %r13d
	jg	.L582
	incq	%rax
.L583:
	cmpl	%eax, %edi
	jl	.L581
	movzwl	0(%rbp,%rax,2), %ecx
	xorl	%edx, %edx
	addq	%rbx, %rcx
	jmp	.L582
.L587:
	imulq	$258, %rax, %rax
.L589:
	cmpl	%edx, %edi
	jl	.L588
	movzwl	0(%rbp,%rdx,2), %ecx
	incq	%rdx
	addq	%rax, %rcx
	incl	45448(%rbx,%rcx,4)
	jmp	.L589
.L577:
	incl	16(%rsp)
	cmpl	$2, 656(%rbx)
	jle	.L591
	movl	32(%rsp), %r8d
	movl	16(%rsp), %ecx
	movl	$1, %esi
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	leaq	.LC37(%rip), %rdx
	sarl	$3, %r8d
	call	__fprintf_chk@PLT
	xorl	%r8d, %r8d
.L592:
	movl	80(%rsp,%r8,4), %ecx
	movq	stderr(%rip), %rdi
	leaq	.LC38(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movq	%r8, 32(%rsp)
	call	__fprintf_chk@PLT
	movq	32(%rsp), %r8
	incq	%r8
	cmpl	%r8d, %r13d
	jg	.L592
	movq	stderr(%rip), %rsi
	movl	$10, %edi
	call	fputc@PLT
.L591:
	leaq	37708(%rbx), %rax
	leaq	45448(%rbx), %rsi
	xorl	%r8d, %r8d
	movq	%rax, %rdi
.L593:
	movl	4(%rsp), %edx
	movl	$20, %ecx
	movl	%r8d, 60(%rsp)
	movq	%rax, 48(%rsp)
	movq	%rsi, 40(%rsp)
	movq	%rdi, 32(%rsp)
	call	BZ2_hbMakeCodeLengths
	movl	60(%rsp), %r8d
	movq	32(%rsp), %rdi
	movq	40(%rsp), %rsi
	movq	48(%rsp), %rax
	movl	%r8d, %edx
	addq	$258, %rdi
	incl	%r8d
	addq	$1032, %rsi
	cmpl	%edx, 8(%rsp)
	jne	.L593
	cmpl	$4, 16(%rsp)
	jne	.L567
	xorl	%edx, %edx
.L594:
	movb	%dl, 104(%rsp,%rdx)
	incq	%rdx
	cmpl	%edx, %r13d
	jg	.L594
	movb	104(%rsp), %sil
	xorl	%edx, %edx
.L595:
	cmpl	%edx, 12(%rsp)
	jle	.L702
	movb	1704(%rbx,%rdx), %dil
	xorl	%ecx, %ecx
.L596:
	leaq	1(%rcx), %r8
	cmpb	%sil, %dil
	je	.L703
	movb	105(%rsp,%rcx), %r9b
	movb	%sil, 105(%rsp,%rcx)
	movq	%r8, %rcx
	movl	%r9d, %esi
	jmp	.L596
.L703:
	movb	%cl, 19706(%rbx,%rdx)
	incq	%rdx
	jmp	.L595
.L702:
	leaq	39256(%rbx), %rdi
	xorl	%r11d, %r11d
	jmp	.L599
.L704:
	cmpl	$20, %ecx
	jle	.L601
	movl	$3004, %edi
.L694:
	call	BZ2_bz__AssertH__fail
.L602:
	movl	4(%rsp), %r8d
	movq	%rax, %rsi
	movq	%rax, 16(%rsp)
	call	BZ2_hbAssignCodes
	movq	16(%rsp), %rax
	leal	1(%r11), %edx
	addq	$1032, %rdi
	addq	$258, %rax
	cmpl	%r11d, 8(%rsp)
	je	.L603
	movl	%edx, %r11d
.L599:
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	leaq	-37708(%rax), %r9
	movl	$32, %edx
.L604:
	cmpl	%esi, 4(%rsp)
	jle	.L704
	movzbl	37708(%r9,%rsi), %r8d
	cmpl	%r8d, %ecx
	cmovl	%r8d, %ecx
	cmpl	%r8d, %edx
	cmovg	%r8d, %edx
	incq	%rsi
	jmp	.L604
.L601:
	testl	%edx, %edx
	jne	.L602
	movl	$3005, %edi
	jmp	.L694
.L603:
	leaq	104(%rsp), %rax
	movq	%rbx, %rsi
	xorl	%ecx, %ecx
	movq	%rax, %r11
.L607:
	movb	$0, (%rax)
	xorl	%edx, %edx
.L606:
	cmpb	$0, 128(%rsi,%rdx)
	je	.L605
	movb	$1, (%rax)
.L605:
	incq	%rdx
	cmpq	$16, %rdx
	jne	.L606
	addl	$16, %ecx
	incq	%rax
	addq	$16, %rsi
	cmpl	$256, %ecx
	jne	.L607
	movl	116(%rbx), %eax
	xorl	%r9d, %r9d
	movl	%eax, 16(%rsp)
.L610:
	cmpb	$0, (%r11,%r9)
	movl	$1, %edx
	jne	.L692
	xorl	%edx, %edx
.L692:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	bsW
	incq	%r9
	cmpq	$16, %r9
	jne	.L610
	xorl	%r14d, %r14d
.L612:
	cmpb	$0, (%r11,%r14)
	jne	.L611
.L617:
	incq	%r14
	cmpq	$16, %r14
	jne	.L612
	jmp	.L705
.L611:
	movq	%r14, %r10
	xorl	%r9d, %r9d
	salq	$4, %r10
	addq	%rbx, %r10
.L616:
	cmpb	$0, 128(%r10,%r9)
	movl	$1, %edx
	jne	.L693
	xorl	%edx, %edx
.L693:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	bsW
	incq	%r9
	cmpq	$16, %r9
	jne	.L616
	jmp	.L617
.L705:
	cmpl	$2, 656(%rbx)
	jle	.L618
	movq	stderr(%rip), %rdi
	movl	116(%rbx), %ecx
	movl	$1, %esi
	xorl	%eax, %eax
	subl	16(%rsp), %ecx
	leaq	.LC39(%rip), %rdx
	call	__fprintf_chk@PLT
.L618:
	movl	%r13d, %edx
	movl	$3, %esi
	movq	%rbx, %rdi
	movl	116(%rbx), %r9d
	call	bsW
	movl	%r15d, %edx
	movl	$15, %esi
	call	bsW
	xorl	%r10d, %r10d
.L619:
	cmpl	%r10d, 12(%rsp)
	jle	.L706
	xorl	%r11d, %r11d
.L621:
	movzbl	19706(%rbx,%r10), %eax
	cmpl	%eax, %r11d
	jge	.L707
	movl	$1, %edx
	movl	$1, %esi
	movq	%rbx, %rdi
	call	bsW
	incl	%r11d
	jmp	.L621
.L707:
	xorl	%edx, %edx
	movl	$1, %esi
	movq	%rbx, %rdi
	call	bsW
	incq	%r10
	jmp	.L619
.L706:
	cmpl	$2, 656(%rbx)
	jle	.L622
	movl	116(%rbx), %ecx
	movq	stderr(%rip), %rdi
	leaq	.LC40(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	subl	%r9d, %ecx
	call	__fprintf_chk@PLT
.L622:
	movl	116(%rbx), %r15d
	xorl	%r11d, %r11d
.L628:
	movq	24(%rsp), %rax
	movl	$5, %esi
	movq	%rbx, %rdi
	xorl	%r14d, %r14d
	movzbl	37708(%rax), %r9d
	movl	%r9d, %edx
	call	bsW
	movq	24(%rsp), %r10
.L623:
	cmpl	%r14d, 4(%rsp)
	jle	.L708
.L627:
	movzbl	37708(%r10), %eax
	cmpl	%eax, %r9d
	jge	.L625
	movl	$2, %edx
	movl	$2, %esi
	movq	%rbx, %rdi
	call	bsW
	incl	%r9d
	jmp	.L627
.L625:
	movzbl	37708(%r10), %eax
	cmpl	%eax, %r9d
	jle	.L709
	movl	$3, %edx
	movl	$2, %esi
	movq	%rbx, %rdi
	call	bsW
	decl	%r9d
	jmp	.L625
.L709:
	xorl	%edx, %edx
	movl	$1, %esi
	movq	%rbx, %rdi
	incl	%r14d
	call	bsW
	incq	%r10
	jmp	.L623
.L708:
	addq	$258, 24(%rsp)
	leal	1(%r11), %eax
	cmpl	%r11d, 8(%rsp)
	je	.L710
	movl	%eax, %r11d
	jmp	.L628
.L710:
	cmpl	$2, 656(%rbx)
	jle	.L629
	movl	116(%rbx), %ecx
	movq	stderr(%rip), %rdi
	leaq	.LC41(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	subl	%r15d, %ecx
	call	__fprintf_chk@PLT
.L629:
	movl	116(%rbx), %r14d
	xorl	%r15d, %r15d
.L637:
	movl	668(%rbx), %eax
	cmpl	%r12d, %eax
	jle	.L630
	leal	49(%r12), %r11d
	cmpl	%r11d, %eax
	jg	.L631
	leal	-1(%rax), %r11d
.L631:
	movzbl	1704(%rbx,%r15), %edx
	movq	%rdx, %rax
	cmpl	%edx, %r13d
	jg	.L632
	movl	$3006, %edi
	jmp	.L694
.L632:
	cmpl	$6, %r13d
	movslq	%r12d, %r9
	jne	.L635
	movl	%r11d, %edx
	subl	%r12d, %edx
	cmpl	$49, %edx
	jne	.L635
	imulq	$258, %rax, %rdx
	addq	%r9, %r9
	movq	%rbx, %rdi
	imulq	$1032, %rax, %rax
	leaq	37708(%rbx,%rdx), %r10
	leaq	39256(%rbx,%rax), %r12
	movzwl	0(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	2(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	4(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	6(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	8(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	10(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	12(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	14(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	16(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	18(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	20(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	22(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	24(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	26(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	28(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	30(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	32(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	34(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	36(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	38(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	40(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	42(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	44(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	46(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	48(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	50(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	52(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	54(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	56(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	58(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	60(%rbp,%r9), %eax
	movl	(%r12,%rax,4), %edx
	movzbl	(%r10,%rax), %esi
	call	bsW
	movzwl	62(%rbp,%r9), %eax
	movl	(%r12,%rax,4), %edx
	movzbl	(%r10,%rax), %esi
	call	bsW
	movzwl	64(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	66(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	68(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	70(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	72(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	74(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	76(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	78(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	80(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	82(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	84(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	86(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	88(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	90(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	92(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	94(%rbp,%r9), %eax
	movzbl	(%r10,%rax), %esi
	movl	(%r12,%rax,4), %edx
	call	bsW
	movzwl	96(%rbp,%r9), %eax
	movl	(%r12,%rax,4), %edx
	movzbl	(%r10,%rax), %esi
	call	bsW
	movzwl	98(%rbp,%r9), %eax
	movl	(%r12,%rax,4), %edx
	movzbl	(%r10,%rax), %esi
	call	bsW
	jmp	.L634
.L635:
	cmpl	%r9d, %r11d
	jl	.L634
	movzbl	1704(%rbx,%r15), %eax
	movzwl	0(%rbp,%r9,2), %edx
	movq	%rbx, %rdi
	imulq	$258, %rax, %rax
	leaq	9812(%rdx,%rax), %rcx
	addq	%rbx, %rax
	movl	8(%rbx,%rcx,4), %r8d
	movzbl	37708(%rdx,%rax), %esi
	movl	%r8d, %edx
	call	bsW
	incq	%r9
	jmp	.L635
.L634:
	leal	1(%r11), %r12d
	incq	%r15
	jmp	.L637
.L630:
	movl	$3007, %edi
	cmpl	%r15d, 12(%rsp)
	jne	.L694
	cmpl	$2, 656(%rbx)
	jle	.L528
	movl	116(%rbx), %ecx
	movq	stderr(%rip), %rdi
	leaq	.LC42(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	subl	%r14d, %ecx
	call	__fprintf_chk@PLT
.L528:
	cmpb	$0, 56(%rsp)
	je	.L523
	movq	%rbx, %rdi
	movl	$23, %esi
	call	bsPutUChar
	movl	$114, %esi
	call	bsPutUChar
	movl	$69, %esi
	call	bsPutUChar
	movl	$56, %esi
	call	bsPutUChar
	movl	$80, %esi
	call	bsPutUChar
	movl	$144, %esi
	call	bsPutUChar
	movl	652(%rbx), %esi
	call	bsPutUInt32
	cmpl	$1, 656(%rbx)
	jle	.L642
	movl	652(%rbx), %ecx
	movq	stderr(%rip), %rdi
	leaq	.LC43(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
.L642:
	cmpl	$0, 644(%rbx)
	jle	.L523
	movslq	116(%rbx), %rax
	movzbl	643(%rbx), %ecx
	movq	80(%rbx), %rdx
	movb	%cl, (%rdx,%rax)
	incl	116(%rbx)
	subl	$8, 644(%rbx)
	sall	$8, 640(%rbx)
	jmp	.L642
.L523:
	movq	360(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L645
	call	__stack_chk_fail@PLT
.L645:
	addq	$376, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE55:
	.size	BZ2_compressBlock, .-BZ2_compressBlock
	.type	handle_compress.isra.0, @function
handle_compress.isra.0:
.LFB166:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	BZ2_crc32Table(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	pushq	%rcx
	.cfi_def_cfa_offset 48
.L712:
	cmpl	$1, 12(%rbx)
	jne	.L713
	xorl	%ecx, %ecx
.L715:
	movq	(%rbx), %rsi
	movslq	120(%rbx), %rax
	movl	116(%rbx), %edx
	cmpl	$0, 32(%rsi)
	je	.L714
	cmpl	%edx, %eax
	jge	.L714
	movq	80(%rbx), %rcx
	movq	24(%rsi), %rdx
	movb	(%rcx,%rax), %al
	movb	$1, %cl
	movb	%al, (%rdx)
	movq	(%rbx), %rax
	incl	120(%rbx)
	movl	36(%rax), %edi
	decl	32(%rax)
	incq	24(%rax)
	leal	1(%rdi), %edx
	movl	%edx, 36(%rax)
	testl	%edx, %edx
	jne	.L715
	incl	40(%rax)
	jmp	.L715
.L714:
	orl	%ecx, %ebp
	cmpl	%edx, %eax
	jl	.L717
	movl	8(%rbx), %edx
	cmpl	$4, %edx
	jne	.L718
	cmpl	$0, 16(%rbx)
	jne	.L718
	cmpl	$255, 92(%rbx)
	ja	.L717
	cmpl	$0, 96(%rbx)
	jle	.L717
.L718:
	movl	$0, 108(%rbx)
	xorl	%eax, %eax
	movq	$0, 116(%rbx)
	movl	$-1, 648(%rbx)
.L719:
	movb	$0, 128(%rbx,%rax)
	incq	%rax
	cmpq	$256, %rax
	jne	.L719
	incl	660(%rbx)
	movl	$2, 12(%rbx)
	cmpl	$3, %edx
	jne	.L713
	cmpl	$0, 16(%rbx)
	jne	.L713
	cmpl	$255, 92(%rbx)
	ja	.L717
	cmpl	$0, 96(%rbx)
	jle	.L717
.L713:
	cmpl	$2, 12(%rbx)
	jne	.L712
	xorl	%ecx, %ecx
	cmpl	$2, 8(%rbx)
	jne	.L721
.L729:
	movslq	108(%rbx), %rsi
	cmpl	112(%rbx), %esi
	jge	.L722
	movq	(%rbx), %rax
	cmpl	$0, 8(%rax)
	je	.L722
	movq	(%rax), %rax
	movl	92(%rbx), %edx
	movzbl	(%rax), %r11d
	movl	96(%rbx), %eax
	cmpl	%edx, %r11d
	je	.L723
	decl	%eax
	jne	.L724
	movl	648(%rbx), %eax
	movl	%eax, %ecx
	sall	$8, %eax
	shrl	$24, %ecx
	xorl	%edx, %ecx
	movzbl	%cl, %ecx
	xorl	0(%r13,%rcx,4), %eax
	movl	%eax, 648(%rbx)
	movl	%edx, %eax
	movb	$1, 128(%rbx,%rax)
	movq	64(%rbx), %rax
	movb	%dl, (%rax,%rsi)
	movl	%r11d, 92(%rbx)
	incl	108(%rbx)
	jmp	.L725
.L723:
	cmpl	$255, %eax
	jne	.L752
	jmp	.L726
.L724:
	cmpl	$255, %edx
	ja	.L728
.L726:
	movq	%rbx, %rdi
	call	add_pair_to_block
.L728:
	movl	%r11d, 92(%rbx)
	movl	$1, 96(%rbx)
	jmp	.L725
.L752:
	incl	%eax
	movl	%eax, 96(%rbx)
.L725:
	movq	(%rbx), %rax
	movb	$1, %cl
	movl	12(%rax), %edi
	incq	(%rax)
	decl	8(%rax)
	leal	1(%rdi), %edx
	movl	%edx, 12(%rax)
	testl	%edx, %edx
	jne	.L729
	incl	16(%rax)
	jmp	.L729
.L756:
	movq	(%rbx), %rax
	cmpl	$0, 8(%rax)
	je	.L722
	cmpl	$0, 16(%rbx)
	je	.L722
	movq	(%rax), %rax
	movl	92(%rbx), %edx
	movzbl	(%rax), %r11d
	movl	96(%rbx), %eax
	cmpl	%edx, %r11d
	je	.L731
	decl	%eax
	jne	.L732
	movl	648(%rbx), %eax
	movl	%eax, %ecx
	sall	$8, %eax
	shrl	$24, %ecx
	xorl	%edx, %ecx
	movzbl	%cl, %ecx
	xorl	0(%r13,%rcx,4), %eax
	movl	%eax, 648(%rbx)
	movl	%edx, %eax
	movb	$1, 128(%rbx,%rax)
	movq	64(%rbx), %rax
	movb	%dl, (%rax,%rsi)
	incl	108(%rbx)
	movl	%r11d, 92(%rbx)
.L733:
	movq	(%rbx), %rax
	incq	(%rax)
	decl	8(%rax)
	incl	12(%rax)
	jne	.L737
	incl	16(%rax)
.L737:
	decl	16(%rbx)
	movb	$1, %cl
.L721:
	movslq	108(%rbx), %rsi
	cmpl	112(%rbx), %esi
	jl	.L756
	jmp	.L722
.L731:
	cmpl	$255, %eax
	jne	.L753
	jmp	.L734
.L732:
	cmpl	$255, %edx
	ja	.L736
.L734:
	movq	%rbx, %rdi
	call	add_pair_to_block
.L736:
	movl	%r11d, 92(%rbx)
	movl	$1, 96(%rbx)
	jmp	.L733
.L753:
	incl	%eax
	movl	%eax, 96(%rbx)
	jmp	.L733
.L722:
	orl	%ecx, %r12d
	cmpl	$2, 8(%rbx)
	je	.L738
	cmpl	$0, 16(%rbx)
	jne	.L738
	cmpl	$255, 92(%rbx)
	ja	.L739
	movq	%rbx, %rdi
	call	add_pair_to_block
.L739:
	xorl	%esi, %esi
	cmpl	$4, 8(%rbx)
	movq	$256, 92(%rbx)
	sete	%sil
	jmp	.L755
.L738:
	movl	112(%rbx), %eax
	cmpl	%eax, 108(%rbx)
	jl	.L740
	xorl	%esi, %esi
.L755:
	movq	%rbx, %rdi
	call	BZ2_compressBlock
	movl	$1, 12(%rbx)
	jmp	.L712
.L740:
	movq	(%rbx), %rax
	cmpl	$0, 8(%rax)
	jne	.L712
.L717:
	orb	%bpl, %r12b
	popq	%rdx
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	setne	%al
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE166:
	.size	handle_compress.isra.0, .-handle_compress.isra.0
	.globl	BZ2_bzCompressInit
	.type	BZ2_bzCompressInit, @function
BZ2_bzCompressInit:
.LFB65:
	.cfi_startproc
	endbr64
	leal	-1(%rsi), %eax
	cmpl	$8, %eax
	ja	.L783
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$-2, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	pushq	%r8
	.cfi_def_cfa_offset 64
	testq	%rdi, %rdi
	je	.L757
	movl	%ecx, %r12d
	movl	$-2, %eax
	cmpl	$250, %ecx
	ja	.L757
	movl	%esi, %r13d
	movl	%edx, %r14d
	testl	%ecx, %ecx
	jne	.L759
	movl	$30, %r12d
.L759:
	cmpq	$0, 56(%rbx)
	jne	.L760
	leaq	default_bzalloc(%rip), %rax
	movq	%rax, 56(%rbx)
.L760:
	cmpq	$0, 64(%rbx)
	jne	.L761
	leaq	default_bzfree(%rip), %rax
	movq	%rax, 64(%rbx)
.L761:
	movq	72(%rbx), %rdi
	movl	$1, %edx
	movl	$55768, %esi
	call	*56(%rbx)
	movq	%rax, %rbp
	movl	$-3, %eax
	testq	%rbp, %rbp
	je	.L757
	imull	$100000, %r13d, %r15d
	movq	72(%rbx), %rdi
	movq	%rbx, 0(%rbp)
	movl	$1, %edx
	movq	$0, 24(%rbp)
	movq	$0, 32(%rbp)
	leal	0(,%r15,4), %esi
	movq	$0, 40(%rbp)
	call	*56(%rbx)
	movq	72(%rbx), %rdi
	leal	136(,%r15,4), %esi
	movl	$1, %edx
	movq	%rax, 24(%rbp)
	call	*56(%rbx)
	movl	$262148, %esi
	movq	72(%rbx), %rdi
	movl	$1, %edx
	movq	%rax, 32(%rbp)
	call	*56(%rbx)
	movq	24(%rbp), %rsi
	movq	%rax, 40(%rbp)
	testq	%rsi, %rsi
	je	.L762
	movq	32(%rbp), %rdx
	testq	%rdx, %rdx
	je	.L771
	testq	%rax, %rax
	jne	.L763
.L771:
	movq	72(%rbx), %rdi
	call	*64(%rbx)
.L762:
	movq	32(%rbp), %rsi
	testq	%rsi, %rsi
	je	.L765
	movq	72(%rbx), %rdi
	call	*64(%rbx)
.L765:
	movq	40(%rbp), %rsi
	testq	%rsi, %rsi
	je	.L766
	movq	72(%rbx), %rdi
	call	*64(%rbx)
.L766:
	movq	72(%rbx), %rdi
	movq	%rbp, %rsi
	call	*64(%rbx)
	movl	$-3, %eax
	jmp	.L757
.L763:
	movabsq	$8589934594, %rax
	subl	$19, %r15d
	movl	%r12d, 88(%rbp)
	movq	%rax, 8(%rbp)
	xorl	%eax, %eax
	movl	$0, 652(%rbp)
	movl	%r13d, 664(%rbp)
	movl	%r15d, 112(%rbp)
	movl	%r14d, 656(%rbp)
	movq	%rdx, 64(%rbp)
	movq	%rsi, 72(%rbp)
	movq	$0, 80(%rbp)
	movq	%rsi, 56(%rbp)
	movq	%rbp, 48(%rbx)
	movq	$0, 12(%rbx)
	movq	$0, 36(%rbx)
	movq	$256, 92(%rbp)
	movl	$0, 108(%rbp)
	movq	$0, 116(%rbp)
	movl	$-1, 648(%rbp)
.L767:
	movb	$0, 128(%rbp,%rax)
	incq	%rax
	cmpq	$256, %rax
	jne	.L767
	movl	$1, 660(%rbp)
	xorl	%eax, %eax
.L757:
	popq	%rdx
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L783:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	movl	$-2, %eax
	ret
	.cfi_endproc
.LFE65:
	.size	BZ2_bzCompressInit, .-BZ2_bzCompressInit
	.globl	BZ2_bzCompress
	.type	BZ2_bzCompress, @function
BZ2_bzCompress:
.LFB71:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rcx
	.cfi_def_cfa_offset 32
	testq	%rdi, %rdi
	je	.L788
	movq	48(%rdi), %rbp
	testq	%rbp, %rbp
	je	.L788
	cmpq	%rdi, 0(%rbp)
	jne	.L788
.L789:
	movl	8(%rbp), %r12d
	cmpl	$3, %r12d
	je	.L790
	jg	.L791
	cmpl	$1, %r12d
	je	.L802
	cmpl	$2, %r12d
	je	.L793
	jmp	.L820
.L791:
	cmpl	$4, %r12d
	je	.L794
.L820:
	xorl	%r12d, %r12d
	jmp	.L787
.L793:
	testl	%esi, %esi
	jne	.L795
	movq	%rbp, %rdi
	movl	$1, %r12d
	call	handle_compress.isra.0
	testb	%al, %al
	jne	.L787
.L788:
	movl	$-2, %r12d
	jmp	.L787
.L795:
	cmpl	$1, %esi
	jne	.L796
	movl	8(%rdi), %eax
	movl	$3, 8(%rbp)
	movl	%eax, 16(%rbp)
	jmp	.L789
.L796:
	cmpl	$2, %esi
	jne	.L788
	movl	8(%rdi), %eax
	movl	$4, 8(%rbp)
	movl	%eax, 16(%rbp)
	jmp	.L789
.L790:
	decl	%esi
	jne	.L802
	movl	8(%rdi), %eax
	cmpl	%eax, 16(%rbp)
	jne	.L802
	movq	%rbp, %rdi
	movl	$2, %r12d
	call	handle_compress.isra.0
	cmpl	$0, 16(%rbp)
	jne	.L787
	cmpl	$255, 92(%rbp)
	ja	.L800
	cmpl	$0, 96(%rbp)
	jg	.L787
.L800:
	movl	116(%rbp), %eax
	movl	$2, %r12d
	cmpl	%eax, 120(%rbp)
	jl	.L787
	movl	$2, 8(%rbp)
	movl	$1, %r12d
	jmp	.L787
.L794:
	cmpl	$2, %esi
	jne	.L802
	movl	8(%rdi), %eax
	cmpl	%eax, 16(%rbp)
	jne	.L802
	movq	%rbp, %rdi
	call	handle_compress.isra.0
	testb	%al, %al
	je	.L802
	cmpl	$0, 16(%rbp)
	jne	.L809
	cmpl	$255, 92(%rbp)
	ja	.L801
	cmpl	$0, 96(%rbp)
	jg	.L809
.L801:
	movl	116(%rbp), %eax
	cmpl	%eax, 120(%rbp)
	jl	.L809
	movl	$1, 8(%rbp)
	jmp	.L787
.L802:
	orl	$-1, %r12d
	jmp	.L787
.L809:
	movl	$3, %r12d
.L787:
	movl	%r12d, %eax
	popq	%rdx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE71:
	.size	BZ2_bzCompress, .-BZ2_bzCompress
	.globl	BZ2_bzCompressEnd
	.type	BZ2_bzCompressEnd, @function
BZ2_bzCompressEnd:
.LFB72:
	.cfi_startproc
	endbr64
	movl	$-2, %eax
	testq	%rdi, %rdi
	je	.L839
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	pushq	%rcx
	.cfi_def_cfa_offset 32
	movq	48(%rdi), %rbp
	testq	%rbp, %rbp
	je	.L821
	cmpq	%rdi, 0(%rbp)
	jne	.L821
	movq	24(%rbp), %rsi
	testq	%rsi, %rsi
	je	.L823
	movq	72(%rdi), %rdi
	call	*64(%rbx)
.L823:
	movq	32(%rbp), %rsi
	testq	%rsi, %rsi
	je	.L824
	movq	72(%rbx), %rdi
	call	*64(%rbx)
.L824:
	movq	40(%rbp), %rsi
	testq	%rsi, %rsi
	je	.L825
	movq	72(%rbx), %rdi
	call	*64(%rbx)
.L825:
	movq	48(%rbx), %rsi
	movq	72(%rbx), %rdi
	call	*64(%rbx)
	movq	$0, 48(%rbx)
	xorl	%eax, %eax
.L821:
	popq	%rdx
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L839:
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE72:
	.size	BZ2_bzCompressEnd, .-BZ2_bzCompressEnd
	.globl	BZ2_bzDecompressInit
	.type	BZ2_bzDecompressInit, @function
BZ2_bzDecompressInit:
.LFB73:
	.cfi_startproc
	endbr64
	movl	$-2, %r8d
	testq	%rdi, %rdi
	je	.L851
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	cmpl	$1, %edx
	ja	.L842
	movl	%esi, %ebp
	cmpl	$4, %esi
	ja	.L842
	cmpq	$0, 56(%rdi)
	movq	%rdi, %rbx
	jne	.L844
	leaq	default_bzalloc(%rip), %rax
	movq	%rax, 56(%rdi)
.L844:
	cmpq	$0, 64(%rbx)
	jne	.L845
	leaq	default_bzfree(%rip), %rax
	movq	%rax, 64(%rbx)
.L845:
	movq	72(%rbx), %rdi
	movl	$1, %edx
	movl	$64144, %esi
	call	*56(%rbx)
	movl	$-3, %r8d
	testq	%rax, %rax
	je	.L842
	movq	%rbx, (%rax)
	xorl	%r8d, %r8d
	movq	%rax, 48(%rbx)
	movl	$10, 8(%rax)
	movq	$0, 32(%rax)
	movl	$0, 3188(%rax)
	movq	$0, 12(%rbx)
	movq	$0, 36(%rbx)
	movb	%r12b, 44(%rax)
	movq	$0, 3168(%rax)
	movq	$0, 3160(%rax)
	movq	$0, 3152(%rax)
	movl	$0, 48(%rax)
	movl	%ebp, 52(%rax)
.L842:
	popq	%rbx
	.cfi_def_cfa_offset 24
	movl	%r8d, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L851:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE73:
	.size	BZ2_bzDecompressInit, .-BZ2_bzDecompressInit
	.globl	BZ2_indexIntoF
	.type	BZ2_indexIntoF, @function
BZ2_indexIntoF:
.LFB75:
	.cfi_startproc
	endbr64
	movl	$256, %ecx
	xorl	%eax, %eax
.L856:
	leal	(%rax,%rcx), %edx
	sarl	%edx
	movslq	%edx, %r8
	cmpl	%edi, (%rsi,%r8,4)
	cmovg	%edx, %ecx
	cmovle	%edx, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	decl	%edx
	jne	.L856
	ret
	.cfi_endproc
.LFE75:
	.size	BZ2_indexIntoF, .-BZ2_indexIntoF
	.section	.rodata.str1.1
.LC44:
	.string	"\n    [%d: huff+mtf "
.LC45:
	.string	"rt+rld"
	.text
	.globl	BZ2_decompress
	.type	BZ2_decompress, @function
BZ2_decompress:
.LFB57:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movq	(%rdi), %r9
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	movl	8(%rdi), %eax
	cmpl	$10, %eax
	jne	.L860
	movl	$0, 64036(%rdi)
	movq	$0, 64040(%rdi)
	movq	$0, 64048(%rdi)
	movq	$0, 64056(%rdi)
	movq	$0, 64064(%rdi)
	movq	$0, 64072(%rdi)
	movq	$0, 64080(%rdi)
	movq	$0, 64088(%rdi)
	movq	$0, 64096(%rdi)
	movq	$0, 64104(%rdi)
	movq	$0, 64112(%rdi)
	movq	$0, 64120(%rdi)
	movq	$0, 64128(%rdi)
	movq	$0, 64136(%rdi)
.L860:
	movl	64044(%rbx), %edi
	movl	64036(%rbx), %ebp
	subl	$10, %eax
	movl	64040(%rbx), %r13d
	movl	64080(%rbx), %r15d
	movl	%edi, 52(%rsp)
	movl	64048(%rbx), %edi
	movl	64100(%rbx), %r14d
	movl	64104(%rbx), %r12d
	movl	%edi, 68(%rsp)
	movl	64052(%rbx), %edi
	movl	%edi, 8(%rsp)
	movl	64056(%rbx), %edi
	movl	%edi, 12(%rsp)
	movl	64060(%rbx), %edi
	movl	%edi, 80(%rsp)
	movl	64064(%rbx), %edi
	movl	%edi, 16(%rsp)
	movl	64068(%rbx), %edi
	movl	%edi, 20(%rsp)
	movl	64072(%rbx), %edi
	movl	%edi, (%rsp)
	movl	64076(%rbx), %edi
	movl	%edi, 72(%rsp)
	movl	64084(%rbx), %edi
	movl	%edi, 4(%rsp)
	movl	64088(%rbx), %edi
	movl	%edi, 56(%rsp)
	movl	64092(%rbx), %edi
	movl	%edi, 60(%rsp)
	movl	64096(%rbx), %edi
	movl	%edi, 84(%rsp)
	movl	64108(%rbx), %edi
	movl	%edi, 48(%rsp)
	movl	64112(%rbx), %esi
	movl	64116(%rbx), %edi
	movl	%esi, 76(%rsp)
	movq	64120(%rbx), %rsi
	movl	%edi, 64(%rsp)
	movq	64128(%rbx), %rdi
	movq	%rsi, 24(%rsp)
	movq	64136(%rbx), %rsi
	movq	%rdi, 32(%rsp)
	movq	%rsi, 40(%rsp)
	cmpl	$40, %eax
	ja	.L861
	leaq	.L863(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L863:
	.long	.L903-.L863
	.long	.L902-.L863
	.long	.L901-.L863
	.long	.L900-.L863
	.long	.L899-.L863
	.long	.L898-.L863
	.long	.L897-.L863
	.long	.L896-.L863
	.long	.L895-.L863
	.long	.L894-.L863
	.long	.L893-.L863
	.long	.L892-.L863
	.long	.L891-.L863
	.long	.L890-.L863
	.long	.L889-.L863
	.long	.L888-.L863
	.long	.L887-.L863
	.long	.L886-.L863
	.long	.L885-.L863
	.long	.L884-.L863
	.long	.L883-.L863
	.long	.L882-.L863
	.long	.L881-.L863
	.long	.L880-.L863
	.long	.L879-.L863
	.long	.L878-.L863
	.long	.L877-.L863
	.long	.L876-.L863
	.long	.L875-.L863
	.long	.L874-.L863
	.long	.L873-.L863
	.long	.L872-.L863
	.long	.L871-.L863
	.long	.L870-.L863
	.long	.L869-.L863
	.long	.L868-.L863
	.long	.L867-.L863
	.long	.L866-.L863
	.long	.L865-.L863
	.long	.L864-.L863
	.long	.L862-.L863
	.text
.L903:
	movl	$10, 8(%rbx)
.L906:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L904
	movl	32(%rbx), %edx
	subl	$8, %ecx
	movl	$-5, %eax
	movl	%ecx, 36(%rbx)
	shrl	%cl, %edx
	cmpb	$66, %dl
	je	.L902
	jmp	.L905
.L904:
	movl	8(%r9), %edx
	testl	%edx, %edx
	je	.L1192
	movq	(%r9), %rsi
	movl	32(%rbx), %eax
	addl	$8, %ecx
	decl	%edx
	movzbl	(%rsi), %edi
	sall	$8, %eax
	movl	%ecx, 36(%rbx)
	incq	%rsi
	orl	%edi, %eax
	movl	%eax, 32(%rbx)
	incl	12(%r9)
	movq	%rsi, (%r9)
	movl	%edx, 8(%r9)
	jne	.L906
	incl	16(%r9)
	jmp	.L906
.L902:
	movl	$11, 8(%rbx)
.L909:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L908
	movl	32(%rbx), %edx
	subl	$8, %ecx
	movl	$-5, %eax
	movl	%ecx, 36(%rbx)
	shrl	%cl, %edx
	cmpb	$90, %dl
	je	.L901
	jmp	.L905
.L908:
	movl	8(%r9), %edx
	testl	%edx, %edx
	je	.L1192
	movq	(%r9), %rsi
	movl	32(%rbx), %eax
	addl	$8, %ecx
	decl	%edx
	movzbl	(%rsi), %edi
	sall	$8, %eax
	movl	%ecx, 36(%rbx)
	incq	%rsi
	orl	%edi, %eax
	movl	%eax, 32(%rbx)
	incl	12(%r9)
	movq	%rsi, (%r9)
	movl	%edx, 8(%r9)
	jne	.L909
	incl	16(%r9)
	jmp	.L909
.L901:
	movl	$12, 8(%rbx)
.L912:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L911
	movl	32(%rbx), %edx
	subl	$8, %ecx
	movl	$-5, %eax
	movl	%ecx, 36(%rbx)
	shrl	%cl, %edx
	cmpb	$104, %dl
	je	.L900
	jmp	.L905
.L911:
	movl	8(%r9), %edx
	testl	%edx, %edx
	je	.L1192
	movq	(%r9), %rsi
	movl	32(%rbx), %eax
	addl	$8, %ecx
	decl	%edx
	movzbl	(%rsi), %edi
	sall	$8, %eax
	movl	%ecx, 36(%rbx)
	incq	%rsi
	orl	%edi, %eax
	movl	%eax, 32(%rbx)
	incl	12(%r9)
	movq	%rsi, (%r9)
	movl	%edx, 8(%r9)
	jne	.L912
	incl	16(%r9)
	jmp	.L912
.L900:
	movl	$13, 8(%rbx)
.L916:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L914
	movl	32(%rbx), %esi
	subl	$8, %ecx
	movl	%ecx, 36(%rbx)
	shrl	%cl, %esi
	movzbl	%sil, %esi
	leal	-49(%rsi), %eax
	cmpl	$8, %eax
	jbe	.L915
	movl	%esi, 40(%rbx)
	movl	$-5, %eax
	jmp	.L905
.L914:
	movl	8(%r9), %edx
	testl	%edx, %edx
	je	.L1192
	movq	(%r9), %rsi
	movl	32(%rbx), %eax
	addl	$8, %ecx
	decl	%edx
	movzbl	(%rsi), %edi
	sall	$8, %eax
	movl	%ecx, 36(%rbx)
	incq	%rsi
	orl	%edi, %eax
	movl	%eax, 32(%rbx)
	incl	12(%r9)
	movq	%rsi, (%r9)
	movl	%edx, 8(%r9)
	jne	.L916
	incl	16(%r9)
	jmp	.L916
.L915:
	subl	$48, %esi
	movq	56(%r9), %rax
	movq	72(%r9), %rdi
	movq	%r9, 88(%rsp)
	movl	%esi, 40(%rbx)
	imull	$100000, %esi, %esi
	cmpb	$0, 44(%rbx)
	je	.L918
	addl	%esi, %esi
	movl	$1, %edx
	call	*%rax
	imull	$100000, 40(%rbx), %esi
	movq	88(%rsp), %r9
	movl	$1, %edx
	movq	%rax, 3160(%rbx)
	movq	72(%r9), %rdi
	sarl	%esi
	call	*56(%r9)
	cmpq	$0, 3160(%rbx)
	movq	%rax, 3168(%rbx)
	je	.L1122
	testq	%rax, %rax
	jne	.L899
	jmp	.L1122
.L918:
	movl	$1, %edx
	sall	$2, %esi
	call	*%rax
	movq	%rax, %rdx
	movq	%rax, 3152(%rbx)
	movl	$-3, %eax
	testq	%rdx, %rdx
	je	.L905
.L899:
	movl	$14, 8(%rbx)
.L922:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L920
	movl	32(%rbx), %edx
	subl	$8, %ecx
	movl	%ecx, 36(%rbx)
	shrl	%cl, %edx
	cmpb	$23, %dl
	jne	.L1252
	jmp	.L871
.L920:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L922
	incl	16(%rax)
	jmp	.L922
.L1252:
	movl	$-4, %eax
	cmpb	$49, %dl
	jne	.L905
.L898:
	movl	$15, 8(%rbx)
.L925:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L924
	movl	32(%rbx), %edx
	subl	$8, %ecx
	movl	$-4, %eax
	movl	%ecx, 36(%rbx)
	shrl	%cl, %edx
	cmpb	$65, %dl
	je	.L897
	jmp	.L905
.L924:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L925
	incl	16(%rax)
	jmp	.L925
.L897:
	movl	$16, 8(%rbx)
.L928:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L927
	movl	32(%rbx), %edx
	subl	$8, %ecx
	movl	$-4, %eax
	movl	%ecx, 36(%rbx)
	shrl	%cl, %edx
	cmpb	$89, %dl
	je	.L896
	jmp	.L905
.L927:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L928
	incl	16(%rax)
	jmp	.L928
.L896:
	movl	$17, 8(%rbx)
.L931:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L930
	movl	32(%rbx), %edx
	subl	$8, %ecx
	movl	$-4, %eax
	movl	%ecx, 36(%rbx)
	shrl	%cl, %edx
	cmpb	$38, %dl
	je	.L895
	jmp	.L905
.L930:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L931
	incl	16(%rax)
	jmp	.L931
.L895:
	movl	$18, 8(%rbx)
.L934:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L933
	movl	32(%rbx), %edx
	subl	$8, %ecx
	movl	$-4, %eax
	movl	%ecx, 36(%rbx)
	shrl	%cl, %edx
	cmpb	$83, %dl
	je	.L894
	jmp	.L905
.L933:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L934
	incl	16(%rax)
	jmp	.L934
.L894:
	movl	$19, 8(%rbx)
.L938:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L936
	movl	32(%rbx), %edx
	subl	$8, %ecx
	movl	$-4, %eax
	movl	%ecx, 36(%rbx)
	shrl	%cl, %edx
	cmpb	$89, %dl
	je	.L1253
	jmp	.L905
.L936:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L938
	incl	16(%rax)
	jmp	.L938
.L1253:
	movl	48(%rbx), %eax
	cmpl	$1, 52(%rbx)
	leal	1(%rax), %ecx
	movl	%ecx, 48(%rbx)
	jle	.L940
	movq	stderr(%rip), %rdi
	leaq	.LC44(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
.L940:
	movl	$0, 3176(%rbx)
.L893:
	movl	$20, 8(%rbx)
.L942:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L941
	movl	32(%rbx), %eax
	subl	$8, %ecx
	movl	%ecx, 36(%rbx)
	shrl	%cl, %eax
	movzbl	%al, %edx
	movl	3176(%rbx), %eax
	sall	$8, %eax
	orl	%edx, %eax
	movl	%eax, 3176(%rbx)
	jmp	.L892
.L941:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L942
	incl	16(%rax)
	jmp	.L942
.L892:
	movl	$21, 8(%rbx)
.L945:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L944
	movl	32(%rbx), %eax
	subl	$8, %ecx
	movl	%ecx, 36(%rbx)
	shrl	%cl, %eax
	movzbl	%al, %edx
	movl	3176(%rbx), %eax
	sall	$8, %eax
	orl	%edx, %eax
	movl	%eax, 3176(%rbx)
	jmp	.L891
.L944:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L945
	incl	16(%rax)
	jmp	.L945
.L891:
	movl	$22, 8(%rbx)
.L948:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L947
	movl	32(%rbx), %eax
	subl	$8, %ecx
	movl	%ecx, 36(%rbx)
	shrl	%cl, %eax
	movzbl	%al, %edx
	movl	3176(%rbx), %eax
	sall	$8, %eax
	orl	%edx, %eax
	movl	%eax, 3176(%rbx)
	jmp	.L890
.L947:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L948
	incl	16(%rax)
	jmp	.L948
.L890:
	movl	$23, 8(%rbx)
.L951:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L950
	movl	32(%rbx), %eax
	subl	$8, %ecx
	movl	%ecx, 36(%rbx)
	shrl	%cl, %eax
	movzbl	%al, %edx
	movl	3176(%rbx), %eax
	sall	$8, %eax
	orl	%edx, %eax
	movl	%eax, 3176(%rbx)
	jmp	.L889
.L950:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L951
	incl	16(%rax)
	jmp	.L951
.L889:
	movl	$24, 8(%rbx)
.L954:
	movl	36(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.L953
	movl	32(%rbx), %eax
	decl	%ecx
	movl	$0, 56(%rbx)
	movl	%ecx, 36(%rbx)
	shrl	%cl, %eax
	andl	$1, %eax
	movb	%al, 20(%rbx)
	jmp	.L888
.L953:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L954
	incl	16(%rax)
	jmp	.L954
.L888:
	movl	$25, 8(%rbx)
.L957:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L956
	movl	32(%rbx), %eax
	subl	$8, %ecx
	movl	%ecx, 36(%rbx)
	shrl	%cl, %eax
	movzbl	%al, %edx
	movl	56(%rbx), %eax
	sall	$8, %eax
	orl	%edx, %eax
	movl	%eax, 56(%rbx)
	jmp	.L887
.L956:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L957
	incl	16(%rax)
	jmp	.L957
.L887:
	movl	$26, 8(%rbx)
.L960:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L959
	movl	32(%rbx), %eax
	subl	$8, %ecx
	movl	%ecx, 36(%rbx)
	shrl	%cl, %eax
	movzbl	%al, %edx
	movl	56(%rbx), %eax
	sall	$8, %eax
	orl	%edx, %eax
	movl	%eax, 56(%rbx)
	jmp	.L886
.L959:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L960
	incl	16(%rax)
	jmp	.L960
.L886:
	movl	$27, 8(%rbx)
.L964:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L962
	movl	32(%rbx), %edx
	subl	$8, %ecx
	movl	%ecx, 36(%rbx)
	shrl	%cl, %edx
	movzbl	%dl, %eax
	movl	56(%rbx), %edx
	sall	$8, %edx
	orl	%eax, %edx
	movl	$-4, %eax
	movl	%edx, 56(%rbx)
	jns	.L1254
	jmp	.L905
.L962:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L964
	incl	16(%rax)
	jmp	.L964
.L1254:
	imull	$100000, 40(%rbx), %ecx
	movl	$-4, %eax
	addl	$10, %ecx
	cmpl	%ecx, %edx
	jg	.L905
	xorl	%ebp, %ebp
.L885:
	movslq	%ebp, %rdx
.L967:
	movl	$28, 8(%rbx)
	movl	%edx, %ebp
.L969:
	movl	36(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.L966
	movl	32(%rbx), %eax
	decl	%ecx
	movl	%ecx, 36(%rbx)
	shrl	%cl, %eax
	andl	$1, %eax
	movb	%al, 3452(%rbx,%rdx)
	incq	%rdx
	cmpl	$15, %edx
	jle	.L967
	xorl	%eax, %eax
	jmp	.L968
.L966:
	movq	(%rbx), %rax
	movl	8(%rax), %edi
	testl	%edi, %edi
	je	.L1192
	movq	(%rax), %r9
	movl	32(%rbx), %esi
	addl	$8, %ecx
	decl	%edi
	movzbl	(%r9), %r10d
	sall	$8, %esi
	movl	%ecx, 36(%rbx)
	incq	%r9
	orl	%r10d, %esi
	movl	%esi, 32(%rbx)
	incl	12(%rax)
	movq	%r9, (%rax)
	movl	%edi, 8(%rax)
	jne	.L969
	incl	16(%rax)
	jmp	.L969
.L968:
	movb	$0, 3196(%rbx,%rax)
	incq	%rax
	cmpq	$256, %rax
	jne	.L968
	xorl	%ebp, %ebp
.L978:
	movslq	%ebp, %rax
	cmpb	$0, 3452(%rbx,%rax)
	je	.L971
	xorl	%r13d, %r13d
.L884:
	movl	%ebp, %r9d
	sall	$4, %r9d
.L977:
	movl	$29, 8(%rbx)
.L975:
	movl	36(%rbx), %edx
	testl	%edx, %edx
	jle	.L972
	movl	32(%rbx), %eax
	decl	%edx
	movl	%edx, 36(%rbx)
	btl	%edx, %eax
	jnc	.L974
	leal	0(%r13,%r9), %eax
	cltq
	movb	$1, 3196(%rbx,%rax)
	jmp	.L974
.L972:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %ecx
	addl	$8, %edx
	decl	%esi
	movzbl	(%rdi), %r10d
	sall	$8, %ecx
	movl	%edx, 36(%rbx)
	incq	%rdi
	orl	%r10d, %ecx
	movl	%ecx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L975
	incl	16(%rax)
	jmp	.L975
.L974:
	incl	%r13d
	cmpl	$15, %r13d
	jle	.L977
.L971:
	incl	%ebp
	cmpl	$15, %ebp
	jle	.L978
	movl	$0, 3192(%rbx)
	xorl	%eax, %eax
.L980:
	cmpb	$0, 3196(%rbx,%rax)
	je	.L979
	movslq	3192(%rbx), %rcx
	movq	%rcx, %rdx
	movb	%al, 3468(%rbx,%rcx)
	incl	%edx
	movl	%edx, 3192(%rbx)
.L979:
	incq	%rax
	cmpq	$256, %rax
	jne	.L980
	movl	3192(%rbx), %edx
	movl	$-4, %eax
	testl	%edx, %edx
	je	.L905
	leal	2(%rdx), %eax
	movl	%eax, 68(%rsp)
.L883:
	movl	$30, 8(%rbx)
.L982:
	movl	36(%rbx), %ecx
	cmpl	$2, %ecx
	jle	.L981
	movl	32(%rbx), %eax
	subl	$3, %ecx
	movl	%ecx, 36(%rbx)
	shrl	%cl, %eax
	andl	$7, %eax
	leal	-2(%rax), %edx
	movl	%eax, 8(%rsp)
	movl	$-4, %eax
	cmpl	$4, %edx
	jbe	.L882
	jmp	.L905
.L981:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L982
	incl	16(%rax)
	jmp	.L982
.L882:
	movl	$31, 8(%rbx)
.L985:
	movl	36(%rbx), %ecx
	cmpl	$14, %ecx
	jle	.L984
	movl	32(%rbx), %edx
	subl	$15, %ecx
	movl	$-4, %eax
	movl	%ecx, 36(%rbx)
	shrl	%cl, %edx
	andl	$32767, %edx
	movl	%edx, 12(%rsp)
	je	.L905
	xorl	%r13d, %r13d
	xorl	%ebp, %ebp
	jmp	.L881
.L984:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L985
	incl	16(%rax)
	jmp	.L985
.L881:
	movslq	%ebp, %rcx
	movl	%r13d, %eax
.L993:
	movl	%ecx, %ebp
	movl	%eax, %r13d
.L992:
	movl	$32, 8(%rbx)
.L990:
	movl	36(%rbx), %edx
	testl	%edx, %edx
	jle	.L987
	movl	32(%rbx), %eax
	decl	%edx
	movl	%edx, 36(%rbx)
	btl	%edx, %eax
	jc	.L1255
	jmp	.L1265
.L987:
	movq	(%rbx), %rax
	movl	8(%rax), %edi
	testl	%edi, %edi
	je	.L1192
	movq	(%rax), %r9
	movl	32(%rbx), %esi
	addl	$8, %edx
	decl	%edi
	movzbl	(%r9), %r10d
	sall	$8, %esi
	movl	%edx, 36(%rbx)
	incq	%r9
	orl	%r10d, %esi
	movl	%esi, 32(%rbx)
	incl	12(%rax)
	movq	%r9, (%rax)
	movl	%edi, 8(%rax)
	jne	.L990
	incl	16(%rax)
	jmp	.L990
.L1255:
	incl	%r13d
	cmpl	8(%rsp), %r13d
	jl	.L992
	jmp	.L1178
.L1265:
	movb	%r13b, 25886(%rbx,%rcx)
	xorl	%eax, %eax
	incq	%rcx
	cmpl	%ecx, 12(%rsp)
	jg	.L993
	xorl	%edx, %edx
.L994:
	movzbl	%dl, %eax
	cmpl	8(%rsp), %eax
	jge	.L1266
	movb	%dl, 98(%rsp,%rax)
	incl	%edx
	jmp	.L994
.L1266:
	xorl	%ecx, %ecx
	leaq	99(%rsp), %rsi
.L996:
	cmpl	%ecx, 12(%rsp)
	jle	.L1267
	movzbl	25886(%rbx,%rcx), %edx
	movq	%rdx, %rax
	movb	98(%rsp,%rdx), %dl
.L997:
	decq	%rax
	cmpq	$-1, %rax
	je	.L1268
	movb	98(%rsp,%rax), %dil
	movb	%dil, (%rsi,%rax)
	jmp	.L997
.L1268:
	movb	%dl, 7884(%rbx,%rcx)
	incq	%rcx
	movb	%dl, 98(%rsp)
	jmp	.L996
.L1267:
	cmpl	$0, 12(%rsp)
	movl	$0, %ebp
	movl	$0, 52(%rsp)
	cmovns	12(%rsp), %ebp
	jmp	.L1000
.L880:
	movl	$33, 8(%rbx)
.L1003:
	movl	36(%rbx), %ecx
	cmpl	$4, %ecx
	jle	.L1001
	movl	32(%rbx), %eax
	subl	$5, %ecx
	xorl	%ebp, %ebp
	movl	%ecx, 36(%rbx)
	shrl	%cl, %eax
	andl	$31, %eax
	movl	%eax, 60(%rsp)
	jmp	.L1002
.L1001:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L1003
	incl	16(%rax)
	jmp	.L1003
.L1005:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %ecx
	addl	$8, %edx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %ecx
	movl	%edx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %ecx
	movl	%ecx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L1007
	incl	16(%rax)
.L1007:
	movl	36(%rbx), %edx
	testl	%edx, %edx
	jle	.L1005
	movl	32(%rbx), %eax
	decl	%edx
	movl	%edx, 36(%rbx)
	btl	%edx, %eax
	jnc	.L1006
.L878:
	movl	$35, 8(%rbx)
.L1012:
	movl	36(%rbx), %edx
	testl	%edx, %edx
	jle	.L1009
	movl	32(%rbx), %eax
	decl	%edx
	movl	%edx, 36(%rbx)
	btl	%edx, %eax
	jc	.L1269
	incl	60(%rsp)
.L1014:
	movl	60(%rsp), %eax
	leal	-1(%rax), %edx
	movl	$-4, %eax
	cmpl	$19, %edx
	ja	.L905
.L879:
	movl	$34, 8(%rbx)
	jmp	.L1007
.L1009:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %ecx
	addl	$8, %edx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %ecx
	movl	%edx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %ecx
	movl	%ecx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L1012
	incl	16(%rax)
	jmp	.L1012
.L1269:
	decl	60(%rsp)
	jmp	.L1014
.L1006:
	movslq	52(%rsp), %rax
	movb	60(%rsp), %dil
	movslq	%ebp, %rdx
	incl	%ebp
	imulq	$258, %rax, %rax
	addq	%rbx, %rax
	movb	%dil, 43888(%rdx,%rax)
.L1002:
	cmpl	68(%rsp), %ebp
	jl	.L1014
	incl	52(%rsp)
.L1000:
	movl	8(%rsp), %esi
	cmpl	%esi, 52(%rsp)
	jl	.L880
	leaq	45436(%rbx), %rdi
	movq	%rbx, %r15
	xorl	%ebp, %ebp
.L1015:
	cmpl	%ebp, 8(%rsp)
	jle	.L1270
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	movl	$32, %r8d
.L1017:
	cmpl	%edx, 68(%rsp)
	jle	.L1271
	movzbl	43888(%r15,%rdx), %ecx
	cmpl	%ecx, %r9d
	cmovl	%ecx, %r9d
	cmpl	%ecx, %r8d
	cmovg	%ecx, %r8d
	incq	%rdx
	jmp	.L1017
.L1271:
	pushq	%rax
	.cfi_def_cfa_offset 184
	movl	76(%rsp), %eax
	leaq	43888(%r15), %rcx
	leaq	12384(%rdi), %rdx
	leaq	6192(%rdi), %rsi
	addq	$258, %r15
	pushq	%rax
	.cfi_def_cfa_offset 192
	movl	%r8d, 32(%rsp)
	call	BZ2_hbCreateDecodeTables
	movl	32(%rsp), %r8d
	addq	$1032, %rdi
	movl	%r8d, 64012(%rbx,%rbp,4)
	incq	%rbp
	popq	%rdx
	.cfi_def_cfa_offset 184
	popq	%rcx
	.cfi_def_cfa_offset 176
	jmp	.L1015
.L1270:
	cmpl	$0, 8(%rsp)
	movl	$0, %eax
	cmovns	8(%rsp), %eax
	movl	%eax, 52(%rsp)
	movl	3192(%rbx), %eax
	incl	%eax
	movl	%eax, 80(%rsp)
	imull	$100000, 40(%rbx), %eax
	movl	%eax, 72(%rsp)
	xorl	%eax, %eax
.L1018:
	movl	$0, 68(%rbx,%rax)
	addq	$4, %rax
	cmpq	$1024, %rax
	jne	.L1018
	leaq	7880(%rbx), %rdi
	movl	$4095, %esi
.L1019:
	movl	%esi, %ecx
	leal	-15(%rsi), %r8d
	movq	%rsi, %rdx
	movl	$15, %eax
.L1020:
	leal	(%r8,%rax), %r9d
	decl	%eax
	movb	%r9b, 3724(%rbx,%rdx)
	decq	%rdx
	cmpl	$-1, %eax
	jne	.L1020
	subl	$15, %ecx
	subq	$16, %rsi
	subq	$4, %rdi
	movl	%ecx, 4(%rdi)
	cmpq	$3839, %rsi
	jne	.L1019
	cmpl	$0, 12(%rsp)
	jle	.L1160
	movzbl	7884(%rbx), %esi
	movl	$49, 20(%rsp)
	xorl	%r15d, %r15d
	movl	$256, %ebp
	movl	$0, 16(%rsp)
	movzbl	%sil, %edx
	movl	%esi, 76(%rsp)
	imulq	$1032, %rdx, %rax
	movl	64012(%rbx,%rdx,4), %r14d
	movl	%r14d, 64(%rsp)
	leaq	45436(%rbx,%rax), %rdi
	leaq	57820(%rbx,%rax), %rsi
	leaq	51628(%rbx,%rax), %rax
	movq	%rdi, 24(%rsp)
	movq	%rsi, 40(%rsp)
	movq	%rax, 32(%rsp)
.L877:
	movl	$36, 8(%rbx)
.L1024:
	movl	36(%rbx), %ecx
	cmpl	%r14d, %ecx
	jl	.L1022
	movl	32(%rbx), %r12d
	subl	%r14d, %ecx
	movl	$1, %eax
	movl	%ecx, %edx
	shrl	%cl, %r12d
	movl	%r14d, %ecx
	movl	%edx, 36(%rbx)
	sall	%cl, %eax
	decl	%eax
	andl	%eax, %r12d
	jmp	.L1023
.L1022:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L1024
	incl	16(%rax)
	jmp	.L1024
.L1272:
	movq	24(%rsp), %rsi
	movslq	%r14d, %rax
	cmpl	%r12d, (%rsi,%rax,4)
	jge	.L1026
	incl	%r14d
.L876:
	movl	$37, 8(%rbx)
.L1028:
	movl	36(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.L1027
	movl	32(%rbx), %eax
	decl	%ecx
	addl	%r12d, %r12d
	movl	%ecx, 36(%rbx)
	shrl	%cl, %eax
	andl	$1, %eax
	movl	%eax, 48(%rsp)
	orl	%eax, %r12d
.L1023:
	movl	$-4, %eax
	cmpl	$20, %r14d
	jle	.L1272
	jmp	.L905
.L1027:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L1028
	incl	16(%rax)
	jmp	.L1028
.L1026:
	movq	32(%rsp), %rsi
	movl	%r12d, %edx
	subl	(%rsi,%rax,4), %edx
	jmp	.L1262
.L1068:
	movq	32(%rsp), %rdi
	movl	%r12d, %edx
	subl	(%rdi,%rax,4), %edx
.L1262:
	movl	$-4, %eax
	cmpl	$257, %edx
	ja	.L905
	movq	40(%rsp), %rax
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	movl	%eax, (%rsp)
.L1048:
	movl	(%rsp), %edi
	cmpl	%edi, 80(%rsp)
	je	.L1030
	cmpl	$1, %edi
	ja	.L1031
	movl	$1, 56(%rsp)
	movl	$-1, 4(%rsp)
.L1043:
	movl	56(%rsp), %eax
	cmpl	$0, (%rsp)
	leal	(%rax,%rax), %edx
	jne	.L1032
	addl	%eax, 4(%rsp)
.L1033:
	cmpl	$0, 20(%rsp)
	je	.L1273
.L1034:
	decl	20(%rsp)
	movl	64(%rsp), %r14d
	movl	%edx, 56(%rsp)
.L875:
	movl	$38, 8(%rbx)
.L1037:
	movl	36(%rbx), %ecx
	cmpl	%r14d, %ecx
	jl	.L1035
	movl	32(%rbx), %r12d
	subl	%r14d, %ecx
	movl	$1, %eax
	movl	%ecx, %edx
	shrl	%cl, %r12d
	movl	%r14d, %ecx
	movl	%edx, 36(%rbx)
	sall	%cl, %eax
	decl	%eax
	andl	%eax, %r12d
	jmp	.L1036
.L1035:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L1037
	incl	16(%rax)
	jmp	.L1037
.L1274:
	movq	24(%rsp), %rdi
	movslq	%r14d, %rax
	cmpl	%r12d, (%rdi,%rax,4)
	jge	.L1039
	incl	%r14d
.L874:
	movl	$39, 8(%rbx)
.L1041:
	movl	36(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.L1040
	movl	32(%rbx), %eax
	decl	%ecx
	addl	%r12d, %r12d
	movl	%ecx, 36(%rbx)
	shrl	%cl, %eax
	andl	$1, %eax
	movl	%eax, 48(%rsp)
	orl	%eax, %r12d
.L1036:
	movl	$-4, %eax
	cmpl	$20, %r14d
	jle	.L1274
	jmp	.L905
.L1040:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L1041
	incl	16(%rax)
	jmp	.L1041
.L1039:
	movq	32(%rsp), %rdi
	movl	%r12d, %edx
	subl	(%rdi,%rax,4), %edx
	movl	$-4, %eax
	cmpl	$257, %edx
	ja	.L905
	movq	40(%rsp), %rax
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	movl	%eax, (%rsp)
	cmpl	$1, %eax
	ja	.L1275
	jmp	.L1043
.L1032:
	cmpl	$1, (%rsp)
	jne	.L1033
	addl	%edx, 4(%rsp)
	jmp	.L1033
.L1273:
	incl	16(%rsp)
	movl	16(%rsp), %edi
	cmpl	%edi, 12(%rsp)
	jle	.L1165
	movslq	%edi, %rax
	movl	$50, 20(%rsp)
	movzbl	7884(%rbx,%rax), %esi
	movzbl	%sil, %ecx
	movl	%esi, 76(%rsp)
	imulq	$1032, %rcx, %rax
	movl	64012(%rbx,%rcx,4), %edi
	movl	%edi, 64(%rsp)
	leaq	45436(%rbx,%rax), %rsi
	leaq	57820(%rbx,%rax), %rdi
	leaq	51628(%rbx,%rax), %rax
	movq	%rsi, 24(%rsp)
	movq	%rdi, 40(%rsp)
	movq	%rax, 32(%rsp)
	jmp	.L1034
.L1275:
	movslq	7820(%rbx), %rax
	incl	4(%rsp)
	movl	4(%rsp), %esi
	movzbl	3724(%rbx,%rax), %eax
	movzbl	3468(%rbx,%rax), %eax
	addl	%esi, 68(%rbx,%rax,4)
	cmpb	$0, 44(%rbx)
	movq	%rax, %rdx
	movslq	%r15d, %rax
	jne	.L1044
	salq	$2, %rax
	jmp	.L1045
.L1044:
	addq	%rax, %rax
.L1046:
	cmpl	$0, 4(%rsp)
	jle	.L1048
	cmpl	%r15d, 72(%rsp)
	jle	.L1178
	movq	3160(%rbx), %rcx
	decl	4(%rsp)
	incl	%r15d
	movw	%dx, (%rcx,%rax)
	addq	$2, %rax
	jmp	.L1046
.L1049:
	cmpl	%r15d, 72(%rsp)
	jle	.L1178
	decl	4(%rsp)
	movq	3152(%rbx), %rcx
	incl	%r15d
	movl	%edx, (%rcx,%rax)
	addq	$4, %rax
.L1045:
	cmpl	$0, 4(%rsp)
	jg	.L1049
	jmp	.L1048
.L1031:
	movl	$-4, %eax
	cmpl	%r15d, 72(%rsp)
	jle	.L905
	movl	(%rsp), %eax
	decl	%eax
	cmpl	$15, %eax
	ja	.L1050
	movslq	7820(%rbx), %rcx
	movl	(%rsp), %edi
	leal	(%rax,%rcx), %edx
	movzbl	3724(%rbx,%rdx), %esi
	movq	%rdx, %rax
	leal	(%rdi,%rcx), %edx
.L1051:
	leal	-1(%rdx), %edi
	leal	-4(%rdx), %r10d
	movl	%edi, %r9d
	subl	%ecx, %r9d
	cmpl	$3, %r9d
	jbe	.L1276
	leal	-2(%rdx), %r9d
	movslq	%edi, %rdi
	movslq	%r9d, %r9
	movb	3724(%rbx,%r9), %r11b
	movb	%r11b, 3724(%rbx,%rdi)
	leal	-3(%rdx), %edi
	subl	$5, %edx
	movslq	%edi, %rdi
	movslq	%edx, %rdx
	movb	3724(%rbx,%rdi), %r11b
	movb	%r11b, 3724(%rbx,%r9)
	movslq	%r10d, %r9
	movb	3724(%rbx,%r9), %r11b
	movb	%r11b, 3724(%rbx,%rdi)
	movb	3724(%rbx,%rdx), %dl
	movb	%dl, 3724(%rbx,%r9)
	movl	%r10d, %edx
	jmp	.L1051
.L1276:
	movl	(%rsp), %edi
	leal	-1(%rdi), %edx
	shrl	$2, %edx
	imull	$-4, %edx, %edx
	addl	%edx, %eax
.L1053:
	cmpl	%eax, %ecx
	je	.L1277
	leal	-1(%rax), %edi
	movq	%rdi, %rdx
	movb	3724(%rbx,%rdi), %dil
	movb	%dil, 3724(%rbx,%rax)
	movl	%edx, %eax
	jmp	.L1053
.L1277:
	movb	%sil, 3724(%rbx,%rcx)
	jmp	.L1055
.L1050:
	movl	%eax, %edx
	andl	$15, %eax
	shrl	$4, %edx
	leaq	(%rbx,%rdx,4), %rdi
	movl	7820(%rdi), %ecx
	addl	%ecx, %eax
	cltq
	movzbl	3724(%rbx,%rax), %esi
.L1056:
	cmpl	%eax, %ecx
	jge	.L1278
	movb	3723(%rbx,%rax), %r9b
	movb	%r9b, 3724(%rbx,%rax)
	decq	%rax
	jmp	.L1056
.L1278:
	incl	%ecx
	movl	%ecx, 7820(%rdi)
.L1058:
	movl	7820(%rbx,%rdx,4), %eax
	leal	-1(%rax), %ecx
	movl	7816(%rbx,%rdx,4), %eax
	movl	%ecx, 7820(%rbx,%rdx,4)
	decq	%rdx
	addl	$15, %eax
	cltq
	movb	3724(%rbx,%rax), %dil
	movslq	%ecx, %rax
	movb	%dil, 3724(%rbx,%rax)
	testl	%edx, %edx
	jne	.L1058
	movl	7820(%rbx), %eax
	decl	%eax
	movslq	%eax, %rdx
	movl	%eax, 7820(%rbx)
	movb	%sil, 3724(%rbx,%rdx)
	jne	.L1055
	leaq	7880(%rbx), %rdx
	leaq	4095(%rbx), %r9
	movl	$4095, %ecx
.L1059:
	movslq	(%rdx), %rdi
	movl	$14, %eax
	addq	%rbx, %rdi
.L1060:
	movb	3725(%rdi,%rax), %r10b
	movb	%r10b, 3710(%r9,%rax)
	decq	%rax
	cmpq	$-2, %rax
	jne	.L1060
	leal	-15(%rcx), %edi
	leal	-16(%rcx), %eax
	subq	$4, %rdx
	subq	$16, %r9
	movl	%edi, 4(%rdx)
	cmpl	$3855, %ecx
	je	.L1055
	movl	%eax, %ecx
	jmp	.L1059
.L1055:
	movzbl	3468(%rbx,%rsi), %edx
	incl	68(%rbx,%rdx,4)
	cmpb	$0, 44(%rbx)
	movq	%rdx, %rax
	movslq	%r15d, %rdx
	je	.L1061
	movq	3160(%rbx), %rcx
	movw	%ax, (%rcx,%rdx,2)
	jmp	.L1062
.L1061:
	movq	3152(%rbx), %rcx
	movl	%eax, (%rcx,%rdx,4)
.L1062:
	incl	%r15d
	cmpl	$0, 20(%rsp)
	jne	.L1063
	incl	16(%rsp)
	movl	$-4, %eax
	movl	16(%rsp), %edi
	cmpl	%edi, 12(%rsp)
	jle	.L905
	movslq	%edi, %rax
	movl	$50, 20(%rsp)
	movzbl	7884(%rbx,%rax), %esi
	movzbl	%sil, %edx
	movl	%esi, 76(%rsp)
	imulq	$1032, %rdx, %rax
	movl	64012(%rbx,%rdx,4), %esi
	movl	%esi, 64(%rsp)
	leaq	57820(%rbx,%rax), %rdi
	leaq	45436(%rbx,%rax), %rsi
	leaq	51628(%rbx,%rax), %rax
	movq	%rsi, 24(%rsp)
	movq	%rdi, 40(%rsp)
	movq	%rax, 32(%rsp)
.L1063:
	decl	20(%rsp)
	movl	64(%rsp), %r14d
.L873:
	movl	$40, 8(%rbx)
.L1066:
	movl	36(%rbx), %ecx
	cmpl	%r14d, %ecx
	jl	.L1064
	movl	32(%rbx), %r12d
	subl	%r14d, %ecx
	movl	$1, %eax
	movl	%ecx, %edx
	shrl	%cl, %r12d
	movl	%r14d, %ecx
	movl	%edx, 36(%rbx)
	sall	%cl, %eax
	decl	%eax
	andl	%eax, %r12d
	jmp	.L1065
.L1064:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L1066
	incl	16(%rax)
	jmp	.L1066
.L1279:
	movq	24(%rsp), %rdi
	movslq	%r14d, %rax
	cmpl	%r12d, (%rdi,%rax,4)
	jge	.L1068
	incl	%r14d
.L872:
	movl	$41, 8(%rbx)
.L1070:
	movl	36(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.L1069
	movl	32(%rbx), %eax
	decl	%ecx
	addl	%r12d, %r12d
	movl	%ecx, 36(%rbx)
	shrl	%cl, %eax
	andl	$1, %eax
	movl	%eax, 48(%rsp)
	orl	%eax, %r12d
.L1065:
	movl	$-4, %eax
	cmpl	$20, %r14d
	jle	.L1279
	jmp	.L905
.L1069:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L1070
	incl	16(%rax)
	jmp	.L1070
.L1030:
	movl	56(%rbx), %eax
	testl	%eax, %eax
	js	.L1178
	cmpl	%r15d, %eax
	jge	.L1178
	cmpl	$1, 52(%rbx)
	movb	$0, 12(%rbx)
	movl	$0, 16(%rbx)
	movl	$-1, 3184(%rbx)
	movl	$2, 8(%rbx)
	jle	.L1072
	movq	stderr(%rip), %rsi
	leaq	.LC45(%rip), %rdi
	call	fputs@PLT
.L1072:
	movl	$0, 1096(%rbx)
	xorl	%eax, %eax
.L1073:
	movl	68(%rbx,%rax), %edx
	movl	%edx, 1100(%rbx,%rax)
	addq	$4, %rax
	cmpq	$1024, %rax
	jne	.L1073
	xorl	%eax, %eax
.L1074:
	movl	1096(%rbx,%rax), %edx
	addl	%edx, 1100(%rbx,%rax)
	addq	$4, %rax
	cmpq	$1024, %rax
	jne	.L1074
	cmpb	$0, 44(%rbx)
	je	.L1075
	xorl	%eax, %eax
.L1076:
	movl	1096(%rbx,%rax), %edx
	movl	%edx, 2124(%rbx,%rax)
	addq	$4, %rax
	cmpq	$1028, %rax
	jne	.L1076
	xorl	%ecx, %ecx
.L1079:
	leaq	(%rcx,%rcx), %rdx
	addq	3160(%rbx), %rdx
	movzbl	(%rdx), %eax
	leaq	(%rbx,%rax,4), %rdi
	movl	2124(%rdi), %eax
	movw	%ax, (%rdx)
	movl	%ecx, %edx
	sarl	%edx
	testb	$1, %cl
	movslq	%edx, %rsi
	movq	3168(%rbx), %rdx
	jne	.L1077
	addq	%rsi, %rdx
	sarl	$16, %eax
	movb	(%rdx), %sil
	andl	$-16, %esi
	jmp	.L1260
.L1077:
	addq	%rsi, %rdx
	sarl	$16, %eax
	movb	(%rdx), %sil
	sall	$4, %eax
	andl	$15, %esi
.L1260:
	orl	%esi, %eax
	incq	%rcx
	movb	%al, (%rdx)
	incl	2124(%rdi)
	cmpl	%ecx, %r15d
	jg	.L1079
	movl	56(%rbx), %eax
	movq	3168(%rbx), %rcx
	movl	%eax, %edx
	sarl	%edx
	movslq	%edx, %rdx
	movzbl	(%rcx,%rdx), %r13d
	leal	0(,%rax,4), %ecx
	movq	3160(%rbx), %rdx
	andl	$4, %ecx
	shrl	%cl, %r13d
	movslq	%eax, %rcx
	movzwl	(%rdx,%rcx,2), %edx
	sall	$16, %r13d
	andl	$983040, %r13d
	orl	%edx, %r13d
.L1082:
	movl	%r13d, %esi
	movl	%r13d, %ebp
	movq	3160(%rbx), %rdx
	movslq	%r13d, %r9
	sarl	%esi
	leal	0(,%rbp,4), %ecx
	addq	%r9, %r9
	movslq	%esi, %rsi
	addq	3168(%rbx), %rsi
	andl	$4, %ecx
	addq	%r9, %rdx
	movzbl	(%rsi), %r13d
	shrl	%cl, %r13d
	movzwl	(%rdx), %ecx
	movw	%ax, (%rdx)
	sarl	$16, %eax
	sall	$16, %r13d
	movb	(%rsi), %dl
	andl	$983040, %r13d
	orl	%ecx, %r13d
	testb	$1, %bpl
	jne	.L1080
	andl	$-16, %edx
	jmp	.L1261
.L1080:
	andl	$15, %edx
	sall	$4, %eax
.L1261:
	orl	%edx, %eax
	movb	%al, (%rsi)
	movl	%ebp, %eax
	cmpl	%ebp, 56(%rbx)
	jne	.L1082
	movl	%ebp, %r11d
	movl	%ebp, 60(%rbx)
	leal	0(,%rbp,4), %r10d
	leaq	1096(%rbx), %rsi
	shrl	%r11d
	andl	$4, %r10d
	cmpb	$0, 20(%rbx)
	movl	$0, 1092(%rbx)
	je	.L1083
	movq	$0, 24(%rbx)
	movl	%ebp, %edi
	call	BZ2_indexIntoF
	movq	3168(%rbx), %rdx
	movl	%eax, 64(%rbx)
	movl	%r10d, %ecx
	movzbl	(%rdx,%r11), %edx
	shrl	%cl, %edx
	movq	3160(%rbx), %rcx
	sall	$16, %edx
	movzwl	(%rcx,%r9), %ecx
	andl	$983040, %edx
	movl	$1, 1092(%rbx)
	orl	%ecx, %edx
	movl	%edx, 60(%rbx)
	movl	BZ2_rNums(%rip), %edx
	movl	$1, 28(%rbx)
	decl	%edx
	movl	%edx, 24(%rbx)
	jmp	.L1263
.L1083:
	movl	%ebp, %edi
	call	BZ2_indexIntoF
	movq	3160(%rbx), %rdx
	movl	%eax, 64(%rbx)
	movq	3168(%rbx), %rax
	movl	%r10d, %ecx
	movzwl	(%rdx,%r9), %edx
	movzbl	(%rax,%r11), %eax
	shrl	%cl, %eax
	sall	$16, %eax
	andl	$983040, %eax
	orl	%edx, %eax
	jmp	.L1264
.L1075:
	movq	3152(%rbx), %rdx
	xorl	%eax, %eax
.L1084:
	movzbl	(%rdx,%rax,4), %ecx
	movl	%eax, %edi
	incq	%rax
	sall	$8, %edi
	leaq	(%rbx,%rcx,4), %rcx
	movslq	1096(%rcx), %rsi
	orl	%edi, (%rdx,%rsi,4)
	incl	1096(%rcx)
	cmpl	%eax, %r15d
	jg	.L1084
	movslq	56(%rbx), %rax
	testl	%r15d, %r15d
	movl	$1, %ebp
	cmovg	%r15d, %ebp
	movl	(%rdx,%rax,4), %eax
	movl	$0, 1092(%rbx)
	shrl	$8, %eax
	cmpb	$0, 20(%rbx)
	movl	%eax, 60(%rbx)
	leaq	(%rdx,%rax,4), %rax
	je	.L1085
	movq	$0, 24(%rbx)
	movl	(%rax), %eax
	movl	$1, 1092(%rbx)
	movl	%eax, %edx
	movzbl	%al, %eax
	shrl	$8, %edx
	movl	%edx, 60(%rbx)
	movl	BZ2_rNums(%rip), %edx
	movl	$1, 28(%rbx)
	decl	%edx
	movl	%edx, 24(%rbx)
.L1263:
	decl	%edx
	sete	%dl
	movzbl	%dl, %edx
	xorl	%edx, %eax
	movl	%eax, 64(%rbx)
	jmp	.L1192
.L1085:
	movl	(%rax), %eax
	movzbl	%al, %edx
	shrl	$8, %eax
	movl	%edx, 64(%rbx)
.L1264:
	movl	%eax, 60(%rbx)
	movl	$1, 1092(%rbx)
	jmp	.L1192
.L871:
	movl	$42, 8(%rbx)
.L1087:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L1086
	movl	32(%rbx), %edx
	subl	$8, %ecx
	movl	$-4, %eax
	movl	%ecx, 36(%rbx)
	shrl	%cl, %edx
	cmpb	$114, %dl
	je	.L870
	jmp	.L905
.L1086:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L1087
	incl	16(%rax)
	jmp	.L1087
.L870:
	movl	$43, 8(%rbx)
.L1090:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L1089
	movl	32(%rbx), %edx
	subl	$8, %ecx
	movl	$-4, %eax
	movl	%ecx, 36(%rbx)
	shrl	%cl, %edx
	cmpb	$69, %dl
	je	.L869
	jmp	.L905
.L1089:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L1090
	incl	16(%rax)
	jmp	.L1090
.L869:
	movl	$44, 8(%rbx)
.L1093:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L1092
	movl	32(%rbx), %edx
	subl	$8, %ecx
	movl	$-4, %eax
	movl	%ecx, 36(%rbx)
	shrl	%cl, %edx
	cmpb	$56, %dl
	je	.L868
	jmp	.L905
.L1092:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L1093
	incl	16(%rax)
	jmp	.L1093
.L868:
	movl	$45, 8(%rbx)
.L1096:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L1095
	movl	32(%rbx), %edx
	subl	$8, %ecx
	movl	$-4, %eax
	movl	%ecx, 36(%rbx)
	shrl	%cl, %edx
	cmpb	$80, %dl
	je	.L867
	jmp	.L905
.L1095:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L1096
	incl	16(%rax)
	jmp	.L1096
.L867:
	movl	$46, 8(%rbx)
.L1100:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L1098
	movl	32(%rbx), %edx
	subl	$8, %ecx
	movl	$-4, %eax
	movl	%ecx, 36(%rbx)
	shrl	%cl, %edx
	cmpb	$-112, %dl
	jne	.L905
	movl	$0, 3180(%rbx)
	jmp	.L866
.L1098:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L1100
	incl	16(%rax)
	jmp	.L1100
.L866:
	movl	$47, 8(%rbx)
.L1103:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L1102
	movl	32(%rbx), %eax
	subl	$8, %ecx
	movl	%ecx, 36(%rbx)
	shrl	%cl, %eax
	movzbl	%al, %edx
	movl	3180(%rbx), %eax
	sall	$8, %eax
	orl	%edx, %eax
	movl	%eax, 3180(%rbx)
	jmp	.L865
.L1102:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L1103
	incl	16(%rax)
	jmp	.L1103
.L865:
	movl	$48, 8(%rbx)
.L1106:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L1105
	movl	32(%rbx), %eax
	subl	$8, %ecx
	movl	%ecx, 36(%rbx)
	shrl	%cl, %eax
	movzbl	%al, %edx
	movl	3180(%rbx), %eax
	sall	$8, %eax
	orl	%edx, %eax
	movl	%eax, 3180(%rbx)
	jmp	.L864
.L1105:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L1106
	incl	16(%rax)
	jmp	.L1106
.L864:
	movl	$49, 8(%rbx)
.L1109:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L1108
	movl	32(%rbx), %eax
	subl	$8, %ecx
	movl	%ecx, 36(%rbx)
	shrl	%cl, %eax
	movzbl	%al, %edx
	movl	3180(%rbx), %eax
	sall	$8, %eax
	orl	%edx, %eax
	movl	%eax, 3180(%rbx)
	jmp	.L862
.L1108:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L1109
	incl	16(%rax)
	jmp	.L1109
.L862:
	movl	$50, 8(%rbx)
.L1112:
	movl	36(%rbx), %ecx
	cmpl	$7, %ecx
	jle	.L1111
	movl	32(%rbx), %eax
	subl	$8, %ecx
	movl	$1, 8(%rbx)
	movl	%ecx, 36(%rbx)
	shrl	%cl, %eax
	movzbl	%al, %edx
	movl	3180(%rbx), %eax
	sall	$8, %eax
	orl	%edx, %eax
	movl	%eax, 3180(%rbx)
	movl	$4, %eax
	jmp	.L905
.L1111:
	movq	(%rbx), %rax
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L1192
	movq	(%rax), %rdi
	movl	32(%rbx), %edx
	addl	$8, %ecx
	decl	%esi
	movzbl	(%rdi), %r9d
	sall	$8, %edx
	movl	%ecx, 36(%rbx)
	incq	%rdi
	orl	%r9d, %edx
	movl	%edx, 32(%rbx)
	incl	12(%rax)
	movq	%rdi, (%rax)
	movl	%esi, 8(%rax)
	jne	.L1112
	incl	16(%rax)
	jmp	.L1112
.L861:
	movl	$4001, %edi
	call	BZ2_bz__AssertH__fail
.L1122:
	movl	$-3, %eax
	jmp	.L905
.L1160:
	movl	$0, 20(%rsp)
	xorl	%r15d, %r15d
	movl	$256, %ebp
	movl	$0, 16(%rsp)
	jmp	.L1178
.L1165:
	movl	%edx, 56(%rsp)
.L1178:
	movl	$-4, %eax
	jmp	.L905
.L1192:
	xorl	%eax, %eax
.L905:
	movl	52(%rsp), %edi
	movl	68(%rsp), %esi
	movl	%ebp, 64036(%rbx)
	movl	%r13d, 64040(%rbx)
	movl	%edi, 64044(%rbx)
	movl	8(%rsp), %edi
	movl	%esi, 64048(%rbx)
	movl	12(%rsp), %esi
	movl	%edi, 64052(%rbx)
	movl	80(%rsp), %edi
	movl	%esi, 64056(%rbx)
	movl	16(%rsp), %esi
	movl	%edi, 64060(%rbx)
	movl	20(%rsp), %edi
	movl	%esi, 64064(%rbx)
	movl	(%rsp), %esi
	movl	%edi, 64068(%rbx)
	movl	72(%rsp), %edi
	movl	%esi, 64072(%rbx)
	movl	4(%rsp), %esi
	movl	%edi, 64076(%rbx)
	movl	56(%rsp), %edi
	movl	%esi, 64084(%rbx)
	movl	60(%rsp), %esi
	movl	%edi, 64088(%rbx)
	movl	84(%rsp), %edi
	movl	%esi, 64092(%rbx)
	movl	48(%rsp), %esi
	movl	%edi, 64096(%rbx)
	movl	%r15d, 64080(%rbx)
	movl	%r14d, 64100(%rbx)
	movl	%r12d, 64104(%rbx)
	movl	%esi, 64108(%rbx)
	movl	76(%rsp), %edi
	movl	64(%rsp), %esi
	movl	%edi, 64112(%rbx)
	movq	24(%rsp), %rdi
	movl	%esi, 64116(%rbx)
	movq	32(%rsp), %rsi
	movq	%rdi, 64120(%rbx)
	movq	40(%rsp), %rdi
	movq	%rsi, 64128(%rbx)
	movq	%rdi, 64136(%rbx)
	movq	104(%rsp), %rsi
	xorq	%fs:40, %rsi
	je	.L1114
	call	__stack_chk_fail@PLT
.L1114:
	addq	$120, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE57:
	.size	BZ2_decompress, .-BZ2_decompress
	.section	.rodata.str1.1
.LC46:
	.string	" {0x%x, 0x%x}"
.LC47:
	.string	"\n    combined CRCs: stored = 0x%x, computed = 0x%x"
	.text
	.globl	BZ2_bzDecompress
	.type	BZ2_bzDecompress, @function
BZ2_bzDecompress:
.LFB77:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	$-2, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	testq	%rdi, %rdi
	je	.L1280
	movq	48(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L1280
	cmpq	%rdi, (%rbx)
	jne	.L1280
	leaq	BZ2_rNums(%rip), %rbp
.L1366:
	movl	8(%rbx), %eax
.L1363:
	cmpl	$1, %eax
	je	.L1371
	cmpl	$2, %eax
	jne	.L1282
	cmpb	$0, 44(%rbx)
	movb	20(%rbx), %al
	je	.L1283
	leaq	BZ2_crc32Table(%rip), %r13
	testb	%al, %al
	je	.L1285
.L1284:
	movq	(%rbx), %rax
	cmpl	$0, 32(%rax)
	je	.L1287
	cmpl	$0, 16(%rbx)
	je	.L1288
	movq	24(%rax), %rax
	movb	12(%rbx), %dl
	movb	%dl, (%rax)
	movl	3184(%rbx), %eax
	movl	%eax, %ecx
	sall	$8, %eax
	shrl	$24, %ecx
	xorl	%ecx, %edx
	leaq	BZ2_crc32Table(%rip), %rcx
	movzbl	%dl, %edx
	xorl	(%rcx,%rdx,4), %eax
	decl	16(%rbx)
	movl	%eax, 3184(%rbx)
	movq	(%rbx), %rax
	incq	24(%rax)
	decl	32(%rax)
	incl	36(%rax)
	jne	.L1284
	incl	40(%rax)
	jmp	.L1284
.L1288:
	movl	64080(%rbx), %r11d
	movl	1092(%rbx), %r10d
	leal	1(%r11), %r14d
	cmpl	%r14d, %r10d
	je	.L1367
	movl	64(%rbx), %edx
	movl	$1, 16(%rbx)
	leaq	1096(%rbx), %rsi
	movl	60(%rbx), %edi
	movb	%dl, 12(%rbx)
	movl	%edx, 8(%rsp)
	call	BZ2_indexIntoF
	movq	3168(%rbx), %r13
	movq	3160(%rbx), %r12
	movl	%edi, %ecx
	movl	8(%rsp), %edx
	shrl	%ecx
	movzbl	0(%r13,%rcx), %r9d
	leal	0(,%rdi,4), %ecx
	andl	$4, %ecx
	shrl	%cl, %r9d
	movzwl	(%r12,%rdi,2), %ecx
	sall	$16, %r9d
	andl	$983040, %r9d
	orl	%ecx, %r9d
	cmpl	$0, 24(%rbx)
	movl	%r9d, 60(%rbx)
	jne	.L1293
	movslq	28(%rbx), %rcx
	movq	%rcx, %rdi
	movl	0(%rbp,%rcx,4), %ecx
	cmpl	$511, %edi
	movl	%ecx, 24(%rbx)
	leal	1(%rdi), %ecx
	movl	$0, %edi
	cmove	%edi, %ecx
	movl	%ecx, 28(%rbx)
.L1293:
	movl	24(%rbx), %edi
	leal	-1(%rdi), %r15d
	cmpl	$1, %r15d
	movl	%r15d, 24(%rbx)
	sete	%cl
	xorl	%ecx, %eax
	leal	1(%r10), %ecx
	movl	%ecx, 1092(%rbx)
	cmpl	%r11d, %r10d
	je	.L1284
	movzbl	%al, %r11d
	cmpl	%r11d, %edx
	je	.L1296
	movl	%r11d, 64(%rbx)
	jmp	.L1284
.L1296:
	movl	$2, 16(%rbx)
	movl	%r9d, %edi
	call	BZ2_indexIntoF
	movl	%r9d, %edx
	leal	0(,%r9,4), %ecx
	shrl	%edx
	andl	$4, %ecx
	movzbl	0(%r13,%rdx), %edi
	movzwl	(%r12,%r9,2), %edx
	shrl	%cl, %edi
	sall	$16, %edi
	andl	$983040, %edi
	orl	%edx, %edi
	movl	%edi, 60(%rbx)
	testl	%r15d, %r15d
	jne	.L1298
	movslq	28(%rbx), %rdx
	movq	%rdx, %rcx
	movl	0(%rbp,%rdx,4), %edx
	cmpl	$511, %ecx
	movl	%edx, 24(%rbx)
	leal	1(%rcx), %edx
	cmovne	%edx, %r15d
	movl	%r15d, 28(%rbx)
.L1298:
	movl	24(%rbx), %ecx
	leal	-1(%rcx), %r15d
	cmpl	$1, %r15d
	movl	%r15d, 24(%rbx)
	sete	%dl
	xorl	%edx, %eax
	leal	2(%r10), %edx
	movl	%edx, 1092(%rbx)
	cmpl	%edx, %r14d
	je	.L1284
	movzbl	%al, %eax
	cmpl	%eax, %r11d
	jne	.L1392
	movl	$3, 16(%rbx)
	call	BZ2_indexIntoF
	movl	%edi, %edx
	leal	0(,%rdi,4), %ecx
	shrl	%edx
	andl	$4, %ecx
	movzbl	0(%r13,%rdx), %r9d
	movzwl	(%r12,%rdi,2), %edx
	shrl	%cl, %r9d
	sall	$16, %r9d
	andl	$983040, %r9d
	orl	%edx, %r9d
	movl	%r9d, 60(%rbx)
	testl	%r15d, %r15d
	jne	.L1303
	movslq	28(%rbx), %rdx
	movq	%rdx, %rcx
	movl	0(%rbp,%rdx,4), %edx
	cmpl	$511, %ecx
	movl	%edx, 24(%rbx)
	leal	1(%rcx), %edx
	cmovne	%edx, %r15d
	movl	%r15d, 28(%rbx)
.L1303:
	movl	24(%rbx), %edi
	leal	-1(%rdi), %r15d
	cmpl	$1, %r15d
	movl	%r15d, 24(%rbx)
	sete	%dl
	xorl	%edx, %eax
	leal	3(%r10), %edx
	movl	%edx, 1092(%rbx)
	cmpl	%edx, %r14d
	je	.L1284
	movzbl	%al, %eax
	cmpl	%eax, %r11d
	je	.L1306
.L1392:
	movl	%eax, 64(%rbx)
	jmp	.L1284
.L1306:
	movl	%r9d, %edi
	call	BZ2_indexIntoF
	movl	%eax, %edx
	movl	%r9d, %eax
	leal	0(,%r9,4), %ecx
	shrl	%eax
	andl	$4, %ecx
	movzbl	0(%r13,%rax), %edi
	movzwl	(%r12,%r9,2), %eax
	shrl	%cl, %edi
	sall	$16, %edi
	andl	$983040, %edi
	orl	%eax, %edi
	movl	%edi, 60(%rbx)
	testl	%r15d, %r15d
	jne	.L1308
	movslq	28(%rbx), %rax
	movq	%rax, %rcx
	movl	0(%rbp,%rax,4), %eax
	cmpl	$511, %ecx
	movl	%eax, 24(%rbx)
	leal	1(%rcx), %eax
	cmovne	%eax, %r15d
	movl	%r15d, 28(%rbx)
.L1308:
	movl	24(%rbx), %eax
	leal	-1(%rax), %r9d
	leal	4(%r10), %eax
	cmpl	$1, %r9d
	movl	%eax, 1092(%rbx)
	sete	%al
	movl	%r9d, 24(%rbx)
	xorl	%edx, %eax
	movzbl	%al, %eax
	addl	$4, %eax
	movl	%eax, 16(%rbx)
	call	BZ2_indexIntoF
	movl	%edi, %edx
	movl	%eax, 64(%rbx)
	leal	0(,%rdi,4), %ecx
	shrl	%edx
	andl	$4, %ecx
	movzbl	0(%r13,%rdx), %edx
	shrl	%cl, %edx
	movzwl	(%r12,%rdi,2), %ecx
	sall	$16, %edx
	andl	$983040, %edx
	orl	%ecx, %edx
	movl	%edx, 60(%rbx)
	testl	%r9d, %r9d
	jne	.L1312
	movslq	28(%rbx), %rdx
	movq	%rdx, %rcx
	movl	0(%rbp,%rdx,4), %edx
	cmpl	$511, %ecx
	movl	%edx, 24(%rbx)
	leal	1(%rcx), %edx
	cmovne	%edx, %r9d
	movl	%r9d, 28(%rbx)
.L1312:
	movl	24(%rbx), %esi
	leal	-1(%rsi), %edx
	movl	%edx, 24(%rbx)
	decl	%edx
	sete	%dl
	addl	$5, %r10d
	movzbl	%dl, %edx
	movl	%r10d, 1092(%rbx)
	xorl	%edx, %eax
	movl	%eax, 64(%rbx)
	jmp	.L1284
.L1396:
	cmpl	$0, 16(%rbx)
	je	.L1316
	movq	24(%rax), %rax
	movb	12(%rbx), %dl
	movb	%dl, (%rax)
	movl	3184(%rbx), %eax
	movl	%eax, %ecx
	sall	$8, %eax
	shrl	$24, %ecx
	xorl	%ecx, %edx
	movzbl	%dl, %edx
	xorl	0(%r13,%rdx,4), %eax
	decl	16(%rbx)
	movl	%eax, 3184(%rbx)
	movq	(%rbx), %rax
	incq	24(%rax)
	decl	32(%rax)
	incl	36(%rax)
	jne	.L1285
	incl	40(%rax)
.L1285:
	movq	(%rbx), %rax
	cmpl	$0, 32(%rax)
	jne	.L1396
	jmp	.L1287
.L1316:
	movl	64080(%rbx), %edx
	movl	1092(%rbx), %r9d
	leal	1(%rdx), %r14d
	movl	%edx, 8(%rsp)
	cmpl	%r14d, %r9d
	je	.L1367
	movl	64(%rbx), %r12d
	movl	$1, 16(%rbx)
	leaq	1096(%rbx), %rsi
	movl	60(%rbx), %edi
	movb	%r12b, 12(%rbx)
	call	BZ2_indexIntoF
	movq	3168(%rbx), %r11
	movq	3160(%rbx), %r10
	movl	%edi, %ecx
	movl	8(%rsp), %edx
	shrl	%ecx
	movzbl	(%r11,%rcx), %r15d
	leal	0(,%rdi,4), %ecx
	andl	$4, %ecx
	shrl	%cl, %r15d
	movzwl	(%r10,%rdi,2), %ecx
	sall	$16, %r15d
	andl	$983040, %r15d
	orl	%ecx, %r15d
	leal	1(%r9), %ecx
	movl	%r15d, 60(%rbx)
	movl	%ecx, 1092(%rbx)
	cmpl	%edx, %r9d
	je	.L1285
	movzbl	%al, %eax
	cmpl	%eax, %r12d
	jne	.L1393
	movl	$2, 16(%rbx)
	movl	%r15d, %edi
	call	BZ2_indexIntoF
	movl	%r15d, %edx
	leal	0(,%r15,4), %ecx
	shrl	%edx
	andl	$4, %ecx
	movzbl	(%r11,%rdx), %edi
	movzwl	(%r10,%r15,2), %edx
	shrl	%cl, %edi
	sall	$16, %edi
	andl	$983040, %edi
	orl	%edx, %edi
	leal	2(%r9), %edx
	movl	%edi, 60(%rbx)
	movl	%edx, 1092(%rbx)
	cmpl	%edx, %r14d
	je	.L1285
	movzbl	%al, %eax
	cmpl	%eax, %r12d
	jne	.L1393
	movl	$3, 16(%rbx)
	call	BZ2_indexIntoF
	movl	%edi, %edx
	leal	0(,%rdi,4), %ecx
	shrl	%edx
	andl	$4, %ecx
	movzbl	(%r11,%rdx), %r15d
	movzwl	(%r10,%rdi,2), %edx
	shrl	%cl, %r15d
	sall	$16, %r15d
	andl	$983040, %r15d
	orl	%edx, %r15d
	leal	3(%r9), %edx
	movl	%r15d, 60(%rbx)
	movl	%edx, 1092(%rbx)
	cmpl	%edx, %r14d
	je	.L1285
	movzbl	%al, %eax
	cmpl	%eax, %r12d
	je	.L1321
.L1393:
	movl	%eax, 64(%rbx)
	jmp	.L1285
.L1321:
	movl	%r15d, %edi
	call	BZ2_indexIntoF
	movl	%r15d, %edx
	leal	0(,%r15,4), %ecx
	shrl	%edx
	andl	$4, %ecx
	movzbl	%al, %eax
	movzbl	(%r11,%rdx), %edi
	movzwl	(%r10,%r15,2), %edx
	addl	$4, %eax
	movl	%eax, 16(%rbx)
	shrl	%cl, %edi
	sall	$16, %edi
	andl	$983040, %edi
	orl	%edx, %edi
	leal	4(%r9), %edx
	movl	%edx, 1092(%rbx)
	movl	%edi, 60(%rbx)
	call	BZ2_indexIntoF
	movl	%eax, 64(%rbx)
	movl	%edi, %eax
	movzwl	(%r10,%rdi,2), %edx
	addl	$5, %r9d
	shrl	%eax
	leal	0(,%rdi,4), %ecx
	movzbl	(%r11,%rax), %eax
	andl	$4, %ecx
	movl	%r9d, 1092(%rbx)
	shrl	%cl, %eax
	sall	$16, %eax
	andl	$983040, %eax
	orl	%edx, %eax
	movl	%eax, 60(%rbx)
	jmp	.L1285
.L1283:
	testb	%al, %al
	je	.L1390
	xorl	%esi, %esi
	leaq	BZ2_crc32Table(%rip), %rdi
.L1322:
	movq	(%rbx), %rax
	cmpl	$0, 32(%rax)
	je	.L1287
	cmpl	$0, 16(%rbx)
	je	.L1324
	movq	24(%rax), %rax
	movb	12(%rbx), %dl
	movb	%dl, (%rax)
	movl	3184(%rbx), %eax
	movl	%eax, %edx
	sall	$8, %eax
	shrl	$24, %edx
	xorl	12(%rbx), %edx
	movzbl	%dl, %edx
	xorl	(%rdi,%rdx,4), %eax
	decl	16(%rbx)
	movl	%eax, 3184(%rbx)
	movq	(%rbx), %rax
	incq	24(%rax)
	decl	32(%rax)
	incl	36(%rax)
	jne	.L1322
	incl	40(%rax)
	jmp	.L1322
.L1324:
	movl	64080(%rbx), %r12d
	movl	1092(%rbx), %eax
	leal	1(%r12), %r10d
	cmpl	%r10d, %eax
	je	.L1367
	movl	60(%rbx), %edx
	movl	64(%rbx), %r11d
	movl	$1, 16(%rbx)
	movq	3152(%rbx), %r8
	movb	%r11b, 12(%rbx)
	movl	(%r8,%rdx,4), %r13d
	movl	%r13d, %ecx
	shrl	$8, %ecx
	cmpl	$0, 24(%rbx)
	movl	%ecx, 60(%rbx)
	jne	.L1328
	movslq	28(%rbx), %r9
	movq	%r9, %rdx
	movl	0(%rbp,%r9,4), %r9d
	cmpl	$511, %edx
	movl	%r9d, 24(%rbx)
	leal	1(%rdx), %r9d
	cmove	%esi, %r9d
	movl	%r9d, 28(%rbx)
.L1328:
	movl	24(%rbx), %edx
	leal	-1(%rdx), %r9d
	cmpl	$1, %r9d
	movl	%r9d, 24(%rbx)
	sete	%dl
	xorl	%r13d, %edx
	leal	1(%rax), %r13d
	movl	%r13d, 1092(%rbx)
	cmpl	%r12d, %eax
	je	.L1322
	movzbl	%dl, %edx
	cmpl	%edx, %r11d
	je	.L1331
	movl	%edx, 64(%rbx)
	jmp	.L1322
.L1331:
	movl	$2, 16(%rbx)
	movl	(%r8,%rcx,4), %r12d
	movl	%r12d, %r11d
	shrl	$8, %r11d
	movl	%r11d, 60(%rbx)
	testl	%r9d, %r9d
	jne	.L1333
	movslq	28(%rbx), %r9
	movq	%r9, %rcx
	movl	0(%rbp,%r9,4), %r9d
	cmpl	$511, %ecx
	movl	%r9d, 24(%rbx)
	leal	1(%rcx), %r9d
	cmove	%esi, %r9d
	movl	%r9d, 28(%rbx)
.L1333:
	movl	24(%rbx), %ecx
	leal	-1(%rcx), %r9d
	cmpl	$1, %r9d
	movl	%r9d, 24(%rbx)
	sete	%cl
	xorl	%r12d, %ecx
	leal	2(%rax), %r12d
	movl	%r12d, 1092(%rbx)
	cmpl	%r12d, %r10d
	je	.L1322
	movzbl	%cl, %ecx
	cmpl	%ecx, %edx
	jne	.L1394
	movl	$3, 16(%rbx)
	movl	(%r8,%r11,4), %r12d
	movl	%r12d, %r11d
	shrl	$8, %r11d
	movl	%r11d, 60(%rbx)
	testl	%r9d, %r9d
	jne	.L1338
	movslq	28(%rbx), %r9
	movq	%r9, %rcx
	movl	0(%rbp,%r9,4), %r9d
	cmpl	$511, %ecx
	movl	%r9d, 24(%rbx)
	leal	1(%rcx), %r9d
	cmove	%esi, %r9d
	movl	%r9d, 28(%rbx)
.L1338:
	movl	24(%rbx), %ecx
	leal	-1(%rcx), %r9d
	cmpl	$1, %r9d
	movl	%r9d, 24(%rbx)
	sete	%cl
	xorl	%r12d, %ecx
	leal	3(%rax), %r12d
	movl	%r12d, 1092(%rbx)
	cmpl	%r12d, %r10d
	je	.L1322
	movzbl	%cl, %ecx
	cmpl	%ecx, %edx
	je	.L1341
.L1394:
	movl	%ecx, 64(%rbx)
	jmp	.L1322
.L1341:
	movl	(%r8,%r11,4), %r11d
	movl	%r11d, %r10d
	shrl	$8, %r10d
	movl	%r10d, 60(%rbx)
	testl	%r9d, %r9d
	jne	.L1343
	movslq	28(%rbx), %rdx
	movq	%rdx, %r9
	movl	0(%rbp,%rdx,4), %edx
	leal	1(%r9), %ecx
	cmpl	$511, %r9d
	cmove	%esi, %ecx
	movl	%edx, 24(%rbx)
	movl	%ecx, 28(%rbx)
.L1343:
	movl	24(%rbx), %ecx
	leal	4(%rax), %edx
	movl	%edx, 1092(%rbx)
	decl	%ecx
	cmpl	$1, %ecx
	movl	%ecx, 24(%rbx)
	sete	%dl
	xorl	%r11d, %edx
	movzbl	%dl, %edx
	addl	$4, %edx
	movl	%edx, 16(%rbx)
	movl	(%r8,%r10,4), %edx
	movzbl	%dl, %r9d
	shrl	$8, %edx
	movl	%r9d, 64(%rbx)
	movl	%edx, 60(%rbx)
	testl	%ecx, %ecx
	jne	.L1347
	movslq	28(%rbx), %rdx
	movq	%rdx, %r8
	movl	0(%rbp,%rdx,4), %edx
	leal	1(%r8), %ecx
	cmpl	$511, %r8d
	cmove	%esi, %ecx
	movl	%edx, 24(%rbx)
	movl	%ecx, 28(%rbx)
.L1347:
	movl	24(%rbx), %ecx
	leal	-1(%rcx), %edx
	movl	%edx, 24(%rbx)
	decl	%edx
	sete	%dl
	addl	$5, %eax
	movzbl	%dl, %edx
	movl	%eax, 1092(%rbx)
	xorl	%r9d, %edx
	movl	%edx, 64(%rbx)
	jmp	.L1322
.L1390:
	movq	(%rbx), %r8
	movl	64080(%rbx), %r14d
	movl	3184(%rbx), %ecx
	movb	12(%rbx), %r11b
	movl	32(%r8), %eax
	movl	16(%rbx), %edx
	movl	%r14d, 8(%rsp)
	leal	1(%r14), %r15d
	movq	24(%r8), %r9
	movl	1092(%rbx), %edi
	leaq	BZ2_crc32Table(%rip), %r14
	movl	64(%rbx), %esi
	movq	3152(%rbx), %r10
	movl	%eax, 12(%rsp)
	movl	60(%rbx), %eax
	movl	12(%rsp), %r8d
.L1350:
	movl	%esi, %r12d
	testl	%edx, %edx
	jle	.L1351
	movzbl	%r11b, %r13d
	movl	%r13d, 28(%rsp)
.L1354:
	testl	%r8d, %r8d
	je	.L1352
	movl	%ecx, %r12d
	movl	%ecx, %r13d
	shrl	$24, %r12d
	xorl	28(%rsp), %r12d
	sall	$8, %r13d
	movl	%r12d, 20(%rsp)
	leal	-1(%r8), %r12d
	movl	%r13d, 16(%rsp)
	leaq	1(%r9), %r13
	movl	%r12d, 24(%rsp)
	cmpl	$1, %edx
	je	.L1353
	movl	20(%rsp), %r12d
	movl	16(%rsp), %ecx
	movb	%r11b, (%r9)
	decl	%edx
	movl	24(%rsp), %r8d
	movq	%r13, %r9
	xorl	(%r14,%r12,4), %ecx
	jmp	.L1354
.L1353:
	movl	%ecx, %edx
	shrl	$24, %ecx
	movb	%r11b, (%r9)
	decl	%r8d
	xorl	%r11d, %ecx
	sall	$8, %edx
	incq	%r9
	movl	%esi, %r12d
	movzbl	%cl, %ecx
	xorl	(%r14,%rcx,4), %edx
	movl	%edx, %ecx
.L1351:
	cmpl	%edi, %r15d
	je	.L1374
	movl	%esi, %r11d
	movl	(%r10,%rax,4), %esi
	movl	%esi, %eax
	movzbl	%sil, %esi
	shrl	$8, %eax
	cmpl	%esi, %r12d
	je	.L1397
.L1355:
	incl	%edi
	testl	%r8d, %r8d
	jne	.L1353
	movl	$1, %edx
	jmp	.L1352
.L1397:
	cmpl	%edi, 8(%rsp)
	je	.L1355
	movl	(%r10,%rax,4), %esi
	leal	2(%rdi), %r13d
	movl	$2, %edx
	movl	%esi, %eax
	shrl	$8, %eax
	cmpl	%r13d, %r15d
	jne	.L1398
.L1356:
	movl	%r12d, %esi
	movl	%r13d, %edi
	jmp	.L1350
.L1398:
	movzbl	%sil, %esi
	cmpl	%esi, %r12d
	je	.L1399
	movl	%esi, %r12d
	movl	$2, %edx
	jmp	.L1356
.L1399:
	movl	(%r10,%rax,4), %esi
	leal	3(%rdi), %r13d
	movl	$3, %edx
	movl	%esi, %eax
	shrl	$8, %eax
	cmpl	%r13d, %r15d
	je	.L1356
	movzbl	%sil, %esi
	cmpl	%esi, %r12d
	je	.L1400
	movl	%esi, %r12d
	movl	$3, %edx
	jmp	.L1356
.L1400:
	movl	(%r10,%rax,4), %eax
	leal	5(%rdi), %r13d
	movzbl	%al, %edx
	shrl	$8, %eax
	movl	(%r10,%rax,4), %eax
	addl	$4, %edx
	movzbl	%al, %r12d
	shrl	$8, %eax
	jmp	.L1356
.L1374:
	xorl	%edx, %edx
.L1352:
	movq	(%rbx), %r13
	movl	12(%rsp), %r12d
	movl	36(%r13), %r14d
	addl	%r14d, %r12d
	subl	%r8d, %r12d
	movl	%r12d, 36(%r13)
	cmpl	%r12d, %r14d
	jbe	.L1357
	incl	40(%r13)
.L1357:
	movl	%ecx, 3184(%rbx)
	movb	%r11b, 12(%rbx)
	movl	%edx, 16(%rbx)
	movl	%edi, 1092(%rbx)
	movl	%esi, 64(%rbx)
	movq	%r10, 3152(%rbx)
	movl	%eax, 60(%rbx)
	movq	%r9, 24(%r13)
	movl	%r8d, 32(%r13)
.L1287:
	movl	64080(%rbx), %eax
	incl	%eax
	cmpl	%eax, 1092(%rbx)
	jne	.L1395
	cmpl	$0, 16(%rbx)
	jne	.L1395
.L1367:
	movl	3184(%rbx), %r8d
	cmpl	$2, 52(%rbx)
	notl	%r8d
	movl	%r8d, 3184(%rbx)
	jle	.L1359
	movl	3176(%rbx), %ecx
	movq	stderr(%rip), %rdi
	leaq	.LC46(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
.L1359:
	cmpl	$1, 52(%rbx)
	jle	.L1360
	movq	stderr(%rip), %rsi
	movl	$93, %edi
	call	fputc@PLT
.L1360:
	movl	3184(%rbx), %edx
	cmpl	3176(%rbx), %edx
	jne	.L1361
	movl	3188(%rbx), %eax
	movl	$14, 8(%rbx)
	roll	%eax
	xorl	%edx, %eax
	movl	%eax, 3188(%rbx)
	jmp	.L1362
.L1282:
	cmpl	$9, %eax
	jle	.L1363
.L1362:
	movq	%rbx, %rdi
	call	BZ2_decompress
	movl	%eax, %r12d
	cmpl	$4, %eax
	jne	.L1364
	cmpl	$2, 52(%rbx)
	jle	.L1365
	movl	3180(%rbx), %ecx
	movl	3188(%rbx), %r8d
	xorl	%eax, %eax
	leaq	.LC47(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	call	__fprintf_chk@PLT
.L1365:
	movl	3180(%rbx), %eax
	cmpl	%eax, 3188(%rbx)
	je	.L1280
.L1361:
	movl	$-4, %r12d
	jmp	.L1280
.L1364:
	cmpl	$2, 8(%rbx)
	je	.L1366
	jmp	.L1280
.L1371:
	orl	$-1, %r12d
	jmp	.L1280
.L1395:
	xorl	%r12d, %r12d
.L1280:
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	movl	%r12d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE77:
	.size	BZ2_bzDecompress, .-BZ2_bzDecompress
	.globl	BZ2_bzDecompressEnd
	.type	BZ2_bzDecompressEnd, @function
BZ2_bzDecompressEnd:
.LFB78:
	.cfi_startproc
	endbr64
	movl	$-2, %eax
	testq	%rdi, %rdi
	je	.L1419
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	pushq	%rcx
	.cfi_def_cfa_offset 32
	movq	48(%rdi), %rbp
	testq	%rbp, %rbp
	je	.L1401
	cmpq	%rdi, 0(%rbp)
	jne	.L1401
	movq	3152(%rbp), %rsi
	testq	%rsi, %rsi
	je	.L1403
	movq	72(%rdi), %rdi
	call	*64(%rbx)
.L1403:
	movq	3160(%rbp), %rsi
	testq	%rsi, %rsi
	je	.L1404
	movq	72(%rbx), %rdi
	call	*64(%rbx)
.L1404:
	movq	3168(%rbp), %rsi
	testq	%rsi, %rsi
	je	.L1405
	movq	72(%rbx), %rdi
	call	*64(%rbx)
.L1405:
	movq	48(%rbx), %rsi
	movq	72(%rbx), %rdi
	call	*64(%rbx)
	movq	$0, 48(%rbx)
	xorl	%eax, %eax
.L1401:
	popq	%rdx
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L1419:
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE78:
	.size	BZ2_bzDecompressEnd, .-BZ2_bzDecompressEnd
	.globl	BZ2_bzWriteOpen
	.type	BZ2_bzWriteOpen, @function
BZ2_bzWriteOpen:
.LFB80:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%ecx, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edx, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%r8d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	pushq	%r9
	.cfi_def_cfa_offset 64
	testq	%rdi, %rdi
	je	.L1423
	movl	$0, (%rdi)
	testq	%rsi, %rsi
	jne	.L1424
.L1429:
	movl	$-2, (%rbx)
	jmp	.L1453
.L1423:
	testq	%rsi, %rsi
	je	.L1453
.L1424:
	leal	-1(%r14), %eax
	cmpl	$8, %eax
	ja	.L1426
	cmpl	$250, %r13d
	ja	.L1426
	cmpl	$4, %r15d
	jbe	.L1427
.L1426:
	testq	%rbx, %rbx
	jne	.L1429
	jmp	.L1453
.L1427:
	movq	%rbp, %rdi
	call	ferror@PLT
	testl	%eax, %eax
	je	.L1430
	testq	%rbx, %rbx
	je	.L1453
	movl	$-6, (%rbx)
	jmp	.L1453
.L1430:
	movl	$5104, %edi
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L1432
	testq	%rbx, %rbx
	je	.L1453
	movl	$-3, (%rbx)
	jmp	.L1422
.L1432:
	testq	%rbx, %rbx
	je	.L1433
	movl	$0, (%rbx)
.L1433:
	movl	$0, 5096(%r12)
	movb	$0, 5100(%r12)
	movl	$0, 5008(%r12)
	movq	%rbp, (%r12)
	movb	$1, 5012(%r12)
	movq	$0, 5072(%r12)
	movq	$0, 5080(%r12)
	movq	$0, 5088(%r12)
	testl	%r13d, %r13d
	jne	.L1434
	movl	$30, %r13d
.L1434:
	leaq	5016(%r12), %rdi
	movl	%r13d, %ecx
	movl	%r15d, %edx
	movl	%r14d, %esi
	call	BZ2_bzCompressInit
	testl	%eax, %eax
	je	.L1435
	testq	%rbx, %rbx
	je	.L1436
	movl	%eax, (%rbx)
.L1436:
	movq	%r12, %rdi
	call	free@PLT
.L1453:
	xorl	%r12d, %r12d
	jmp	.L1422
.L1435:
	movl	$0, 5024(%r12)
	movb	$1, 5100(%r12)
.L1422:
	popq	%rdx
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE80:
	.size	BZ2_bzWriteOpen, .-BZ2_bzWriteOpen
	.globl	BZ2_bzWrite
	.type	BZ2_bzWrite, @function
BZ2_bzWrite:
.LFB81:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%ecx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %rbx
	pushq	%r8
	.cfi_def_cfa_offset 48
	testq	%rdi, %rdi
	je	.L1455
	movl	$0, (%rdi)
	testq	%rsi, %rsi
	je	.L1456
.L1477:
	movl	$0, 5096(%rbx)
	testq	%r13, %r13
	je	.L1457
	testl	%r12d, %r12d
	jns	.L1492
.L1457:
	testq	%rbp, %rbp
	je	.L1459
.L1456:
	movl	$-2, 0(%rbp)
	testq	%rbx, %rbx
	je	.L1454
.L1459:
	movl	$-2, 5096(%rbx)
	jmp	.L1454
.L1492:
	cmpb	$0, 5012(%rbx)
	jne	.L1461
	testq	%rbp, %rbp
	je	.L1462
	movl	$-1, 0(%rbp)
.L1462:
	movl	$-1, 5096(%rbx)
	jmp	.L1454
.L1461:
	movq	(%rbx), %rdi
	call	ferror@PLT
	testl	%eax, %eax
	je	.L1463
.L1494:
	testq	%rbp, %rbp
	je	.L1465
	movl	$-6, 0(%rbp)
.L1465:
	movl	$-6, 5096(%rbx)
	jmp	.L1454
.L1463:
	testl	%r12d, %r12d
	jne	.L1466
.L1495:
	testq	%rbp, %rbp
	je	.L1468
	movl	$0, 0(%rbp)
.L1468:
	movl	$0, 5096(%rbx)
	jmp	.L1454
.L1466:
	movl	%r12d, 5024(%rbx)
	movq	%r13, 5016(%rbx)
	leaq	8(%rbx), %r13
.L1475:
	movq	%r13, 5040(%rbx)
	xorl	%esi, %esi
	leaq	5016(%rbx), %rdi
	movl	$5000, 5048(%rbx)
	call	BZ2_bzCompress
	cmpl	$1, %eax
	je	.L1469
	testq	%rbp, %rbp
	je	.L1470
	movl	%eax, 0(%rbp)
.L1470:
	movl	%eax, 5096(%rbx)
	jmp	.L1454
.L1469:
	movl	5048(%rbx), %eax
	cmpl	$4999, %eax
	ja	.L1471
	movl	$5000, %r12d
	movq	(%rbx), %rcx
	movl	$1, %esi
	movq	%r13, %rdi
	subl	%eax, %r12d
	movl	%r12d, %edx
	call	fwrite@PLT
	cmpl	%eax, %r12d
	jne	.L1494
	movq	(%rbx), %rdi
	call	ferror@PLT
	testl	%eax, %eax
	jne	.L1494
.L1471:
	cmpl	$0, 5024(%rbx)
	jne	.L1475
	jmp	.L1495
.L1455:
	testq	%rsi, %rsi
	jne	.L1477
.L1454:
	popq	%rax
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE81:
	.size	BZ2_bzWrite, .-BZ2_bzWrite
	.globl	BZ2_bzWriteClose64
	.type	BZ2_bzWriteClose64, @function
BZ2_bzWriteClose64:
.LFB83:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%r8, 8(%rsp)
	movq	96(%rsp), %r13
	testq	%rsi, %rsi
	jne	.L1497
	testq	%rdi, %rdi
	je	.L1496
	movl	$0, (%rdi)
	jmp	.L1496
.L1497:
	cmpb	$0, 5012(%rsi)
	movq	%rsi, %rbp
	jne	.L1499
	testq	%rdi, %rdi
	je	.L1500
	movl	$-1, (%rdi)
.L1500:
	movl	$-1, 5096(%rbp)
	jmp	.L1496
.L1499:
	movq	(%rsi), %rdi
	movl	%edx, %r14d
	movq	%rcx, %rbx
	movq	%r9, %r12
	call	ferror@PLT
	testl	%eax, %eax
	je	.L1501
.L1566:
	testq	%r15, %r15
	je	.L1503
	movl	$-6, (%r15)
.L1503:
	movl	$-6, 5096(%rbp)
	jmp	.L1496
.L1501:
	testq	%rbx, %rbx
	je	.L1504
	movl	$0, (%rbx)
.L1504:
	cmpq	$0, 8(%rsp)
	je	.L1505
	movq	8(%rsp), %rax
	movl	$0, (%rax)
.L1505:
	testq	%r12, %r12
	je	.L1506
	movl	$0, (%r12)
.L1506:
	testq	%r13, %r13
	je	.L1507
	movl	$0, 0(%r13)
.L1507:
	testl	%r14d, %r14d
	jne	.L1508
	cmpl	$0, 5096(%rbp)
	jne	.L1509
	leaq	8(%rbp), %rax
	movq	%rax, 16(%rsp)
.L1516:
	movq	16(%rsp), %rax
	leaq	5016(%rbp), %rdi
	movl	$2, %esi
	movl	$5000, 5048(%rbp)
	movq	%rax, 5040(%rbp)
	call	BZ2_bzCompress
	movl	%eax, %r8d
	leal	-3(%rax), %eax
	cmpl	$1, %eax
	jbe	.L1510
	testq	%r15, %r15
	je	.L1511
	movl	%r8d, (%r15)
.L1511:
	movl	%r8d, 5096(%rbp)
	jmp	.L1496
.L1510:
	movl	5048(%rbp), %eax
	cmpl	$4999, %eax
	ja	.L1512
	movl	$5000, %r14d
	movq	0(%rbp), %rcx
	movq	16(%rsp), %rdi
	movl	$1, %esi
	subl	%eax, %r14d
	movl	%r8d, 28(%rsp)
	movl	%r14d, %edx
	call	fwrite@PLT
	movl	28(%rsp), %r8d
	cmpl	%eax, %r14d
	jne	.L1566
	movq	0(%rbp), %rdi
	movl	%r8d, 28(%rsp)
	call	ferror@PLT
	movl	28(%rsp), %r8d
	testl	%eax, %eax
	jne	.L1566
.L1512:
	cmpl	$4, %r8d
	jne	.L1516
.L1509:
	movq	0(%rbp), %rdi
	call	ferror@PLT
	testl	%eax, %eax
	jne	.L1508
	movq	0(%rbp), %rdi
	call	fflush@PLT
	movq	0(%rbp), %rdi
	call	ferror@PLT
	testl	%eax, %eax
	jne	.L1566
.L1508:
	testq	%rbx, %rbx
	je	.L1517
	movl	5028(%rbp), %eax
	movl	%eax, (%rbx)
.L1517:
	cmpq	$0, 8(%rsp)
	je	.L1518
	movl	5032(%rbp), %eax
	movq	8(%rsp), %rcx
	movl	%eax, (%rcx)
.L1518:
	testq	%r12, %r12
	je	.L1519
	movl	5052(%rbp), %eax
	movl	%eax, (%r12)
.L1519:
	testq	%r13, %r13
	je	.L1520
	movl	5056(%rbp), %eax
	movl	%eax, 0(%r13)
.L1520:
	testq	%r15, %r15
	je	.L1521
	movl	$0, (%r15)
.L1521:
	movl	$0, 5096(%rbp)
	leaq	5016(%rbp), %rdi
	call	BZ2_bzCompressEnd
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	free@PLT
.L1496:
	.cfi_restore_state
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE83:
	.size	BZ2_bzWriteClose64, .-BZ2_bzWriteClose64
	.globl	BZ2_bzWriteClose
	.type	BZ2_bzWriteClose, @function
BZ2_bzWriteClose:
.LFB82:
	.cfi_startproc
	endbr64
	subq	$16, %rsp
	.cfi_def_cfa_offset 24
	movq	%r8, %r9
	xorl	%r8d, %r8d
	pushq	$0
	.cfi_def_cfa_offset 32
	call	BZ2_bzWriteClose64
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE82:
	.size	BZ2_bzWriteClose, .-BZ2_bzWriteClose
	.section	.rodata.str1.1
.LC50:
	.string	" no data compressed.\n"
.LC53:
	.string	"%6.3f:1, %6.3f bits/byte, %5.2f%% saved, %s in, %s out.\n"
.LC54:
	.string	"compress:unexpected error"
	.text
	.type	compressStream, @function
compressStream:
.LFB117:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4152
	orq	$0, (%rsp)
	subq	$1064, %rsp
	.cfi_def_cfa_offset 5216
	movq	%fs:40, %rax
	movq	%rax, 5144(%rsp)
	xorl	%eax, %eax
	movq	%rdi, %rbp
	movq	%rsi, %r12
	call	ferror@PLT
	testl	%eax, %eax
	jne	.L1583
	movq	%r12, %rdi
	call	ferror@PLT
	testl	%eax, %eax
	jne	.L1583
	movl	workFactor(%rip), %r8d
	movl	verbosity(%rip), %ecx
	leaq	56(%rsp), %r14
	movq	%r12, %rsi
	movl	blockSize100k(%rip), %edx
	movq	%r14, %rdi
	call	BZ2_bzWriteOpen
	cmpl	$0, 56(%rsp)
	movq	%rax, %r13
	jne	.L1571
	cmpl	$1, verbosity(%rip)
	jle	.L1572
	movq	stderr(%rip), %rsi
	movl	$10, %edi
	call	fputc@PLT
.L1572:
	leaq	144(%rsp), %r15
.L1575:
	movq	%rbp, %rdi
	call	myfeof
	testb	%al, %al
	jne	.L1573
	movq	%r15, %rdi
	movq	%rbp, %rcx
	movl	$5000, %edx
	movl	$1, %esi
	call	fread@PLT
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	ferror@PLT
	testl	%eax, %eax
	jne	.L1583
	testl	%ebx, %ebx
	jle	.L1574
	movl	%ebx, %ecx
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	BZ2_bzWrite
.L1574:
	cmpl	$0, 56(%rsp)
	je	.L1575
	jmp	.L1571
.L1573:
	leaq	40(%rsp), %rcx
	pushq	%rsi
	.cfi_def_cfa_offset 5224
	xorl	%edx, %edx
	movq	%r14, %rdi
	movq	%r13, %rsi
	leaq	60(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 5232
	leaq	64(%rsp), %r9
	leaq	60(%rsp), %r8
	call	BZ2_bzWriteClose64
	popq	%rdi
	.cfi_def_cfa_offset 5224
	popq	%r8
	.cfi_def_cfa_offset 5216
	cmpl	$0, 56(%rsp)
	jne	.L1571
	movq	%r12, %rdi
	call	ferror@PLT
	testl	%eax, %eax
	jne	.L1583
	movq	%r12, %rdi
	call	fflush@PLT
	incl	%eax
	je	.L1583
	cmpq	%r12, stdout(%rip)
	jne	.L1576
.L1578:
	movq	$0, outputHandleJustInCase(%rip)
	movq	%rbp, %rdi
	call	ferror@PLT
	testl	%eax, %eax
	je	.L1601
	jmp	.L1583
.L1576:
	movq	%r12, %rdi
	call	fclose@PLT
	movq	$0, outputHandleJustInCase(%rip)
	incl	%eax
	jne	.L1578
	jmp	.L1583
.L1601:
	movq	%rbp, %rdi
	call	fclose@PLT
	incl	%eax
	je	.L1583
	cmpl	$0, verbosity(%rip)
	jle	.L1569
	movl	40(%rsp), %eax
	movl	44(%rsp), %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	jne	.L1580
	movq	stderr(%rip), %rsi
	leaq	.LC50(%rip), %rdi
	call	fputs@PLT
	jmp	.L1569
.L1580:
	movl	%eax, 64(%rsp)
	movl	52(%rsp), %eax
	xorps	%xmm0, %xmm0
	leaq	64(%rsp), %rcx
	movsd	.LC49(%rip), %xmm3
	movsd	.LC51(%rip), %xmm5
	movl	%edx, 68(%rsp)
	xorl	%edx, %edx
	movl	%eax, 76(%rsp)
	movl	48(%rsp), %eax
	movapd	%xmm3, %xmm2
	movl	%eax, 72(%rsp)
.L1581:
	movzbl	(%rdx,%rcx), %eax
	incq	%rdx
	cvtsi2sdl	%eax, %xmm1
	mulsd	%xmm3, %xmm1
	mulsd	%xmm5, %xmm3
	addsd	%xmm1, %xmm0
	cmpq	$8, %rdx
	jne	.L1581
	xorps	%xmm3, %xmm3
	movapd	%xmm2, %xmm4
	leaq	72(%rsp), %rcx
	xorl	%edx, %edx
.L1582:
	movzbl	(%rdx,%rcx), %eax
	incq	%rdx
	cvtsi2sdl	%eax, %xmm1
	mulsd	%xmm4, %xmm1
	mulsd	%xmm5, %xmm4
	addsd	%xmm1, %xmm3
	cmpq	$8, %rdx
	jne	.L1582
	movq	64(%rsp), %rsi
	leaq	80(%rsp), %r12
	movsd	%xmm0, 24(%rsp)
	movq	%r12, %rdi
	movsd	%xmm3, 16(%rsp)
	call	uInt64_toAscii.isra.0
	leaq	112(%rsp), %r8
	movq	72(%rsp), %rsi
	movq	%r8, %rdi
	movq	%r8, 8(%rsp)
	call	uInt64_toAscii.isra.0
	movsd	16(%rsp), %xmm3
	movsd	24(%rsp), %xmm0
	movq	%r12, %rcx
	movq	.LC49(%rip), %rax
	movq	8(%rsp), %r8
	leaq	.LC53(%rip), %rdx
	movl	$1, %esi
	movapd	%xmm3, %xmm1
	movapd	%xmm0, %xmm6
	movq	stderr(%rip), %rdi
	divsd	%xmm0, %xmm1
	movq	%rax, %xmm2
	movb	$3, %al
	divsd	%xmm3, %xmm6
	subsd	%xmm1, %xmm2
	movsd	.LC52(%rip), %xmm1
	mulsd	.LC35(%rip), %xmm2
	mulsd	%xmm3, %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm6, %xmm0
	call	__fprintf_chk@PLT
	jmp	.L1569
.L1571:
	leaq	40(%rsp), %rcx
	leaq	60(%rsp), %rdi
	pushq	%rax
	.cfi_def_cfa_offset 5224
	movl	$1, %edx
	movq	%r13, %rsi
	leaq	60(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 5232
	leaq	64(%rsp), %r9
	leaq	60(%rsp), %r8
	call	BZ2_bzWriteClose64
	movl	72(%rsp), %eax
	popq	%rdx
	.cfi_def_cfa_offset 5224
	popq	%rcx
	.cfi_def_cfa_offset 5216
	cmpl	$-6, %eax
	je	.L1583
	cmpl	$-3, %eax
	je	.L1584
	cmpl	$-9, %eax
	jne	.L1585
	call	configError
.L1584:
	call	outOfMemory
.L1583:
	call	ioError
.L1585:
	leaq	.LC54(%rip), %rdi
	call	panic
.L1569:
	movq	5144(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L1586
	call	__stack_chk_fail@PLT
.L1586:
	addq	$5160, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE117:
	.size	compressStream, .-compressStream
	.globl	BZ2_bzReadOpen
	.type	BZ2_bzReadOpen, @function
BZ2_bzReadOpen:
.LFB84:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%edx, %r15d
	movl	%ecx, %edx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%r8, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%r9d, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	testq	%rdi, %rdi
	je	.L1604
	movl	$0, (%rdi)
.L1604:
	testq	%r14, %r14
	je	.L1605
	cmpl	$1, %edx
	ja	.L1605
	cmpl	$4, %r15d
	ja	.L1605
	testq	%r13, %r13
	jne	.L1643
	testl	%ebp, %ebp
	jne	.L1605
	testq	%r13, %r13
	je	.L1607
.L1643:
	cmpl	$5000, %ebp
	jbe	.L1607
.L1605:
	testq	%rbx, %rbx
	je	.L1645
	movl	$-2, (%rbx)
.L1645:
	xorl	%r12d, %r12d
	jmp	.L1603
.L1607:
	movq	%r14, %rdi
	movl	%edx, 12(%rsp)
	call	ferror@PLT
	movl	12(%rsp), %edx
	testl	%eax, %eax
	je	.L1610
	testq	%rbx, %rbx
	je	.L1645
	movl	$-6, (%rbx)
	jmp	.L1645
.L1610:
	movl	$5104, %edi
	movl	%edx, 12(%rsp)
	call	malloc@PLT
	movl	12(%rsp), %edx
	testq	%rax, %rax
	movq	%rax, %r12
	jne	.L1612
	testq	%rbx, %rbx
	je	.L1645
	movl	$-3, (%rbx)
	jmp	.L1603
.L1612:
	testq	%rbx, %rbx
	je	.L1613
	movl	$0, (%rbx)
.L1613:
	movl	$0, 5096(%r12)
	xorl	%eax, %eax
	movb	$0, 5100(%r12)
	movq	%r14, (%r12)
	movl	$0, 5008(%r12)
	movb	$0, 5012(%r12)
	movq	$0, 5072(%r12)
	movq	$0, 5080(%r12)
	movq	$0, 5088(%r12)
.L1614:
	movl	%ebp, %ecx
	subl	%eax, %ecx
	testl	%ecx, %ecx
	jle	.L1646
	movslq	5008(%r12), %rsi
	movb	0(%r13,%rax), %dil
	incq	%rax
	movq	%rsi, %rcx
	movb	%dil, 8(%r12,%rsi)
	incl	%ecx
	movl	%ecx, 5008(%r12)
	jmp	.L1614
.L1646:
	leaq	5016(%r12), %rdi
	movl	%r15d, %esi
	call	BZ2_bzDecompressInit
	testl	%eax, %eax
	je	.L1616
	testq	%rbx, %rbx
	je	.L1617
	movl	%eax, (%rbx)
.L1617:
	movq	%r12, %rdi
	call	free@PLT
	jmp	.L1645
.L1616:
	movl	5008(%r12), %eax
	movb	$1, 5100(%r12)
	movl	%eax, 5024(%r12)
	leaq	8(%r12), %rax
	movq	%rax, 5016(%r12)
.L1603:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE84:
	.size	BZ2_bzReadOpen, .-BZ2_bzReadOpen
	.section	.rodata.str1.1
.LC55:
	.string	"w"
.LC56:
	.string	"r"
.LC57:
	.string	"b"
	.text
	.type	bzopen_or_bzdopen, @function
bzopen_or_bzdopen:
.LFB91:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4152
	orq	$0, (%rsp)
	subq	$952, %rsp
	.cfi_def_cfa_offset 5104
	movl	%esi, 4(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 5032(%rsp)
	xorl	%eax, %eax
	movw	$0, 30(%rsp)
	movq	$0, 22(%rsp)
	testq	%rdx, %rdx
	jne	.L1663
.L1657:
	xorl	%r12d, %r12d
	jmp	.L1647
.L1663:
	movq	%rdi, %r13
	movl	%ecx, %r15d
	xorl	%r14d, %r14d
	xorl	%ebx, %ebx
	movl	$9, %r12d
.L1648:
	movb	(%rdx), %bpl
	testb	%bpl, %bpl
	je	.L1689
	cmpb	$115, %bpl
	je	.L1664
	cmpb	$119, %bpl
	je	.L1665
	cmpb	$114, %bpl
	je	.L1666
	movq	%rdx, 8(%rsp)
	call	__ctype_b_loc@PLT
	movq	8(%rsp), %rdx
	movq	%rax, %r9
	movsbq	%bpl, %rax
	movq	(%r9), %rcx
	testb	$8, 1(%rcx,%rax,2)
	je	.L1650
	movsbl	%bpl, %r12d
	subl	$48, %r12d
	jmp	.L1650
.L1664:
	movl	$1, %r14d
	jmp	.L1650
.L1665:
	movl	$1, %ebx
	jmp	.L1650
.L1666:
	xorl	%ebx, %ebx
.L1650:
	incq	%rdx
	jmp	.L1648
.L1689:
	testl	%ebx, %ebx
	leaq	22(%rsp), %r9
	movl	$10, %edx
	leaq	.LC56(%rip), %rax
	leaq	.LC55(%rip), %rsi
	movq	%r9, %rdi
	cmove	%rax, %rsi
	call	__strcat_chk@PLT
	movl	$10, %edx
	leaq	.LC57(%rip), %rsi
	movq	%rax, %rdi
	call	__strcat_chk@PLT
	testl	%r15d, %r15d
	jne	.L1653
	testq	%r13, %r13
	je	.L1654
	cmpb	$0, 0(%r13)
	jne	.L1655
.L1654:
	testl	%ebx, %ebx
	je	.L1656
	movq	stdout(%rip), %rbp
	testq	%rbp, %rbp
	jne	.L1658
	jmp	.L1657
.L1656:
	movq	stdin(%rip), %rbp
	testq	%rbp, %rbp
	jne	.L1659
	jmp	.L1657
.L1655:
	movq	%rax, %rsi
	movq	%r13, %rdi
	call	fopen@PLT
	jmp	.L1687
.L1653:
	movl	4(%rsp), %edi
	movq	%rax, %rsi
	call	fdopen@PLT
.L1687:
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L1657
	testl	%ebx, %ebx
	je	.L1659
.L1658:
	cmpl	$9, %r12d
	movl	$9, %edx
	leaq	16(%rsp), %rdi
	movq	%rbp, %rsi
	cmovg	%edx, %r12d
	movl	$1, %edx
	movl	$30, %r8d
	testl	%r12d, %r12d
	cmovg	%r12d, %edx
	xorl	%ecx, %ecx
	call	BZ2_bzWriteOpen
	jmp	.L1688
.L1659:
	leaq	16(%rsp), %rdi
	xorl	%r9d, %r9d
	leaq	32(%rsp), %r8
	movl	%r14d, %ecx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	call	BZ2_bzReadOpen
.L1688:
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L1647
	cmpq	%rbp, stdin(%rip)
	je	.L1657
	cmpq	%rbp, stdout(%rip)
	je	.L1657
	movq	%rbp, %rdi
	call	fclose@PLT
.L1647:
	movq	5032(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L1662
	call	__stack_chk_fail@PLT
.L1662:
	addq	$5048, %rsp
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE91:
	.size	bzopen_or_bzdopen, .-bzopen_or_bzdopen
	.globl	BZ2_bzReadClose
	.type	BZ2_bzReadClose, @function
BZ2_bzReadClose:
.LFB85:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %rbp
	testq	%rdi, %rdi
	je	.L1702
	movl	$0, (%rdi)
.L1702:
	testq	%rbp, %rbp
	je	.L1690
	cmpb	$0, 5012(%rbp)
	movl	$0, 5096(%rbp)
	je	.L1694
	testq	%rdi, %rdi
	je	.L1695
	movl	$-1, (%rdi)
.L1695:
	movl	$-1, 5096(%rbp)
	jmp	.L1690
.L1694:
	cmpb	$0, 5100(%rbp)
	je	.L1696
	leaq	5016(%rbp), %rdi
	call	BZ2_bzDecompressEnd
.L1696:
	movq	%rbp, %rdi
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	free@PLT
.L1690:
	.cfi_restore_state
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE85:
	.size	BZ2_bzReadClose, .-BZ2_bzReadClose
	.globl	BZ2_bzRead
	.type	BZ2_bzRead, @function
BZ2_bzRead:
.LFB86:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%ecx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rsi, %rbx
	testq	%rdi, %rdi
	je	.L1704
	movl	$0, (%rdi)
	testq	%rsi, %rsi
	je	.L1705
.L1731:
	movl	$0, 5096(%rbx)
	testq	%rdx, %rdx
	je	.L1706
	testl	%r12d, %r12d
	jns	.L1761
.L1706:
	testq	%rbp, %rbp
	je	.L1708
.L1705:
	movl	$-2, 0(%rbp)
	testq	%rbx, %rbx
	je	.L1765
.L1708:
	movl	$-2, 5096(%rbx)
	jmp	.L1765
.L1761:
	cmpb	$0, 5012(%rbx)
	je	.L1710
	testq	%rbp, %rbp
	je	.L1711
	movl	$-1, 0(%rbp)
.L1711:
	movl	$-1, 5096(%rbx)
	jmp	.L1765
.L1710:
	testl	%r12d, %r12d
	je	.L1726
	movl	%r12d, 5048(%rbx)
	leaq	8(%rbx), %r13
	movq	%rdx, 5040(%rbx)
.L1729:
	movq	(%rbx), %rdi
	call	ferror@PLT
	testl	%eax, %eax
	je	.L1714
.L1764:
	testq	%rbp, %rbp
	je	.L1716
	movl	$-6, 0(%rbp)
.L1716:
	movl	$-6, 5096(%rbx)
	jmp	.L1765
.L1714:
	cmpl	$0, 5024(%rbx)
	jne	.L1718
	movq	(%rbx), %rdi
	call	myfeof
	testb	%al, %al
	jne	.L1718
	movq	(%rbx), %rcx
	movq	%r13, %rdi
	movl	$5000, %edx
	movl	$1, %esi
	call	fread@PLT
	movq	(%rbx), %rdi
	movq	%rax, %r14
	call	ferror@PLT
	testl	%eax, %eax
	jne	.L1764
	movl	%r14d, 5008(%rbx)
	movl	%r14d, 5024(%rbx)
	movq	%r13, 5016(%rbx)
.L1718:
	leaq	5016(%rbx), %rdi
	call	BZ2_bzDecompress
	testl	$-5, %eax
	je	.L1722
	testq	%rbp, %rbp
	je	.L1723
	movl	%eax, 0(%rbp)
.L1723:
	movl	%eax, 5096(%rbx)
	jmp	.L1765
.L1722:
	testl	%eax, %eax
	jne	.L1724
	movq	(%rbx), %rdi
	call	myfeof
	testb	%al, %al
	je	.L1725
	cmpl	$0, 5024(%rbx)
	jne	.L1725
	cmpl	$0, 5048(%rbx)
	je	.L1726
	testq	%rbp, %rbp
	je	.L1727
	movl	$-7, 0(%rbp)
.L1727:
	movl	$-7, 5096(%rbx)
.L1765:
	xorl	%r12d, %r12d
	jmp	.L1762
.L1724:
	cmpl	$4, %eax
	jne	.L1725
	testq	%rbp, %rbp
	je	.L1728
	movl	$4, 0(%rbp)
.L1728:
	movl	$4, 5096(%rbx)
	subl	5048(%rbx), %r12d
	jmp	.L1762
.L1725:
	cmpl	$0, 5048(%rbx)
	jne	.L1729
.L1726:
	testq	%rbp, %rbp
	je	.L1730
	movl	$0, 0(%rbp)
.L1730:
	movl	$0, 5096(%rbx)
	jmp	.L1762
.L1704:
	testq	%rsi, %rsi
	jne	.L1731
	jmp	.L1765
.L1762:
	popq	%rbx
	.cfi_def_cfa_offset 40
	movl	%r12d, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE86:
	.size	BZ2_bzRead, .-BZ2_bzRead
	.globl	BZ2_bzReadGetUnused
	.type	BZ2_bzReadGetUnused, @function
BZ2_bzReadGetUnused:
.LFB87:
	.cfi_startproc
	endbr64
	testq	%rsi, %rsi
	jne	.L1769
	testq	%rdi, %rdi
	je	.L1768
	movl	$-2, (%rdi)
	ret
.L1769:
	cmpl	$4, 5096(%rsi)
	je	.L1771
	testq	%rdi, %rdi
	je	.L1772
	movl	$-1, (%rdi)
.L1772:
	movl	$-1, 5096(%rsi)
	ret
.L1771:
	testq	%rdx, %rdx
	je	.L1777
	testq	%rcx, %rcx
	jne	.L1773
.L1777:
	testq	%rdi, %rdi
	je	.L1775
	movl	$-2, (%rdi)
.L1775:
	movl	$-2, 5096(%rsi)
	ret
.L1773:
	testq	%rdi, %rdi
	je	.L1776
	movl	$0, (%rdi)
.L1776:
	movl	$0, 5096(%rsi)
	movl	5024(%rsi), %eax
	movl	%eax, (%rcx)
	movq	5016(%rsi), %rax
	movq	%rax, (%rdx)
.L1768:
	ret
	.cfi_endproc
.LFE87:
	.size	BZ2_bzReadGetUnused, .-BZ2_bzReadGetUnused
	.section	.rodata.str1.1
.LC58:
	.string	"decompress:bzReadGetUnused"
.LC59:
	.string	"\n    "
.LC60:
	.string	"\n%s: Data integrity error when decompressing.\n"
.LC61:
	.string	"\n%s: Compressed file ends unexpectedly;\n\tperhaps it is corrupted?  *Possible* reason follows.\n"
.LC62:
	.string	"\n%s: %s: trailing garbage after EOF ignored\n"
.LC63:
	.string	"decompress:unexpected error"
	.text
	.type	uncompressStream, @function
uncompressStream:
.LFB118:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4152
	orq	$0, (%rsp)
	subq	$4096, %rsp
	.cfi_def_cfa_offset 8248
	orq	$0, (%rsp)
	subq	$1864, %rsp
	.cfi_def_cfa_offset 10112
	movq	%fs:40, %rax
	movq	%rax, 10040(%rsp)
	xorl	%eax, %eax
	movq	%rdi, %r12
	movq	%rsi, %rdi
	movl	$0, 28(%rsp)
	movq	%rsi, %rbp
	call	ferror@PLT
	testl	%eax, %eax
	jne	.L1816
	movq	%r12, %rdi
	call	ferror@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L1816
	leaq	5040(%rsp), %rax
	movq	%rax, 8(%rsp)
.L1792:
	movzbl	smallMode(%rip), %ecx
	movl	28(%rsp), %r9d
	leaq	20(%rsp), %r15
	movq	%r12, %rsi
	movq	8(%rsp), %r8
	movl	verbosity(%rip), %edx
	movq	%r15, %rdi
	call	BZ2_bzReadOpen
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L1793
	cmpl	$0, 20(%rsp)
	jne	.L1793
	incl	%ebx
	leaq	40(%rsp), %r14
.L1794:
	movl	20(%rsp), %eax
	testl	%eax, %eax
	jne	.L1845
	movq	%r14, %rdx
	movl	$5000, %ecx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	BZ2_bzRead
	movl	20(%rsp), %edx
	cmpl	$-5, %edx
	jne	.L1795
	cmpb	$0, forceOverwrite(%rip)
	je	.L1793
	movq	%r12, %rdi
	call	rewind@PLT
	jmp	.L1810
.L1795:
	andl	$-5, %edx
	jne	.L1797
	testl	%eax, %eax
	jle	.L1797
	movslq	%eax, %rdx
	movq	%rbp, %rcx
	movl	$1, %esi
	movq	%r14, %rdi
	call	fwrite@PLT
.L1797:
	movq	%rbp, %rdi
	call	ferror@PLT
	testl	%eax, %eax
	je	.L1794
	jmp	.L1816
.L1845:
	cmpl	$4, %eax
	jne	.L1793
	leaq	28(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	BZ2_bzReadGetUnused
	cmpl	$0, 20(%rsp)
	jne	.L1799
	movl	28(%rsp), %edx
	movq	32(%rsp), %rcx
	xorl	%eax, %eax
	jmp	.L1800
.L1847:
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	BZ2_bzReadClose
	cmpl	$0, 20(%rsp)
	je	.L1846
.L1799:
	leaq	.LC58(%rip), %rdi
	jmp	.L1843
.L1800:
	cmpl	%eax, %edx
	jle	.L1847
	movb	(%rcx,%rax), %sil
	movq	8(%rsp), %rdi
	movb	%sil, (%rdi,%rax)
	incq	%rax
	jmp	.L1800
.L1846:
	cmpl	$0, 28(%rsp)
	jne	.L1792
	movq	%r12, %rdi
	call	myfeof
	testb	%al, %al
	je	.L1792
.L1808:
	movq	%r12, %rdi
	call	ferror@PLT
	testl	%eax, %eax
	jne	.L1816
	movq	%r12, %rdi
	call	fclose@PLT
	incl	%eax
	je	.L1816
	movq	%rbp, %rdi
	call	ferror@PLT
	testl	%eax, %eax
	jne	.L1816
	movq	%rbp, %rdi
	call	fflush@PLT
	testl	%eax, %eax
	jne	.L1816
	cmpq	%rbp, stdout(%rip)
	jne	.L1803
.L1806:
	cmpl	$1, verbosity(%rip)
	movq	$0, outputHandleJustInCase(%rip)
	jle	.L1805
	movq	stderr(%rip), %rsi
	leaq	.LC59(%rip), %rdi
	call	fputs@PLT
	jmp	.L1805
.L1803:
	movq	%rbp, %rdi
	call	fclose@PLT
	movq	$0, outputHandleJustInCase(%rip)
	incl	%eax
	jne	.L1806
	jmp	.L1816
.L1848:
	movq	%r14, %rdi
	movq	%r12, %rcx
	movl	$5000, %edx
	movl	$1, %esi
	call	fread@PLT
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	ferror@PLT
	testl	%eax, %eax
	jne	.L1816
	testl	%ebx, %ebx
	jle	.L1809
	movslq	%ebx, %rdx
	movq	%rbp, %rcx
	movl	$1, %esi
	movq	%r14, %rdi
	call	fwrite@PLT
.L1809:
	movq	%rbp, %rdi
	call	ferror@PLT
	testl	%eax, %eax
	jne	.L1816
.L1810:
	movq	%r12, %rdi
	call	myfeof
	testb	%al, %al
	je	.L1848
	jmp	.L1808
.L1793:
	leaq	24(%rsp), %rdi
	movq	%r13, %rsi
	call	BZ2_bzReadClose
	movl	20(%rsp), %eax
	addl	$9, %eax
	cmpl	$6, %eax
	ja	.L1811
	leaq	.L1813(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L1813:
	.long	.L1818-.L1813
	.long	.L1811-.L1813
	.long	.L1817-.L1813
	.long	.L1816-.L1813
	.long	.L1815-.L1813
	.long	.L1814-.L1813
	.long	.L1812-.L1813
	.text
.L1818:
	call	configError
.L1816:
	call	ioError
.L1814:
	movq	progName(%rip), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC60(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	jmp	.L1844
.L1812:
	call	outOfMemory
.L1817:
	cmpb	$0, noisy(%rip)
	je	.L1819
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rcx
	leaq	.LC61(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movq	progName(%rip), %rdi
	call	perror@PLT
.L1844:
	call	showFileNames
	call	cadvise
.L1819:
	movl	$2, %edi
	call	cleanUpAndFail
.L1815:
	cmpq	%r12, stdin(%rip)
	je	.L1820
	movq	%r12, %rdi
	call	fclose@PLT
.L1820:
	cmpq	%rbp, stdout(%rip)
	je	.L1821
	movq	%rbp, %rdi
	call	fclose@PLT
.L1821:
	xorl	%eax, %eax
	decl	%ebx
	je	.L1790
	cmpb	$0, noisy(%rip)
	je	.L1805
	movq	progName(%rip), %rcx
	movq	stderr(%rip), %rdi
	leaq	inName(%rip), %r8
	leaq	.LC62(%rip), %rdx
	movl	$1, %esi
	call	__fprintf_chk@PLT
	jmp	.L1805
.L1811:
	leaq	.LC63(%rip), %rdi
.L1843:
	call	panic
.L1805:
	movb	$1, %al
.L1790:
	movq	10040(%rsp), %rbx
	xorq	%fs:40, %rbx
	je	.L1822
	call	__stack_chk_fail@PLT
.L1822:
	addq	$10056, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE118:
	.size	uncompressStream, .-uncompressStream
	.section	.rodata.str1.1
.LC64:
	.string	"test:bzReadGetUnused"
.LC65:
	.string	"%s: %s: "
.LC66:
	.string	"data integrity (CRC) error in data\n"
.LC67:
	.string	"file ends unexpectedly\n"
.LC68:
	.string	"bad magic number (file not created by bzip2)\n"
.LC69:
	.string	"trailing garbage after EOF ignored\n"
.LC70:
	.string	"test:unexpected error"
	.text
	.type	testStream, @function
testStream:
.LFB119:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4152
	orq	$0, (%rsp)
	subq	$4096, %rsp
	.cfi_def_cfa_offset 8248
	orq	$0, (%rsp)
	subq	$1848, %rsp
	.cfi_def_cfa_offset 10096
	movq	%fs:40, %rax
	movq	%rax, 10024(%rsp)
	xorl	%eax, %eax
	movq	%rdi, %rbp
	movl	$0, 12(%rsp)
	call	ferror@PLT
	testl	%eax, %eax
	jne	.L1867
	movl	%eax, %ebx
	leaq	5024(%rsp), %r14
.L1851:
	movl	12(%rsp), %r9d
	leaq	4(%rsp), %r13
	movq	%r14, %r8
	movq	%rbp, %rsi
	movzbl	smallMode(%rip), %ecx
	movl	verbosity(%rip), %edx
	movq	%r13, %rdi
	call	BZ2_bzReadOpen
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L1852
	cmpl	$0, 4(%rsp)
	jne	.L1852
	incl	%ebx
	leaq	24(%rsp), %r15
.L1853:
	movl	4(%rsp), %eax
	testl	%eax, %eax
	jne	.L1886
	movl	$5000, %ecx
	movq	%r15, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	BZ2_bzRead
	cmpl	$-5, 4(%rsp)
	jne	.L1853
	jmp	.L1852
.L1886:
	cmpl	$4, %eax
	jne	.L1852
	leaq	12(%rsp), %rcx
	leaq	16(%rsp), %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	BZ2_bzReadGetUnused
	cmpl	$0, 4(%rsp)
	jne	.L1855
	movl	12(%rsp), %edx
	movq	16(%rsp), %rcx
	xorl	%eax, %eax
	jmp	.L1856
.L1888:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	BZ2_bzReadClose
	cmpl	$0, 4(%rsp)
	je	.L1887
.L1855:
	leaq	.LC64(%rip), %rdi
	jmp	.L1884
.L1856:
	cmpl	%eax, %edx
	jle	.L1888
	movb	(%rcx,%rax), %sil
	movb	%sil, (%r14,%rax)
	incq	%rax
	jmp	.L1856
.L1887:
	cmpl	$0, 12(%rsp)
	jne	.L1851
	movq	%rbp, %rdi
	call	myfeof
	testb	%al, %al
	je	.L1851
	movq	%rbp, %rdi
	call	ferror@PLT
	testl	%eax, %eax
	jne	.L1867
	movq	%rbp, %rdi
	call	fclose@PLT
	incl	%eax
	je	.L1867
	cmpl	$1, verbosity(%rip)
	movq	stderr(%rip), %rsi
	leaq	.LC59(%rip), %rdi
	jle	.L1859
	jmp	.L1885
.L1852:
	leaq	8(%rsp), %rdi
	movq	%r12, %rsi
	call	BZ2_bzReadClose
	cmpl	$0, verbosity(%rip)
	jne	.L1861
	movq	progName(%rip), %rcx
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	leaq	inName(%rip), %r8
	leaq	.LC65(%rip), %rdx
	movl	$1, %esi
	call	__fprintf_chk@PLT
.L1861:
	movl	4(%rsp), %eax
	addl	$9, %eax
	cmpl	$6, %eax
	ja	.L1862
	leaq	.L1864(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L1864:
	.long	.L1869-.L1864
	.long	.L1862-.L1864
	.long	.L1868-.L1864
	.long	.L1867-.L1864
	.long	.L1866-.L1864
	.long	.L1865-.L1864
	.long	.L1863-.L1864
	.text
.L1869:
	call	configError
.L1867:
	call	ioError
.L1865:
	movq	stderr(%rip), %rsi
	leaq	.LC66(%rip), %rdi
	jmp	.L1883
.L1863:
	call	outOfMemory
.L1868:
	movq	stderr(%rip), %rsi
	leaq	.LC67(%rip), %rdi
	jmp	.L1883
.L1866:
	cmpq	%rbp, stdin(%rip)
	je	.L1870
	movq	%rbp, %rdi
	call	fclose@PLT
.L1870:
	decl	%ebx
	jne	.L1871
	movq	stderr(%rip), %rsi
	leaq	.LC68(%rip), %rdi
.L1883:
	call	fputs@PLT
	xorl	%eax, %eax
	jmp	.L1849
.L1871:
	cmpb	$0, noisy(%rip)
	je	.L1859
	movq	stderr(%rip), %rsi
	leaq	.LC69(%rip), %rdi
.L1885:
	call	fputs@PLT
	jmp	.L1859
.L1862:
	leaq	.LC70(%rip), %rdi
.L1884:
	call	panic
.L1859:
	movb	$1, %al
.L1849:
	movq	10024(%rsp), %rbx
	xorq	%fs:40, %rbx
	je	.L1872
	call	__stack_chk_fail@PLT
.L1872:
	addq	$10040, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE119:
	.size	testStream, .-testStream
	.section	.rodata.str1.1
.LC71:
	.string	"testf: bad modes\n"
.LC72:
	.string	"(none)"
.LC73:
	.string	"(stdin)"
.LC74:
	.string	"%s: Can't open input %s: %s.\n"
.LC75:
	.string	"%s: Input file %s is a directory.\n"
.LC76:
	.string	"%s: I won't read compressed data from a terminal.\n"
.LC77:
	.string	"%s: For help, type: `%s --help'.\n"
.LC78:
	.string	"%s: Can't open input file %s:%s.\n"
.LC79:
	.string	"testf: bad srcMode"
.LC80:
	.string	"  %s: "
.LC81:
	.string	"ok\n"
	.text
	.type	testf, @function
testf:
.LFB145:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	subq	$160, %rsp
	.cfi_def_cfa_offset 176
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	movb	$0, deleteOutputOnInterrupt(%rip)
	testq	%rdi, %rdi
	jne	.L1890
	cmpl	$1, srcMode(%rip)
	leaq	.LC71(%rip), %rdi
	jne	.L1913
.L1890:
	leaq	.LC72(%rip), %rsi
	leaq	outName(%rip), %rdi
	call	copyFileName
	movl	srcMode(%rip), %eax
	cmpl	$1, %eax
	je	.L1891
	subl	$2, %eax
	movq	%rbp, %rsi
	cmpl	$1, %eax
	jbe	.L1910
	jmp	.L1892
.L1891:
	leaq	.LC73(%rip), %rsi
.L1910:
	leaq	inName(%rip), %rdi
	call	copyFileName
.L1892:
	cmpl	$1, srcMode(%rip)
	je	.L1897
	leaq	inName(%rip), %rdi
	call	fileExists
	testb	%al, %al
	jne	.L1894
	call	__errno_location@PLT
	movl	(%rax), %edi
	call	strerror@PLT
	movq	progName(%rip), %rcx
	leaq	inName(%rip), %r8
	leaq	.LC74(%rip), %rdx
	movq	%rax, %r9
	jmp	.L1911
.L1894:
	cmpl	$1, srcMode(%rip)
	je	.L1897
	leaq	8(%rsp), %rsi
	leaq	inName(%rip), %rdi
	call	stat@PLT
	movl	32(%rsp), %eax
	movq	progName(%rip), %rcx
	leaq	inName(%rip), %r8
	leaq	.LC75(%rip), %rdx
	andl	$61440, %eax
	cmpl	$16384, %eax
	je	.L1914
	movl	srcMode(%rip), %eax
	cmpl	$1, %eax
	je	.L1897
	subl	$2, %eax
	cmpl	$1, %eax
	ja	.L1898
	leaq	.LC5(%rip), %rsi
	leaq	inName(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L1900
	call	__errno_location@PLT
	movl	(%rax), %edi
	call	strerror@PLT
	movq	progName(%rip), %rcx
	leaq	inName(%rip), %r8
	leaq	.LC78(%rip), %rdx
	movq	%rax, %r9
	jmp	.L1911
.L1897:
	movq	stdin(%rip), %rdi
	call	fileno@PLT
	movl	%eax, %edi
	call	isatty@PLT
	movq	stdin(%rip), %rbp
	testl	%eax, %eax
	je	.L1900
	movq	progName(%rip), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC76(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movq	progName(%rip), %rcx
	leaq	.LC77(%rip), %rdx
	movq	%rcx, %r8
.L1914:
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	jmp	.L1912
.L1911:
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
.L1912:
	movl	$1, %edi
	call	setExit
	jmp	.L1889
.L1898:
	leaq	.LC79(%rip), %rdi
.L1913:
	call	panic
.L1900:
	cmpl	$0, verbosity(%rip)
	jle	.L1902
	movq	stderr(%rip), %rdi
	leaq	inName(%rip), %rcx
	leaq	.LC80(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	call	pad.constprop.0
	movq	stderr(%rip), %rdi
	call	fflush@PLT
.L1902:
	movq	$0, outputHandleJustInCase(%rip)
	movq	%rbp, %rdi
	call	testStream
	testb	%al, %al
	je	.L1903
	cmpl	$0, verbosity(%rip)
	jle	.L1889
	movq	stderr(%rip), %rsi
	leaq	.LC81(%rip), %rdi
	call	fputs@PLT
	jmp	.L1889
.L1903:
	movb	$1, testFailsExist(%rip)
.L1889:
	movq	152(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L1904
	call	__stack_chk_fail@PLT
.L1904:
	addq	$160, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE145:
	.size	testf, .-testf
	.globl	BZ2_bzBuffToBuffCompress
	.type	BZ2_bzBuffToBuffCompress, @function
BZ2_bzBuffToBuffCompress:
.LFB88:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	%ecx, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$112, %rsp
	.cfi_def_cfa_offset 160
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	movl	160(%rsp), %ecx
	testq	%rdi, %rdi
	je	.L1923
	movq	%rsi, %rbx
	testq	%rsi, %rsi
	je	.L1923
	leal	-1(%r8), %eax
	movl	%r8d, %esi
	cmpl	$8, %eax
	ja	.L1923
	movq	%rdx, %r13
	testq	%rdx, %rdx
	je	.L1923
	cmpl	$250, %ecx
	ja	.L1923
	movl	%r9d, %edx
	cmpl	$4, %r9d
	ja	.L1923
	movq	%rdi, %rbp
	testl	%ecx, %ecx
	jne	.L1917
	movl	$30, %ecx
.L1917:
	movq	$0, 80(%rsp)
	leaq	24(%rsp), %rdi
	movq	$0, 88(%rsp)
	movq	$0, 96(%rsp)
	movq	%rdi, 8(%rsp)
	call	BZ2_bzCompressInit
	movl	%eax, %r12d
	testl	%eax, %eax
	jne	.L1915
	movl	(%rbx), %eax
	movq	8(%rsp), %rdi
	movl	$2, %esi
	movq	%rbp, 48(%rsp)
	movq	%r13, 24(%rsp)
	movl	%r14d, 32(%rsp)
	movl	%eax, 56(%rsp)
	call	BZ2_bzCompress
	movq	8(%rsp), %rdi
	cmpl	$3, %eax
	movl	%eax, %ebp
	jne	.L1918
	call	BZ2_bzCompressEnd
	movl	$-8, %r12d
	jmp	.L1915
.L1918:
	cmpl	$4, %eax
	je	.L1919
	call	BZ2_bzCompressEnd
	movl	%ebp, %r12d
	jmp	.L1915
.L1919:
	movl	56(%rsp), %eax
	subl	%eax, (%rbx)
	call	BZ2_bzCompressEnd
	jmp	.L1915
.L1923:
	movl	$-2, %r12d
.L1915:
	movq	104(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L1920
	call	__stack_chk_fail@PLT
.L1920:
	addq	$112, %rsp
	.cfi_def_cfa_offset 48
	movl	%r12d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE88:
	.size	BZ2_bzBuffToBuffCompress, .-BZ2_bzBuffToBuffCompress
	.globl	BZ2_bzBuffToBuffDecompress
	.type	BZ2_bzBuffToBuffDecompress, @function
BZ2_bzBuffToBuffDecompress:
.LFB89:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$112, %rsp
	.cfi_def_cfa_offset 160
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.L1933
	movq	%rsi, %rbx
	testq	%rsi, %rsi
	je	.L1933
	movq	%rdx, %r13
	testq	%rdx, %rdx
	je	.L1933
	movl	%r8d, %edx
	cmpl	$1, %r8d
	ja	.L1933
	movl	%r9d, %esi
	movl	$-2, %r12d
	cmpl	$4, %r9d
	ja	.L1925
	movq	$0, 80(%rsp)
	movq	%rdi, %rbp
	movl	%ecx, %r14d
	leaq	24(%rsp), %rdi
	movq	$0, 88(%rsp)
	movq	$0, 96(%rsp)
	movq	%rdi, 8(%rsp)
	call	BZ2_bzDecompressInit
	movl	%eax, %r12d
	testl	%eax, %eax
	jne	.L1925
	movl	(%rbx), %eax
	movq	8(%rsp), %rdi
	movq	%rbp, 48(%rsp)
	movq	%r13, 24(%rsp)
	movl	%r14d, 32(%rsp)
	movl	%eax, 56(%rsp)
	call	BZ2_bzDecompress
	movq	8(%rsp), %rdi
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L1927
	cmpl	$0, 56(%rsp)
	je	.L1937
	call	BZ2_bzDecompressEnd
	movl	$-7, %r12d
	jmp	.L1925
.L1927:
	cmpl	$4, %eax
	je	.L1930
	call	BZ2_bzDecompressEnd
	movl	%ebp, %r12d
	jmp	.L1925
.L1930:
	movl	56(%rsp), %eax
	subl	%eax, (%rbx)
	call	BZ2_bzDecompressEnd
	jmp	.L1925
.L1937:
	call	BZ2_bzDecompressEnd
	movl	$-8, %r12d
	jmp	.L1925
.L1933:
	movl	$-2, %r12d
.L1925:
	movq	104(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L1931
	call	__stack_chk_fail@PLT
.L1931:
	addq	$112, %rsp
	.cfi_def_cfa_offset 48
	movl	%r12d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE89:
	.size	BZ2_bzBuffToBuffDecompress, .-BZ2_bzBuffToBuffDecompress
	.globl	BZ2_bzlibVersion
	.type	BZ2_bzlibVersion, @function
BZ2_bzlibVersion:
.LFB90:
	.cfi_startproc
	endbr64
	leaq	.LC1(%rip), %rax
	ret
	.cfi_endproc
.LFE90:
	.size	BZ2_bzlibVersion, .-BZ2_bzlibVersion
	.globl	BZ2_bzopen
	.type	BZ2_bzopen, @function
BZ2_bzopen:
.LFB92:
	.cfi_startproc
	endbr64
	movq	%rsi, %rdx
	xorl	%ecx, %ecx
	orl	$-1, %esi
	jmp	bzopen_or_bzdopen
	.cfi_endproc
.LFE92:
	.size	BZ2_bzopen, .-BZ2_bzopen
	.globl	BZ2_bzdopen
	.type	BZ2_bzdopen, @function
BZ2_bzdopen:
.LFB93:
	.cfi_startproc
	endbr64
	movq	%rsi, %rdx
	movl	$1, %ecx
	movl	%edi, %esi
	xorl	%edi, %edi
	jmp	bzopen_or_bzdopen
	.cfi_endproc
.LFE93:
	.size	BZ2_bzdopen, .-BZ2_bzdopen
	.globl	BZ2_bzread
	.type	BZ2_bzread, @function
BZ2_bzread:
.LFB94:
	.cfi_startproc
	endbr64
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	cmpl	$4, 5096(%rdi)
	je	.L1941
	movq	%rdi, %r8
	movl	%edx, %ecx
	leaq	4(%rsp), %rdi
	movq	%rsi, %rdx
	movq	%r8, %rsi
	call	BZ2_bzRead
	testl	$-5, 4(%rsp)
	movl	$-1, %edx
	cmovne	%edx, %eax
.L1941:
	movq	8(%rsp), %rcx
	xorq	%fs:40, %rcx
	je	.L1943
	call	__stack_chk_fail@PLT
.L1943:
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE94:
	.size	BZ2_bzread, .-BZ2_bzread
	.globl	BZ2_bzwrite
	.type	BZ2_bzwrite, @function
BZ2_bzwrite:
.LFB95:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r8
	movl	%edx, %r12d
	movl	%edx, %ecx
	movq	%rsi, %rdx
	movq	%r8, %rsi
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rdi
	call	BZ2_bzWrite
	cmpl	$0, 4(%rsp)
	movl	$-1, %eax
	cmovne	%eax, %r12d
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L1950
	call	__stack_chk_fail@PLT
.L1950:
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE95:
	.size	BZ2_bzwrite, .-BZ2_bzwrite
	.globl	BZ2_bzflush
	.type	BZ2_bzflush, @function
BZ2_bzflush:
.LFB96:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE96:
	.size	BZ2_bzflush, .-BZ2_bzflush
	.globl	BZ2_bzclose
	.type	BZ2_bzclose, @function
BZ2_bzclose:
.LFB97:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rsi
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	movq	(%rdi), %rbp
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	cmpb	$0, 5012(%rdi)
	leaq	20(%rsp), %rdi
	je	.L1954
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rsi, 8(%rsp)
	call	BZ2_bzWriteClose
	cmpl	$0, 20(%rsp)
	movq	8(%rsp), %rsi
	je	.L1955
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movl	$1, %edx
	xorl	%edi, %edi
	call	BZ2_bzWriteClose
	jmp	.L1955
.L1954:
	call	BZ2_bzReadClose
.L1955:
	cmpq	%rbp, stdin(%rip)
	je	.L1953
	cmpq	%rbp, stdout(%rip)
	je	.L1953
	movq	%rbp, %rdi
	call	fclose@PLT
.L1953:
	movq	24(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L1957
	call	__stack_chk_fail@PLT
.L1957:
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE97:
	.size	BZ2_bzclose, .-BZ2_bzclose
	.globl	BZ2_bzerror
	.type	BZ2_bzerror, @function
BZ2_bzerror:
.LFB98:
	.cfi_startproc
	endbr64
	movl	5096(%rdi), %eax
	movl	$0, %edx
	testl	%eax, %eax
	cmovg	%edx, %eax
	leaq	bzerrorstrings(%rip), %rdx
	movl	%eax, (%rsi)
	negl	%eax
	cltq
	movq	(%rdx,%rax,8), %rax
	ret
	.cfi_endproc
.LFE98:
	.size	BZ2_bzerror, .-BZ2_bzerror
	.globl	fopen_output_safely
	.type	fopen_output_safely, @function
fopen_output_safely:
.LFB135:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	$384, %edx
	movq	%rsi, %r13
	xorl	%eax, %eax
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	$193, %esi
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	call	open@PLT
	cmpl	$-1, %eax
	je	.L1960
	movq	%r13, %rsi
	movl	%eax, %edi
	movl	%eax, %ebp
	call	fdopen@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L1960
	movl	%ebp, %edi
	call	close@PLT
.L1960:
	movq	%r12, %rax
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE135:
	.size	fopen_output_safely, .-fopen_output_safely
	.section	.rodata.str1.1
.LC82:
	.string	"s"
.LC83:
	.string	""
.LC84:
	.string	"compress: bad modes\n"
.LC85:
	.string	"(stdout)"
.LC86:
	.string	".bz2"
.LC87:
	.string	"%s: Can't open input file %s: %s.\n"
.LC88:
	.string	"%s: Input file %s already has %s suffix.\n"
.LC89:
	.string	"%s: Input file %s is not a normal file.\n"
.LC90:
	.string	"%s: Output file %s already exists.\n"
.LC91:
	.string	"%s: Input file %s has %d other link%s.\n"
.LC92:
	.string	"%s: I won't write compressed data to a terminal.\n"
.LC93:
	.string	"wb"
.LC94:
	.string	"%s: Can't create output file %s: %s.\n"
.LC95:
	.string	"compress: bad srcMode"
	.text
	.type	compress, @function
compress:
.LFB143:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$320, %rsp
	.cfi_def_cfa_offset 352
	movq	%fs:40, %rax
	movq	%rax, 312(%rsp)
	xorl	%eax, %eax
	movb	$0, deleteOutputOnInterrupt(%rip)
	movl	srcMode(%rip), %eax
	testq	%rdi, %rdi
	jne	.L1965
	decl	%eax
	leaq	.LC84(%rip), %rdi
	je	.L1966
	jmp	.L2027
.L1965:
	movq	%rdi, %rsi
	cmpl	$3, %eax
	je	.L1967
	jg	.L1968
	cmpl	$1, %eax
	je	.L1966
	cmpl	$2, %eax
	je	.L1969
	jmp	.L1968
.L1966:
	leaq	.LC73(%rip), %rsi
	jmp	.L1969
.L1967:
	movq	%rdi, 8(%rsp)
	leaq	inName(%rip), %rdi
	call	copyFileName
	movq	8(%rsp), %rsi
	leaq	outName(%rip), %rdi
	call	copyFileName
	movl	$1034, %edx
	leaq	.LC86(%rip), %rsi
	leaq	outName(%rip), %rdi
	call	__strcat_chk@PLT
	jmp	.L1968
.L1969:
	leaq	inName(%rip), %rdi
	call	copyFileName
	leaq	.LC85(%rip), %rsi
	leaq	outName(%rip), %rdi
	call	copyFileName
.L1968:
	cmpl	$1, srcMode(%rip)
	je	.L1970
	leaq	inName(%rip), %rdi
	call	fileExists
	testb	%al, %al
	je	.L2028
.L1970:
	leaq	zSuffix(%rip), %rbp
	leaq	inName(%rip), %rbx
	leaq	32(%rbp), %r12
.L1975:
	movq	0(%rbp), %r9
	movq	%rbx, %rdi
	movq	%r9, %rsi
	movq	%r9, 8(%rsp)
	call	hasSuffix
	movq	8(%rsp), %r9
	testb	%al, %al
	je	.L1972
	cmpb	$0, noisy(%rip)
	movq	progName(%rip), %rcx
	leaq	inName(%rip), %r8
	leaq	.LC88(%rip), %rdx
	je	.L2026
	jmp	.L2030
.L1972:
	addq	$8, %rbp
	cmpq	%r12, %rbp
	jne	.L1975
	movl	srcMode(%rip), %eax
	subl	$2, %eax
	cmpl	$1, %eax
	ja	.L1976
	leaq	24(%rsp), %rsi
	leaq	inName(%rip), %rdi
	call	stat@PLT
	movl	48(%rsp), %eax
	movq	progName(%rip), %rcx
	leaq	inName(%rip), %r8
	leaq	.LC75(%rip), %rdx
	andl	$61440, %eax
	cmpl	$16384, %eax
	je	.L2031
.L1976:
	cmpl	$3, srcMode(%rip)
	jne	.L1988
	cmpb	$0, forceOverwrite(%rip)
	je	.L1978
.L1983:
	leaq	outName(%rip), %rdi
	call	fileExists
	testb	%al, %al
	jne	.L1979
	jmp	.L1980
.L1978:
	call	notAStandardFile.constprop.0
	testb	%al, %al
	je	.L1981
	cmpb	$0, noisy(%rip)
	movq	progName(%rip), %rcx
	leaq	inName(%rip), %r8
	leaq	.LC89(%rip), %rdx
	je	.L2026
	jmp	.L2031
.L1981:
	cmpl	$3, srcMode(%rip)
	jne	.L1988
	jmp	.L1983
.L1979:
	cmpb	$0, forceOverwrite(%rip)
	je	.L1984
	leaq	outName(%rip), %rdi
	call	remove@PLT
	jmp	.L1980
.L1984:
	movq	progName(%rip), %rcx
	leaq	outName(%rip), %r8
	leaq	.LC90(%rip), %rdx
	jmp	.L2031
.L1980:
	cmpl	$3, srcMode(%rip)
	jne	.L1988
	cmpb	$0, forceOverwrite(%rip)
	je	.L1986
.L1992:
	leaq	fileMetaInfo(%rip), %rsi
	leaq	inName(%rip), %rdi
	call	stat@PLT
	testl	%eax, %eax
	je	.L1988
	jmp	.L1987
.L1986:
	leaq	168(%rsp), %rsi
	leaq	inName(%rip), %rdi
	call	lstat@PLT
	testl	%eax, %eax
	jne	.L1990
	movl	184(%rsp), %eax
	leal	-1(%rax), %r9d
	testl	%r9d, %r9d
	jle	.L1990
	cmpl	$1, %r9d
	leaq	.LC83(%rip), %rdx
	leaq	.LC82(%rip), %rax
	movq	progName(%rip), %rcx
	cmove	%rdx, %rax
	pushq	%rdx
	.cfi_def_cfa_offset 360
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	leaq	inName(%rip), %r8
	leaq	.LC91(%rip), %rdx
	pushq	%rax
	.cfi_def_cfa_offset 368
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	setExit
	popq	%rcx
	.cfi_def_cfa_offset 360
	popq	%rsi
	.cfi_def_cfa_offset 352
	jmp	.L1964
.L1990:
	cmpl	$3, srcMode(%rip)
	jne	.L1988
	jmp	.L1992
.L1994:
	testq	%rbp, %rbp
	je	.L2028
.L1993:
	cmpl	$0, verbosity(%rip)
	jle	.L1996
	movq	stderr(%rip), %rdi
	leaq	inName(%rip), %rcx
	leaq	.LC80(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	call	pad.constprop.0
	movq	stderr(%rip), %rdi
	call	fflush@PLT
.L1996:
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movq	%r12, outputHandleJustInCase(%rip)
	movb	$1, deleteOutputOnInterrupt(%rip)
	call	compressStream
	cmpl	$3, srcMode(%rip)
	movq	$0, outputHandleJustInCase(%rip)
	jne	.L1997
	call	applySavedMetaInfoToOutputFile.constprop.0
	cmpb	$0, keepInputFiles(%rip)
	movb	$0, deleteOutputOnInterrupt(%rip)
	jne	.L1997
	leaq	inName(%rip), %rdi
	call	remove@PLT
	testl	%eax, %eax
	je	.L1997
.L1987:
	call	ioError
.L1988:
	movl	srcMode(%rip), %eax
	cmpl	$2, %eax
	je	.L1999
	cmpl	$3, %eax
	je	.L2000
	decl	%eax
	leaq	.LC95(%rip), %rdi
	jne	.L2027
	movq	stdout(%rip), %r12
	movq	stdin(%rip), %rbp
	movq	%r12, %rdi
	call	fileno@PLT
	movl	%eax, %edi
	call	isatty@PLT
	testl	%eax, %eax
	je	.L1993
	movq	progName(%rip), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC92(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movq	progName(%rip), %rcx
	leaq	.LC77(%rip), %rdx
	movq	%rcx, %r8
.L2031:
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	jmp	.L2026
.L2028:
	call	__errno_location@PLT
	movl	(%rax), %edi
	call	strerror@PLT
	movq	progName(%rip), %rcx
	leaq	inName(%rip), %r8
	leaq	.LC87(%rip), %rdx
	movq	%rax, %r9
.L2030:
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	jmp	.L2026
.L1999:
	leaq	.LC5(%rip), %rsi
	leaq	inName(%rip), %rdi
	call	fopen@PLT
	movq	stdout(%rip), %r12
	movq	%rax, %rbp
	movq	%r12, %rdi
	call	fileno@PLT
	movl	%eax, %edi
	call	isatty@PLT
	testl	%eax, %eax
	je	.L1994
	movq	progName(%rip), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC92(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movq	progName(%rip), %rcx
	movl	$1, %esi
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	leaq	.LC77(%rip), %rdx
	movq	%rcx, %r8
	call	__fprintf_chk@PLT
.L2025:
	movq	%rbp, %rdi
	testq	%rbp, %rbp
	jne	.L2029
.L2026:
	movl	$1, %edi
	call	setExit
	jmp	.L1964
.L2027:
	call	panic
.L1995:
	testq	%rbp, %rbp
	jne	.L1993
	call	__errno_location@PLT
	movl	(%rax), %edi
	call	strerror@PLT
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rcx
	leaq	inName(%rip), %r8
	movq	%rax, %r9
	leaq	.LC87(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	%r12, %rdi
.L2029:
	call	fclose@PLT
	jmp	.L2026
.L1997:
	movb	$0, deleteOutputOnInterrupt(%rip)
	jmp	.L1964
.L2000:
	leaq	.LC5(%rip), %rsi
	leaq	inName(%rip), %rdi
	call	fopen@PLT
	leaq	.LC93(%rip), %rsi
	leaq	outName(%rip), %rdi
	movq	%rax, %rbp
	call	fopen_output_safely
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L1995
	call	__errno_location@PLT
	movl	(%rax), %edi
	call	strerror@PLT
	movq	progName(%rip), %rcx
	movq	stderr(%rip), %rdi
	leaq	outName(%rip), %r8
	movq	%rax, %r9
	leaq	.LC94(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	jmp	.L2025
.L1964:
	movq	312(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L2003
	call	__stack_chk_fail@PLT
.L2003:
	addq	$320, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE143:
	.size	compress, .-compress
	.section	.rodata.str1.1
.LC96:
	.string	"uncompress: bad modes\n"
.LC97:
	.string	".out"
.LC98:
	.string	"%s: Can't guess original name for %s -- using %s\n"
.LC99:
	.string	"uncompress: bad srcMode"
.LC100:
	.string	"done\n"
.LC101:
	.string	"not a bzip2 file.\n"
.LC102:
	.string	"%s: %s is not a bzip2 file.\n"
	.text
	.type	uncompress, @function
uncompress:
.LFB144:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$320, %rsp
	.cfi_def_cfa_offset 368
	movq	%fs:40, %rax
	movq	%rax, 312(%rsp)
	xorl	%eax, %eax
	movb	$0, deleteOutputOnInterrupt(%rip)
	movl	srcMode(%rip), %eax
	testq	%rdi, %rdi
	jne	.L2033
	decl	%eax
	leaq	.LC96(%rip), %rdi
	je	.L2034
	jmp	.L2105
.L2033:
	movq	%rdi, %rsi
	cmpl	$3, %eax
	je	.L2035
	movb	$0, %bpl
	jg	.L2036
	cmpl	$1, %eax
	je	.L2034
	cmpl	$2, %eax
	je	.L2037
	jmp	.L2036
.L2034:
	leaq	.LC73(%rip), %rsi
	jmp	.L2037
.L2035:
	movq	%rdi, 8(%rsp)
	leaq	inName(%rip), %rdi
	xorl	%ebp, %ebp
	leaq	zSuffix(%rip), %r13
	call	copyFileName
	movq	8(%rsp), %rsi
	leaq	outName(%rip), %rdi
	leaq	outName(%rip), %r14
	call	copyFileName
.L2039:
	movq	0(%r13,%rbp,8), %r12
	movq	%r14, %rdi
	movslq	%ebp, %rbx
	movq	%r12, %rsi
	call	hasSuffix
	testb	%al, %al
	jne	.L2038
	incq	%rbp
	cmpq	$4, %rbp
	jne	.L2039
	movl	$1034, %edx
	leaq	.LC97(%rip), %rsi
	leaq	outName(%rip), %rdi
	movb	$1, %bpl
	call	__strcat_chk@PLT
	jmp	.L2036
.L2038:
	leaq	outName(%rip), %r8
	orq	$-1, %rdx
	leaq	unzSuffix(%rip), %rax
	movq	%r8, %rdi
	movq	(%rax,%rbx,8), %rsi
	movq	%rdx, %rcx
	xorl	%eax, %eax
	repnz scasb
	movq	%r12, %rdi
	movq	%rcx, %r9
	movq	%rdx, %rcx
	movl	$1034, %edx
	repnz scasb
	movq	%r8, %rdi
	movq	%rcx, %rax
	subq	%r9, %rax
	movb	$0, (%r8,%rax)
	call	__strcat_chk@PLT
	jmp	.L2099
.L2037:
	leaq	inName(%rip), %rdi
	call	copyFileName
	leaq	.LC85(%rip), %rsi
	leaq	outName(%rip), %rdi
	call	copyFileName
.L2099:
	xorl	%ebp, %ebp
.L2036:
	cmpl	$1, srcMode(%rip)
	je	.L2041
	leaq	inName(%rip), %rdi
	call	fileExists
	testb	%al, %al
	jne	.L2042
	call	__errno_location@PLT
	movl	(%rax), %edi
	call	strerror@PLT
	movq	progName(%rip), %rcx
	leaq	inName(%rip), %r8
	leaq	.LC87(%rip), %rdx
	movq	%rax, %r9
	jmp	.L2106
.L2042:
	movl	srcMode(%rip), %eax
	subl	$2, %eax
	cmpl	$1, %eax
	ja	.L2044
	leaq	24(%rsp), %rsi
	leaq	inName(%rip), %rdi
	call	stat@PLT
	movl	48(%rsp), %eax
	andl	$61440, %eax
	cmpl	$16384, %eax
	jne	.L2044
	movq	progName(%rip), %rcx
	leaq	inName(%rip), %r8
	leaq	.LC75(%rip), %rdx
.L2104:
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
.L2103:
	movl	$1, %edi
	call	setExit
	jmp	.L2032
.L2044:
	cmpl	$3, srcMode(%rip)
	jne	.L2041
	cmpb	$0, forceOverwrite(%rip)
	jne	.L2045
	call	notAStandardFile.constprop.0
	testb	%al, %al
	je	.L2041
	cmpb	$0, noisy(%rip)
	movq	progName(%rip), %rcx
	leaq	inName(%rip), %r8
	leaq	.LC89(%rip), %rdx
	je	.L2103
	jmp	.L2104
.L2041:
	testb	%bpl, %bpl
	je	.L2049
.L2048:
	cmpb	$0, noisy(%rip)
	je	.L2049
	movq	progName(%rip), %rcx
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	leaq	outName(%rip), %r9
	leaq	inName(%rip), %r8
	leaq	.LC98(%rip), %rdx
	movl	$1, %esi
	call	__fprintf_chk@PLT
.L2049:
	cmpl	$3, srcMode(%rip)
	jne	.L2056
.L2073:
	leaq	outName(%rip), %rdi
	call	fileExists
	testb	%al, %al
	je	.L2052
	cmpb	$0, forceOverwrite(%rip)
	je	.L2053
	leaq	outName(%rip), %rdi
	call	remove@PLT
	jmp	.L2052
.L2053:
	movq	progName(%rip), %rcx
	leaq	outName(%rip), %r8
	leaq	.LC90(%rip), %rdx
	jmp	.L2104
.L2052:
	cmpl	$3, srcMode(%rip)
	jne	.L2056
	cmpb	$0, forceOverwrite(%rip)
	je	.L2054
.L2060:
	leaq	fileMetaInfo(%rip), %rsi
	leaq	inName(%rip), %rdi
	call	stat@PLT
	testl	%eax, %eax
	je	.L2056
	jmp	.L2055
.L2054:
	leaq	168(%rsp), %rsi
	leaq	inName(%rip), %rdi
	call	lstat@PLT
	testl	%eax, %eax
	jne	.L2058
	movl	184(%rsp), %eax
	leal	-1(%rax), %r9d
	testl	%r9d, %r9d
	jle	.L2058
	cmpl	$1, %r9d
	leaq	.LC83(%rip), %rdx
	leaq	.LC82(%rip), %rax
	movq	progName(%rip), %rcx
	cmove	%rdx, %rax
	pushq	%rdx
	.cfi_def_cfa_offset 376
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	leaq	inName(%rip), %r8
	leaq	.LC91(%rip), %rdx
	pushq	%rax
	.cfi_def_cfa_offset 384
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	setExit
	popq	%rcx
	.cfi_def_cfa_offset 376
	popq	%rsi
	.cfi_def_cfa_offset 368
	jmp	.L2032
.L2058:
	cmpl	$3, srcMode(%rip)
	jne	.L2056
	jmp	.L2060
.L2061:
	cmpl	$0, verbosity(%rip)
	jle	.L2064
	movq	stderr(%rip), %rdi
	leaq	inName(%rip), %rcx
	leaq	.LC80(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	call	pad.constprop.0
	movq	stderr(%rip), %rdi
	call	fflush@PLT
.L2064:
	movq	%rbp, %rdi
	movq	%r12, %rsi
	movq	%r12, outputHandleJustInCase(%rip)
	movb	$1, deleteOutputOnInterrupt(%rip)
	call	uncompressStream
	movq	$0, outputHandleJustInCase(%rip)
	movl	%eax, %ebp
	testb	%al, %al
	je	.L2065
	cmpl	$3, srcMode(%rip)
	jne	.L2066
	call	applySavedMetaInfoToOutputFile.constprop.0
	cmpb	$0, keepInputFiles(%rip)
	movb	$0, deleteOutputOnInterrupt(%rip)
	leaq	inName(%rip), %rdi
	jne	.L2066
.L2101:
	call	remove@PLT
	testl	%eax, %eax
	je	.L2066
.L2055:
	call	ioError
.L2056:
	movl	srcMode(%rip), %eax
	cmpl	$2, %eax
	jne	.L2108
	leaq	.LC5(%rip), %rsi
	leaq	inName(%rip), %rdi
	call	fopen@PLT
	movq	stdout(%rip), %r12
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L2061
	call	__errno_location@PLT
	movl	(%rax), %edi
	call	strerror@PLT
	movq	progName(%rip), %rcx
	leaq	inName(%rip), %r8
	leaq	.LC78(%rip), %rdx
	movq	%rax, %r9
.L2106:
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	jmp	.L2103
.L2108:
	cmpl	$3, %eax
	je	.L2070
	decl	%eax
	leaq	.LC99(%rip), %rdi
	je	.L2109
.L2105:
	call	panic
.L2065:
	cmpl	$3, srcMode(%rip)
	movb	$1, unzFailsExist(%rip)
	movb	$0, deleteOutputOnInterrupt(%rip)
	jne	.L2066
	leaq	outName(%rip), %rdi
	jmp	.L2101
.L2066:
	movb	$0, deleteOutputOnInterrupt(%rip)
	testb	%bpl, %bpl
	je	.L2067
	cmpl	$0, verbosity(%rip)
	movq	stderr(%rip), %rsi
	leaq	.LC100(%rip), %rdi
	jle	.L2032
	jmp	.L2102
.L2067:
	movl	$2, %edi
	call	setExit
	cmpl	$0, verbosity(%rip)
	movq	stderr(%rip), %rdi
	jle	.L2068
	movq	%rdi, %rsi
	leaq	.LC101(%rip), %rdi
.L2102:
	call	fputs@PLT
	jmp	.L2032
.L2068:
	movq	progName(%rip), %rcx
	leaq	inName(%rip), %r8
	leaq	.LC102(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	jmp	.L2032
.L2070:
	leaq	.LC5(%rip), %rsi
	leaq	inName(%rip), %rdi
	call	fopen@PLT
	leaq	.LC93(%rip), %rsi
	leaq	outName(%rip), %rdi
	movq	%rax, %rbp
	call	fopen_output_safely
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L2062
	call	__errno_location@PLT
	movl	(%rax), %edi
	call	strerror@PLT
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rcx
	leaq	outName(%rip), %r8
	movq	%rax, %r9
	leaq	.LC94(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	%rbp, %rdi
	testq	%rbp, %rbp
	jne	.L2107
	jmp	.L2103
.L2062:
	testq	%rbp, %rbp
	jne	.L2061
	call	__errno_location@PLT
	movl	(%rax), %edi
	call	strerror@PLT
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rcx
	leaq	inName(%rip), %r8
	movq	%rax, %r9
	leaq	.LC87(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	%r12, %rdi
.L2107:
	call	fclose@PLT
	jmp	.L2103
.L2109:
	movq	stdin(%rip), %rbp
	movq	stdout(%rip), %r12
	movq	%rbp, %rdi
	call	fileno@PLT
	movl	%eax, %edi
	call	isatty@PLT
	testl	%eax, %eax
	je	.L2061
	movq	progName(%rip), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC76(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movq	progName(%rip), %rcx
	leaq	.LC77(%rip), %rdx
	movq	%rcx, %r8
	jmp	.L2104
.L2045:
	testb	%bpl, %bpl
	jne	.L2048
	jmp	.L2073
.L2032:
	movq	312(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L2074
	call	__stack_chk_fail@PLT
.L2074:
	addq	$320, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE144:
	.size	uncompress, .-uncompress
	.section	.rodata.str1.1
.LC103:
	.string	"BZIP2"
.LC104:
	.string	"BZIP"
.LC105:
	.string	"--"
.LC106:
	.string	"unzip"
.LC107:
	.string	"UNZIP"
.LC108:
	.string	"z2cat"
.LC109:
	.string	"Z2CAT"
.LC110:
	.string	"zcat"
.LC111:
	.string	"ZCAT"
.LC112:
	.string	"%s: Bad flag `%s'\n"
.LC113:
	.string	"--stdout"
.LC114:
	.string	"--decompress"
.LC115:
	.string	"--compress"
.LC116:
	.string	"--force"
.LC117:
	.string	"--test"
.LC118:
	.string	"--keep"
.LC119:
	.string	"--small"
.LC120:
	.string	"--quiet"
.LC121:
	.string	"--version"
.LC122:
	.string	"--license"
.LC123:
	.string	"--exponential"
.LC124:
	.string	"--repetitive-best"
.LC125:
	.string	"--repetitive-fast"
.LC126:
	.string	"--fast"
.LC127:
	.string	"--best"
.LC128:
	.string	"--verbose"
.LC129:
	.string	"--help"
.LC130:
	.string	"%s: -c and -t cannot be used together.\n"
.LC131:
	.string	"\nYou can use the `bzip2recover' program to attempt to recover\ndata from undamaged sections of corrupted files.\n\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB153:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%edi, %r13d
	movl	$11, %edi
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	leaq	mySIGSEGVorSIGBUScatcher(%rip), %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movb	$0, smallMode(%rip)
	movq	$0, outputHandleJustInCase(%rip)
	movb	$0, keepInputFiles(%rip)
	movb	$0, forceOverwrite(%rip)
	movb	$1, noisy(%rip)
	movl	$0, verbosity(%rip)
	movl	$9, blockSize100k(%rip)
	movb	$0, testFailsExist(%rip)
	movb	$0, unzFailsExist(%rip)
	movl	$0, numFileNames(%rip)
	movl	$0, numFilesProcessed(%rip)
	movl	$30, workFactor(%rip)
	movb	$0, deleteOutputOnInterrupt(%rip)
	movl	$0, exitValue(%rip)
	call	signal@PLT
	leaq	mySIGSEGVorSIGBUScatcher(%rip), %rsi
	movl	$7, %edi
	call	signal@PLT
	leaq	.LC72(%rip), %rsi
	leaq	inName(%rip), %rdi
	call	copyFileName
	leaq	.LC72(%rip), %rsi
	leaq	outName(%rip), %rdi
	call	copyFileName
	movq	(%r12), %rsi
	leaq	progNameReally(%rip), %rdi
	call	copyFileName
	leaq	progNameReally(%rip), %rax
	xorl	%ecx, %ecx
	movb	$1, %dil
	movq	%rax, progName(%rip)
	movq	%rax, %rdx
.L2111:
	movb	(%rdx), %sil
	testb	%sil, %sil
	je	.L2277
	incq	%rdx
	cmpb	$47, %sil
	cmove	%rdx, %rax
	cmove	%edi, %ecx
	jmp	.L2111
.L2277:
	testb	%cl, %cl
	je	.L2114
	movq	%rax, progName(%rip)
.L2114:
	movq	%rsp, %rbp
	leaq	.LC103(%rip), %rsi
	movq	$0, (%rsp)
	xorl	%ebx, %ebx
	movq	%rbp, %rdi
	call	addFlagsFromEnvVar
	leaq	.LC104(%rip), %rsi
	movq	%rbp, %rdi
	call	addFlagsFromEnvVar
.L2115:
	incq	%rbx
	movq	(%rsp), %rbp
	cmpl	%ebx, %r13d
	jle	.L2278
	movq	(%r12,%rbx,8), %rsi
	movq	%rbp, %rdi
	call	snocString
	movq	%rax, (%rsp)
	jmp	.L2115
.L2278:
	movl	$7, longestFileName(%rip)
	movq	%rbp, %r14
	movb	$1, %bl
	leaq	.LC105(%rip), %r12
	movl	$0, numFileNames(%rip)
.L2117:
	movl	numFileNames(%rip), %r13d
	testq	%r14, %r14
	je	.L2279
	movq	(%r14), %r15
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L2214
	cmpb	$45, (%r15)
	jne	.L2225
	testb	%bl, %bl
	jne	.L2215
.L2225:
	incl	%r13d
	orq	$-1, %rcx
	xorl	%eax, %eax
	movq	%r15, %rdi
	movl	%r13d, numFileNames(%rip)
	repnz scasb
	notq	%rcx
	decq	%rcx
	cmpl	longestFileName(%rip), %ecx
	jle	.L2118
	movl	%ecx, longestFileName(%rip)
	jmp	.L2118
.L2214:
	xorl	%ebx, %ebx
	jmp	.L2118
.L2215:
	movb	$1, %bl
.L2118:
	movq	8(%r14), %r14
	jmp	.L2117
.L2279:
	cmpl	$1, %r13d
	movq	progName(%rip), %r12
	leaq	.LC106(%rip), %rsi
	movl	$1, opMode(%rip)
	sbbl	%eax, %eax
	andl	$-2, %eax
	movq	%r12, %rdi
	addl	$3, %eax
	movl	%eax, srcMode(%rip)
	call	strstr@PLT
	testq	%rax, %rax
	jne	.L2122
	leaq	.LC107(%rip), %rsi
	movq	%r12, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	je	.L2123
.L2122:
	movl	$2, opMode(%rip)
.L2123:
	leaq	.LC108(%rip), %rsi
	movq	%r12, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	jne	.L2124
	leaq	.LC109(%rip), %rsi
	movq	%r12, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	jne	.L2124
	leaq	.LC110(%rip), %rsi
	movq	%r12, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	jne	.L2124
	leaq	.LC111(%rip), %rsi
	movq	%r12, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	je	.L2125
.L2124:
	movl	$2, opMode(%rip)
	cmpl	$1, %r13d
	sbbl	%eax, %eax
	addl	$2, %eax
	movl	%eax, srcMode(%rip)
.L2125:
	leaq	.L2137(%rip), %rbx
.L2127:
	testq	%rbp, %rbp
	je	.L2128
	movq	0(%rbp), %r12
	leaq	.LC105(%rip), %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L2128
	cmpb	$45, (%r12)
	je	.L2129
.L2131:
	movq	8(%rbp), %rbp
	jmp	.L2127
.L2129:
	cmpb	$45, 1(%r12)
	je	.L2131
	movl	$1, %r12d
.L2130:
	movq	0(%rbp), %r8
	movb	(%r8,%r12), %al
	testb	%al, %al
	je	.L2131
	cmpb	$86, %al
	je	.L2132
	jg	.L2133
	subl	$49, %eax
	cmpb	$27, %al
	ja	.L2134
	leaq	.L2147(%rip), %rdx
	movzbl	%al, %eax
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L2147:
	.long	.L2156-.L2147
	.long	.L2155-.L2147
	.long	.L2154-.L2147
	.long	.L2153-.L2147
	.long	.L2152-.L2147
	.long	.L2151-.L2147
	.long	.L2150-.L2147
	.long	.L2149-.L2147
	.long	.L2148-.L2147
	.long	.L2134-.L2147
	.long	.L2134-.L2147
	.long	.L2134-.L2147
	.long	.L2134-.L2147
	.long	.L2134-.L2147
	.long	.L2134-.L2147
	.long	.L2134-.L2147
	.long	.L2134-.L2147
	.long	.L2134-.L2147
	.long	.L2134-.L2147
	.long	.L2134-.L2147
	.long	.L2134-.L2147
	.long	.L2134-.L2147
	.long	.L2134-.L2147
	.long	.L2134-.L2147
	.long	.L2134-.L2147
	.long	.L2134-.L2147
	.long	.L2134-.L2147
	.long	.L2132-.L2147
	.section	.text.startup
.L2133:
	subl	$99, %eax
	cmpb	$23, %al
	ja	.L2134
	movzbl	%al, %eax
	movslq	(%rbx,%rax,4), %rax
	addq	%rbx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L2137:
	.long	.L2146-.L2137
	.long	.L2145-.L2137
	.long	.L2134-.L2137
	.long	.L2144-.L2137
	.long	.L2134-.L2137
	.long	.L2275-.L2137
	.long	.L2134-.L2137
	.long	.L2134-.L2137
	.long	.L2142-.L2137
	.long	.L2134-.L2137
	.long	.L2134-.L2137
	.long	.L2134-.L2137
	.long	.L2134-.L2137
	.long	.L2134-.L2137
	.long	.L2141-.L2137
	.long	.L2134-.L2137
	.long	.L2140-.L2137
	.long	.L2139-.L2137
	.long	.L2134-.L2137
	.long	.L2138-.L2137
	.long	.L2134-.L2137
	.long	.L2134-.L2137
	.long	.L2134-.L2137
	.long	.L2136-.L2137
	.section	.text.startup
.L2146:
	movl	$2, srcMode(%rip)
	jmp	.L2158
.L2145:
	movl	$2, opMode(%rip)
	jmp	.L2158
.L2136:
	movl	$1, opMode(%rip)
	jmp	.L2158
.L2144:
	movb	$1, forceOverwrite(%rip)
	jmp	.L2158
.L2139:
	movl	$3, opMode(%rip)
	jmp	.L2158
.L2142:
	movb	$1, keepInputFiles(%rip)
	jmp	.L2158
.L2140:
	movb	$1, smallMode(%rip)
	jmp	.L2158
.L2141:
	movb	$0, noisy(%rip)
	jmp	.L2158
.L2156:
	movl	$1, blockSize100k(%rip)
	jmp	.L2158
.L2155:
	movl	$2, blockSize100k(%rip)
	jmp	.L2158
.L2154:
	movl	$3, blockSize100k(%rip)
	jmp	.L2158
.L2153:
	movl	$4, blockSize100k(%rip)
	jmp	.L2158
.L2152:
	movl	$5, blockSize100k(%rip)
	jmp	.L2158
.L2151:
	movl	$6, blockSize100k(%rip)
	jmp	.L2158
.L2150:
	movl	$7, blockSize100k(%rip)
	jmp	.L2158
.L2149:
	movl	$8, blockSize100k(%rip)
	jmp	.L2158
.L2148:
	movl	$9, blockSize100k(%rip)
	jmp	.L2158
.L2132:
	call	license
	jmp	.L2158
.L2138:
	incl	verbosity(%rip)
	jmp	.L2158
.L2134:
	movq	progName(%rip), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC112(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
.L2274:
	call	__fprintf_chk@PLT
	movq	progName(%rip), %rdi
	call	usage
.L2273:
	movl	$1, %edi
.L2272:
	call	exit@PLT
.L2158:
	incq	%r12
	jmp	.L2130
.L2128:
	movq	(%rsp), %rbx
	leaq	.LC105(%rip), %r12
	jmp	.L2161
.L2179:
	leaq	.LC129(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2180
.L2275:
	movq	progName(%rip), %rdi
	call	usage
	xorl	%edi, %edi
	jmp	.L2272
.L2181:
	movq	(%rbx), %rbp
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L2162
	leaq	.LC113(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2163
	movl	$2, srcMode(%rip)
.L2164:
	movq	8(%rbx), %rbx
.L2161:
	testq	%rbx, %rbx
	jne	.L2181
	jmp	.L2162
.L2163:
	leaq	.LC114(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2165
	movl	$2, opMode(%rip)
	jmp	.L2164
.L2165:
	leaq	.LC115(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2166
	movl	$1, opMode(%rip)
	jmp	.L2164
.L2166:
	leaq	.LC116(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2167
	movb	$1, forceOverwrite(%rip)
	jmp	.L2164
.L2167:
	leaq	.LC117(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2168
	movl	$3, opMode(%rip)
	jmp	.L2164
.L2168:
	leaq	.LC118(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2169
	movb	$1, keepInputFiles(%rip)
	jmp	.L2164
.L2169:
	leaq	.LC119(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2170
	movb	$1, smallMode(%rip)
	jmp	.L2164
.L2170:
	leaq	.LC120(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2171
	movb	$0, noisy(%rip)
	jmp	.L2164
.L2171:
	leaq	.LC121(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2172
.L2173:
	call	license
	jmp	.L2164
.L2172:
	leaq	.LC122(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L2173
	leaq	.LC123(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2174
	movl	$1, workFactor(%rip)
	jmp	.L2164
.L2174:
	leaq	.LC124(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L2271
	leaq	.LC125(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2176
.L2271:
	movq	%rbp, %rdi
	call	redundant
	jmp	.L2164
.L2176:
	leaq	.LC126(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2177
	movl	$1, blockSize100k(%rip)
	jmp	.L2164
.L2177:
	leaq	.LC127(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2178
	movl	$9, blockSize100k(%rip)
	jmp	.L2164
.L2178:
	leaq	.LC128(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2179
	incl	verbosity(%rip)
	jmp	.L2164
.L2180:
	movl	$2, %edx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	jne	.L2164
	movq	progName(%rip), %rcx
	movq	%rbp, %r8
	movq	stderr(%rip), %rdi
	leaq	.LC112(%rip), %rdx
	movl	$1, %esi
	jmp	.L2274
.L2162:
	cmpl	$4, verbosity(%rip)
	jle	.L2182
	movl	$4, verbosity(%rip)
.L2182:
	movl	opMode(%rip), %eax
	movl	srcMode(%rip), %edx
	cmpl	$1, %eax
	jne	.L2183
	cmpb	$0, smallMode(%rip)
	je	.L2184
	cmpl	$2, blockSize100k(%rip)
	jle	.L2184
	movl	$2, blockSize100k(%rip)
	jmp	.L2184
.L2183:
	cmpl	$3, %eax
	jne	.L2184
	cmpl	$2, %edx
	jne	.L2185
	movq	progName(%rip), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC130(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	jmp	.L2273
.L2184:
	cmpl	$2, %edx
	jne	.L2186
	cmpl	$0, numFileNames(%rip)
	jne	.L2186
	movl	$1, srcMode(%rip)
.L2186:
	decl	%eax
	je	.L2187
.L2185:
	movl	$0, blockSize100k(%rip)
.L2187:
	cmpl	$3, srcMode(%rip)
	jne	.L2188
	leaq	mySignalCatcher(%rip), %rsi
	movl	$2, %edi
	call	signal@PLT
	leaq	mySignalCatcher(%rip), %rsi
	movl	$15, %edi
	call	signal@PLT
	leaq	mySignalCatcher(%rip), %rsi
	movl	$1, %edi
	call	signal@PLT
.L2188:
	movl	opMode(%rip), %edx
	movl	srcMode(%rip), %eax
	cmpl	$1, %edx
	jne	.L2189
	decl	%eax
	jne	.L2190
	xorl	%edi, %edi
	call	compress
	jmp	.L2191
.L2190:
	movq	(%rsp), %rbx
	movb	$1, %bpl
.L2192:
	testq	%rbx, %rbx
	je	.L2191
	movq	(%rbx), %r12
	leaq	.LC105(%rip), %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L2219
	cmpb	$45, (%r12)
	jne	.L2226
	testb	%bpl, %bpl
	jne	.L2220
.L2226:
	movq	%r12, %rdi
	incl	numFilesProcessed(%rip)
	call	compress
	jmp	.L2193
.L2219:
	xorl	%ebp, %ebp
	jmp	.L2193
.L2220:
	movb	$1, %bpl
.L2193:
	movq	8(%rbx), %rbx
	jmp	.L2192
.L2189:
	cmpl	$2, %edx
	jne	.L2197
	decl	%eax
	movb	$0, unzFailsExist(%rip)
	jne	.L2198
	xorl	%edi, %edi
	call	uncompress
	jmp	.L2199
.L2198:
	movq	(%rsp), %rbx
	movb	$1, %bpl
.L2200:
	testq	%rbx, %rbx
	je	.L2199
	movq	(%rbx), %r12
	leaq	.LC105(%rip), %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L2221
	cmpb	$45, (%r12)
	jne	.L2227
	testb	%bpl, %bpl
	jne	.L2222
.L2227:
	movq	%r12, %rdi
	incl	numFilesProcessed(%rip)
	call	uncompress
	jmp	.L2201
.L2221:
	xorl	%ebp, %ebp
	jmp	.L2201
.L2222:
	movb	$1, %bpl
.L2201:
	movq	8(%rbx), %rbx
	jmp	.L2200
.L2199:
	cmpb	$0, unzFailsExist(%rip)
	je	.L2191
	jmp	.L2276
.L2197:
	decl	%eax
	movb	$0, testFailsExist(%rip)
	jne	.L2204
	xorl	%edi, %edi
	call	testf
	jmp	.L2205
.L2204:
	movq	(%rsp), %rbx
	movb	$1, %bpl
.L2206:
	testq	%rbx, %rbx
	je	.L2205
	movq	(%rbx), %r12
	leaq	.LC105(%rip), %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L2223
	cmpb	$45, (%r12)
	jne	.L2228
	testb	%bpl, %bpl
	jne	.L2224
.L2228:
	movq	%r12, %rdi
	incl	numFilesProcessed(%rip)
	call	testf
	jmp	.L2207
.L2223:
	xorl	%ebp, %ebp
	jmp	.L2207
.L2224:
	movb	$1, %bpl
.L2207:
	movq	8(%rbx), %rbx
	jmp	.L2206
.L2205:
	cmpb	$0, testFailsExist(%rip)
	je	.L2191
	cmpb	$0, noisy(%rip)
	je	.L2191
	movq	stderr(%rip), %rsi
	leaq	.LC131(%rip), %rdi
	call	fputs@PLT
.L2276:
	movl	$2, %edi
	call	setExit
	movl	exitValue(%rip), %edi
	jmp	.L2272
.L2191:
	movq	(%rsp), %rbp
.L2210:
	testq	%rbp, %rbp
	je	.L2280
	movq	0(%rbp), %rdi
	movq	8(%rbp), %rbx
	testq	%rdi, %rdi
	je	.L2211
	call	free@PLT
.L2211:
	movq	%rbp, %rdi
	movq	%rbx, %rbp
	call	free@PLT
	jmp	.L2210
.L2280:
	movq	8(%rsp), %rcx
	xorq	%fs:40, %rcx
	movl	exitValue(%rip), %eax
	je	.L2213
	call	__stack_chk_fail@PLT
.L2213:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE153:
	.size	main, .-main
	.globl	unzSuffix
	.section	.rodata.str1.1
.LC132:
	.string	".tar"
	.section	.data.rel.local,"aw"
	.align 32
	.type	unzSuffix, @object
	.size	unzSuffix, 32
unzSuffix:
	.quad	.LC83
	.quad	.LC83
	.quad	.LC132
	.quad	.LC132
	.globl	zSuffix
	.section	.rodata.str1.1
.LC133:
	.string	".bz"
.LC134:
	.string	".tbz2"
.LC135:
	.string	".tbz"
	.section	.data.rel.local
	.align 32
	.type	zSuffix, @object
	.size	zSuffix, 32
zSuffix:
	.quad	.LC86
	.quad	.LC133
	.quad	.LC134
	.quad	.LC135
	.local	fileMetaInfo
	.comm	fileMetaInfo,144,32
	.comm	workFactor,4,4
	.comm	outputHandleJustInCase,8,8
	.comm	progNameReally,1034,32
	.comm	progName,8,8
	.comm	tmpName,1034,32
	.comm	outName,1034,32
	.comm	inName,1034,32
	.comm	longestFileName,4,4
	.comm	srcMode,4,4
	.comm	opMode,4,4
	.comm	exitValue,4,4
	.comm	blockSize100k,4,4
	.comm	numFilesProcessed,4,4
	.comm	numFileNames,4,4
	.comm	noisy,1,1
	.comm	unzFailsExist,1,1
	.comm	testFailsExist,1,1
	.comm	forceOverwrite,1,1
	.comm	deleteOutputOnInterrupt,1,1
	.comm	smallMode,1,1
	.comm	keepInputFiles,1,1
	.comm	verbosity,4,4
	.section	.rodata.str1.1
.LC136:
	.string	"OK"
.LC137:
	.string	"SEQUENCE_ERROR"
.LC138:
	.string	"PARAM_ERROR"
.LC139:
	.string	"MEM_ERROR"
.LC140:
	.string	"DATA_ERROR"
.LC141:
	.string	"DATA_ERROR_MAGIC"
.LC142:
	.string	"IO_ERROR"
.LC143:
	.string	"UNEXPECTED_EOF"
.LC144:
	.string	"OUTBUFF_FULL"
.LC145:
	.string	"CONFIG_ERROR"
.LC146:
	.string	"???"
	.section	.data.rel.ro.local,"aw"
	.align 32
	.type	bzerrorstrings, @object
	.size	bzerrorstrings, 128
bzerrorstrings:
	.quad	.LC136
	.quad	.LC137
	.quad	.LC138
	.quad	.LC139
	.quad	.LC140
	.quad	.LC141
	.quad	.LC142
	.quad	.LC143
	.quad	.LC144
	.quad	.LC145
	.quad	.LC146
	.quad	.LC146
	.quad	.LC146
	.quad	.LC146
	.quad	.LC146
	.quad	.LC146
	.globl	BZ2_rNums
	.data
	.align 32
	.type	BZ2_rNums, @object
	.size	BZ2_rNums, 2048
BZ2_rNums:
	.long	619
	.long	720
	.long	127
	.long	481
	.long	931
	.long	816
	.long	813
	.long	233
	.long	566
	.long	247
	.long	985
	.long	724
	.long	205
	.long	454
	.long	863
	.long	491
	.long	741
	.long	242
	.long	949
	.long	214
	.long	733
	.long	859
	.long	335
	.long	708
	.long	621
	.long	574
	.long	73
	.long	654
	.long	730
	.long	472
	.long	419
	.long	436
	.long	278
	.long	496
	.long	867
	.long	210
	.long	399
	.long	680
	.long	480
	.long	51
	.long	878
	.long	465
	.long	811
	.long	169
	.long	869
	.long	675
	.long	611
	.long	697
	.long	867
	.long	561
	.long	862
	.long	687
	.long	507
	.long	283
	.long	482
	.long	129
	.long	807
	.long	591
	.long	733
	.long	623
	.long	150
	.long	238
	.long	59
	.long	379
	.long	684
	.long	877
	.long	625
	.long	169
	.long	643
	.long	105
	.long	170
	.long	607
	.long	520
	.long	932
	.long	727
	.long	476
	.long	693
	.long	425
	.long	174
	.long	647
	.long	73
	.long	122
	.long	335
	.long	530
	.long	442
	.long	853
	.long	695
	.long	249
	.long	445
	.long	515
	.long	909
	.long	545
	.long	703
	.long	919
	.long	874
	.long	474
	.long	882
	.long	500
	.long	594
	.long	612
	.long	641
	.long	801
	.long	220
	.long	162
	.long	819
	.long	984
	.long	589
	.long	513
	.long	495
	.long	799
	.long	161
	.long	604
	.long	958
	.long	533
	.long	221
	.long	400
	.long	386
	.long	867
	.long	600
	.long	782
	.long	382
	.long	596
	.long	414
	.long	171
	.long	516
	.long	375
	.long	682
	.long	485
	.long	911
	.long	276
	.long	98
	.long	553
	.long	163
	.long	354
	.long	666
	.long	933
	.long	424
	.long	341
	.long	533
	.long	870
	.long	227
	.long	730
	.long	475
	.long	186
	.long	263
	.long	647
	.long	537
	.long	686
	.long	600
	.long	224
	.long	469
	.long	68
	.long	770
	.long	919
	.long	190
	.long	373
	.long	294
	.long	822
	.long	808
	.long	206
	.long	184
	.long	943
	.long	795
	.long	384
	.long	383
	.long	461
	.long	404
	.long	758
	.long	839
	.long	887
	.long	715
	.long	67
	.long	618
	.long	276
	.long	204
	.long	918
	.long	873
	.long	777
	.long	604
	.long	560
	.long	951
	.long	160
	.long	578
	.long	722
	.long	79
	.long	804
	.long	96
	.long	409
	.long	713
	.long	940
	.long	652
	.long	934
	.long	970
	.long	447
	.long	318
	.long	353
	.long	859
	.long	672
	.long	112
	.long	785
	.long	645
	.long	863
	.long	803
	.long	350
	.long	139
	.long	93
	.long	354
	.long	99
	.long	820
	.long	908
	.long	609
	.long	772
	.long	154
	.long	274
	.long	580
	.long	184
	.long	79
	.long	626
	.long	630
	.long	742
	.long	653
	.long	282
	.long	762
	.long	623
	.long	680
	.long	81
	.long	927
	.long	626
	.long	789
	.long	125
	.long	411
	.long	521
	.long	938
	.long	300
	.long	821
	.long	78
	.long	343
	.long	175
	.long	128
	.long	250
	.long	170
	.long	774
	.long	972
	.long	275
	.long	999
	.long	639
	.long	495
	.long	78
	.long	352
	.long	126
	.long	857
	.long	956
	.long	358
	.long	619
	.long	580
	.long	124
	.long	737
	.long	594
	.long	701
	.long	612
	.long	669
	.long	112
	.long	134
	.long	694
	.long	363
	.long	992
	.long	809
	.long	743
	.long	168
	.long	974
	.long	944
	.long	375
	.long	748
	.long	52
	.long	600
	.long	747
	.long	642
	.long	182
	.long	862
	.long	81
	.long	344
	.long	805
	.long	988
	.long	739
	.long	511
	.long	655
	.long	814
	.long	334
	.long	249
	.long	515
	.long	897
	.long	955
	.long	664
	.long	981
	.long	649
	.long	113
	.long	974
	.long	459
	.long	893
	.long	228
	.long	433
	.long	837
	.long	553
	.long	268
	.long	926
	.long	240
	.long	102
	.long	654
	.long	459
	.long	51
	.long	686
	.long	754
	.long	806
	.long	760
	.long	493
	.long	403
	.long	415
	.long	394
	.long	687
	.long	700
	.long	946
	.long	670
	.long	656
	.long	610
	.long	738
	.long	392
	.long	760
	.long	799
	.long	887
	.long	653
	.long	978
	.long	321
	.long	576
	.long	617
	.long	626
	.long	502
	.long	894
	.long	679
	.long	243
	.long	440
	.long	680
	.long	879
	.long	194
	.long	572
	.long	640
	.long	724
	.long	926
	.long	56
	.long	204
	.long	700
	.long	707
	.long	151
	.long	457
	.long	449
	.long	797
	.long	195
	.long	791
	.long	558
	.long	945
	.long	679
	.long	297
	.long	59
	.long	87
	.long	824
	.long	713
	.long	663
	.long	412
	.long	693
	.long	342
	.long	606
	.long	134
	.long	108
	.long	571
	.long	364
	.long	631
	.long	212
	.long	174
	.long	643
	.long	304
	.long	329
	.long	343
	.long	97
	.long	430
	.long	751
	.long	497
	.long	314
	.long	983
	.long	374
	.long	822
	.long	928
	.long	140
	.long	206
	.long	73
	.long	263
	.long	980
	.long	736
	.long	876
	.long	478
	.long	430
	.long	305
	.long	170
	.long	514
	.long	364
	.long	692
	.long	829
	.long	82
	.long	855
	.long	953
	.long	676
	.long	246
	.long	369
	.long	970
	.long	294
	.long	750
	.long	807
	.long	827
	.long	150
	.long	790
	.long	288
	.long	923
	.long	804
	.long	378
	.long	215
	.long	828
	.long	592
	.long	281
	.long	565
	.long	555
	.long	710
	.long	82
	.long	896
	.long	831
	.long	547
	.long	261
	.long	524
	.long	462
	.long	293
	.long	465
	.long	502
	.long	56
	.long	661
	.long	821
	.long	976
	.long	991
	.long	658
	.long	869
	.long	905
	.long	758
	.long	745
	.long	193
	.long	768
	.long	550
	.long	608
	.long	933
	.long	378
	.long	286
	.long	215
	.long	979
	.long	792
	.long	961
	.long	61
	.long	688
	.long	793
	.long	644
	.long	986
	.long	403
	.long	106
	.long	366
	.long	905
	.long	644
	.long	372
	.long	567
	.long	466
	.long	434
	.long	645
	.long	210
	.long	389
	.long	550
	.long	919
	.long	135
	.long	780
	.long	773
	.long	635
	.long	389
	.long	707
	.long	100
	.long	626
	.long	958
	.long	165
	.long	504
	.long	920
	.long	176
	.long	193
	.long	713
	.long	857
	.long	265
	.long	203
	.long	50
	.long	668
	.long	108
	.long	645
	.long	990
	.long	626
	.long	197
	.long	510
	.long	357
	.long	358
	.long	850
	.long	858
	.long	364
	.long	936
	.long	638
	.globl	BZ2_crc32Table
	.align 32
	.type	BZ2_crc32Table, @object
	.size	BZ2_crc32Table, 1024
BZ2_crc32Table:
	.long	0
	.long	79764919
	.long	159529838
	.long	222504665
	.long	319059676
	.long	398814059
	.long	445009330
	.long	507990021
	.long	638119352
	.long	583659535
	.long	797628118
	.long	726387553
	.long	890018660
	.long	835552979
	.long	1015980042
	.long	944750013
	.long	1276238704
	.long	1221641927
	.long	1167319070
	.long	1095957929
	.long	1595256236
	.long	1540665371
	.long	1452775106
	.long	1381403509
	.long	1780037320
	.long	1859660671
	.long	1671105958
	.long	1733955601
	.long	2031960084
	.long	2111593891
	.long	1889500026
	.long	1952343757
	.long	-1742489888
	.long	-1662866601
	.long	-1851683442
	.long	-1788833735
	.long	-1960329156
	.long	-1880695413
	.long	-2103051438
	.long	-2040207643
	.long	-1104454824
	.long	-1159051537
	.long	-1213636554
	.long	-1284997759
	.long	-1389417084
	.long	-1444007885
	.long	-1532160278
	.long	-1603531939
	.long	-734892656
	.long	-789352409
	.long	-575645954
	.long	-646886583
	.long	-952755380
	.long	-1007220997
	.long	-827056094
	.long	-898286187
	.long	-231047128
	.long	-151282273
	.long	-71779514
	.long	-8804623
	.long	-515967244
	.long	-436212925
	.long	-390279782
	.long	-327299027
	.long	881225847
	.long	809987520
	.long	1023691545
	.long	969234094
	.long	662832811
	.long	591600412
	.long	771767749
	.long	717299826
	.long	311336399
	.long	374308984
	.long	453813921
	.long	533576470
	.long	25881363
	.long	88864420
	.long	134795389
	.long	214552010
	.long	2023205639
	.long	2086057648
	.long	1897238633
	.long	1976864222
	.long	1804852699
	.long	1867694188
	.long	1645340341
	.long	1724971778
	.long	1587496639
	.long	1516133128
	.long	1461550545
	.long	1406951526
	.long	1302016099
	.long	1230646740
	.long	1142491917
	.long	1087903418
	.long	-1398421865
	.long	-1469785312
	.long	-1524105735
	.long	-1578704818
	.long	-1079922613
	.long	-1151291908
	.long	-1239184603
	.long	-1293773166
	.long	-1968362705
	.long	-1905510760
	.long	-2094067647
	.long	-2014441994
	.long	-1716953613
	.long	-1654112188
	.long	-1876203875
	.long	-1796572374
	.long	-525066777
	.long	-462094256
	.long	-382327159
	.long	-302564546
	.long	-206542021
	.long	-143559028
	.long	-97365931
	.long	-17609246
	.long	-960696225
	.long	-1031934488
	.long	-817968335
	.long	-872425850
	.long	-709327229
	.long	-780559564
	.long	-600130067
	.long	-654598054
	.long	1762451694
	.long	1842216281
	.long	1619975040
	.long	1682949687
	.long	2047383090
	.long	2127137669
	.long	1938468188
	.long	2001449195
	.long	1325665622
	.long	1271206113
	.long	1183200824
	.long	1111960463
	.long	1543535498
	.long	1489069629
	.long	1434599652
	.long	1363369299
	.long	622672798
	.long	568075817
	.long	748617968
	.long	677256519
	.long	907627842
	.long	853037301
	.long	1067152940
	.long	995781531
	.long	51762726
	.long	131386257
	.long	177728840
	.long	240578815
	.long	269590778
	.long	349224269
	.long	429104020
	.long	491947555
	.long	-248556018
	.long	-168932423
	.long	-122852000
	.long	-60002089
	.long	-500490030
	.long	-420856475
	.long	-341238852
	.long	-278395381
	.long	-685261898
	.long	-739858943
	.long	-559578920
	.long	-630940305
	.long	-1004286614
	.long	-1058877219
	.long	-845023740
	.long	-916395085
	.long	-1119974018
	.long	-1174433591
	.long	-1262701040
	.long	-1333941337
	.long	-1371866206
	.long	-1426332139
	.long	-1481064244
	.long	-1552294533
	.long	-1690935098
	.long	-1611170447
	.long	-1833673816
	.long	-1770699233
	.long	-2009983462
	.long	-1930228819
	.long	-2119160460
	.long	-2056179517
	.long	1569362073
	.long	1498123566
	.long	1409854455
	.long	1355396672
	.long	1317987909
	.long	1246755826
	.long	1192025387
	.long	1137557660
	.long	2072149281
	.long	2135122070
	.long	1912620623
	.long	1992383480
	.long	1753615357
	.long	1816598090
	.long	1627664531
	.long	1707420964
	.long	295390185
	.long	358241886
	.long	404320391
	.long	483945776
	.long	43990325
	.long	106832002
	.long	186451547
	.long	266083308
	.long	932423249
	.long	861060070
	.long	1041341759
	.long	986742920
	.long	613929101
	.long	542559546
	.long	756411363
	.long	701822548
	.long	-978770311
	.long	-1050133554
	.long	-869589737
	.long	-924188512
	.long	-693284699
	.long	-764654318
	.long	-550540341
	.long	-605129092
	.long	-475935807
	.long	-413084042
	.long	-366743377
	.long	-287118056
	.long	-257573603
	.long	-194731862
	.long	-114850189
	.long	-35218492
	.long	-1984365303
	.long	-1921392450
	.long	-2143631769
	.long	-2063868976
	.long	-1698919467
	.long	-1635936670
	.long	-1824608069
	.long	-1744851700
	.long	-1347415887
	.long	-1418654458
	.long	-1506661409
	.long	-1561119128
	.long	-1129027987
	.long	-1200260134
	.long	-1254728445
	.long	-1309196108
	.section	.rodata
	.align 32
	.type	incs, @object
	.size	incs, 56
incs:
	.long	1
	.long	4
	.long	13
	.long	40
	.long	121
	.long	364
	.long	1093
	.long	3280
	.long	9841
	.long	29524
	.long	88573
	.long	265720
	.long	797161
	.long	2391484
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC35:
	.long	0
	.long	1079574528
	.align 8
.LC49:
	.long	0
	.long	1072693248
	.align 8
.LC51:
	.long	0
	.long	1081081856
	.align 8
.LC52:
	.long	0
	.long	1075838976
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
