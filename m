Return-Path: <linux-usb+bounces-31678-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 891E2CD686A
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 16:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55A3C30F92F2
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 15:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5FD132D0D6;
	Mon, 22 Dec 2025 15:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8LZUQCe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3790E32BF23;
	Mon, 22 Dec 2025 15:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766416958; cv=none; b=a9p2tAjO+kkeFathIRTCImJTU7+UNa2Apvua8rWd43z7egazngHmLgh821+t0X5gHTWy6VVy+1dFjCvkPt6lgmSMQ4662210dU67+uQzGSsm7BQnmTvrj6i1qssVBFnYHwXlRigNAwl+amTKSHz5LVTmTMncAJNVZKbAufcQHbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766416958; c=relaxed/simple;
	bh=S9dQt4V9H1LdWeFjh2aiXHtKGCoSOnWyofwOkzggtPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SV/9mlAqaPNzEt0L0dGJ/2pSIRp4dM3Klx0dtbPUL2rxGcX5t0s+xCpyWtWWnp+LpbBEHWYVeOvLQlJecMpiSFp79n7FY+7SDWJCczZjGXvxkl6F4H4MTepE9dCXZ07wvAVEm1b6fEV2s0yBwop444GqYuMCQnmF2JH/EnmqrVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8LZUQCe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED33C2BC87;
	Mon, 22 Dec 2025 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766416957;
	bh=S9dQt4V9H1LdWeFjh2aiXHtKGCoSOnWyofwOkzggtPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m8LZUQCenUv85CPHL/PwYDiVHw0osl8KQQbj+Ysl5Ltjp2REP3l4gFv9XnrVffwxd
	 JG7EYYNbgpv4EQW0h4YsBo/kTySp8h4XNq3DyckS1KyeovcESWLNgWNAyUP+SQyLlF
	 AY0rp9wyXPH3Nc8e+sB9ufU9+OY6wzqQYmgkG056X9xshptejuxwSxyP1+mlIwOSxr
	 JM0hdnQ3BrmJOPgQWd7OVAy2r7D8MCDSMPEYq/m83nRmGMxs9jwfJwJ2SAcucvNQzy
	 DHTBfcyt7FmNWejCNqqDUjvrTC5NnzeN/E6tBwdoL/3AKzV/FB/4wNcrvMavukG0Ds
	 0uDyclXFNgCGw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vXhkB-000000000km-1SjH;
	Mon, 22 Dec 2025 16:22:43 +0100
From: Johan Hovold <johan@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pooja Katiyar <pooja.katiyar@intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/4] Revert "usb: typec: ucsi: Update UCSI structure to have message in and message out fields"
Date: Mon, 22 Dec 2025 16:22:04 +0100
Message-ID: <20251222152204.2846-5-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251222152204.2846-1-johan@kernel.org>
References: <20251222152204.2846-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 3e082978c33151d576694deac8abde021ea669a8.

The new buffer management code has not been tested or reviewed properly
and breaks boot of machines like the Lenovo ThinkPad X13s:

    Unable to handle kernel NULL pointer dereference at virtual address
    0000000000000000

    CPU: 0 UID: 0 PID: 813 Comm: kworker/0:3 Not tainted 6.19.0-rc2 #26 PREEMPT
    Hardware name: LENOVO 21BYZ9SRUS/21BYZ9SRUS, BIOS N3HET87W (1.59 ) 12/05/2023
    Workqueue: events ucsi_handle_connector_change [typec_ucsi]

    Call trace:
     ucsi_sync_control_common+0xe4/0x1ec [typec_ucsi] (P)
     ucsi_run_command+0xcc/0x194 [typec_ucsi]
     ucsi_send_command_common+0x84/0x2a0 [typec_ucsi]
     ucsi_get_connector_status+0x48/0x78 [typec_ucsi]
     ucsi_handle_connector_change+0x5c/0x4f4 [typec_ucsi]
     process_one_work+0x208/0x60c
     worker_thread+0x244/0x388

The new code completely ignores concurrency so that the message length
can be updated while a transaction is ongoing. In the above case, the
length ends up being modified by another thread while processing an ack
so that the NULL cci pointer is dereferenced.

Fixing this will require designing a proper interface for managing these
transactions, something which most likely involves reverting most of the
offending commit anyway.

Revert the broken code to fix the regression and let Intel come up with
a properly tested implementation for a later kernel.

Fixes: 3e082978c331 ("usb: typec: ucsi: Update UCSI structure to have message in and message out fields")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c   |   5 +-
 drivers/usb/typec/ucsi/debugfs.c        |   9 +-
 drivers/usb/typec/ucsi/displayport.c    |  11 +--
 drivers/usb/typec/ucsi/ucsi.c           | 104 ++++++++----------------
 drivers/usb/typec/ucsi/ucsi.h           |  19 ++---
 drivers/usb/typec/ucsi/ucsi_acpi.c      |   9 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c       |  11 +--
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c |  15 ++--
 8 files changed, 71 insertions(+), 112 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index d753f2188e25..eed2a7d0ebc6 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -105,12 +105,13 @@ static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
 	return 0;
 }
 
-static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci)
+static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci,
+				  void *data, size_t size)
 {
 	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
 	int ret;
 
-	ret = ucsi_sync_control_common(ucsi, cmd, cci);
+	ret = ucsi_sync_control_common(ucsi, cmd, cci, data, size);
 	switch (ret) {
 	case -EBUSY:
 		/* EC may return -EBUSY if CCI.busy is set.
diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index 924f93027553..f3684ab787fe 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -37,8 +37,7 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_SET_USB:
 	case UCSI_SET_POWER_LEVEL:
 	case UCSI_READ_POWER_LEVEL:
-		ucsi->message_in_size = 0;
-		ret = ucsi_send_command(ucsi, val);
+		ret = ucsi_send_command(ucsi, val, NULL, 0);
 		break;
 	case UCSI_GET_CAPABILITY:
 	case UCSI_GET_CONNECTOR_CAPABILITY:
@@ -53,9 +52,9 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_GET_ATTENTION_VDO:
 	case UCSI_GET_CAM_CS:
 	case UCSI_GET_LPM_PPM_INFO:
-		ucsi->message_in_size = sizeof(ucsi->debugfs->response);
-		ret = ucsi_send_command(ucsi, val);
-		memcpy(&ucsi->debugfs->response, ucsi->message_in, sizeof(ucsi->debugfs->response));
+		ret = ucsi_send_command(ucsi, val,
+					&ucsi->debugfs->response,
+					sizeof(ucsi->debugfs->response));
 		break;
 	default:
 		ret = -EOPNOTSUPP;
diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index a09b4900ec76..8aae80b457d7 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -67,14 +67,11 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 	}
 
 	command = UCSI_GET_CURRENT_CAM | UCSI_CONNECTOR_NUMBER(dp->con->num);
-	ucsi->message_in_size = sizeof(cur);
-	ret = ucsi_send_command(ucsi, command);
+	ret = ucsi_send_command(ucsi, command, &cur, sizeof(cur));
 	if (ret < 0) {
 		if (ucsi->version > 0x0100)
 			goto err_unlock;
 		cur = 0xff;
-	} else {
-		memcpy(&cur, ucsi->message_in, ucsi->message_in_size);
 	}
 
 	if (cur != 0xff) {
@@ -129,8 +126,7 @@ static int ucsi_displayport_exit(struct typec_altmode *alt)
 	}
 
 	command = UCSI_CMD_SET_NEW_CAM(dp->con->num, 0, dp->offset, 0);
-	dp->con->ucsi->message_in_size = 0;
-	ret = ucsi_send_command(dp->con->ucsi, command);
+	ret = ucsi_send_command(dp->con->ucsi, command, NULL, 0);
 	if (ret < 0)
 		goto out_unlock;
 
@@ -197,8 +193,7 @@ static int ucsi_displayport_configure(struct ucsi_dp *dp)
 
 	command = UCSI_CMD_SET_NEW_CAM(dp->con->num, 1, dp->offset, pins);
 
-	dp->con->ucsi->message_in_size = 0;
-	return ucsi_send_command(dp->con->ucsi, command);
+	return ucsi_send_command(dp->con->ucsi, command, NULL, 0);
 }
 
 static int ucsi_displayport_vdm(struct typec_altmode *alt,
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 819540713150..a7b388dc7fa0 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -55,7 +55,8 @@ void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
 }
 EXPORT_SYMBOL_GPL(ucsi_notify_common);
 
-int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci)
+int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
+			     void *data, size_t size)
 {
 	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
 	int ret;
@@ -83,10 +84,9 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci)
 	if (!ret && cci)
 		ret = ucsi->ops->read_cci(ucsi, cci);
 
-	if (!ret && ucsi->message_in_size > 0 &&
+	if (!ret && data &&
 	    (*cci & UCSI_CCI_COMMAND_COMPLETE))
-		ret = ucsi->ops->read_message_in(ucsi, ucsi->message_in,
-						 ucsi->message_in_size);
+		ret = ucsi->ops->read_message_in(ucsi, data, size);
 
 	return ret;
 }
@@ -103,25 +103,23 @@ static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 		ctrl |= UCSI_ACK_CONNECTOR_CHANGE;
 	}
 
-	ucsi->message_in_size = 0;
-	return ucsi->ops->sync_control(ucsi, ctrl, NULL);
+	return ucsi->ops->sync_control(ucsi, ctrl, NULL, NULL, 0);
 }
 
-static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci, bool conn_ack)
+static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
+			    void *data, size_t size, bool conn_ack)
 {
 	int ret, err;
 
 	*cci = 0;
 
-	if (ucsi->message_in_size > UCSI_MAX_DATA_LENGTH(ucsi))
+	if (size > UCSI_MAX_DATA_LENGTH(ucsi))
 		return -EINVAL;
 
-	ret = ucsi->ops->sync_control(ucsi, command, cci);
+	ret = ucsi->ops->sync_control(ucsi, command, cci, data, size);
 
-	if (*cci & UCSI_CCI_BUSY) {
-		ucsi->message_in_size = 0;
-		return ucsi_run_command(ucsi, UCSI_CANCEL, cci, false) ?: -EBUSY;
-	}
+	if (*cci & UCSI_CCI_BUSY)
+		return ucsi_run_command(ucsi, UCSI_CANCEL, cci, NULL, 0, false) ?: -EBUSY;
 	if (ret)
 		return ret;
 
@@ -153,13 +151,10 @@ static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
 	int ret;
 
 	command = UCSI_GET_ERROR_STATUS | UCSI_CONNECTOR_NUMBER(connector_num);
-	ucsi->message_in_size = sizeof(error);
-	ret = ucsi_run_command(ucsi, command, &cci, false);
+	ret = ucsi_run_command(ucsi, command, &cci, &error, sizeof(error), false);
 	if (ret < 0)
 		return ret;
 
-	memcpy(&error, ucsi->message_in, sizeof(error));
-
 	switch (error) {
 	case UCSI_ERROR_INCOMPATIBLE_PARTNER:
 		return -EOPNOTSUPP;
@@ -205,7 +200,8 @@ static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
 	return -EIO;
 }
 
-static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd, bool conn_ack)
+static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
+				    void *data, size_t size, bool conn_ack)
 {
 	u8 connector_num;
 	u32 cci;
@@ -233,7 +229,7 @@ static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd, bool conn_ack)
 
 	mutex_lock(&ucsi->ppm_lock);
 
-	ret = ucsi_run_command(ucsi, cmd, &cci, conn_ack);
+	ret = ucsi_run_command(ucsi, cmd, &cci, data, size, conn_ack);
 
 	if (cci & UCSI_CCI_ERROR)
 		ret = ucsi_read_error(ucsi, connector_num);
@@ -242,9 +238,10 @@ static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd, bool conn_ack)
 	return ret;
 }
 
-int ucsi_send_command(struct ucsi *ucsi, u64 command)
+int ucsi_send_command(struct ucsi *ucsi, u64 command,
+		      void *data, size_t size)
 {
-	return ucsi_send_command_common(ucsi, command, false);
+	return ucsi_send_command_common(ucsi, command, data, size, false);
 }
 EXPORT_SYMBOL_GPL(ucsi_send_command);
 
@@ -322,8 +319,7 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
 	int i;
 
 	command = UCSI_GET_CURRENT_CAM | UCSI_CONNECTOR_NUMBER(con->num);
-	con->ucsi->message_in_size = sizeof(cur);
-	ret = ucsi_send_command(con->ucsi, command);
+	ret = ucsi_send_command(con->ucsi, command, &cur, sizeof(cur));
 	if (ret < 0) {
 		if (con->ucsi->version > 0x0100) {
 			dev_err(con->ucsi->dev,
@@ -331,8 +327,6 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
 			return;
 		}
 		cur = 0xff;
-	} else {
-		memcpy(&cur, con->ucsi->message_in, sizeof(cur));
 	}
 
 	if (cur < UCSI_MAX_ALTMODES)
@@ -516,8 +510,7 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
 		command |= UCSI_GET_ALTMODE_RECIPIENT(recipient);
 		command |= UCSI_GET_ALTMODE_CONNECTOR_NUMBER(con->num);
 		command |= UCSI_GET_ALTMODE_OFFSET(i);
-		ucsi->message_in_size = sizeof(alt);
-		len = ucsi_send_command(con->ucsi, command);
+		len = ucsi_send_command(con->ucsi, command, &alt, sizeof(alt));
 		/*
 		 * We are collecting all altmodes first and then registering.
 		 * Some type-C device will return zero length data beyond last
@@ -526,8 +519,6 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
 		if (len < 0)
 			return len;
 
-		memcpy(&alt, ucsi->message_in, sizeof(alt));
-
 		/* We got all altmodes, now break out and register them */
 		if (!len || !alt.svid)
 			break;
@@ -595,15 +586,12 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 		command |= UCSI_GET_ALTMODE_RECIPIENT(recipient);
 		command |= UCSI_GET_ALTMODE_CONNECTOR_NUMBER(con->num);
 		command |= UCSI_GET_ALTMODE_OFFSET(i);
-		con->ucsi->message_in_size = sizeof(alt);
-		len = ucsi_send_command(con->ucsi, command);
+		len = ucsi_send_command(con->ucsi, command, alt, sizeof(alt));
 		if (len == -EBUSY)
 			continue;
 		if (len <= 0)
 			return len;
 
-		memcpy(&alt, con->ucsi->message_in, sizeof(alt));
-
 		/*
 		 * This code is requesting one alt mode at a time, but some PPMs
 		 * may still return two. If that happens both alt modes need be
@@ -671,9 +659,7 @@ static int ucsi_get_connector_status(struct ucsi_connector *con, bool conn_ack)
 			  UCSI_MAX_DATA_LENGTH(con->ucsi));
 	int ret;
 
-	con->ucsi->message_in_size = size;
-	ret = ucsi_send_command_common(con->ucsi, command, conn_ack);
-	memcpy(&con->status, con->ucsi->message_in, size);
+	ret = ucsi_send_command_common(con->ucsi, command, &con->status, size, conn_ack);
 
 	return ret < 0 ? ret : 0;
 }
@@ -696,9 +682,8 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
 	command |= UCSI_GET_PDOS_PDO_OFFSET(offset);
 	command |= UCSI_GET_PDOS_NUM_PDOS(num_pdos - 1);
 	command |= is_source(role) ? UCSI_GET_PDOS_SRC_PDOS : 0;
-	ucsi->message_in_size = num_pdos * sizeof(u32);
-	ret = ucsi_send_command(ucsi, command);
-	memcpy(pdos + offset, ucsi->message_in, num_pdos * sizeof(u32));
+	ret = ucsi_send_command(ucsi, command, pdos + offset,
+				num_pdos * sizeof(u32));
 	if (ret < 0 && ret != -ETIMEDOUT)
 		dev_err(ucsi->dev, "UCSI_GET_PDOS failed (%d)\n", ret);
 
@@ -785,9 +770,7 @@ static int ucsi_get_pd_message(struct ucsi_connector *con, u8 recipient,
 		command |= UCSI_GET_PD_MESSAGE_BYTES(len);
 		command |= UCSI_GET_PD_MESSAGE_TYPE(type);
 
-		con->ucsi->message_in_size = len;
-		ret = ucsi_send_command(con->ucsi, command);
-		memcpy(data + offset, con->ucsi->message_in, len);
+		ret = ucsi_send_command(con->ucsi, command, data + offset, len);
 		if (ret < 0)
 			return ret;
 	}
@@ -952,9 +935,7 @@ static int ucsi_register_cable(struct ucsi_connector *con)
 	int ret;
 
 	command = UCSI_GET_CABLE_PROPERTY | UCSI_CONNECTOR_NUMBER(con->num);
-	con->ucsi->message_in_size = sizeof(cable_prop);
-	ret = ucsi_send_command(con->ucsi, command);
-	memcpy(&cable_prop, con->ucsi->message_in, sizeof(cable_prop));
+	ret = ucsi_send_command(con->ucsi, command, &cable_prop, sizeof(cable_prop));
 	if (ret < 0) {
 		dev_err(con->ucsi->dev, "GET_CABLE_PROPERTY failed (%d)\n", ret);
 		return ret;
@@ -1015,9 +996,7 @@ static int ucsi_check_connector_capability(struct ucsi_connector *con)
 		return 0;
 
 	command = UCSI_GET_CONNECTOR_CAPABILITY | UCSI_CONNECTOR_NUMBER(con->num);
-	con->ucsi->message_in_size = sizeof(con->cap);
-	ret = ucsi_send_command(con->ucsi, command);
-	memcpy(&con->cap, con->ucsi->message_in, sizeof(con->cap));
+	ret = ucsi_send_command(con->ucsi, command, &con->cap, sizeof(con->cap));
 	if (ret < 0) {
 		dev_err(con->ucsi->dev, "GET_CONNECTOR_CAPABILITY failed (%d)\n", ret);
 		return ret;
@@ -1401,8 +1380,7 @@ static int ucsi_reset_connector(struct ucsi_connector *con, bool hard)
 	else if (con->ucsi->version >= UCSI_VERSION_2_0)
 		command |= hard ? 0 : UCSI_CONNECTOR_RESET_DATA_VER_2_0;
 
-	con->ucsi->message_in_size = 0;
-	return ucsi_send_command(con->ucsi, command);
+	return ucsi_send_command(con->ucsi, command, NULL, 0);
 }
 
 static int ucsi_reset_ppm(struct ucsi *ucsi)
@@ -1483,8 +1461,7 @@ static int ucsi_role_cmd(struct ucsi_connector *con, u64 command)
 {
 	int ret;
 
-	con->ucsi->message_in_size = 0;
-	ret = ucsi_send_command(con->ucsi, command);
+	ret = ucsi_send_command(con->ucsi, command, NULL, 0);
 	if (ret == -ETIMEDOUT) {
 		u64 c;
 
@@ -1492,8 +1469,7 @@ static int ucsi_role_cmd(struct ucsi_connector *con, u64 command)
 		ucsi_reset_ppm(con->ucsi);
 
 		c = UCSI_SET_NOTIFICATION_ENABLE | con->ucsi->ntfy;
-		con->ucsi->message_in_size = 0;
-		ucsi_send_command(con->ucsi, c);
+		ucsi_send_command(con->ucsi, c, NULL, 0);
 
 		ucsi_reset_connector(con, true);
 	}
@@ -1646,13 +1622,10 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	/* Get connector capability */
 	command = UCSI_GET_CONNECTOR_CAPABILITY;
 	command |= UCSI_CONNECTOR_NUMBER(con->num);
-	ucsi->message_in_size = sizeof(con->cap);
-	ret = ucsi_send_command(ucsi, command);
+	ret = ucsi_send_command(ucsi, command, &con->cap, sizeof(con->cap));
 	if (ret < 0)
 		goto out_unlock;
 
-	memcpy(&con->cap, ucsi->message_in, sizeof(con->cap));
-
 	if (UCSI_CONCAP(con, OPMODE_DRP))
 		cap->data = TYPEC_PORT_DRD;
 	else if (UCSI_CONCAP(con, OPMODE_DFP))
@@ -1849,20 +1822,17 @@ static int ucsi_init(struct ucsi *ucsi)
 	/* Enable basic notifications */
 	ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
 	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
-	ucsi->message_in_size = 0;
-	ret = ucsi_send_command(ucsi, command);
+	ret = ucsi_send_command(ucsi, command, NULL, 0);
 	if (ret < 0)
 		goto err_reset;
 
 	/* Get PPM capabilities */
 	command = UCSI_GET_CAPABILITY;
-	ucsi->message_in_size = BITS_TO_BYTES(UCSI_GET_CAPABILITY_SIZE);
-	ret = ucsi_send_command(ucsi, command);
+	ret = ucsi_send_command(ucsi, command, &ucsi->cap,
+				BITS_TO_BYTES(UCSI_GET_CAPABILITY_SIZE));
 	if (ret < 0)
 		goto err_reset;
 
-	memcpy(&ucsi->cap, ucsi->message_in, BITS_TO_BYTES(UCSI_GET_CAPABILITY_SIZE));
-
 	if (!ucsi->cap.num_connectors) {
 		ret = -ENODEV;
 		goto err_reset;
@@ -1892,8 +1862,7 @@ static int ucsi_init(struct ucsi *ucsi)
 	/* Enable all supported notifications */
 	ntfy = ucsi_get_supported_notifications(ucsi);
 	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
-	ucsi->message_in_size = 0;
-	ret = ucsi_send_command(ucsi, command);
+	ret = ucsi_send_command(ucsi, command, NULL, 0);
 	if (ret < 0)
 		goto err_unregister;
 
@@ -1944,8 +1913,7 @@ static void ucsi_resume_work(struct work_struct *work)
 
 	/* Restore UCSI notification enable mask after system resume */
 	command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
-	ucsi->message_in_size = 0;
-	ret = ucsi_send_command(ucsi, command);
+	ret = ucsi_send_command(ucsi, command, NULL, 0);
 	if (ret < 0) {
 		dev_err(ucsi->dev, "failed to re-enable notifications (%d)\n", ret);
 		return;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 479bf1f69c72..410389ef173a 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -29,10 +29,6 @@ struct dentry;
 #define UCSI_MESSAGE_OUT		32
 #define UCSIv2_MESSAGE_OUT		272
 
-/* Define maximum lengths for message buffers */
-#define UCSI_MAX_MESSAGE_IN_LENGTH	256
-#define UCSI_MAX_MESSAGE_OUT_LENGTH	256
-
 /* UCSI versions */
 #define UCSI_VERSION_1_0	0x0100
 #define UCSI_VERSION_1_1	0x0110
@@ -84,7 +80,8 @@ struct ucsi_operations {
 	int (*read_cci)(struct ucsi *ucsi, u32 *cci);
 	int (*poll_cci)(struct ucsi *ucsi, u32 *cci);
 	int (*read_message_in)(struct ucsi *ucsi, void *val, size_t val_len);
-	int (*sync_control)(struct ucsi *ucsi, u64 command, u32 *cci);
+	int (*sync_control)(struct ucsi *ucsi, u64 command, u32 *cci,
+			    void *data, size_t size);
 	int (*async_control)(struct ucsi *ucsi, u64 command);
 	bool (*update_altmodes)(struct ucsi *ucsi, u8 recipient,
 				struct ucsi_altmode *orig,
@@ -496,12 +493,6 @@ struct ucsi {
 	unsigned long quirks;
 #define UCSI_NO_PARTNER_PDOS	BIT(0)	/* Don't read partner's PDOs */
 #define UCSI_DELAY_DEVICE_PDOS	BIT(1)	/* Reading PDOs fails until the parter is in PD mode */
-
-	/* Fixed-size buffers for incoming and outgoing messages */
-	u8 message_in[UCSI_MAX_MESSAGE_IN_LENGTH];
-	size_t message_in_size;
-	u8 message_out[UCSI_MAX_MESSAGE_OUT_LENGTH];
-	size_t message_out_size;
 };
 
 #define UCSI_MAX_DATA_LENGTH(u) (((u)->version < UCSI_VERSION_2_0) ? 0x10 : 0xff)
@@ -564,13 +555,15 @@ struct ucsi_connector {
 	struct usb_pd_identity cable_identity;
 };
 
-int ucsi_send_command(struct ucsi *ucsi, u64 command);
+int ucsi_send_command(struct ucsi *ucsi, u64 command,
+		      void *retval, size_t size);
 
 void ucsi_altmode_update_active(struct ucsi_connector *con);
 int ucsi_resume(struct ucsi *ucsi);
 
 void ucsi_notify_common(struct ucsi *ucsi, u32 cci);
-int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci);
+int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
+			     void *data, size_t size);
 
 #if IS_ENABLED(CONFIG_POWER_SUPPLY)
 int ucsi_register_port_psy(struct ucsi_connector *con);
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index f1d1f6917b09..6b92f296e985 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -105,14 +105,15 @@ static const struct ucsi_operations ucsi_acpi_ops = {
 	.async_control = ucsi_acpi_async_control
 };
 
-static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *cci)
+static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
+				  void *val, size_t len)
 {
 	u16 bogus_change = UCSI_CONSTAT_POWER_LEVEL_CHANGE |
 			   UCSI_CONSTAT_PDOS_CHANGE;
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
 	int ret;
 
-	ret = ucsi_sync_control_common(ucsi, command, cci);
+	ret = ucsi_sync_control_common(ucsi, command, cci, val, len);
 	if (ret < 0)
 		return ret;
 
@@ -124,8 +125,8 @@ static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *cci)
 	if (UCSI_COMMAND(ua->cmd) == UCSI_GET_CONNECTOR_STATUS &&
 	    ua->check_bogus_event) {
 		/* Clear the bogus change */
-		if (*(u16 *)ucsi->message_in == bogus_change)
-			*(u16 *)ucsi->message_in = 0;
+		if (*(u16 *)val == bogus_change)
+			*(u16 *)val = 0;
 
 		ua->check_bogus_event = false;
 	}
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index ead1b2a25c79..d83a0051c737 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -606,7 +606,8 @@ static int ucsi_ccg_async_control(struct ucsi *ucsi, u64 command)
 	return ccg_write(uc, reg, (u8 *)&command, sizeof(command));
 }
 
-static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci)
+static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
+				 void *data, size_t size)
 {
 	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
 	struct ucsi_connector *con;
@@ -628,16 +629,16 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci)
 		ucsi_ccg_update_set_new_cam_cmd(uc, con, &command);
 	}
 
-	ret = ucsi_sync_control_common(ucsi, command, cci);
+	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
 
 	switch (UCSI_COMMAND(command)) {
 	case UCSI_GET_CURRENT_CAM:
 		if (uc->has_multiple_dp)
-			ucsi_ccg_update_get_current_cam_cmd(uc, (u8 *)ucsi->message_in);
+			ucsi_ccg_update_get_current_cam_cmd(uc, (u8 *)data);
 		break;
 	case UCSI_GET_ALTERNATE_MODES:
 		if (UCSI_ALTMODE_RECIPIENT(command) == UCSI_RECIPIENT_SOP) {
-			struct ucsi_altmode *alt = (struct ucsi_altmode *)ucsi->message_in;
+			struct ucsi_altmode *alt = data;
 
 			if (alt[0].svid == USB_TYPEC_NVIDIA_VLINK_SID)
 				ucsi_ccg_nvidia_altmode(uc, alt, command);
@@ -645,7 +646,7 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci)
 		break;
 	case UCSI_GET_CAPABILITY:
 		if (uc->fw_build == CCG_FW_BUILD_NVIDIA_TEGRA) {
-			struct ucsi_capability *cap = (struct ucsi_capability *)ucsi->message_in;
+			struct ucsi_capability *cap = data;
 
 			cap->features &= ~UCSI_CAP_ALT_MODE_DETAILS;
 		}
diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 299081444caa..0187c1c4b21a 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -88,7 +88,8 @@ static int yoga_c630_ucsi_async_control(struct ucsi *ucsi, u64 command)
 
 static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
 				       u64 command,
-				       u32 *cci)
+				       u32 *cci,
+				       void *data, size_t size)
 {
 	int ret;
 
@@ -106,8 +107,8 @@ static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
 		};
 
 		dev_dbg(ucsi->dev, "faking DP altmode for con1\n");
-		memset(ucsi->message_in, 0, ucsi->message_in_size);
-		memcpy(ucsi->message_in, &alt, min(sizeof(alt), ucsi->message_in_size));
+		memset(data, 0, size);
+		memcpy(data, &alt, min(sizeof(alt), size));
 		*cci = UCSI_CCI_COMMAND_COMPLETE | UCSI_SET_CCI_LENGTH(sizeof(alt));
 		return 0;
 	}
@@ -120,18 +121,18 @@ static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
 	if (UCSI_COMMAND(command) == UCSI_GET_ALTERNATE_MODES &&
 	    UCSI_GET_ALTMODE_GET_CONNECTOR_NUMBER(command) == 2) {
 		dev_dbg(ucsi->dev, "ignoring altmodes for con2\n");
-		memset(ucsi->message_in, 0, ucsi->message_in_size);
+		memset(data, 0, size);
 		*cci = UCSI_CCI_COMMAND_COMPLETE;
 		return 0;
 	}
 
-	ret = ucsi_sync_control_common(ucsi, command, cci);
+	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
 	if (ret < 0)
 		return ret;
 
 	/* UCSI_GET_CURRENT_CAM is off-by-one on all ports */
-	if (UCSI_COMMAND(command) == UCSI_GET_CURRENT_CAM && ucsi->message_in_size > 0)
-		ucsi->message_in[0]--;
+	if (UCSI_COMMAND(command) == UCSI_GET_CURRENT_CAM && data)
+		((u8 *)data)[0]--;
 
 	return ret;
 }
-- 
2.51.2


