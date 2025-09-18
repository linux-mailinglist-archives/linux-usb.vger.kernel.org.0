Return-Path: <linux-usb+bounces-27614-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8DCB46907
	for <lists+linux-usb@lfdr.de>; Sat,  6 Sep 2025 06:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D430F5C4651
	for <lists+linux-usb@lfdr.de>; Sat,  6 Sep 2025 04:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0631269B12;
	Sat,  6 Sep 2025 04:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ah7hEYHh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889BC254877
	for <linux-usb@vger.kernel.org>; Sat,  6 Sep 2025 04:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757133056; cv=none; b=bPTrk7uQkCozyAqZtbOv6g7qknE8xTFNwb77XXOkjE8XMK3PHN+Qb/LqXBBg+q9YD4VJtTIy5EUidZTnjw5eduRrJnFQX3GzQYgdBgoNdAPujoTP0DG4C/mVV8RNTacTjnhiXmPTmkMrwNzdSnraVsp5xRkWiPM0YuiMH+hYumY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757133056; c=relaxed/simple;
	bh=bVidJSlAKZ1tkR48xzHb+J8z7iGkImKToieJLrlSShU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JuDM/W4RdH45OgOuGFpogqE0repOiOaXv/ay+D8wPXv0Sod1HLnz3/BCyblJZdDCSYuGoF7T7nU917ncnDVZl+jbFkK242XZv+jYiTIe4VO5NxT7hu7F83o4O2ctP7FSPzNCxP2TGR87QtvDP+RxUZ+a61QFSUWXFHupNgOAoEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ah7hEYHh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757133053; x=1788669053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bVidJSlAKZ1tkR48xzHb+J8z7iGkImKToieJLrlSShU=;
  b=Ah7hEYHhtt73uW9BG+IahMgJQxgqSqQ9GbbC+ZHlO/vG3sUzYO5PfyW7
   LXrAXRrtjWyYn4t6OtGfuSNrmr/nBhjoigg8jdk1v718q49B5Dbs1cFrv
   YqsJhQnM2e08uhLhAk9LBW3SutUTtTqnhZ0OSb8C/wsnvl4Fl2Fb01VEY
   Jm5RGV1ByTVj8p/F1hVB9dsvz4IYtBUVK+5MGqx1EJzoJlsE2UTvWpkAg
   yZ12HCrN9tycDVv5n7NDA4fJz+Zlhd9XWDUEh8Gf3MX1BXktwNgJOG4ic
   Vtxhtmzy8xlgeHljeduUoRxCIvbSB7y/5jIizyHg5SN73oXRR7a+FQ3o7
   g==;
X-CSE-ConnectionGUID: Z1UCQAm5RYe0ctcbjs0tcQ==
X-CSE-MsgGUID: bcFZmWnEToKF2ySdKiWibw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="63307761"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="63307761"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 21:30:53 -0700
X-CSE-ConnectionGUID: UY/68/1JSYC33TwOH9NnOA==
X-CSE-MsgGUID: Of3hEW+YSBWeZvzMbfV4vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="173128882"
Received: from clke07vm102.fm.intel.com (HELO clke07vm102.amr.corp.intel.com) ([10.80.128.226])
  by fmviesa010.fm.intel.com with ESMTP; 05 Sep 2025 21:30:53 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	pooja.katiyar@intel.com,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v3 1/4] usb: typec: ucsi: Update UCSI structure to have message in and message out fields
Date: Fri,  5 Sep 2025 21:30:58 -0700
Message-ID: <109c631547b41ce7af26a7c3e9bfd5ab87fa4587.1757024530.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757024530.git.pooja.katiyar@intel.com>
References: <cover.1757024530.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update UCSI structure by adding fields for incoming and outgoing
messages. Update .sync_control function and other related functions
to use these new fields within the UCSI structure, instead of handling
them as separate parameters.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c |   5 +-
 drivers/usb/typec/ucsi/debugfs.c      |   9 ++-
 drivers/usb/typec/ucsi/displayport.c  |  11 ++-
 drivers/usb/typec/ucsi/ucsi.c         | 104 +++++++++++++++++---------
 drivers/usb/typec/ucsi/ucsi.h         |  19 +++--
 drivers/usb/typec/ucsi/ucsi_acpi.c    |   9 +--
 drivers/usb/typec/ucsi/ucsi_ccg.c     |  11 ++-
 7 files changed, 105 insertions(+), 63 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index eed2a7d0ebc6..d753f2188e25 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -105,13 +105,12 @@ static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
 	return 0;
 }
 
-static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci,
-				  void *data, size_t size)
+static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci)
 {
 	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
 	int ret;
 
-	ret = ucsi_sync_control_common(ucsi, cmd, cci, data, size);
+	ret = ucsi_sync_control_common(ucsi, cmd, cci);
 	switch (ret) {
 	case -EBUSY:
 		/* EC may return -EBUSY if CCI.busy is set.
diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index 92ebf1a2defd..0a20b966578c 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -35,7 +35,8 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_SET_SINK_PATH:
 	case UCSI_SET_NEW_CAM:
 	case UCSI_SET_USB:
-		ret = ucsi_send_command(ucsi, val, NULL, 0);
+		ucsi->message_in_size = 0;
+		ret = ucsi_send_command(ucsi, val);
 		break;
 	case UCSI_GET_CAPABILITY:
 	case UCSI_GET_CONNECTOR_CAPABILITY:
@@ -50,9 +51,9 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_GET_ATTENTION_VDO:
 	case UCSI_GET_CAM_CS:
 	case UCSI_GET_LPM_PPM_INFO:
-		ret = ucsi_send_command(ucsi, val,
-					&ucsi->debugfs->response,
-					sizeof(ucsi->debugfs->response));
+		ucsi->message_in_size = sizeof(ucsi->debugfs->response);
+		ret = ucsi_send_command(ucsi, val);
+		memcpy(&ucsi->debugfs->response, ucsi->message_in, sizeof(ucsi->debugfs->response));
 		break;
 	default:
 		ret = -EOPNOTSUPP;
diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 8aae80b457d7..a09b4900ec76 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -67,11 +67,14 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 	}
 
 	command = UCSI_GET_CURRENT_CAM | UCSI_CONNECTOR_NUMBER(dp->con->num);
-	ret = ucsi_send_command(ucsi, command, &cur, sizeof(cur));
+	ucsi->message_in_size = sizeof(cur);
+	ret = ucsi_send_command(ucsi, command);
 	if (ret < 0) {
 		if (ucsi->version > 0x0100)
 			goto err_unlock;
 		cur = 0xff;
+	} else {
+		memcpy(&cur, ucsi->message_in, ucsi->message_in_size);
 	}
 
 	if (cur != 0xff) {
@@ -126,7 +129,8 @@ static int ucsi_displayport_exit(struct typec_altmode *alt)
 	}
 
 	command = UCSI_CMD_SET_NEW_CAM(dp->con->num, 0, dp->offset, 0);
-	ret = ucsi_send_command(dp->con->ucsi, command, NULL, 0);
+	dp->con->ucsi->message_in_size = 0;
+	ret = ucsi_send_command(dp->con->ucsi, command);
 	if (ret < 0)
 		goto out_unlock;
 
@@ -193,7 +197,8 @@ static int ucsi_displayport_configure(struct ucsi_dp *dp)
 
 	command = UCSI_CMD_SET_NEW_CAM(dp->con->num, 1, dp->offset, pins);
 
-	return ucsi_send_command(dp->con->ucsi, command, NULL, 0);
+	dp->con->ucsi->message_in_size = 0;
+	return ucsi_send_command(dp->con->ucsi, command);
 }
 
 static int ucsi_displayport_vdm(struct typec_altmode *alt,
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 5739ea2abdd1..c953aa7d5283 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -55,8 +55,7 @@ void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
 }
 EXPORT_SYMBOL_GPL(ucsi_notify_common);
 
-int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
-			     void *data, size_t size)
+int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci)
 {
 	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
 	int ret;
@@ -84,9 +83,10 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
 	if (!ret && cci)
 		ret = ucsi->ops->read_cci(ucsi, cci);
 
-	if (!ret && data &&
+	if (!ret && ucsi->message_in_size > 0 &&
 	    (*cci & UCSI_CCI_COMMAND_COMPLETE))
-		ret = ucsi->ops->read_message_in(ucsi, data, size);
+		ret = ucsi->ops->read_message_in(ucsi, ucsi->message_in,
+						 ucsi->message_in_size);
 
 	return ret;
 }
@@ -103,23 +103,25 @@ static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 		ctrl |= UCSI_ACK_CONNECTOR_CHANGE;
 	}
 
-	return ucsi->ops->sync_control(ucsi, ctrl, NULL, NULL, 0);
+	ucsi->message_in_size = 0;
+	return ucsi->ops->sync_control(ucsi, ctrl, NULL);
 }
 
-static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
-			    void *data, size_t size, bool conn_ack)
+static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci, bool conn_ack)
 {
 	int ret, err;
 
 	*cci = 0;
 
-	if (size > UCSI_MAX_DATA_LENGTH(ucsi))
+	if (ucsi->message_in_size > UCSI_MAX_DATA_LENGTH(ucsi))
 		return -EINVAL;
 
-	ret = ucsi->ops->sync_control(ucsi, command, cci, data, size);
+	ret = ucsi->ops->sync_control(ucsi, command, cci);
 
-	if (*cci & UCSI_CCI_BUSY)
-		return ucsi_run_command(ucsi, UCSI_CANCEL, cci, NULL, 0, false) ?: -EBUSY;
+	if (*cci & UCSI_CCI_BUSY) {
+		ucsi->message_in_size = 0;
+		return ucsi_run_command(ucsi, UCSI_CANCEL, cci, false) ?: -EBUSY;
+	}
 	if (ret)
 		return ret;
 
@@ -151,10 +153,13 @@ static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
 	int ret;
 
 	command = UCSI_GET_ERROR_STATUS | UCSI_CONNECTOR_NUMBER(connector_num);
-	ret = ucsi_run_command(ucsi, command, &cci, &error, sizeof(error), false);
+	ucsi->message_in_size = sizeof(error);
+	ret = ucsi_run_command(ucsi, command, &cci, false);
 	if (ret < 0)
 		return ret;
 
+	memcpy(&error, ucsi->message_in, sizeof(error));
+
 	switch (error) {
 	case UCSI_ERROR_INCOMPATIBLE_PARTNER:
 		return -EOPNOTSUPP;
@@ -200,8 +205,7 @@ static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
 	return -EIO;
 }
 
-static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
-				    void *data, size_t size, bool conn_ack)
+static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd, bool conn_ack)
 {
 	u8 connector_num;
 	u32 cci;
@@ -229,7 +233,7 @@ static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
 
 	mutex_lock(&ucsi->ppm_lock);
 
-	ret = ucsi_run_command(ucsi, cmd, &cci, data, size, conn_ack);
+	ret = ucsi_run_command(ucsi, cmd, &cci, conn_ack);
 
 	if (cci & UCSI_CCI_ERROR)
 		ret = ucsi_read_error(ucsi, connector_num);
@@ -238,10 +242,9 @@ static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
 	return ret;
 }
 
-int ucsi_send_command(struct ucsi *ucsi, u64 command,
-		      void *data, size_t size)
+int ucsi_send_command(struct ucsi *ucsi, u64 command)
 {
-	return ucsi_send_command_common(ucsi, command, data, size, false);
+	return ucsi_send_command_common(ucsi, command, false);
 }
 EXPORT_SYMBOL_GPL(ucsi_send_command);
 
@@ -319,7 +322,8 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
 	int i;
 
 	command = UCSI_GET_CURRENT_CAM | UCSI_CONNECTOR_NUMBER(con->num);
-	ret = ucsi_send_command(con->ucsi, command, &cur, sizeof(cur));
+	con->ucsi->message_in_size = sizeof(cur);
+	ret = ucsi_send_command(con->ucsi, command);
 	if (ret < 0) {
 		if (con->ucsi->version > 0x0100) {
 			dev_err(con->ucsi->dev,
@@ -327,6 +331,8 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
 			return;
 		}
 		cur = 0xff;
+	} else {
+		memcpy(&cur, con->ucsi->message_in, sizeof(cur));
 	}
 
 	if (cur < UCSI_MAX_ALTMODES)
@@ -510,7 +516,8 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
 		command |= UCSI_GET_ALTMODE_RECIPIENT(recipient);
 		command |= UCSI_GET_ALTMODE_CONNECTOR_NUMBER(con->num);
 		command |= UCSI_GET_ALTMODE_OFFSET(i);
-		len = ucsi_send_command(con->ucsi, command, &alt, sizeof(alt));
+		ucsi->message_in_size = sizeof(alt);
+		len = ucsi_send_command(con->ucsi, command);
 		/*
 		 * We are collecting all altmodes first and then registering.
 		 * Some type-C device will return zero length data beyond last
@@ -519,6 +526,8 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
 		if (len < 0)
 			return len;
 
+		memcpy(&alt, ucsi->message_in, sizeof(alt));
+
 		/* We got all altmodes, now break out and register them */
 		if (!len || !alt.svid)
 			break;
@@ -586,12 +595,15 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 		command |= UCSI_GET_ALTMODE_RECIPIENT(recipient);
 		command |= UCSI_GET_ALTMODE_CONNECTOR_NUMBER(con->num);
 		command |= UCSI_GET_ALTMODE_OFFSET(i);
-		len = ucsi_send_command(con->ucsi, command, alt, sizeof(alt));
+		con->ucsi->message_in_size = sizeof(alt);
+		len = ucsi_send_command(con->ucsi, command);
 		if (len == -EBUSY)
 			continue;
 		if (len <= 0)
 			return len;
 
+		memcpy(&alt, con->ucsi->message_in, sizeof(alt));
+
 		/*
 		 * This code is requesting one alt mode at a time, but some PPMs
 		 * may still return two. If that happens both alt modes need be
@@ -659,7 +671,9 @@ static int ucsi_get_connector_status(struct ucsi_connector *con, bool conn_ack)
 			  UCSI_MAX_DATA_LENGTH(con->ucsi));
 	int ret;
 
-	ret = ucsi_send_command_common(con->ucsi, command, &con->status, size, conn_ack);
+	con->ucsi->message_in_size = size;
+	ret = ucsi_send_command_common(con->ucsi, command, conn_ack);
+	memcpy(&con->status, con->ucsi->message_in, size);
 
 	return ret < 0 ? ret : 0;
 }
@@ -682,8 +696,9 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
 	command |= UCSI_GET_PDOS_PDO_OFFSET(offset);
 	command |= UCSI_GET_PDOS_NUM_PDOS(num_pdos - 1);
 	command |= is_source(role) ? UCSI_GET_PDOS_SRC_PDOS : 0;
-	ret = ucsi_send_command(ucsi, command, pdos + offset,
-				num_pdos * sizeof(u32));
+	ucsi->message_in_size = num_pdos * sizeof(u32);
+	ret = ucsi_send_command(ucsi, command);
+	memcpy(pdos + offset, ucsi->message_in, num_pdos * sizeof(u32));
 	if (ret < 0 && ret != -ETIMEDOUT)
 		dev_err(ucsi->dev, "UCSI_GET_PDOS failed (%d)\n", ret);
 
@@ -770,7 +785,9 @@ static int ucsi_get_pd_message(struct ucsi_connector *con, u8 recipient,
 		command |= UCSI_GET_PD_MESSAGE_BYTES(len);
 		command |= UCSI_GET_PD_MESSAGE_TYPE(type);
 
-		ret = ucsi_send_command(con->ucsi, command, data + offset, len);
+		con->ucsi->message_in_size = len;
+		ret = ucsi_send_command(con->ucsi, command);
+		memcpy(data + offset, con->ucsi->message_in, len);
 		if (ret < 0)
 			return ret;
 	}
@@ -935,7 +952,9 @@ static int ucsi_register_cable(struct ucsi_connector *con)
 	int ret;
 
 	command = UCSI_GET_CABLE_PROPERTY | UCSI_CONNECTOR_NUMBER(con->num);
-	ret = ucsi_send_command(con->ucsi, command, &cable_prop, sizeof(cable_prop));
+	con->ucsi->message_in_size = sizeof(cable_prop);
+	ret = ucsi_send_command(con->ucsi, command);
+	memcpy(&cable_prop, con->ucsi->message_in, sizeof(cable_prop));
 	if (ret < 0) {
 		dev_err(con->ucsi->dev, "GET_CABLE_PROPERTY failed (%d)\n", ret);
 		return ret;
@@ -996,7 +1015,9 @@ static int ucsi_check_connector_capability(struct ucsi_connector *con)
 		return 0;
 
 	command = UCSI_GET_CONNECTOR_CAPABILITY | UCSI_CONNECTOR_NUMBER(con->num);
-	ret = ucsi_send_command(con->ucsi, command, &con->cap, sizeof(con->cap));
+	con->ucsi->message_in_size = sizeof(con->cap);
+	ret = ucsi_send_command(con->ucsi, command);
+	memcpy(&con->cap, con->ucsi->message_in, sizeof(con->cap));
 	if (ret < 0) {
 		dev_err(con->ucsi->dev, "GET_CONNECTOR_CAPABILITY failed (%d)\n", ret);
 		return ret;
@@ -1337,7 +1358,8 @@ static int ucsi_reset_connector(struct ucsi_connector *con, bool hard)
 	else if (con->ucsi->version >= UCSI_VERSION_2_0)
 		command |= hard ? 0 : UCSI_CONNECTOR_RESET_DATA_VER_2_0;
 
-	return ucsi_send_command(con->ucsi, command, NULL, 0);
+	con->ucsi->message_in_size = 0;
+	return ucsi_send_command(con->ucsi, command);
 }
 
 static int ucsi_reset_ppm(struct ucsi *ucsi)
@@ -1418,7 +1440,8 @@ static int ucsi_role_cmd(struct ucsi_connector *con, u64 command)
 {
 	int ret;
 
-	ret = ucsi_send_command(con->ucsi, command, NULL, 0);
+	con->ucsi->message_in_size = 0;
+	ret = ucsi_send_command(con->ucsi, command);
 	if (ret == -ETIMEDOUT) {
 		u64 c;
 
@@ -1426,7 +1449,8 @@ static int ucsi_role_cmd(struct ucsi_connector *con, u64 command)
 		ucsi_reset_ppm(con->ucsi);
 
 		c = UCSI_SET_NOTIFICATION_ENABLE | con->ucsi->ntfy;
-		ucsi_send_command(con->ucsi, c, NULL, 0);
+		con->ucsi->message_in_size = 0;
+		ucsi_send_command(con->ucsi, c);
 
 		ucsi_reset_connector(con, true);
 	}
@@ -1579,10 +1603,13 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	/* Get connector capability */
 	command = UCSI_GET_CONNECTOR_CAPABILITY;
 	command |= UCSI_CONNECTOR_NUMBER(con->num);
-	ret = ucsi_send_command(ucsi, command, &con->cap, sizeof(con->cap));
+	ucsi->message_in_size = sizeof(con->cap);
+	ret = ucsi_send_command(ucsi, command);
 	if (ret < 0)
 		goto out_unlock;
 
+	memcpy(&con->cap, ucsi->message_in, sizeof(con->cap));
+
 	if (UCSI_CONCAP(con, OPMODE_DRP))
 		cap->data = TYPEC_PORT_DRD;
 	else if (UCSI_CONCAP(con, OPMODE_DFP))
@@ -1775,17 +1802,20 @@ static int ucsi_init(struct ucsi *ucsi)
 	/* Enable basic notifications */
 	ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
 	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
-	ret = ucsi_send_command(ucsi, command, NULL, 0);
+	ucsi->message_in_size = 0;
+	ret = ucsi_send_command(ucsi, command);
 	if (ret < 0)
 		goto err_reset;
 
 	/* Get PPM capabilities */
 	command = UCSI_GET_CAPABILITY;
-	ret = ucsi_send_command(ucsi, command, &ucsi->cap,
-				BITS_TO_BYTES(UCSI_GET_CAPABILITY_SIZE));
+	ucsi->message_in_size = BITS_TO_BYTES(UCSI_GET_CAPABILITY_SIZE);
+	ret = ucsi_send_command(ucsi, command);
 	if (ret < 0)
 		goto err_reset;
 
+	memcpy(&ucsi->cap, ucsi->message_in, BITS_TO_BYTES(UCSI_GET_CAPABILITY_SIZE));
+
 	if (!ucsi->cap.num_connectors) {
 		ret = -ENODEV;
 		goto err_reset;
@@ -1809,7 +1839,8 @@ static int ucsi_init(struct ucsi *ucsi)
 	/* Enable all supported notifications */
 	ntfy = ucsi_get_supported_notifications(ucsi);
 	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
-	ret = ucsi_send_command(ucsi, command, NULL, 0);
+	ucsi->message_in_size = 0;
+	ret = ucsi_send_command(ucsi, command);
 	if (ret < 0)
 		goto err_unregister;
 
@@ -1860,7 +1891,8 @@ static void ucsi_resume_work(struct work_struct *work)
 
 	/* Restore UCSI notification enable mask after system resume */
 	command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
-	ret = ucsi_send_command(ucsi, command, NULL, 0);
+	ucsi->message_in_size = 0;
+	ret = ucsi_send_command(ucsi, command);
 	if (ret < 0) {
 		dev_err(ucsi->dev, "failed to re-enable notifications (%d)\n", ret);
 		return;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index ebd7c27c2cc7..673f57eb7842 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -29,6 +29,10 @@ struct dentry;
 #define UCSI_MESSAGE_OUT		32
 #define UCSIv2_MESSAGE_OUT		272
 
+/* Define maximum lengths for message buffers */
+#define UCSI_MAX_MESSAGE_IN_LENGTH	256
+#define UCSI_MAX_MESSAGE_OUT_LENGTH	256
+
 /* UCSI versions */
 #define UCSI_VERSION_1_0	0x0100
 #define UCSI_VERSION_1_1	0x0110
@@ -80,8 +84,7 @@ struct ucsi_operations {
 	int (*read_cci)(struct ucsi *ucsi, u32 *cci);
 	int (*poll_cci)(struct ucsi *ucsi, u32 *cci);
 	int (*read_message_in)(struct ucsi *ucsi, void *val, size_t val_len);
-	int (*sync_control)(struct ucsi *ucsi, u64 command, u32 *cci,
-			    void *data, size_t size);
+	int (*sync_control)(struct ucsi *ucsi, u64 command, u32 *cci);
 	int (*async_control)(struct ucsi *ucsi, u64 command);
 	bool (*update_altmodes)(struct ucsi *ucsi, u8 recipient,
 				struct ucsi_altmode *orig,
@@ -476,6 +479,12 @@ struct ucsi {
 	unsigned long quirks;
 #define UCSI_NO_PARTNER_PDOS	BIT(0)	/* Don't read partner's PDOs */
 #define UCSI_DELAY_DEVICE_PDOS	BIT(1)	/* Reading PDOs fails until the parter is in PD mode */
+
+	/* Fixed-size buffers for incoming and outgoing messages */
+	u8 message_in[UCSI_MAX_MESSAGE_IN_LENGTH];
+	size_t message_in_size;
+	u8 message_out[UCSI_MAX_MESSAGE_OUT_LENGTH];
+	size_t message_out_size;
 };
 
 #define UCSI_MAX_DATA_LENGTH(u) (((u)->version < UCSI_VERSION_2_0) ? 0x10 : 0xff)
@@ -534,15 +543,13 @@ struct ucsi_connector {
 	struct usb_pd_identity cable_identity;
 };
 
-int ucsi_send_command(struct ucsi *ucsi, u64 command,
-		      void *retval, size_t size);
+int ucsi_send_command(struct ucsi *ucsi, u64 command);
 
 void ucsi_altmode_update_active(struct ucsi_connector *con);
 int ucsi_resume(struct ucsi *ucsi);
 
 void ucsi_notify_common(struct ucsi *ucsi, u32 cci);
-int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
-			     void *data, size_t size);
+int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci);
 
 #if IS_ENABLED(CONFIG_POWER_SUPPLY)
 int ucsi_register_port_psy(struct ucsi_connector *con);
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 6b92f296e985..f1d1f6917b09 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -105,15 +105,14 @@ static const struct ucsi_operations ucsi_acpi_ops = {
 	.async_control = ucsi_acpi_async_control
 };
 
-static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
-				  void *val, size_t len)
+static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *cci)
 {
 	u16 bogus_change = UCSI_CONSTAT_POWER_LEVEL_CHANGE |
 			   UCSI_CONSTAT_PDOS_CHANGE;
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
 	int ret;
 
-	ret = ucsi_sync_control_common(ucsi, command, cci, val, len);
+	ret = ucsi_sync_control_common(ucsi, command, cci);
 	if (ret < 0)
 		return ret;
 
@@ -125,8 +124,8 @@ static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
 	if (UCSI_COMMAND(ua->cmd) == UCSI_GET_CONNECTOR_STATUS &&
 	    ua->check_bogus_event) {
 		/* Clear the bogus change */
-		if (*(u16 *)val == bogus_change)
-			*(u16 *)val = 0;
+		if (*(u16 *)ucsi->message_in == bogus_change)
+			*(u16 *)ucsi->message_in = 0;
 
 		ua->check_bogus_event = false;
 	}
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index d83a0051c737..ead1b2a25c79 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -606,8 +606,7 @@ static int ucsi_ccg_async_control(struct ucsi *ucsi, u64 command)
 	return ccg_write(uc, reg, (u8 *)&command, sizeof(command));
 }
 
-static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
-				 void *data, size_t size)
+static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci)
 {
 	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
 	struct ucsi_connector *con;
@@ -629,16 +628,16 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
 		ucsi_ccg_update_set_new_cam_cmd(uc, con, &command);
 	}
 
-	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
+	ret = ucsi_sync_control_common(ucsi, command, cci);
 
 	switch (UCSI_COMMAND(command)) {
 	case UCSI_GET_CURRENT_CAM:
 		if (uc->has_multiple_dp)
-			ucsi_ccg_update_get_current_cam_cmd(uc, (u8 *)data);
+			ucsi_ccg_update_get_current_cam_cmd(uc, (u8 *)ucsi->message_in);
 		break;
 	case UCSI_GET_ALTERNATE_MODES:
 		if (UCSI_ALTMODE_RECIPIENT(command) == UCSI_RECIPIENT_SOP) {
-			struct ucsi_altmode *alt = data;
+			struct ucsi_altmode *alt = (struct ucsi_altmode *)ucsi->message_in;
 
 			if (alt[0].svid == USB_TYPEC_NVIDIA_VLINK_SID)
 				ucsi_ccg_nvidia_altmode(uc, alt, command);
@@ -646,7 +645,7 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
 		break;
 	case UCSI_GET_CAPABILITY:
 		if (uc->fw_build == CCG_FW_BUILD_NVIDIA_TEGRA) {
-			struct ucsi_capability *cap = data;
+			struct ucsi_capability *cap = (struct ucsi_capability *)ucsi->message_in;
 
 			cap->features &= ~UCSI_CAP_ALT_MODE_DETAILS;
 		}
-- 
2.43.0


