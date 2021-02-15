
NAME		=	minishell

HEADER		=	./includes/

LIBFT		=	libft/libft.a

CC			=	gcc

FLAGS		=	-Werror -Wall -Wextra -I $(HEADER)

SRCS		=	./sources/before_lexxer.c \
				./sources/before_redirs_utils.c \
				./sources/before_redirs.c \
				./sources/cmd_cd.c \
				./sources/cmd_echo.c \
				./sources/cmd_env.c \
				./sources/cmd_execve_1.c \
				./sources/cmd_execve_errors.c \
				./sources/cmd_execve.c \
				./sources/cmd_exit.c \
				./sources/cmd_export_1.c \
				./sources/cmd_export.c \
				./sources/cmd_pwd.c \
				./sources/cmd_unset_1.c \
				./sources/cmd_unset.c\
				./sources/command_output.c \
				./sources/lexxer_utils.c \
				./sources/lexxer.c \
				./sources/main.c \
				./sources/minishell_utils_1.c \
				./sources/minishell_utils.c \
				./sources/parse_utils.c \
				./sources/parse.c \
				./sources/parser_utils.c \
				./sources/parser.c \
				./sources/pipe.c \
				./sources/proc_type_red.c \
				./sources/redirects_errors.c \
				./sources/redirects.c \
				./sources/redirs.c \
				./sources/save_home_dir.c \
				./sources/sort_dollar_utils.c \
				./sources/sort_dollar.c \
				./sources/sort_dquote.c \
				./sources/tokens.c	\
				./sources/signals.c \
				./sources/check_error_syntax.c \

OBJS		=	$(SRCS:%.c=%.o)

all: $(NAME)

$(NAME): $(OBJS) $(LIBFT) $(HEADER)
	@$(CC) $(FLAGS) $(OBJS) -o $(NAME) $(LIBFT)

$(LIBFT):
	make -C ./libft

%.o: %.c
	gcc $(FLAGS) -c $< -o $@

re	:fclean all

norm:
	norminette ./sources/*.c ./includes/*.h ./libft/*.c ./libft/*.h

clean:
	@rm -rf $(OBJS)
	@make clean -C ./libft

fclean: clean
	@rm $(NAME)
	@make fclean -C ./libft

.PHONY: all clean fclean re
