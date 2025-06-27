Return-Path: <linux-usb+bounces-25195-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 503B0AEBEE3
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 20:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 906E55617E4
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 18:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF642EB5BD;
	Fri, 27 Jun 2025 18:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7cEiZC+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3573B15E8B
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 18:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751047832; cv=none; b=Iz3fKpH5+ta0XaA2Vvm4NG5/hlVg0rDHv6FwEpYi498F723HChSQudVa/a8DGDBgbvXeJqYIELEgKIOIyucTpcGvB+61Q8kN0JutZL6D3EuWQ/hBUioH/XQblP0ccnatYUOeMDnc+S4dgzPfVMWkaMJnvqsCVgnX3hZHZMnNj2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751047832; c=relaxed/simple;
	bh=l2KyhQtMEGG/ZFt62B3g/dLKy8bpKsh/hI5vjaqrSI8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tFx5tRZvDBQO45O8LqL4JFUlt8CDBnIXq1/p745rKHeh9Knu8pbhkvEBB0Udwv2llxaQijNGKtHxFJdySdYnF/84v7w2jv4B8tpbT7ijUUtYKcuGwpC4YXVQ+dPvwWmb7rcggmTlSeuiPfhHcYhfcqSY+vu+a74KMO20Du+qQec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7cEiZC+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751047830; x=1782583830;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l2KyhQtMEGG/ZFt62B3g/dLKy8bpKsh/hI5vjaqrSI8=;
  b=D7cEiZC+koav6V0M76bhbxnNF4j3aZ82qijBBoxMS/Nqkl1i73KZ/ybs
   Dkqe8eSH8495BbsSo6UtxVoLEDEeVTqj6mQp+C5tmDx+Pp3TvaiSIT6Z9
   8Xu+psHR65opQ+BLaUrdtKAwpBpxUvs3FAGz6krcCPYOUAyIVUp8xGNmV
   W3M6N8+TENl52IZ2p3F5/fPvDXoeYMvM+dKSk6k8jP5IvbOGNFR/BNlDM
   l3gJKks6MPweA0sK7iYMhGBbUPHGtUdCyosPdCMpX/pasVUOMRUCRCDcw
   kP3d44G37a1CWWTM+Pyy5v9KlkEnqJ8s+mB47AWEc6V27oD4DCgsDUGuZ
   Q==;
X-CSE-ConnectionGUID: MNGTNts/QWeTz+qU2gdALA==
X-CSE-MsgGUID: EtOE7gV2QHKaSaEvjSH4jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53309996"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="53309996"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 11:10:29 -0700
X-CSE-ConnectionGUID: Mq8SD2fFS6Wg9d4fDegjdQ==
X-CSE-MsgGUID: WbN8Amb2QCikZ2qPQMNzqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="183773582"
Received: from pooja-lin-vm.fm.intel.com ([10.80.128.159])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jun 2025 11:10:29 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com,
	dmitry.baryshkov@oss.qualcomm.com,
	pooja.katiyar@intel.com
Subject: [PATCH v2 1/3] usb: typec: ucsi: Add support for message out data structure
Date: Fri, 27 Jun 2025 11:10:10 -0700
Message-Id: <cc0b7701c4ea3d1001fefeb3df65caeb3e624722.1751042810.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1751042810.git.pooja.katiyar@intel.com>
References: <cover.1751042810.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for updating message out data structure for UCSI ACPI
interface for UCSI 2.1 and UCSI 3.0 commands such as Set PDOs and
LPM Firmware Update.

Additionally, update ucsi_send_command to accept message_out data
and .sync_control function to pass message_out data to
write_message_out function if the command is UCSI_SET_PDOS.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
Changelog v2:
- Moved write_message_out operation to .sync_control.
- Updated ucsi_send_command to accept message_out data.

 drivers/usb/typec/ucsi/cros_ec_ucsi.c |  4 +-
 drivers/usb/typec/ucsi/debugfs.c      |  4 +-
 drivers/usb/typec/ucsi/displayport.c  |  6 +--
 drivers/usb/typec/ucsi/ucsi.c         | 64 ++++++++++++++++-----------
 drivers/usb/typec/ucsi/ucsi.h         | 10 +++--
 drivers/usb/typec/ucsi/ucsi_acpi.c    | 20 ++++++++-
 drivers/usb/typec/ucsi/ucsi_ccg.c     |  4 +-
 7 files changed, 72 insertions(+), 40 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index 4ec1c6d22310..53caa354461b 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -106,12 +106,12 @@ static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
 }
 
 static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci,
-				  void *data, size_t size)
+				  void *data, size_t size, void *message_out)
 {
 	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
 	int ret;
 
-	ret = ucsi_sync_control_common(ucsi, cmd, cci, data, size);
+	ret = ucsi_sync_control_common(ucsi, cmd, cci, data, size, message_out);
 	switch (ret) {
 	case -EBUSY:
 		/* EC may return -EBUSY if CCI.busy is set.
diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index 92ebf1a2defd..c3c349e712d0 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -35,7 +35,7 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_SET_SINK_PATH:
 	case UCSI_SET_NEW_CAM:
 	case UCSI_SET_USB:
-		ret = ucsi_send_command(ucsi, val, NULL, 0);
+		ret = ucsi_send_command(ucsi, val, NULL, 0, NULL);
 		break;
 	case UCSI_GET_CAPABILITY:
 	case UCSI_GET_CONNECTOR_CAPABILITY:
@@ -52,7 +52,7 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_GET_LPM_PPM_INFO:
 		ret = ucsi_send_command(ucsi, val,
 					&ucsi->debugfs->response,
-					sizeof(ucsi->debugfs->response));
+					sizeof(ucsi->debugfs->response), NULL);
 		break;
 	default:
 		ret = -EOPNOTSUPP;
diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 8aae80b457d7..93912719d915 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -67,7 +67,7 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 	}
 
 	command = UCSI_GET_CURRENT_CAM | UCSI_CONNECTOR_NUMBER(dp->con->num);
-	ret = ucsi_send_command(ucsi, command, &cur, sizeof(cur));
+	ret = ucsi_send_command(ucsi, command, &cur, sizeof(cur), NULL);
 	if (ret < 0) {
 		if (ucsi->version > 0x0100)
 			goto err_unlock;
@@ -126,7 +126,7 @@ static int ucsi_displayport_exit(struct typec_altmode *alt)
 	}
 
 	command = UCSI_CMD_SET_NEW_CAM(dp->con->num, 0, dp->offset, 0);
-	ret = ucsi_send_command(dp->con->ucsi, command, NULL, 0);
+	ret = ucsi_send_command(dp->con->ucsi, command, NULL, 0, NULL);
 	if (ret < 0)
 		goto out_unlock;
 
@@ -193,7 +193,7 @@ static int ucsi_displayport_configure(struct ucsi_dp *dp)
 
 	command = UCSI_CMD_SET_NEW_CAM(dp->con->num, 1, dp->offset, pins);
 
-	return ucsi_send_command(dp->con->ucsi, command, NULL, 0);
+	return ucsi_send_command(dp->con->ucsi, command, NULL, 0, NULL);
 }
 
 static int ucsi_displayport_vdm(struct typec_altmode *alt,
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 01ce858a1a2b..c8410c88b45b 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -56,7 +56,7 @@ void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
 EXPORT_SYMBOL_GPL(ucsi_notify_common);
 
 int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
-			     void *data, size_t size)
+			     void *data, size_t size, void *message_out)
 {
 	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
 	int ret;
@@ -68,6 +68,18 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
 
 	reinit_completion(&ucsi->complete);
 
+	if (message_out) {
+		if (!ucsi->ops->write_message_out) {
+			ret = -EOPNOTSUPP;
+			goto out_clear_bit;
+		}
+
+		ret = ucsi->ops->write_message_out(ucsi, message_out,
+						   UCSI_COMMAND_DATA_LEN(command));
+		if (ret)
+			goto out_clear_bit;
+	}
+
 	ret = ucsi->ops->async_control(ucsi, command);
 	if (ret)
 		goto out_clear_bit;
@@ -103,11 +115,11 @@ static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 		ctrl |= UCSI_ACK_CONNECTOR_CHANGE;
 	}
 
-	return ucsi->ops->sync_control(ucsi, ctrl, NULL, NULL, 0);
+	return ucsi->ops->sync_control(ucsi, ctrl, NULL, NULL, 0, NULL);
 }
 
 static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
-			    void *data, size_t size, bool conn_ack)
+			    void *data, size_t size, bool conn_ack, void *message_out)
 {
 	int ret, err;
 
@@ -116,10 +128,10 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 	if (size > UCSI_MAX_DATA_LENGTH(ucsi))
 		return -EINVAL;
 
-	ret = ucsi->ops->sync_control(ucsi, command, cci, data, size);
+	ret = ucsi->ops->sync_control(ucsi, command, cci, data, size, message_out);
 
 	if (*cci & UCSI_CCI_BUSY)
-		return ucsi_run_command(ucsi, UCSI_CANCEL, cci, NULL, 0, false) ?: -EBUSY;
+		return ucsi_run_command(ucsi, UCSI_CANCEL, cci, NULL, 0, false, NULL) ?: -EBUSY;
 	if (ret)
 		return ret;
 
@@ -151,7 +163,7 @@ static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
 	int ret;
 
 	command = UCSI_GET_ERROR_STATUS | UCSI_CONNECTOR_NUMBER(connector_num);
-	ret = ucsi_run_command(ucsi, command, &cci, &error, sizeof(error), false);
+	ret = ucsi_run_command(ucsi, command, &cci, &error, sizeof(error), false, NULL);
 	if (ret < 0)
 		return ret;
 
@@ -201,7 +213,7 @@ static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
 }
 
 static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
-				    void *data, size_t size, bool conn_ack)
+				    void *data, size_t size, bool conn_ack, void *message_out)
 {
 	u8 connector_num;
 	u32 cci;
@@ -229,7 +241,7 @@ static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
 
 	mutex_lock(&ucsi->ppm_lock);
 
-	ret = ucsi_run_command(ucsi, cmd, &cci, data, size, conn_ack);
+	ret = ucsi_run_command(ucsi, cmd, &cci, data, size, conn_ack, message_out);
 
 	if (cci & UCSI_CCI_ERROR)
 		ret = ucsi_read_error(ucsi, connector_num);
@@ -239,9 +251,9 @@ static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
 }
 
 int ucsi_send_command(struct ucsi *ucsi, u64 command,
-		      void *data, size_t size)
+		      void *data, size_t size, void *message_out)
 {
-	return ucsi_send_command_common(ucsi, command, data, size, false);
+	return ucsi_send_command_common(ucsi, command, data, size, false, message_out);
 }
 EXPORT_SYMBOL_GPL(ucsi_send_command);
 
@@ -319,7 +331,7 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
 	int i;
 
 	command = UCSI_GET_CURRENT_CAM | UCSI_CONNECTOR_NUMBER(con->num);
-	ret = ucsi_send_command(con->ucsi, command, &cur, sizeof(cur));
+	ret = ucsi_send_command(con->ucsi, command, &cur, sizeof(cur), NULL);
 	if (ret < 0) {
 		if (con->ucsi->version > 0x0100) {
 			dev_err(con->ucsi->dev,
@@ -510,7 +522,7 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
 		command |= UCSI_GET_ALTMODE_RECIPIENT(recipient);
 		command |= UCSI_GET_ALTMODE_CONNECTOR_NUMBER(con->num);
 		command |= UCSI_GET_ALTMODE_OFFSET(i);
-		len = ucsi_send_command(con->ucsi, command, &alt, sizeof(alt));
+		len = ucsi_send_command(con->ucsi, command, &alt, sizeof(alt), NULL);
 		/*
 		 * We are collecting all altmodes first and then registering.
 		 * Some type-C device will return zero length data beyond last
@@ -587,7 +599,7 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 		command |= UCSI_GET_ALTMODE_RECIPIENT(recipient);
 		command |= UCSI_GET_ALTMODE_CONNECTOR_NUMBER(con->num);
 		command |= UCSI_GET_ALTMODE_OFFSET(i);
-		len = ucsi_send_command(con->ucsi, command, alt, sizeof(alt));
+		len = ucsi_send_command(con->ucsi, command, alt, sizeof(alt), NULL);
 		if (len == -EBUSY)
 			continue;
 		if (len <= 0)
@@ -660,7 +672,7 @@ static int ucsi_get_connector_status(struct ucsi_connector *con, bool conn_ack)
 			  UCSI_MAX_DATA_LENGTH(con->ucsi));
 	int ret;
 
-	ret = ucsi_send_command_common(con->ucsi, command, &con->status, size, conn_ack);
+	ret = ucsi_send_command_common(con->ucsi, command, &con->status, size, conn_ack, NULL);
 
 	return ret < 0 ? ret : 0;
 }
@@ -684,7 +696,7 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
 	command |= UCSI_GET_PDOS_NUM_PDOS(num_pdos - 1);
 	command |= is_source(role) ? UCSI_GET_PDOS_SRC_PDOS : 0;
 	ret = ucsi_send_command(ucsi, command, pdos + offset,
-				num_pdos * sizeof(u32));
+				num_pdos * sizeof(u32), NULL);
 	if (ret < 0 && ret != -ETIMEDOUT)
 		dev_err(ucsi->dev, "UCSI_GET_PDOS failed (%d)\n", ret);
 
@@ -771,7 +783,7 @@ static int ucsi_get_pd_message(struct ucsi_connector *con, u8 recipient,
 		command |= UCSI_GET_PD_MESSAGE_BYTES(len);
 		command |= UCSI_GET_PD_MESSAGE_TYPE(type);
 
-		ret = ucsi_send_command(con->ucsi, command, data + offset, len);
+		ret = ucsi_send_command(con->ucsi, command, data + offset, len, NULL);
 		if (ret < 0)
 			return ret;
 	}
@@ -936,7 +948,7 @@ static int ucsi_register_cable(struct ucsi_connector *con)
 	int ret;
 
 	command = UCSI_GET_CABLE_PROPERTY | UCSI_CONNECTOR_NUMBER(con->num);
-	ret = ucsi_send_command(con->ucsi, command, &cable_prop, sizeof(cable_prop));
+	ret = ucsi_send_command(con->ucsi, command, &cable_prop, sizeof(cable_prop), NULL);
 	if (ret < 0) {
 		dev_err(con->ucsi->dev, "GET_CABLE_PROPERTY failed (%d)\n", ret);
 		return ret;
@@ -997,7 +1009,7 @@ static int ucsi_check_connector_capability(struct ucsi_connector *con)
 		return 0;
 
 	command = UCSI_GET_CONNECTOR_CAPABILITY | UCSI_CONNECTOR_NUMBER(con->num);
-	ret = ucsi_send_command(con->ucsi, command, &con->cap, sizeof(con->cap));
+	ret = ucsi_send_command(con->ucsi, command, &con->cap, sizeof(con->cap), NULL);
 	if (ret < 0) {
 		dev_err(con->ucsi->dev, "GET_CONNECTOR_CAPABILITY failed (%d)\n", ret);
 		return ret;
@@ -1337,7 +1349,7 @@ static int ucsi_reset_connector(struct ucsi_connector *con, bool hard)
 	else if (con->ucsi->version >= UCSI_VERSION_2_0)
 		command |= hard ? 0 : UCSI_CONNECTOR_RESET_DATA_VER_2_0;
 
-	return ucsi_send_command(con->ucsi, command, NULL, 0);
+	return ucsi_send_command(con->ucsi, command, NULL, 0, NULL);
 }
 
 static int ucsi_reset_ppm(struct ucsi *ucsi)
@@ -1418,7 +1430,7 @@ static int ucsi_role_cmd(struct ucsi_connector *con, u64 command)
 {
 	int ret;
 
-	ret = ucsi_send_command(con->ucsi, command, NULL, 0);
+	ret = ucsi_send_command(con->ucsi, command, NULL, 0, NULL);
 	if (ret == -ETIMEDOUT) {
 		u64 c;
 
@@ -1426,7 +1438,7 @@ static int ucsi_role_cmd(struct ucsi_connector *con, u64 command)
 		ucsi_reset_ppm(con->ucsi);
 
 		c = UCSI_SET_NOTIFICATION_ENABLE | con->ucsi->ntfy;
-		ucsi_send_command(con->ucsi, c, NULL, 0);
+		ucsi_send_command(con->ucsi, c, NULL, 0, NULL);
 
 		ucsi_reset_connector(con, true);
 	}
@@ -1579,7 +1591,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	/* Get connector capability */
 	command = UCSI_GET_CONNECTOR_CAPABILITY;
 	command |= UCSI_CONNECTOR_NUMBER(con->num);
-	ret = ucsi_send_command(ucsi, command, &con->cap, sizeof(con->cap));
+	ret = ucsi_send_command(ucsi, command, &con->cap, sizeof(con->cap), NULL);
 	if (ret < 0)
 		goto out_unlock;
 
@@ -1775,14 +1787,14 @@ static int ucsi_init(struct ucsi *ucsi)
 	/* Enable basic notifications */
 	ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
 	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
-	ret = ucsi_send_command(ucsi, command, NULL, 0);
+	ret = ucsi_send_command(ucsi, command, NULL, 0, NULL);
 	if (ret < 0)
 		goto err_reset;
 
 	/* Get PPM capabilities */
 	command = UCSI_GET_CAPABILITY;
 	ret = ucsi_send_command(ucsi, command, &ucsi->cap,
-				BITS_TO_BYTES(UCSI_GET_CAPABILITY_SIZE));
+				BITS_TO_BYTES(UCSI_GET_CAPABILITY_SIZE), NULL);
 	if (ret < 0)
 		goto err_reset;
 
@@ -1809,7 +1821,7 @@ static int ucsi_init(struct ucsi *ucsi)
 	/* Enable all supported notifications */
 	ntfy = ucsi_get_supported_notifications(ucsi);
 	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
-	ret = ucsi_send_command(ucsi, command, NULL, 0);
+	ret = ucsi_send_command(ucsi, command, NULL, 0, NULL);
 	if (ret < 0)
 		goto err_unregister;
 
@@ -1860,7 +1872,7 @@ static void ucsi_resume_work(struct work_struct *work)
 
 	/* Restore UCSI notification enable mask after system resume */
 	command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
-	ret = ucsi_send_command(ucsi, command, NULL, 0);
+	ret = ucsi_send_command(ucsi, command, NULL, 0, NULL);
 	if (ret < 0) {
 		dev_err(ucsi->dev, "failed to re-enable notifications (%d)\n", ret);
 		return;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 5a8f947fcece..dbc7bcb07bc0 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -79,8 +79,9 @@ struct ucsi_operations {
 	int (*read_cci)(struct ucsi *ucsi, u32 *cci);
 	int (*poll_cci)(struct ucsi *ucsi, u32 *cci);
 	int (*read_message_in)(struct ucsi *ucsi, void *val, size_t val_len);
+	int (*write_message_out)(struct ucsi *ucsi, void *data, size_t data_len);
 	int (*sync_control)(struct ucsi *ucsi, u64 command, u32 *cci,
-			    void *data, size_t size);
+			    void *data, size_t size, void *message_out);
 	int (*async_control)(struct ucsi *ucsi, u64 command);
 	bool (*update_altmodes)(struct ucsi *ucsi, struct ucsi_altmode *orig,
 				struct ucsi_altmode *updated);
@@ -205,6 +206,9 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define   UCSI_GET_PD_MESSAGE_TYPE_IDENTITY	4
 #define   UCSI_GET_PD_MESSAGE_TYPE_REVISION	5
 
+/* Data length bits */
+#define UCSI_COMMAND_DATA_LEN(_cmd_)		(((_cmd_) >> 8) & GENMASK(7, 0))
+
 /* -------------------------------------------------------------------------- */
 
 /* Error information returned by PPM in response to GET_ERROR_STATUS command. */
@@ -532,14 +536,14 @@ struct ucsi_connector {
 };
 
 int ucsi_send_command(struct ucsi *ucsi, u64 command,
-		      void *retval, size_t size);
+		      void *retval, size_t size, void *message_out);
 
 void ucsi_altmode_update_active(struct ucsi_connector *con);
 int ucsi_resume(struct ucsi *ucsi);
 
 void ucsi_notify_common(struct ucsi *ucsi, u32 cci);
 int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
-			     void *data, size_t size);
+			     void *data, size_t size, void *message_out);
 
 #if IS_ENABLED(CONFIG_POWER_SUPPLY)
 int ucsi_register_port_psy(struct ucsi_connector *con);
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 6b92f296e985..c0426bb1e81b 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -86,6 +86,21 @@ static int ucsi_acpi_read_message_in(struct ucsi *ucsi, void *val, size_t val_le
 	return 0;
 }
 
+static int ucsi_acpi_write_message_out(struct ucsi *ucsi, void *data, size_t data_len)
+{
+	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
+
+	if (!data || !data_len)
+		return -EINVAL;
+
+	if (ucsi->version <= UCSI_VERSION_1_2)
+		memcpy(ua->base + UCSI_MESSAGE_OUT, data, data_len);
+	else
+		memcpy(ua->base + UCSIv2_MESSAGE_OUT, data, data_len);
+
+	return ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_WRITE);
+}
+
 static int ucsi_acpi_async_control(struct ucsi *ucsi, u64 command)
 {
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
@@ -101,19 +116,20 @@ static const struct ucsi_operations ucsi_acpi_ops = {
 	.read_cci = ucsi_acpi_read_cci,
 	.poll_cci = ucsi_acpi_poll_cci,
 	.read_message_in = ucsi_acpi_read_message_in,
+	.write_message_out = ucsi_acpi_write_message_out,
 	.sync_control = ucsi_sync_control_common,
 	.async_control = ucsi_acpi_async_control
 };
 
 static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
-				  void *val, size_t len)
+				  void *val, size_t len, void *message_out)
 {
 	u16 bogus_change = UCSI_CONSTAT_POWER_LEVEL_CHANGE |
 			   UCSI_CONSTAT_PDOS_CHANGE;
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
 	int ret;
 
-	ret = ucsi_sync_control_common(ucsi, command, cci, val, len);
+	ret = ucsi_sync_control_common(ucsi, command, cci, val, len, message_out);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index e9a9df1431af..7757493b658e 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -603,7 +603,7 @@ static int ucsi_ccg_async_control(struct ucsi *ucsi, u64 command)
 }
 
 static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
-				 void *data, size_t size)
+				 void *data, size_t size, void *message_out)
 {
 	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
 	struct ucsi_connector *con;
@@ -625,7 +625,7 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
 		ucsi_ccg_update_set_new_cam_cmd(uc, con, &command);
 	}
 
-	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
+	ret = ucsi_sync_control_common(ucsi, command, cci, data, size, message_out);
 
 	switch (UCSI_COMMAND(command)) {
 	case UCSI_GET_CURRENT_CAM:
-- 
2.34.1


