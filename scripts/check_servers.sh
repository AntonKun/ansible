#!/bin/bash

# Групи серверів
solrGlobal=(
	"sg01.informio.biz"
	"sg02.informio.biz"
	"sg03.informio.biz"
	"sg04.informio.biz"
	"sg05.informio.biz"	
	"sg06.informio.biz"	
	"sg07.informio.biz"	
	"sg08.informio.biz"
	"sg09.informio.biz"
	"sg10.informio.biz"
	"sg11.informio.biz"
	"sg12.informio.biz"
	"sg13.informio.biz"
	"sg14.informio.biz"	
	"sp01.informio.biz"	
	"sp02.informio.biz"
)

solrPrivte=(
	"sw01.informio.biz"
	"sw02.informio.biz"
	"sw03.informio.biz"
	"sw04.informio.biz"
	"sw05.informio.biz"
	"sw06.informio.biz"
	"sw07.informio.biz"
	"sw08.informio.biz"
	"sw09.informio.biz"
	"sw10.informio.biz"
	"sw11.informio.biz"
	"sw12.informio.biz"
)

kindexer=(
	"core001.databridge.semanticforce.net"
	"core002.databridge.semanticforce.net"
	"core003.databridge.semanticforce.net"
	"core008.kindexer.com"
	"core030.kindexer.com"
	"core031.kindexer.com"
	"core032.kindexer.com"
	"core033.kindexer.com"
	"core038.kindexer.com"
	"core039.kindexer.com"
	"core034.kindexer.com"
	"core035.kindexer.com"
	"core036.kindexer.com"
	"core037.kindexer.com"
	"core040.kindexer.com"
	"core041.kindexer.com"
	"core042.kindexer.com"
	"core043.kindexer.com"
)

# Кольори
GREEN='\033[0;32m'  # Зелений
RED='\033[0;31m'    # Червоний
NC='\033[0m'        # Повернення до нормального кольору

# Функція для перевірки доступності сервера
check_server() {
    server=$1
    ping -c 1 $server > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Сервер $server в нормі${NC}"
    else
        echo -e "${RED}Сервер $server недоступний${NC}"
    fi
}

# Функція для перевірки групи серверів
check_group() {
    group=("$@")
    echo "Перевірка групи серверів:"
    for server in "${group[@]}"
    do
        check_server $server
    done
    echo "------------------------"
}

# Вибір групи серверів для перевірки
select_group() {
    echo "Доступні групи серверів:"
    echo "1. Solr Global (sg/sp servers)"
    echo "2. Solr Privte (sw servers)"
	echo "3. Kindexer & DataBridge (core servers)"
    echo "4. Всі сервери"
	echo ""
    read -p "Виберіть номер групи для перевірки: " choice
    echo "------------------------"
    case $choice in
        1)
            check_group "${solrGlobal[@]}"
            ;;
        2)
            check_group "${solrPrivte[@]}"
            ;;
		3)
            check_group "${kindexer[@]}"
            ;;
        4)
            check_group "${solrGlobal[@]}" "${solrPrivte[@]}" "${kindexer[@]}"
            ;;
        *)
            echo "Неправильний вибір"
            ;;
    esac
}

# Виклик функції для вибору групи серверів
select_group
