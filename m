Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00C70E1E62
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 16:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405081AbfJWOkJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 10:40:09 -0400
Received: from mga12.intel.com ([192.55.52.136]:39183 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404839AbfJWOkJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Oct 2019 10:40:09 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 07:40:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,221,1569308400"; 
   d="scan'208";a="209934420"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 23 Oct 2019 07:40:06 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 15/18] usb: typec: ucsi: Remove struct ucsi_control
Date:   Wed, 23 Oct 2019 17:39:36 +0300
Message-Id: <20191023143939.39668-16-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023143939.39668-1-heikki.krogerus@linux.intel.com>
References: <20191023143939.39668-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

That data structure was used for constructing the commands
before executing them, but it was never really useful. Using
the structure just complicated the driver. The commands are
64-bit wide, so it is enough to simply fill a u64 variable.
No data structures needed.

This simplifies the driver considerable and makes it much
easier to for example add support for big endian systems
later on.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/displayport.c |  16 +-
 drivers/usb/typec/ucsi/trace.c       |  11 --
 drivers/usb/typec/ucsi/trace.h       |  50 +-----
 drivers/usb/typec/ucsi/ucsi.c        | 107 +++++++------
 drivers/usb/typec/ucsi/ucsi.h        | 231 +++++----------------------
 5 files changed, 115 insertions(+), 300 deletions(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 47424935bc81..d4d5189edfb8 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -49,7 +49,7 @@ static int ucsi_displayport_enter(struct typec_altmode *alt)
 {
 	struct ucsi_dp *dp = typec_altmode_get_drvdata(alt);
 	struct ucsi *ucsi = dp->con->ucsi;
-	struct ucsi_control ctrl;
+	u64 command;
 	u8 cur = 0;
 	int ret;
 
@@ -64,7 +64,7 @@ static int ucsi_displayport_enter(struct typec_altmode *alt)
 		goto err_unlock;
 	}
 
-	UCSI_CMD_GET_CURRENT_CAM(ctrl, dp->con->num);
+	command = UCSI_GET_CURRENT_CAM | UCSI_CONNECTOR_NUMBER(dp->con->num);
 	ret = ucsi_send_command(ucsi, command, &cur, sizeof(cur));
 	if (ret < 0) {
 		if (ucsi->version > 0x0100)
@@ -101,7 +101,7 @@ static int ucsi_displayport_enter(struct typec_altmode *alt)
 static int ucsi_displayport_exit(struct typec_altmode *alt)
 {
 	struct ucsi_dp *dp = typec_altmode_get_drvdata(alt);
-	struct ucsi_control ctrl;
+	u64 command;
 	int ret = 0;
 
 	mutex_lock(&dp->con->lock);
@@ -115,8 +115,8 @@ static int ucsi_displayport_exit(struct typec_altmode *alt)
 		goto out_unlock;
 	}
 
-	ctrl.raw_cmd = UCSI_CMD_SET_NEW_CAM(dp->con->num, 0, dp->offset, 0);
-	ret = ucsi_send_command(dp->con->ucsi, &ctrl, NULL, 0);
+	command = UCSI_CMD_SET_NEW_CAM(dp->con->num, 0, dp->offset, 0);
+	ret = ucsi_send_command(dp->con->ucsi, command, NULL, 0);
 	if (ret < 0)
 		goto out_unlock;
 
@@ -170,14 +170,14 @@ static int ucsi_displayport_status_update(struct ucsi_dp *dp)
 static int ucsi_displayport_configure(struct ucsi_dp *dp)
 {
 	u32 pins = DP_CONF_GET_PIN_ASSIGN(dp->data.conf);
-	struct ucsi_control ctrl;
+	u64 command;
 
 	if (!dp->override)
 		return 0;
 
-	ctrl.raw_cmd = UCSI_CMD_SET_NEW_CAM(dp->con->num, 1, dp->offset, pins);
+	command = UCSI_CMD_SET_NEW_CAM(dp->con->num, 1, dp->offset, pins);
 
-	return ucsi_send_command(dp->con->ucsi, &ctrl, NULL, 0);
+	return ucsi_send_command(dp->con->ucsi, command, NULL, 0);
 }
 
 static int ucsi_displayport_vdm(struct typec_altmode *alt,
diff --git a/drivers/usb/typec/ucsi/trace.c b/drivers/usb/typec/ucsi/trace.c
index 1dabafb74320..48ad1dc1b1b2 100644
--- a/drivers/usb/typec/ucsi/trace.c
+++ b/drivers/usb/typec/ucsi/trace.c
@@ -33,17 +33,6 @@ const char *ucsi_cmd_str(u64 raw_cmd)
 	return ucsi_cmd_strs[(cmd >= ARRAY_SIZE(ucsi_cmd_strs)) ? 0 : cmd];
 }
 
-static const char * const ucsi_ack_strs[] = {
-	[0]				= "",
-	[UCSI_ACK_EVENT]		= "event",
-	[UCSI_ACK_CMD]			= "command",
-};
-
-const char *ucsi_ack_str(u8 ack)
-{
-	return ucsi_ack_strs[(ack >= ARRAY_SIZE(ucsi_ack_strs)) ? 0 : ack];
-}
-
 const char *ucsi_cci_str(u32 cci)
 {
 	if (cci & GENMASK(7, 0)) {
diff --git a/drivers/usb/typec/ucsi/trace.h b/drivers/usb/typec/ucsi/trace.h
index 6e3d510b236e..2262229dae8e 100644
--- a/drivers/usb/typec/ucsi/trace.h
+++ b/drivers/usb/typec/ucsi/trace.h
@@ -10,54 +10,18 @@
 #include <linux/usb/typec_altmode.h>
 
 const char *ucsi_cmd_str(u64 raw_cmd);
-const char *ucsi_ack_str(u8 ack);
 const char *ucsi_cci_str(u32 cci);
 const char *ucsi_recipient_str(u8 recipient);
 
-DECLARE_EVENT_CLASS(ucsi_log_ack,
-	TP_PROTO(u8 ack),
-	TP_ARGS(ack),
-	TP_STRUCT__entry(
-		__field(u8, ack)
-	),
-	TP_fast_assign(
-		__entry->ack = ack;
-	),
-	TP_printk("ACK %s", ucsi_ack_str(__entry->ack))
-);
-
-DEFINE_EVENT(ucsi_log_ack, ucsi_ack,
-	TP_PROTO(u8 ack),
-	TP_ARGS(ack)
-);
-
-DECLARE_EVENT_CLASS(ucsi_log_control,
-	TP_PROTO(struct ucsi_control *ctrl),
-	TP_ARGS(ctrl),
-	TP_STRUCT__entry(
-		__field(u64, ctrl)
-	),
-	TP_fast_assign(
-		__entry->ctrl = ctrl->raw_cmd;
-	),
-	TP_printk("control=%08llx (%s)", __entry->ctrl,
-		ucsi_cmd_str(__entry->ctrl))
-);
-
-DEFINE_EVENT(ucsi_log_control, ucsi_command,
-	TP_PROTO(struct ucsi_control *ctrl),
-	TP_ARGS(ctrl)
-);
-
 DECLARE_EVENT_CLASS(ucsi_log_command,
-	TP_PROTO(struct ucsi_control *ctrl, int ret),
-	TP_ARGS(ctrl, ret),
+	TP_PROTO(u64 command, int ret),
+	TP_ARGS(command, ret),
 	TP_STRUCT__entry(
 		__field(u64, ctrl)
 		__field(int, ret)
 	),
 	TP_fast_assign(
-		__entry->ctrl = ctrl->raw_cmd;
+		__entry->ctrl = command;
 		__entry->ret = ret;
 	),
 	TP_printk("%s -> %s (err=%d)", ucsi_cmd_str(__entry->ctrl),
@@ -66,13 +30,13 @@ DECLARE_EVENT_CLASS(ucsi_log_command,
 );
 
 DEFINE_EVENT(ucsi_log_command, ucsi_run_command,
-	TP_PROTO(struct ucsi_control *ctrl, int ret),
-	TP_ARGS(ctrl, ret)
+	TP_PROTO(u64 command, int ret),
+	TP_ARGS(command, ret)
 );
 
 DEFINE_EVENT(ucsi_log_command, ucsi_reset_ppm,
-	TP_PROTO(struct ucsi_control *ctrl, int ret),
-	TP_ARGS(ctrl, ret)
+	TP_PROTO(u64 command, int ret),
+	TP_ARGS(command, ret)
 );
 
 DECLARE_EVENT_CLASS(ucsi_log_connector_status,
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 6462dadd7540..373dd575c68d 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -131,13 +131,13 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 	return UCSI_CCI_LENGTH(cci);
 }
 
-static int ucsi_run_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
+static int ucsi_run_command(struct ucsi *ucsi, u64 command,
 			    void *data, size_t size)
 {
 	u8 length;
 	int ret;
 
-	ret = ucsi_exec_command(ucsi, ctrl->raw_cmd);
+	ret = ucsi_exec_command(ucsi, command);
 	if (ret < 0)
 		return ret;
 
@@ -156,13 +156,13 @@ static int ucsi_run_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
 	return length;
 }
 
-int ucsi_send_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
+int ucsi_send_command(struct ucsi *ucsi, u64 command,
 		      void *retval, size_t size)
 {
 	int ret;
 
 	mutex_lock(&ucsi->ppm_lock);
-	ret = ucsi_run_command(ucsi, ctrl, retval, size);
+	ret = ucsi_run_command(ucsi, command, retval, size);
 	mutex_unlock(&ucsi->ppm_lock);
 
 	return ret;
@@ -171,11 +171,12 @@ EXPORT_SYMBOL_GPL(ucsi_send_command);
 
 int ucsi_resume(struct ucsi *ucsi)
 {
-	struct ucsi_control ctrl;
+	u64 command;
 
 	/* Restore UCSI notification enable mask after system resume */
-	UCSI_CMD_SET_NTFY_ENABLE(ctrl, UCSI_ENABLE_NTFY_ALL);
-	return ucsi_send_command(ucsi, &ctrl, NULL, 0);
+	command = UCSI_SET_NOTIFICATION_ENABLE | UCSI_ENABLE_NTFY_ALL;
+
+	return ucsi_send_command(ucsi, command, NULL, 0);
 }
 EXPORT_SYMBOL_GPL(ucsi_resume);
 /* -------------------------------------------------------------------------- */
@@ -188,8 +189,8 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
 	u8 cur;
 	int i;
 
-	UCSI_CMD_GET_CURRENT_CAM(ctrl, con->num);
-	ret = ucsi_run_command(con->ucsi, &ctrl, &cur, sizeof(cur));
+	command = UCSI_GET_CURRENT_CAM | UCSI_CONNECTOR_NUMBER(con->num);
+	ret = ucsi_run_command(con->ucsi, command, &cur, sizeof(cur));
 	if (ret < 0) {
 		if (con->ucsi->version > 0x0100) {
 			dev_err(con->ucsi->dev,
@@ -307,7 +308,7 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 	int max_altmodes = UCSI_MAX_ALTMODES;
 	struct typec_altmode_desc desc;
 	struct ucsi_altmode alt[2];
-	struct ucsi_control ctrl;
+	u64 command;
 	int num = 1;
 	int ret;
 	int len;
@@ -325,8 +326,11 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 
 	for (i = 0; i < max_altmodes;) {
 		memset(alt, 0, sizeof(alt));
-		UCSI_CMD_GET_ALTERNATE_MODES(ctrl, recipient, con->num, i, 1);
-		len = ucsi_run_command(con->ucsi, &ctrl, alt, sizeof(alt));
+		command = UCSI_GET_ALTERNATE_MODES;
+		command |= UCSI_GET_ALTMODE_RECIPIENT(recipient);
+		command |= UCSI_GET_ALTMODE_CONNECTOR_NUMBER(con->num);
+		command |= UCSI_GET_ALTMODE_OFFSET(i);
+		len = ucsi_run_command(con->ucsi, command, alt, sizeof(alt));
 		if (len <= 0)
 			return len;
 
@@ -487,13 +491,14 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 	struct ucsi_connector *con = container_of(work, struct ucsi_connector,
 						  work);
 	struct ucsi *ucsi = con->ucsi;
-	struct ucsi_control ctrl;
+	u64 command;
 	int ret;
 
 	mutex_lock(&con->lock);
 
-	UCSI_CMD_GET_CONNECTOR_STATUS(ctrl, con->num);
-	ret = ucsi_send_command(ucsi, &ctrl, &con->status, sizeof(con->status));
+	command = UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER(con->num);
+	ret = ucsi_send_command(ucsi, command, &con->status,
+				sizeof(con->status));
 	if (ret < 0) {
 		dev_err(ucsi->dev, "%s: GET_CONNECTOR_STATUS failed (%d)\n",
 			__func__, ret);
@@ -537,8 +542,9 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 		 * Running GET_CAM_SUPPORTED command just to make sure the PPM
 		 * does not get stuck in case it assumes we do so.
 		 */
-		UCSI_CMD_GET_CAM_SUPPORTED(ctrl, con->num);
-		ucsi_run_command(con->ucsi, &ctrl, NULL, 0);
+		command = UCSI_GET_CAM_SUPPORTED;
+		command |= UCSI_CONNECTOR_NUMBER(con->num);
+		ucsi_run_command(con->ucsi, command, NULL, 0);
 	}
 
 	if (con->status.change & UCSI_CONSTAT_PARTNER_CHANGE)
@@ -573,11 +579,12 @@ EXPORT_SYMBOL_GPL(ucsi_connector_change);
 
 static int ucsi_reset_connector(struct ucsi_connector *con, bool hard)
 {
-	struct ucsi_control ctrl;
+	u64 command;
 
-	UCSI_CMD_CONNECTOR_RESET(ctrl, con, hard);
+	command = UCSI_CONNECTOR_RESET | UCSI_CONNECTOR_NUMBER(con->num);
+	command |= hard ? UCSI_CONNECTOR_RESET_HARD : 0;
 
-	return ucsi_send_command(con->ucsi, &ctrl, NULL, 0);
+	return ucsi_send_command(con->ucsi, command, NULL, 0);
 }
 
 static int ucsi_reset_ppm(struct ucsi *ucsi)
@@ -617,21 +624,21 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 	return 0;
 }
 
-static int ucsi_role_cmd(struct ucsi_connector *con, struct ucsi_control *ctrl)
+static int ucsi_role_cmd(struct ucsi_connector *con, u64 command)
 {
 	int ret;
 
-	ret = ucsi_send_command(con->ucsi, ctrl, NULL, 0);
+	ret = ucsi_send_command(con->ucsi, command, NULL, 0);
 	if (ret == -ETIMEDOUT) {
-		struct ucsi_control c;
+		u64 c;
 
 		/* PPM most likely stopped responding. Resetting everything. */
 		mutex_lock(&con->ucsi->ppm_lock);
 		ucsi_reset_ppm(con->ucsi);
 		mutex_unlock(&con->ucsi->ppm_lock);
 
-		UCSI_CMD_SET_NTFY_ENABLE(c, UCSI_ENABLE_NTFY_ALL);
-		ucsi_send_command(con->ucsi, &c, NULL, 0);
+		c = UCSI_SET_NOTIFICATION_ENABLE | UCSI_ENABLE_NTFY_ALL;
+		ucsi_send_command(con->ucsi, c, NULL, 0);
 
 		ucsi_reset_connector(con, true);
 	}
@@ -642,7 +649,7 @@ static int ucsi_role_cmd(struct ucsi_connector *con, struct ucsi_control *ctrl)
 static int ucsi_dr_swap(struct typec_port *port, enum typec_data_role role)
 {
 	struct ucsi_connector *con = typec_get_drvdata(port);
-	struct ucsi_control ctrl;
+	u64 command;
 	int ret = 0;
 
 	mutex_lock(&con->lock);
@@ -658,8 +665,10 @@ static int ucsi_dr_swap(struct typec_port *port, enum typec_data_role role)
 	     role == TYPEC_HOST))
 		goto out_unlock;
 
-	UCSI_CMD_SET_UOR(ctrl, con, role);
-	ret = ucsi_role_cmd(con, &ctrl);
+	command = UCSI_SET_UOR | UCSI_CONNECTOR_NUMBER(con->num);
+	command |= UCSI_SET_UOR_ROLE(role);
+	command |= UCSI_SET_UOR_ACCEPT_ROLE_SWAPS;
+	ret = ucsi_role_cmd(con, command);
 	if (ret < 0)
 		goto out_unlock;
 
@@ -676,7 +685,7 @@ static int ucsi_dr_swap(struct typec_port *port, enum typec_data_role role)
 static int ucsi_pr_swap(struct typec_port *port, enum typec_role role)
 {
 	struct ucsi_connector *con = typec_get_drvdata(port);
-	struct ucsi_control ctrl;
+	u64 command;
 	int ret = 0;
 
 	mutex_lock(&con->lock);
@@ -689,8 +698,10 @@ static int ucsi_pr_swap(struct typec_port *port, enum typec_role role)
 	if (con->status.pwr_dir == role)
 		goto out_unlock;
 
-	UCSI_CMD_SET_PDR(ctrl, con, role);
-	ret = ucsi_role_cmd(con, &ctrl);
+	command = UCSI_SET_PDR | UCSI_CONNECTOR_NUMBER(con->num);
+	command |= UCSI_SET_PDR_ROLE(role);
+	command |= UCSI_SET_PDR_ACCEPT_ROLE_SWAPS;
+	ret = ucsi_role_cmd(con, command);
 	if (ret < 0)
 		goto out_unlock;
 
@@ -733,7 +744,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	struct ucsi_connector *con = &ucsi->connector[index];
 	struct typec_capability *cap = &con->typec_cap;
 	enum typec_accessory *accessory = cap->accessory;
-	struct ucsi_control ctrl;
+	u64 command;
 	int ret;
 
 	INIT_WORK(&con->work, ucsi_handle_connector_change);
@@ -743,8 +754,9 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	con->ucsi = ucsi;
 
 	/* Get connector capability */
-	UCSI_CMD_GET_CONNECTOR_CAPABILITY(ctrl, con->num);
-	ret = ucsi_run_command(ucsi, &ctrl, &con->cap, sizeof(con->cap));
+	command = UCSI_GET_CONNECTOR_CAPABILITY;
+	command |= UCSI_CONNECTOR_NUMBER(con->num);
+	ret = ucsi_run_command(ucsi, command, &con->cap, sizeof(con->cap));
 	if (ret < 0)
 		return ret;
 
@@ -787,8 +799,9 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 			con->num);
 
 	/* Get the status */
-	UCSI_CMD_GET_CONNECTOR_STATUS(ctrl, con->num);
-	ret = ucsi_run_command(ucsi, &ctrl, &con->status, sizeof(con->status));
+	command = UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER(con->num);
+	ret = ucsi_run_command(ucsi, command, &con->status,
+			       sizeof(con->status));
 	if (ret < 0) {
 		dev_err(ucsi->dev, "con%d: failed to get status\n", con->num);
 		return 0;
@@ -836,7 +849,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 int ucsi_init(struct ucsi *ucsi)
 {
 	struct ucsi_connector *con;
-	struct ucsi_control ctrl;
+	u64 command;
 	int ret;
 	int i;
 
@@ -850,15 +863,15 @@ int ucsi_init(struct ucsi *ucsi)
 	}
 
 	/* Enable basic notifications */
-	UCSI_CMD_SET_NTFY_ENABLE(ctrl, UCSI_ENABLE_NTFY_CMD_COMPLETE |
-					UCSI_ENABLE_NTFY_ERROR);
-	ret = ucsi_run_command(ucsi, &ctrl, NULL, 0);
+	command = UCSI_SET_NOTIFICATION_ENABLE;
+	command |= UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
+	ret = ucsi_run_command(ucsi, command, NULL, 0);
 	if (ret < 0)
 		goto err_reset;
 
 	/* Get PPM capabilities */
-	UCSI_CMD_GET_CAPABILITY(ctrl);
-	ret = ucsi_run_command(ucsi, &ctrl, &ucsi->cap, sizeof(ucsi->cap));
+	command = UCSI_GET_CAPABILITY;
+	ret = ucsi_run_command(ucsi, command, &ucsi->cap, sizeof(ucsi->cap));
 	if (ret < 0)
 		goto err_reset;
 
@@ -883,8 +896,8 @@ int ucsi_init(struct ucsi *ucsi)
 	}
 
 	/* Enable all notifications */
-	UCSI_CMD_SET_NTFY_ENABLE(ctrl, UCSI_ENABLE_NTFY_ALL);
-	ret = ucsi_run_command(ucsi, &ctrl, NULL, 0);
+	command = UCSI_SET_NOTIFICATION_ENABLE | UCSI_ENABLE_NTFY_ALL;
+	ret = ucsi_run_command(ucsi, command, NULL, 0);
 	if (ret < 0)
 		goto err_unregister;
 
@@ -1005,15 +1018,15 @@ EXPORT_SYMBOL_GPL(ucsi_register);
  */
 void ucsi_unregister(struct ucsi *ucsi)
 {
-	struct ucsi_control ctrl;
+	u64 command;
 	int i;
 
 	/* Make sure that we are not in the middle of driver initialization */
 	cancel_work_sync(&ucsi->work);
 
 	/* Disable everything except command complete notification */
-	UCSI_CMD_SET_NTFY_ENABLE(ctrl, UCSI_ENABLE_NTFY_CMD_COMPLETE)
-	ucsi_send_command(ucsi, &ctrl, NULL, 0);
+	command = UCSI_SET_NOTIFICATION_ENABLE | UCSI_ENABLE_NTFY_CMD_COMPLETE;
+	ucsi_send_command(ucsi, command, NULL, 0);
 
 	for (i = 0; i < ucsi->cap.num_connectors; i++) {
 		cancel_work_sync(&ucsi->connector[i].work);
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 29f9e7f0d212..4f1409e06d22 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -60,178 +60,6 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 
 /* -------------------------------------------------------------------------- */
 
-/* Command Status and Connector Change Indication (CCI) data structure */
-struct ucsi_cci {
-	u8:1; /* reserved */
-	u8 connector_change:7;
-	u8 data_length;
-	u16:9; /* reserved */
-	u16 not_supported:1;
-	u16 cancel_complete:1;
-	u16 reset_complete:1;
-	u16 busy:1;
-	u16 ack_complete:1;
-	u16 error:1;
-	u16 cmd_complete:1;
-} __packed;
-
-/* Default fields in CONTROL data structure */
-struct ucsi_command {
-	u8 cmd;
-	u8 length;
-	u64 data:48;
-} __packed;
-
-/* ACK Command structure */
-struct ucsi_ack_cmd {
-	u8 cmd;
-	u8 length;
-	u8 cci_ack:1;
-	u8 cmd_ack:1;
-	u8:6; /* reserved */
-} __packed;
-
-/* Connector Reset Command structure */
-struct ucsi_con_rst {
-	u8 cmd;
-	u8 length;
-	u8 con_num:7;
-	u8 hard_reset:1;
-} __packed;
-
-/* Set USB Operation Mode Command structure */
-struct ucsi_uor_cmd {
-	u8 cmd;
-	u8 length;
-	u16 con_num:7;
-	u16 role:3;
-#define UCSI_UOR_ROLE_DFP			BIT(0)
-#define UCSI_UOR_ROLE_UFP			BIT(1)
-#define UCSI_UOR_ROLE_DRP			BIT(2)
-	u16:6; /* reserved */
-} __packed;
-
-/* Get Alternate Modes Command structure */
-struct ucsi_altmode_cmd {
-	u8 cmd;
-	u8 length;
-	u8 recipient;
-#define UCSI_RECIPIENT_CON			0
-#define UCSI_RECIPIENT_SOP			1
-#define UCSI_RECIPIENT_SOP_P			2
-#define UCSI_RECIPIENT_SOP_PP			3
-	u8 con_num;
-	u8 offset;
-	u8 num_altmodes;
-} __packed;
-
-struct ucsi_control {
-	union {
-		u64 raw_cmd;
-		struct ucsi_command cmd;
-		struct ucsi_uor_cmd uor;
-		struct ucsi_ack_cmd ack;
-		struct ucsi_con_rst con_rst;
-		struct ucsi_altmode_cmd alt;
-	};
-};
-
-#define __UCSI_CMD(_ctrl_, _cmd_)					\
-{									\
-	(_ctrl_).raw_cmd = 0;						\
-	(_ctrl_).cmd.cmd = _cmd_;					\
-}
-
-/* Helper for preparing ucsi_control for CONNECTOR_RESET command. */
-#define UCSI_CMD_CONNECTOR_RESET(_ctrl_, _con_, _hard_)			\
-{									\
-	__UCSI_CMD(_ctrl_, UCSI_CONNECTOR_RESET)			\
-	(_ctrl_).con_rst.con_num = (_con_)->num;			\
-	(_ctrl_).con_rst.hard_reset = _hard_;				\
-}
-
-/* Helper for preparing ucsi_control for ACK_CC_CI command. */
-#define UCSI_CMD_ACK(_ctrl_, _ack_)					\
-{									\
-	__UCSI_CMD(_ctrl_, UCSI_ACK_CC_CI)				\
-	(_ctrl_).ack.cci_ack = ((_ack_) == UCSI_ACK_EVENT);		\
-	(_ctrl_).ack.cmd_ack = ((_ack_) == UCSI_ACK_CMD);		\
-}
-
-/* Helper for preparing ucsi_control for SET_NOTIFY_ENABLE command. */
-#define UCSI_CMD_SET_NTFY_ENABLE(_ctrl_, _ntfys_)			\
-{									\
-	__UCSI_CMD(_ctrl_, UCSI_SET_NOTIFICATION_ENABLE)		\
-	(_ctrl_).cmd.data = _ntfys_;					\
-}
-
-/* Helper for preparing ucsi_control for GET_CAPABILITY command. */
-#define UCSI_CMD_GET_CAPABILITY(_ctrl_)					\
-{									\
-	__UCSI_CMD(_ctrl_, UCSI_GET_CAPABILITY)				\
-}
-
-/* Helper for preparing ucsi_control for GET_CONNECTOR_CAPABILITY command. */
-#define UCSI_CMD_GET_CONNECTOR_CAPABILITY(_ctrl_, _con_)		\
-{									\
-	__UCSI_CMD(_ctrl_, UCSI_GET_CONNECTOR_CAPABILITY)		\
-	(_ctrl_).cmd.data = _con_;					\
-}
-
-/* Helper for preparing ucsi_control for GET_ALTERNATE_MODES command. */
-#define UCSI_CMD_GET_ALTERNATE_MODES(_ctrl_, _r_, _con_num_, _o_, _num_)\
-{									\
-	__UCSI_CMD((_ctrl_), UCSI_GET_ALTERNATE_MODES)			\
-	_ctrl_.alt.recipient = (_r_);					\
-	_ctrl_.alt.con_num = (_con_num_);				\
-	_ctrl_.alt.offset = (_o_);					\
-	_ctrl_.alt.num_altmodes = (_num_) - 1;				\
-}
-
-/* Helper for preparing ucsi_control for GET_CAM_SUPPORTED command. */
-#define UCSI_CMD_GET_CAM_SUPPORTED(_ctrl_, _con_)			\
-{									\
-	__UCSI_CMD((_ctrl_), UCSI_GET_CAM_SUPPORTED)			\
-	_ctrl_.cmd.data = (_con_);					\
-}
-
-/* Helper for preparing ucsi_control for GET_CAM_SUPPORTED command. */
-#define UCSI_CMD_GET_CURRENT_CAM(_ctrl_, _con_)			\
-{									\
-	__UCSI_CMD((_ctrl_), UCSI_GET_CURRENT_CAM)			\
-	_ctrl_.cmd.data = (_con_);					\
-}
-
-/* Helper for preparing ucsi_control for GET_CONNECTOR_STATUS command. */
-#define UCSI_CMD_GET_CONNECTOR_STATUS(_ctrl_, _con_)			\
-{									\
-	__UCSI_CMD(_ctrl_, UCSI_GET_CONNECTOR_STATUS)			\
-	(_ctrl_).cmd.data = _con_;					\
-}
-
-#define __UCSI_ROLE(_ctrl_, _cmd_, _con_num_)				\
-{									\
-	__UCSI_CMD(_ctrl_, _cmd_)					\
-	(_ctrl_).uor.con_num = _con_num_;				\
-	(_ctrl_).uor.role = UCSI_UOR_ROLE_DRP;				\
-}
-
-/* Helper for preparing ucsi_control for SET_UOR command. */
-#define UCSI_CMD_SET_UOR(_ctrl_, _con_, _role_)				\
-{									\
-	__UCSI_ROLE(_ctrl_, UCSI_SET_UOR, (_con_)->num)		\
-	(_ctrl_).uor.role |= (_role_) == TYPEC_HOST ? UCSI_UOR_ROLE_DFP : \
-			  UCSI_UOR_ROLE_UFP;				\
-}
-
-/* Helper for preparing ucsi_control for SET_PDR command. */
-#define UCSI_CMD_SET_PDR(_ctrl_, _con_, _role_)			\
-{									\
-	__UCSI_ROLE(_ctrl_, UCSI_SET_PDR, (_con_)->num)		\
-	(_ctrl_).uor.role |= (_role_) == TYPEC_SOURCE ? UCSI_UOR_ROLE_DFP : \
-			UCSI_UOR_ROLE_UFP;				\
-}
-
 /* Commands */
 #define UCSI_PPM_RESET			0x01
 #define UCSI_CANCEL			0x02
@@ -253,28 +81,49 @@ struct ucsi_control {
 #define UCSI_GET_CONNECTOR_STATUS	0x12
 #define UCSI_GET_ERROR_STATUS		0x13
 
-/* ACK_CC_CI commands */
-#define UCSI_ACK_EVENT			1
-#define UCSI_ACK_CMD			2
+#define UCSI_CONNECTOR_NUMBER(_num_)		((u64)(_num_) << 16)
+
+/* CONNECTOR_RESET command bits */
+#define UCSI_CONNECTOR_RESET_HARD		BIT(23) /* Deprecated in v1.1 */
 
-/* Bits for ACK CC or CI */
+/* ACK_CC_CI bits */
 #define UCSI_ACK_CONNECTOR_CHANGE		BIT(16)
 #define UCSI_ACK_COMMAND_COMPLETE		BIT(17)
 
-/* Bits for SET_NOTIFICATION_ENABLE command */
-#define UCSI_ENABLE_NTFY_CMD_COMPLETE		BIT(0)
-#define UCSI_ENABLE_NTFY_EXT_PWR_SRC_CHANGE	BIT(1)
-#define UCSI_ENABLE_NTFY_PWR_OPMODE_CHANGE	BIT(2)
-#define UCSI_ENABLE_NTFY_CAP_CHANGE		BIT(5)
-#define UCSI_ENABLE_NTFY_PWR_LEVEL_CHANGE	BIT(6)
-#define UCSI_ENABLE_NTFY_PD_RESET_COMPLETE	BIT(7)
-#define UCSI_ENABLE_NTFY_CAM_CHANGE		BIT(8)
-#define UCSI_ENABLE_NTFY_BAT_STATUS_CHANGE	BIT(9)
-#define UCSI_ENABLE_NTFY_PARTNER_CHANGE		BIT(11)
-#define UCSI_ENABLE_NTFY_PWR_DIR_CHANGE		BIT(12)
-#define UCSI_ENABLE_NTFY_CONNECTOR_CHANGE	BIT(14)
-#define UCSI_ENABLE_NTFY_ERROR			BIT(15)
-#define UCSI_ENABLE_NTFY_ALL			0xdbe7
+/* SET_NOTIFICATION_ENABLE command bits */
+#define UCSI_ENABLE_NTFY_CMD_COMPLETE		BIT(16)
+#define UCSI_ENABLE_NTFY_EXT_PWR_SRC_CHANGE	BIT(17)
+#define UCSI_ENABLE_NTFY_PWR_OPMODE_CHANGE	BIT(18)
+#define UCSI_ENABLE_NTFY_CAP_CHANGE		BIT(19)
+#define UCSI_ENABLE_NTFY_PWR_LEVEL_CHANGE	BIT(20)
+#define UCSI_ENABLE_NTFY_PD_RESET_COMPLETE	BIT(21)
+#define UCSI_ENABLE_NTFY_CAM_CHANGE		BIT(22)
+#define UCSI_ENABLE_NTFY_BAT_STATUS_CHANGE	BIT(23)
+#define UCSI_ENABLE_NTFY_PARTNER_CHANGE		BIT(24)
+#define UCSI_ENABLE_NTFY_PWR_DIR_CHANGE		BIT(25)
+#define UCSI_ENABLE_NTFY_CONNECTOR_CHANGE	BIT(26)
+#define UCSI_ENABLE_NTFY_ERROR			BIT(27)
+#define UCSI_ENABLE_NTFY_ALL			0xdbe70000
+
+/* SET_UOR command bits */
+#define UCSI_SET_UOR_ROLE(_r_)		(((_r_) == TYPEC_HOST ? 1 : 2) << 23)
+#define UCSI_SET_UOR_ACCEPT_ROLE_SWAPS		BIT(25)
+
+/* SET_PDF command bits */
+#define UCSI_SET_PDR_ROLE(_r_)		(((_r_) == TYPEC_SOURCE ? 1 : 2) << 23)
+#define UCSI_SET_PDR_ACCEPT_ROLE_SWAPS		BIT(25)
+
+/* GET_ALTERNATE_MODES command bits */
+#define UCSI_GET_ALTMODE_RECIPIENT(_r_)		((u64)(_r_) << 16)
+#define   UCSI_RECIPIENT_CON			0
+#define   UCSI_RECIPIENT_SOP			1
+#define   UCSI_RECIPIENT_SOP_P			2
+#define   UCSI_RECIPIENT_SOP_PP			3
+#define UCSI_GET_ALTMODE_CONNECTOR_NUMBER(_r_)	((u64)(_r_) << 24)
+#define UCSI_GET_ALTMODE_OFFSET(_r_)		((u64)(_r_) << 32)
+#define UCSI_GET_ALTMODE_NUM_ALTMODES(_r_)	((u64)(_r_) << 40)
+
+/* -------------------------------------------------------------------------- */
 
 /* Error information returned by PPM in response to GET_ERROR_STATUS command. */
 #define UCSI_ERROR_UNREGONIZED_CMD		BIT(0)
@@ -443,7 +292,7 @@ struct ucsi_connector {
 	struct ucsi_connector_capability cap;
 };
 
-int ucsi_send_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
+int ucsi_send_command(struct ucsi *ucsi, u64 command,
 		      void *retval, size_t size);
 
 void ucsi_altmode_update_active(struct ucsi_connector *con);
-- 
2.23.0

