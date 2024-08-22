# Script_Backup_Firebird
 
O script é responsável por fazer backup de todos os bancos de dados localizados no diretório /opt/firebird/data/. Ele percorre cada subdiretório dentro de /opt/firebird/data/, identifica o nome de cada pasta e realiza o backup de todos os arquivos .fdb contidos em cada uma delas.

No Cron, o usuário precisa fornecer apenas três parâmetros no comando da crontab: nome de usuário, senha e o número de dias que o backup será mantido.

Exemplo de uso:

0 1 * * * /root/backup_firebird.sh USUARIO SENHA DIAS


Instruções:

1 - Navegue até o diretório /root e crie o arquivo backup_firebird.sh contendo o script de backup.

2 - Em seguida, crie o arquivo de log para os backups. Para isso, abra o Web SSH e execute os comandos abaixo:

touch /opt/firebird/logs/backup_firebird.log

chmod 755 /root/backup_firebird.sh

3 - Agora, configure o crontab do Firebird para agendar a rotina de backups. Execute o comando:

crontab -e

4 - No editor do crontab, insira a seguinte linha, substituindo USUARIO, SENHA e DIAS pelos valores adequados:

0 1 * * * /root/backup_firebird.sh USUARIO SENHA DIAS

![image](https://github.com/user-attachments/assets/bb861f51-295d-4186-aa7a-566b3dab4785)

![image](https://github.com/user-attachments/assets/c5f7b381-90e9-430c-92d1-03e71ccdbbc0)


