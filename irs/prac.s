	.file	"prac.ll"
	.text
	.globl	add                             # -- Begin function add
	.p2align	4
	.type	add,@function
add:                                    # @add
	.cfi_startproc
# %bb.0:                                # %a
                                        # kill: def $esi killed $esi def $rsi
                                        # kill: def $edi killed $edi def $rdi
	leal	(%rdi,%rsi), %eax
	retq
.Lfunc_end0:
	.size	add, .Lfunc_end0-add
	.cfi_endproc
                                        # -- End function
	.globl	sub                             # -- Begin function sub
	.p2align	4
	.type	sub,@function
sub:                                    # @sub
	.cfi_startproc
# %bb.0:                                # %a
	movl	%edi, %eax
	subl	%esi, %eax
	retq
.Lfunc_end1:
	.size	sub, .Lfunc_end1-sub
	.cfi_endproc
                                        # -- End function
	.globl	mul                             # -- Begin function mul
	.p2align	4
	.type	mul,@function
mul:                                    # @mul
	.cfi_startproc
# %bb.0:                                # %a
	movl	%edi, %eax
	imull	%esi, %eax
	retq
.Lfunc_end2:
	.size	mul, .Lfunc_end2-mul
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %a
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	$.Ls, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$10, %edi
	movl	$5, %esi
	callq	add@PLT
	movl	%eax, %ebx
	movl	$10, %edi
	movl	$5, %esi
	callq	sub@PLT
	movl	%eax, %ebp
	movl	$10, %edi
	movl	$5, %esi
	callq	mul@PLT
	addl	%ebx, %ebp
	addl	%ebp, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc
                                        # -- End function
	.type	.Ls,@object                     # @s
	.section	.rodata.str1.1,"aMS",@progbits,1
.Ls:
	.asciz	"Hello World\n"
	.size	.Ls, 13

	.section	".note.GNU-stack","",@progbits
