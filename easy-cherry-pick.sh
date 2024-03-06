#!/bin/bash
while IFS= read -r line
do
    commit_hash=$(echo "$line" | cut -d ' ' -f 1)
    commit_title=$(echo "$line" | cut -d ' ' -f 2-)
    git cherry-pick $commit_hash
if [ $? -eq 0 ]; then
    echo "Cherry-picked commit: $commit_hash - \"$commit_title\"successfully."
    # 从 commit-to-pick 文件中删除已成功 cherry-pick 的 commit
    sed -i "1d" vector-plus-to-pick
else
    echo "There are conflicts for commit: $commit_hash - \"$commit_title\". Launching VSCode to resolve conflicts..."
    sleep 2
    # code --wait
    echo "Please resolve the conflicts for commit: $commit_hash- \"$commit_title\", save, and close VSCode. Then run 'git cherry-pick --continue' in the terminal."
    sed -i "1d" vector-plus-to-pick
    exit 1
fi
done < vector-plus-to-pick