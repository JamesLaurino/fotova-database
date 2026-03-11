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
                sh 'mvn clean install'
            }
        }

        stage('Liquibase DropAll') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'mysql-fotova',
                    usernameVariable: 'DB_USERNAME',
                    passwordVariable: 'DB_PASSWORD'
                )]) {
                    sh """
                    mvn liquibase:dropAll \
                    -Dliquibase.url=jdbc:mysql://10.0.0.1:3306/fotova_db_dev \
                    -Dliquibase.username=$DB_USERNAME \
                    -Dliquibase.password=$DB_PASSWORD
                    """
                }
            }
        }

        stage('Liquibase Update') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'mysql-fotova',
                    usernameVariable: 'DB_USERNAME',
                    passwordVariable: 'DB_PASSWORD'
                )]) {
                    sh """
                    mvn liquibase:update \
                    -Dliquibase.url=jdbc:mysql://10.0.0.1:3306/fotova_db_dev \
                    -Dliquibase.username=$DB_USERNAME \
                    -Dliquibase.password=$DB_PASSWORD \
                    -Dliquibase.changeLogFile=src/main/resources/db/changelog-master.xml
                    """
                }
            }
        }
    }
}