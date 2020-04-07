cd ${JENKINS_HOME}/${JOB_NAME}_helm_charts/
helm package ${JOB_NAME}

helm list | awk '{print $1}' | grep ${JOB_NAME}

if [ $? -eq 0 ]; then
helm uninstall {JOB_NAME}
fi

helm install {JOB_NAME} {JOB_NAME}-0.1.0.tgz
