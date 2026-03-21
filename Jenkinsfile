pipeline {

    agent any

    tools {
        maven 'Maven-3.9'
    }

    parameters {
        choice(
            name: 'LIQUIBASE_TARGET',
            choices: ['tables', 'data'],
            description: 'Choisir le changelog Liquibase à lancer'
        )
    }

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/JamesLaurino/fotova-database.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn -B clean install'
            }
        }

        stage('Liquibase Update') {
            steps {
                script {
                    def changelogFile = ''

                    if (params.LIQUIBASE_TARGET == 'tables') {
                        changelogFile = 'src/main/resources/db/changelog-master-create.xml'
                    } else if (params.LIQUIBASE_TARGET == 'data') {
                        changelogFile = 'src/main/resources/db/changelog-master.xml'
                    }

                    withCredentials([
                        string(credentialsId: 'DB_HOST', variable: 'DB_HOST'),
                        string(credentialsId: 'DB_NAME', variable: 'DB_NAME'),
                        string(credentialsId: 'DB_USERNAME', variable: 'DB_USERNAME'),
                        string(credentialsId: 'DB_PASSWORD', variable: 'DB_PASSWORD')
                    ]) {
                        sh """
                        mvn liquibase:update \
                          -Dliquibase.url=jdbc:mysql://$DB_HOST:3306/$DB_NAME \
                          -Dliquibase.username=$DB_USERNAME \
                          -Dliquibase.password=$DB_PASSWORD \
                          -Dliquibase.changeLogFile=${changelogFile}
                        """
                    }
                }
            }
        }
    }
}