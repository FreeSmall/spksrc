PYTHON_DIR="/usr/local/python"
GIT_DIR="/usr/local/git"
GIT="${GIT_DIR}/bin/git"
PATH="${SYNOPKG_PKGDEST}/bin:${SYNOPKG_PKGDEST}/env/bin:${PYTHON_DIR}/bin:${GIT_DIR}/bin:${PATH}"
PYTHON="${SYNOPKG_PKGDEST}/env/bin/python"
VIRTUALENV="${PYTHON_DIR}/bin/virtualenv"
HEADPHONES="${SYNOPKG_PKGVAR}/Headphones/Headphones.py"
CFG_FILE="${SYNOPKG_PKGVAR}/config.ini"

SERVICE_COMMAND="${PYTHON} ${HEADPHONES} --daemon --pidfile ${PID_FILE} --config ${CFG_FILE} --datadir ${SYNOPKG_PKGVAR}/"

GROUP="sc-download"
LEGACY_GROUP="sc-media"


service_preinst ()
{
    # Check fork
    if [ "${SYNOPKG_PKG_STATUS}" == "INSTALL" ] && ! ${GIT} ls-remote --heads --exit-code ${wizard_fork_url:=git://github.com/rembo10/headphones.git} ${wizard_fork_branch:=master} > /dev/null 2>&1; then
        echo "Incorrect fork"
        exit 1
    fi
}

service_postinst ()
{
    # Create a Python virtualenv
    ${VIRTUALENV} --system-site-packages ${SYNOPKG_PKGDEST}/env >> ${INST_LOG} 2>&1

    if [ "${SYNOPKG_PKG_STATUS}" == "INSTALL" ]; then
        # Clone the repository
        ${GIT} clone -q -b ${wizard_fork_branch:=master} ${wizard_fork_url:=git://github.com/rembo10/headphones.git} ${SYNOPKG_PKGVAR}/Headphones
    fi

    # If nessecary, add user also to the old group
    syno_user_add_to_legacy_group "${EFF_USER}" "${USER}" "${LEGACY_GROUP}"

    # Remove legacy user
    # Commands of busybox from spk/python
    delgroup "${USER}" "users" >> ${INST_LOG}
    deluser "${USER}" >> ${INST_LOG}
}
