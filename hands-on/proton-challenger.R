#title: "My Solution for Proton Challenger"
#subtitle: "Hands-on Curso MBA USP ESALQ"
#author: "Erick Aparecido da Silva"


proton()

# PROBLEM 1

data("employees")

employees[which(employees$name == 'John' & employees$surname == 'Insecure'), ]

proton(action = 'login', login = 'johnins')

# PROBLEM 2

data("top1000passwords")

for(i in 1:length(top1000passwords)){
  proton(action = 'login', 
         login = 'johnins', 
         password = top1000passwords[i])
}

# Find the passwd

for(i in 1:length(top1000passwords)){
  isOK <- proton(action = 'login', 
                 login = 'johnins', 
                 password = top1000passwords[i])
  
  if(isOK == 'Success! User is logged in!'){
    print(top1000passwords[i])
    break()
  }
}

# PROBLEM 3

data('logs')
names(logs)
head(logs)

employees[which(employees$surname == 'Pietraszko'), ]

logs[which(logs$login == 'slap'), ]

answers_R <- logs[which(logs$login == 'slap'), ]

hosts <- unique(answers_R)
hosts

hosts <- as.character(unique(answers_R$host))
hosts

# We can try one by one, or ry it using loop
for(h in hosts){
  proton(action = "server", host=h)
}

for(h in hosts){
  print(nrow(answers_R[which(answers_R$host == h), ]))
}

print(nrow(answers_R[which(answers_R$host == "194.29.178.155"), ]))


# PROBLEM 4

data("bash_history")
names(bash_history)

bash_history

unique(bash_history)

unique_commands <- unique(bash_history)

commands_without_spaces <- gsub(x = unique_commands,
                                pattern = " ",
                                replacement = NA)

commands_without_spaces

commands_without_spaces[which(is.na(commands_without_spaces) != TRUE)]

proton(action = 'login', login = 'slap', password = 'DHbb7QXppuHnaXGN')