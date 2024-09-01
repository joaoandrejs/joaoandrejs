# Se vem do bash, pode ter de alterar o seu $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Caminho para a sua instalação do Oh My Zsh.
export ZSH="$HOME/.oh-my-zsh”

# Defina o nome do tema a carregar --- se definido como “random”, ele irá
# carregará um tema aleatório cada vez que o Oh My Zsh for carregado, nesse caso,
# para saber qual tema específico foi carregado, execute: echo $RANDOM_THEME
# Veja https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="fox”
# Meus temas favoritos:
# fino | agnoster | fox | intheloop

# agnoster lista de temas para escolher ao carregar aleatoriamente
# Definir esta variável quando ZSH_THEME=random fará com que o zsh carregue
# um tema a partir desta variável em vez de procurar em $ZSH/themes/
# Se definida para uma matriz vazia, esta variável não terá efeito.
# ZSH_THEME_RANDOM_CANDIDATES=( “fino” “agnoster” “fox” “intheloop” )

# Descomente a seguinte linha para utilizar o preenchimento sensível a maiúsculas e minúsculas.
# CASE_SENSITIVE="true”

# Descomente a seguinte linha para utilizar a conclusão não sensível a hífen.
# A conclusão sensível a maiúsculas e minúsculas deve estar desactivada. _ e - serão intercambiáveis.
# HYPHEN_INSENSITIVE="true”

# Descomente uma das seguintes linhas para alterar o comportamento de atualização automática
# zstyle ':omz:update' mode disabled # desativar actualizações automáticas
# zstyle ':omz:update' mode auto # actualiza automaticamente sem pedir
# zstyle ':omz:update' mode reminder # lembra-me de atualizar quando for altura

# Descomente a seguinte linha para alterar a frequência da atualização automática (em dias).
# zstyle ':omz:update' frequency 13

# Descomente a seguinte linha se a colagem de URLs e de outro texto estiver a fazer confusão.
# DISABLE_MAGIC_FUNCTIONS="true”

# Descomente a seguinte linha para desativar as cores no ls.
# DISABLE_LS_COLORS="true”

# Descomente a seguinte linha para desativar a definição automática do título do terminal.
# DISABLE_AUTO_TITLE="true”

# Descomente a seguinte linha para ativar a auto-correção de comandos.
# ENABLE_CORRECTION="true”

# Descomente a seguinte linha para mostrar pontos vermelhos enquanto espera pela conclusão.
# Também pode definir esta linha como outra string para que seja mostrada em vez dos pontos vermelhos predefinidos.
# Por exemplo, COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f”
# Cuidado: esta configuração pode causar problemas com prompts de múltiplas linhas no zsh < 5.7.1 (veja #5765)
# COMPLETION_WAITING_DOTS="true”

# Descomente a seguinte linha se quiser desativar a marcação de ficheiros não rastreados
# no VCS como sujos. Isto torna a verificação do estado do repositório para grandes repositórios
# muito, muito mais rápido.
# DISABLE_UNTRACKED_FILES_DIRTY="true”

# Descomente a seguinte linha se quiser alterar o tempo de execução do comando
# do comando mostrado na saída do comando history.
# Pode definir um dos três formatos opcionais:
# “mm/dd/yyyy”|“dd.mm.yyyy”|"yyyy-mm-dd”
# ou definir um formato personalizado usando as especificações de formato da função strftime,
# veja 'man strftime' para detalhes.
# HIST_STAMPS="dd/mm/yyyy”

# Gostaria de usar outra pasta personalizada para além de $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Que plugins gostaria de carregar?
# Os plugins padrão podem ser encontrados em $ZSH/plugins/
# Os plugins personalizados podem ser adicionados a $ZSH_CUSTOM/plugins/
# Exemplo de formato: plugins=(rails git textmate ruby lighthouse)
# Adicione sabiamente, pois demasiados plugins tornam o arranque da shell mais lento.

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

fonte $ZSH/oh-my-zsh.sh

# Configuração do utilizador

# export MANPATH="/usr/local/man:$MANPATH”

# Pode precisar de definir manualmente o seu ambiente linguístico
# export LANG=pt_US.UTF-8

# Editor preferido para sessões locais e remotas
# if [[ -n $SSH_CONNECTION ]]; then
# export EDITOR='vim'
# else
# export EDITOR='mvim'
# fi

# Sinalizadores de compilação
# export ARCHFLAGS="-arch x86_64”

# Define aliases pessoais, sobrescrevendo aqueles fornecidos pelas bibliotecas Oh My Zsh,
# plugins e temas. Os aliases podem ser colocados aqui, embora os utilizadores do Oh My Zsh
# os utilizadores são encorajados a definir aliases dentro de um ficheiro de nível superior em
# na pasta $ZSH_CUSTOM, com extensão .zsh. Exemplos:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# Para uma lista completa de aliases ativos, execute `alias`.

# Minhas alias para facilitar a vida
alias zshconfig="nano ~/.zshrc”
#alias ohmyzsh="nano ~/.oh-my-zsh”
alias pgadmin='fonte ~/pgadmin4/bin/activate && pgadmin4'
alias reload='fonte ~/.zshrc'

# pnpm
export PNPM_HOME="/home/joao/.local/share/pnpm”
case “:$PATH:” in
  *":$PNPM_HOME: ”*) ;;
  *) export PATH=“$PNPM_HOME:$PATH” ;;
esac
# pnpm end

# Deno
fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit -u
# Deno end

# Função para mover o cursor para a linha inferior no início do terminal
function move-cursor-to-bottom {
    echo -ne '\e[999B'
}

# Vincular a função acima ao evento de inicialização da linha de comando
precmd_functions+=(move-cursor-to-bottom)

# Roda um script assim que o terminal inicia
~/scripts/run.sh
