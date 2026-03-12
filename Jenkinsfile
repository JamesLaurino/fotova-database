pipeline {

    agent any

    tools {
        maven 'Maven-3.9'
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

        stage('Liquibase Migration') {

            steps {

                withCredentials([

                    string(credentialsId: 'DB_HOST', variable: 'DB_HOST'),
                    string(credentialsId: 'DB_PORT', variable: 'DB_PORT'),
                    string(credentialsId: 'DB_NAME', variable: 'DB_NAME'),
                    string(credentialsId: 'DB_USERNAME', variable: 'DB_USERNAME'),
                    string(credentialsId: 'DB_PASSWORD', variable: 'DB_PASSWORD')

                ]) {

                    sh """
                    mvn liquibase:update \
                      -Dliquibase.url=jdbc:mysql://$DB_HOST:$DB_PORT/$DB_NAME \
                      -Dliquibase.username=$DB_USERNAME \
                      -Dliquibase.password=$DB_PASSWORD \
                      -Dliquibase.changeLogFile=src/main/resources/db/changelog-master.xml
                    """

                }
            }
        }
    }
}