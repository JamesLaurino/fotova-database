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
                    usernameVariable: 'DB_USER',
                    passwordVariable: 'DB_PASSAWORD'
                )]) {
                    sh """
                    mvn liquibase:dropAll \
                    -Dliquibase.url=jdbc:mysql://localhost:3306/fotova_db_dev \
                    -Dliquibase.username=$DB_USER \
                    -Dliquibase.password=$DB_PASSAWORD
                    """
                }
            }
        }

        stage('Liquibase Update') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'mysql-fotova',
                    usernameVariable: 'DB_USER',
                    passwordVariable: 'DB_PASSAWORD'
                )]) {
                    sh """
                    mvn liquibase:update \
                    -Dliquibase.url=jdbc:mysql://localhost:3306/fotova_db_dev \
                    -Dliquibase.username=$DB_USER \
                    -Dliquibase.password=$DB_PASSAWORD \
                    -Dliquibase.changeLogFile=src/main/resources/db/changelog-master.xml
                    """
                }
            }
        }
    }
}