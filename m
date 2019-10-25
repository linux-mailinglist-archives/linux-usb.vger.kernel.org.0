Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B55D1E4593
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2019 10:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437902AbfJYIXy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Oct 2019 04:23:54 -0400
Received: from mga07.intel.com ([134.134.136.100]:36083 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437901AbfJYIXx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 25 Oct 2019 04:23:53 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Oct 2019 01:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; 
   d="scan'208";a="210332139"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Oct 2019 01:23:51 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v3 14/18] usb: typec: ucsi: Remove the old API
Date:   Fri, 25 Oct 2019 11:23:20 +0300
Message-Id: <20191025082324.75731-15-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191025082324.75731-1-heikki.krogerus@linux.intel.com>
References: <20191025082324.75731-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The drivers now only use the new API, so removing the old one.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Tested-by: Ajay Gupta <ajayg@nvidia.com>
---
 drivers/usb/typec/ucsi/displayport.c |  24 +-
 drivers/usb/typec/ucsi/trace.h       |  17 --
 drivers/usb/typec/ucsi/ucsi.c        | 346 +++------------------------
 drivers/usb/typec/ucsi/ucsi.h        |  41 ----
 4 files changed, 43 insertions(+), 385 deletions(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index d99700cb4dca..47424935bc81 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -48,6 +48,7 @@ struct ucsi_dp {
 static int ucsi_displayport_enter(struct typec_altmode *alt)
 {
 	struct ucsi_dp *dp = typec_altmode_get_drvdata(alt);
+	struct ucsi *ucsi = dp->con->ucsi;
 	struct ucsi_control ctrl;
 	u8 cur = 0;
 	int ret;
@@ -59,25 +60,21 @@ static int ucsi_displayport_enter(struct typec_altmode *alt)
 
 		dev_warn(&p->dev,
 			 "firmware doesn't support alternate mode overriding\n");
-		mutex_unlock(&dp->con->lock);
-		return -EOPNOTSUPP;
+		ret = -EOPNOTSUPP;
+		goto err_unlock;
 	}
 
 	UCSI_CMD_GET_CURRENT_CAM(ctrl, dp->con->num);
-	ret = ucsi_send_command(dp->con->ucsi, &ctrl, &cur, sizeof(cur));
+	ret = ucsi_send_command(ucsi, command, &cur, sizeof(cur));
 	if (ret < 0) {
-		if (dp->con->ucsi->ppm->data->version > 0x0100) {
-			mutex_unlock(&dp->con->lock);
-			return ret;
-		}
+		if (ucsi->version > 0x0100)
+			goto err_unlock;
 		cur = 0xff;
 	}
 
 	if (cur != 0xff) {
-		mutex_unlock(&dp->con->lock);
-		if (dp->con->port_altmode[cur] == alt)
-			return 0;
-		return -EBUSY;
+		ret = dp->con->port_altmode[cur] == alt ? 0 : -EBUSY;
+		goto err_unlock;
 	}
 
 	/*
@@ -94,10 +91,11 @@ static int ucsi_displayport_enter(struct typec_altmode *alt)
 	dp->vdo_size = 1;
 
 	schedule_work(&dp->work);
-
+	ret = 0;
+err_unlock:
 	mutex_unlock(&dp->con->lock);
 
-	return 0;
+	return ret;
 }
 
 static int ucsi_displayport_exit(struct typec_altmode *alt)
diff --git a/drivers/usb/typec/ucsi/trace.h b/drivers/usb/typec/ucsi/trace.h
index 783ec9c72055..6e3d510b236e 100644
--- a/drivers/usb/typec/ucsi/trace.h
+++ b/drivers/usb/typec/ucsi/trace.h
@@ -75,23 +75,6 @@ DEFINE_EVENT(ucsi_log_command, ucsi_reset_ppm,
 	TP_ARGS(ctrl, ret)
 );
 
-DECLARE_EVENT_CLASS(ucsi_log_cci,
-	TP_PROTO(u32 cci),
-	TP_ARGS(cci),
-	TP_STRUCT__entry(
-		__field(u32, cci)
-	),
-	TP_fast_assign(
-		__entry->cci = cci;
-	),
-	TP_printk("CCI=%08x %s", __entry->cci, ucsi_cci_str(__entry->cci))
-);
-
-DEFINE_EVENT(ucsi_log_cci, ucsi_notify,
-	TP_PROTO(u32 cci),
-	TP_ARGS(cci)
-);
-
 DECLARE_EVENT_CLASS(ucsi_log_connector_status,
 	TP_PROTO(int port, struct ucsi_connector_status *status),
 	TP_ARGS(port, status),
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index dffc2cf8db6f..6462dadd7540 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -36,68 +36,6 @@
  */
 #define UCSI_SWAP_TIMEOUT_MS	5000
 
-static inline int ucsi_sync(struct ucsi *ucsi)
-{
-	if (ucsi->ppm && ucsi->ppm->sync)
-		return ucsi->ppm->sync(ucsi->ppm);
-	return 0;
-}
-
-static int ucsi_command(struct ucsi *ucsi, struct ucsi_control *ctrl)
-{
-	int ret;
-
-	trace_ucsi_command(ctrl);
-
-	set_bit(COMMAND_PENDING, &ucsi->flags);
-
-	ret = ucsi->ppm->cmd(ucsi->ppm, ctrl);
-	if (ret)
-		goto err_clear_flag;
-
-	if (!wait_for_completion_timeout(&ucsi->complete,
-					 msecs_to_jiffies(UCSI_TIMEOUT_MS))) {
-		dev_warn(ucsi->dev, "PPM NOT RESPONDING\n");
-		ret = -ETIMEDOUT;
-	}
-
-err_clear_flag:
-	clear_bit(COMMAND_PENDING, &ucsi->flags);
-
-	return ret;
-}
-
-static int ucsi_ack(struct ucsi *ucsi, u8 ack)
-{
-	struct ucsi_control ctrl;
-	int ret;
-
-	trace_ucsi_ack(ack);
-
-	set_bit(ACK_PENDING, &ucsi->flags);
-
-	UCSI_CMD_ACK(ctrl, ack);
-	ret = ucsi->ppm->cmd(ucsi->ppm, &ctrl);
-	if (ret)
-		goto out_clear_bit;
-
-	/* Waiting for ACK with ACK CMD, but not with EVENT for now */
-	if (ack == UCSI_ACK_EVENT)
-		goto out_clear_bit;
-
-	if (!wait_for_completion_timeout(&ucsi->complete,
-					 msecs_to_jiffies(UCSI_TIMEOUT_MS)))
-		ret = -ETIMEDOUT;
-
-out_clear_bit:
-	clear_bit(ACK_PENDING, &ucsi->flags);
-
-	if (ret)
-		dev_err(ucsi->dev, "%s: failed\n", __func__);
-
-	return ret;
-}
-
 static int ucsi_acknowledge_command(struct ucsi *ucsi)
 {
 	u64 ctrl;
@@ -196,115 +134,26 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 static int ucsi_run_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
 			    void *data, size_t size)
 {
-	struct ucsi_control _ctrl;
-	u8 data_length;
-	u16 error;
+	u8 length;
 	int ret;
 
-	if (ucsi->ops) {
-		ret = ucsi_exec_command(ucsi, ctrl->raw_cmd);
-		if (ret < 0)
-			return ret;
-
-		data_length = ret;
+	ret = ucsi_exec_command(ucsi, ctrl->raw_cmd);
+	if (ret < 0)
+		return ret;
 
-		if (data) {
-			ret = ucsi->ops->read(ucsi, UCSI_MESSAGE_IN, data, size);
-			if (ret)
-				return ret;
-		}
+	length = ret;
 
-		ret = ucsi_acknowledge_command(ucsi);
+	if (data) {
+		ret = ucsi->ops->read(ucsi, UCSI_MESSAGE_IN, data, size);
 		if (ret)
 			return ret;
-
-		return data_length;
 	}
 
-	ret = ucsi_command(ucsi, ctrl);
+	ret = ucsi_acknowledge_command(ucsi);
 	if (ret)
-		goto err;
-
-	switch (ucsi->status) {
-	case UCSI_IDLE:
-		ret = ucsi_sync(ucsi);
-		if (ret)
-			dev_warn(ucsi->dev, "%s: sync failed\n", __func__);
-
-		if (data)
-			memcpy(data, ucsi->ppm->data->message_in, size);
-
-		data_length = ucsi->ppm->data->cci.data_length;
-
-		ret = ucsi_ack(ucsi, UCSI_ACK_CMD);
-		if (!ret)
-			ret = data_length;
-		break;
-	case UCSI_BUSY:
-		/* The caller decides whether to cancel or not */
-		ret = -EBUSY;
-		break;
-	case UCSI_ERROR:
-		ret = ucsi_ack(ucsi, UCSI_ACK_CMD);
-		if (ret)
-			break;
-
-		_ctrl.raw_cmd = 0;
-		_ctrl.cmd.cmd = UCSI_GET_ERROR_STATUS;
-		ret = ucsi_command(ucsi, &_ctrl);
-		if (ret) {
-			dev_err(ucsi->dev, "reading error failed!\n");
-			break;
-		}
-
-		memcpy(&error, ucsi->ppm->data->message_in, sizeof(error));
-
-		/* Something has really gone wrong */
-		if (WARN_ON(ucsi->status == UCSI_ERROR)) {
-			ret = -ENODEV;
-			break;
-		}
-
-		ret = ucsi_ack(ucsi, UCSI_ACK_CMD);
-		if (ret)
-			break;
-
-		switch (error) {
-		case UCSI_ERROR_INCOMPATIBLE_PARTNER:
-			ret = -EOPNOTSUPP;
-			break;
-		case UCSI_ERROR_CC_COMMUNICATION_ERR:
-			ret = -ECOMM;
-			break;
-		case UCSI_ERROR_CONTRACT_NEGOTIATION_FAIL:
-			ret = -EPROTO;
-			break;
-		case UCSI_ERROR_DEAD_BATTERY:
-			dev_warn(ucsi->dev, "Dead battery condition!\n");
-			ret = -EPERM;
-			break;
-		/* The following mean a bug in this driver */
-		case UCSI_ERROR_INVALID_CON_NUM:
-		case UCSI_ERROR_UNREGONIZED_CMD:
-		case UCSI_ERROR_INVALID_CMD_ARGUMENT:
-			dev_warn(ucsi->dev,
-				 "%s: possible UCSI driver bug - error 0x%x\n",
-				 __func__, error);
-			ret = -EINVAL;
-			break;
-		default:
-			dev_warn(ucsi->dev,
-				 "%s: error without status\n", __func__);
-			ret = -EIO;
-			break;
-		}
-		break;
-	}
-
-err:
-	trace_ucsi_run_command(ctrl, ret);
+		return ret;
 
-	return ret;
+	return length;
 }
 
 int ucsi_send_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
@@ -334,7 +183,7 @@ EXPORT_SYMBOL_GPL(ucsi_resume);
 void ucsi_altmode_update_active(struct ucsi_connector *con)
 {
 	const struct typec_altmode *altmode = NULL;
-	struct ucsi_control ctrl;
+	u64 command;
 	int ret;
 	u8 cur;
 	int i;
@@ -342,7 +191,7 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
 	UCSI_CMD_GET_CURRENT_CAM(ctrl, con->num);
 	ret = ucsi_run_command(con->ucsi, &ctrl, &cur, sizeof(cur));
 	if (ret < 0) {
-		if (con->ucsi->ppm->data->version > 0x0100) {
+		if (con->ucsi->version > 0x0100) {
 			dev_err(con->ucsi->dev,
 				"GET_CURRENT_CAM command failed\n");
 			return;
@@ -695,10 +544,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 	if (con->status.change & UCSI_CONSTAT_PARTNER_CHANGE)
 		ucsi_partner_change(con);
 
-	if (ucsi->ops)
-		ret = ucsi_acknowledge_connector_change(ucsi);
-	else
-		ret = ucsi_ack(ucsi, UCSI_ACK_EVENT);
+	ret = ucsi_acknowledge_connector_change(ucsi);
 	if (ret)
 		dev_err(ucsi->dev, "%s: ACK failed (%d)", __func__, ret);
 
@@ -723,45 +569,6 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num)
 }
 EXPORT_SYMBOL_GPL(ucsi_connector_change);
 
-/**
- * ucsi_notify - PPM notification handler
- * @ucsi: Source UCSI Interface for the notifications
- *
- * Handle notifications from PPM of @ucsi.
- */
-void ucsi_notify(struct ucsi *ucsi)
-{
-	struct ucsi_cci *cci;
-
-	/* There is no requirement to sync here, but no harm either. */
-	ucsi_sync(ucsi);
-
-	cci = &ucsi->ppm->data->cci;
-
-	if (cci->error)
-		ucsi->status = UCSI_ERROR;
-	else if (cci->busy)
-		ucsi->status = UCSI_BUSY;
-	else
-		ucsi->status = UCSI_IDLE;
-
-	if (cci->cmd_complete && test_bit(COMMAND_PENDING, &ucsi->flags)) {
-		complete(&ucsi->complete);
-	} else if (cci->ack_complete && test_bit(ACK_PENDING, &ucsi->flags)) {
-		complete(&ucsi->complete);
-	} else if (cci->connector_change) {
-		struct ucsi_connector *con;
-
-		con = &ucsi->connector[cci->connector_change - 1];
-
-		if (!test_and_set_bit(EVENT_PENDING, &ucsi->flags))
-			schedule_work(&con->work);
-	}
-
-	trace_ucsi_notify(ucsi->ppm->data->raw_cci);
-}
-EXPORT_SYMBOL_GPL(ucsi_notify);
-
 /* -------------------------------------------------------------------------- */
 
 static int ucsi_reset_connector(struct ucsi_connector *con, bool hard)
@@ -775,83 +582,39 @@ static int ucsi_reset_connector(struct ucsi_connector *con, bool hard)
 
 static int ucsi_reset_ppm(struct ucsi *ucsi)
 {
-	struct ucsi_control ctrl;
+	u64 command = UCSI_PPM_RESET;
 	unsigned long tmo;
+	u32 cci;
 	int ret;
 
-	if (ucsi->ops) {
-		u64 command = UCSI_PPM_RESET;
-		u32 cci;
-
-		ret = ucsi->ops->async_write(ucsi, UCSI_CONTROL, &command,
-					     sizeof(command));
-		if (ret < 0)
-			return ret;
-
-		tmo = jiffies + msecs_to_jiffies(UCSI_TIMEOUT_MS);
-
-		do {
-			if (time_is_before_jiffies(tmo))
-				return -ETIMEDOUT;
-
-			ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
-			if (ret)
-				return ret;
-
-			/* If the PPM is still doing something else, reset it again. */
-			if (cci & ~UCSI_CCI_RESET_COMPLETE) {
-				ret = ucsi->ops->async_write(ucsi, UCSI_CONTROL,
-							     &command,
-							     sizeof(command));
-				if (ret < 0)
-					return ret;
-			}
-
-			msleep(20);
-		} while (!(cci & UCSI_CCI_RESET_COMPLETE));
-
-		return 0;
-	}
-
-	ctrl.raw_cmd = 0;
-	ctrl.cmd.cmd = UCSI_PPM_RESET;
-	trace_ucsi_command(&ctrl);
-	ret = ucsi->ppm->cmd(ucsi->ppm, &ctrl);
-	if (ret)
-		goto err;
+	ret = ucsi->ops->async_write(ucsi, UCSI_CONTROL, &command,
+				     sizeof(command));
+	if (ret < 0)
+		return ret;
 
 	tmo = jiffies + msecs_to_jiffies(UCSI_TIMEOUT_MS);
 
 	do {
-		/* Here sync is critical. */
-		ret = ucsi_sync(ucsi);
-		if (ret)
-			goto err;
+		if (time_is_before_jiffies(tmo))
+			return -ETIMEDOUT;
 
-		if (ucsi->ppm->data->cci.reset_complete)
-			break;
+		ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
+		if (ret)
+			return ret;
 
 		/* If the PPM is still doing something else, reset it again. */
-		if (ucsi->ppm->data->raw_cci) {
-			dev_warn_ratelimited(ucsi->dev,
-				"Failed to reset PPM! Trying again..\n");
-
-			trace_ucsi_command(&ctrl);
-			ret = ucsi->ppm->cmd(ucsi->ppm, &ctrl);
-			if (ret)
-				goto err;
+		if (cci & ~UCSI_CCI_RESET_COMPLETE) {
+			ret = ucsi->ops->async_write(ucsi, UCSI_CONTROL,
+						     &command,
+						     sizeof(command));
+			if (ret < 0)
+				return ret;
 		}
 
-		/* Letting the PPM settle down. */
 		msleep(20);
+	} while (!(cci & UCSI_CCI_RESET_COMPLETE));
 
-		ret = -ETIMEDOUT;
-	} while (time_is_after_jiffies(tmo));
-
-err:
-	trace_ucsi_reset_ppm(&ctrl, ret);
-
-	return ret;
+	return 0;
 }
 
 static int ucsi_role_cmd(struct ucsi_connector *con, struct ucsi_control *ctrl)
@@ -1266,51 +1029,6 @@ void ucsi_unregister(struct ucsi *ucsi)
 }
 EXPORT_SYMBOL_GPL(ucsi_unregister);
 
-/**
- * ucsi_register_ppm - Register UCSI PPM Interface
- * @dev: Device interface to the PPM
- * @ppm: The PPM interface
- *
- * Allocates UCSI instance, associates it with @ppm and returns it to the
- * caller, and schedules initialization of the interface.
- */
-struct ucsi *ucsi_register_ppm(struct device *dev, struct ucsi_ppm *ppm)
-{
-	struct ucsi *ucsi;
-
-	ucsi = kzalloc(sizeof(*ucsi), GFP_KERNEL);
-	if (!ucsi)
-		return ERR_PTR(-ENOMEM);
-
-	INIT_WORK(&ucsi->work, ucsi_init_work);
-	init_completion(&ucsi->complete);
-	mutex_init(&ucsi->ppm_lock);
-
-	ucsi->dev = dev;
-	ucsi->ppm = ppm;
-
-	/*
-	 * Communication with the PPM takes a lot of time. It is not reasonable
-	 * to initialize the driver here. Using a work for now.
-	 */
-	queue_work(system_long_wq, &ucsi->work);
-
-	return ucsi;
-}
-EXPORT_SYMBOL_GPL(ucsi_register_ppm);
-
-/**
- * ucsi_unregister_ppm - Unregister UCSI PPM Interface
- * @ucsi: struct ucsi associated with the PPM
- *
- * Unregister UCSI PPM that was created with ucsi_register().
- */
-void ucsi_unregister_ppm(struct ucsi *ucsi)
-{
-	ucsi_unregister(ucsi);
-}
-EXPORT_SYMBOL_GPL(ucsi_unregister_ppm);
-
 MODULE_AUTHOR("Heikki Krogerus <heikki.krogerus@linux.intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("USB Type-C Connector System Software Interface driver");
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index d8a8e8f2f912..29f9e7f0d212 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -398,54 +398,13 @@ struct ucsi_connector_status {
 
 /* -------------------------------------------------------------------------- */
 
-struct ucsi;
-
-struct ucsi_data {
-	u16 version;
-	u16 reserved;
-	union {
-		u32 raw_cci;
-		struct ucsi_cci cci;
-	};
-	struct ucsi_control ctrl;
-	u32 message_in[4];
-	u32 message_out[4];
-} __packed;
-
-/*
- * struct ucsi_ppm - Interface to UCSI Platform Policy Manager
- * @data: memory location to the UCSI data structures
- * @cmd: UCSI command execution routine
- * @sync: Refresh UCSI mailbox (the data structures)
- */
-struct ucsi_ppm {
-	struct ucsi_data *data;
-	int (*cmd)(struct ucsi_ppm *, struct ucsi_control *);
-	int (*sync)(struct ucsi_ppm *);
-};
-
-struct ucsi *ucsi_register_ppm(struct device *dev, struct ucsi_ppm *ppm);
-void ucsi_unregister_ppm(struct ucsi *ucsi);
-void ucsi_notify(struct ucsi *ucsi);
-
-/* -------------------------------------------------------------------------- */
-
-enum ucsi_status {
-	UCSI_IDLE = 0,
-	UCSI_BUSY,
-	UCSI_ERROR,
-};
-
 struct ucsi {
 	u16 version;
 	struct device *dev;
-	struct ucsi_ppm *ppm;
 	struct driver_data *driver_data;
 
 	const struct ucsi_operations *ops;
 
-	enum ucsi_status status;
-	struct completion complete;
 	struct ucsi_capability cap;
 	struct ucsi_connector *connector;
 
-- 
2.23.0

