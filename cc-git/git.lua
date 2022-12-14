args = { ... }

if table.getn(args) < 1 then
    print("Missing argument, try git help")
    return -1
end

command = args[1]

function git_help()
    print("***** cc-git help page *****")
    print()
    print("git help - display the help page")
    print("git info - display info about git repo")
    print("git repo <repo_name> <user_name> - set active repo")
    print("git pull <branch> <path> <file_name> - pull file")
    print()
    print("***** ---------------- *****")
end

function git_info()
    file = fs.open("/git/git_repo", "r")
    repo = file.readLine()
    file.close()
    print("Repo set to "..repo)
end

function set_repo(repo_name, user_name)
    file = fs.open("/git/git_repo", "w")
    file.writeLine("https://raw.githubusercontent.com/"..user_name.."/"..repo_name)
    file.close()
    print("Repo set to "..user_name.."/"..repo_name)
end

function git_pull(branch, path, file_name)
    repo_f = fs.open("/git/git_repo", "r")
    path = repo_f.readLine().."/"..branch.."/"..path.."/"..file_name
    repo_f.close()
    git_t = http.get(path).readAll()
    dir = "/"..shell.dir().."/"
    if not fs.exists(dir..file_name) then
        fs.open(dir..file_name, "w").close()
    end
    file_f = fs.open(dir..file_name, "r")
    file_t = file_f.readAll()
    if git_t == file_t then
        print("No changes detected, exiting")
        file_f.close()
        return -1
    end
    file_f.close()
    file_f = fs.open(dir..file_name, "w")
    file_f.write(git_t)
    file_f.close()
    print(file_name.." pulled from "..path)
end

function git_err()
    print("Invalid format. Try git help")
    return -1
end

if command == "help" then
    git_help()
elseif command == "info" then
    git_info()
elseif command == "repo" then
    if table.getn(args) < 3 then
        return git_err()
    end
    set_repo(args[2], args[3])
elseif command == "pull" then
    if table.getn(args) < 4 then
        return git_err()
    end
    git_pull(args[2], args[3], args[4])
else
    print("Unknown argument, try git help")
end
