1.使用 `git log --oneline 09cae7507d9e88f2b05cf3a9404bf181e65ccbac..HEAD --grep="riscv\|RISC-V\|vect\|VECT" --pretty="%H %s" --reverse > master-all-riscv+vect-commit` 保存 port riscv 的 commit hash:09cae7507d9e88f2b05cf3a9404bf181e65ccbac 到当前 commit 所有包含 riscv、RISC-V 、vect 、VECT关键词的 commit hash 和 commit tittle 倒序保存到我取名为 master-all-riscv+vect-commit 的文件。   
2.使用上述命令切换到想要进行 git cherry-pick 的 release 进行相同操作，保存到另一个文件。   
3.使用 `sed -i '/LoongArch\|s390x\|s390\|x86\|AArch64\|aarch64\|Aarch64\|RS6000\|Darwin\|arm\|i386\|rs6000\|amdcn\|x86_64\|IBM Z\|AVX512FP16\|390\|3900\|ARM\|Arm\|amdgcn\|NDS32\|MIPS\|nvptx\|gccrs/d' *-all-riscv+vect-commit` 。因为保存 commit history 的文件名都是 -all-riscv+vect-commit。如果用了别的名字记得改。    
4.将两个文件的 commit tittle 分别查重一次进行标记。此处我写的 shell 脚本不是很工作，所以掏出了 excel 丢人。   
5.将master文件中与指定版本重复部分删除。   
6.把剩余 commit hash 和 commit tittle 中间空一个拼入 commit-to-pick 文件。   
7.使用 easy-cherry-pick.sh 进行自动 cherry-pick。 遇到冲突处理完成继续运行。如果处理失败需要手动重新 pick，直接运行脚本会跳过该 commit 。
