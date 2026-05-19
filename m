Return-Path: <linux-usb+bounces-37734-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFs1D22vDGrdkwUAu9opvQ
	(envelope-from <linux-usb+bounces-37734-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:43:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E79583D2D
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4471B3018AEA
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 18:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E0A36B06A;
	Tue, 19 May 2026 18:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jnQjqnrD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0F436B07C
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 18:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779216216; cv=none; b=qswwhS30TkGsxqbQe4FTExs1Ti32YVFzSMbHZxejnNU1LTsqbtO1i0qO/NVL7IFStGS1T4C5aWW2ic5OtqoF08REdDYXSg9r2GfsCwDS4PNZJf6rsu5y74Sn5qOo55ilx6pvhPH9Pyzx3UbnpUib6BKo86O1fxZaDQ6lh0X73Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779216216; c=relaxed/simple;
	bh=tse/MvswhpdyoPa2mR87kp/nx+S69SVXPsihGjhL6gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YIAIWsdrpZY89smO8Kv+jjOHFzW12WQ9httB5ADFuqxbVyWWYSX9+GOA3ROmePgE4ggG9XPsy4pesvJAD+YHJSU7rjhYBdHtHNOYSojyy3BD2H+KAawyP9VZDHGzU4wmbYr54ju+P95+XcgC8SL3HW/TEIv5UiNjloCm5ilVo3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jnQjqnrD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779216215; x=1810752215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tse/MvswhpdyoPa2mR87kp/nx+S69SVXPsihGjhL6gw=;
  b=jnQjqnrDeTbDW9Cplpv66btc6hkKHYKPCWD7SxPQqy4EE3tM3kym51lU
   YBVfxmp9c0mTDjzB4kXziMDSj8je+79Q787/EEs7v9VakoVbfSPw7H8wS
   B0IQ/cMF/TQpZRMaukw1uMJeutHIAeuCmLE7cxbhb9w/9V0vXR5vT9gXk
   tHVBveTtL3tIKVWz18nn/hZ0Kv7h/wJ99E8RAJUnuYx4Pae9wZYHlBWfM
   9WViuYiwq8kdiHWuwj1TcRYTIgmAO/yCBlvWbr2k7Q7vd+3cUsgtcovG0
   hG2yhAajXPNTYHD3D79uf6iJp9cW3/wz2ScP40tqxm6JMQadX12NYeOnm
   Q==;
X-CSE-ConnectionGUID: fVhCYP/OQBOZBKVMXSlGtw==
X-CSE-MsgGUID: yAK0HJcJQL+5mMOTnvLL0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="102783839"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="102783839"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 11:43:35 -0700
X-CSE-ConnectionGUID: Iriug0EdRuGFpLdKz3leLw==
X-CSE-MsgGUID: beZCrctcTvqNAexlO8PFYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="263633792"
Received: from pooja-nuc9i7qnx.fm.intel.com ([10.80.169.153])
  by fmviesa001.fm.intel.com with ESMTP; 19 May 2026 11:43:34 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	dmitry.baryshkov@oss.qualcomm.com,
	johan@kernel.org,
	asutosh.pathak@intel.com,
	heikki.krogerus@linux.intel.com,
	Pooja Katiyar <pooja.katiyar@intel.com>
Subject: [PATCH v8 1/3] usb: typec: ucsi: Add support for message_out data structure
Date: Tue, 19 May 2026 11:45:12 -0700
Message-ID: <6d4e1ba7f92e713638f66925ae6389528597df6e.1778798352.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778798352.git.pooja.katiyar@intel.com>
References: <cover.1778798352.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37734-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pooja.katiyar@intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: C7E79583D2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for UCSI message_out data structure. The UCSI
interface defines separate message_in and message_out data
structure for bidirectional communication, where commands
like Set PDOs and LPM Firmware Update require writing data
to message_out before command execution.

Add write_message_out operation to ucsi_operations structure
to allow platform drivers to implement message_out data writing
capability.

Update ucsi_sync_control_common to accept message_out parameters
and call write_message_out followed by command execution to
maintain proper sequencing as per the UCSI specification.

Introduce ucsi_write_message_out_command for commands that need
to send message_out data, while maintaining ucsi_send_command
for commands that only require message_in response data.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
Changelog v7:
- Added changelogs.

Changelog v6:
- Removed message_in and message_out related fields from global ucsi data
  structure and replaced with function parameter approach.
- Added message_out parameters to existing function parameters, keeping the
  flow similar to message_in data handling.
- Modified ucsi_sync_control_common() signature to accept msg_out and
  msg_out_size.
- Added write_message_out() to ucsi_operations struct.
- Added ucsi_write_message_out_command() function to handle commands
  which need to send message_out data to PPM.
- Updated platform interfaces and other function callers with new function
  signatures.

Changelog v5:
- Rebased patches to v6.18-rc3.

Changelog v4:
- Fixed build errors reported by kernel test robot.
- Added changelogs.

Changelog v3:
- Added message fields to UCSI structure and updated
  sync_control handling.

Changelog v2:
- Moved write_message_out operation to .sync_control.
- Updated ucsi_send_command to accept message_out data.

 drivers/usb/typec/ucsi/cros_ec_ucsi.c   |  6 ++-
 drivers/usb/typec/ucsi/ucsi.c           | 52 ++++++++++++++++++++-----
 drivers/usb/typec/ucsi/ucsi.h           | 13 ++++++-
 drivers/usb/typec/ucsi/ucsi_acpi.c      | 22 ++++++++++-
 drivers/usb/typec/ucsi/ucsi_ccg.c       |  6 ++-
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c |  6 ++-
 6 files changed, 85 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index 251aa7251ce6..c192d42d449e 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -114,12 +114,14 @@ static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
 }
 
 static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci,
-				  void *data, size_t size)
+				  void *data, size_t size, void *msg_out,
+				  size_t msg_out_size)
 {
 	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
 	int ret;
 
-	ret = ucsi_sync_control_common(ucsi, cmd, cci, data, size);
+	ret = ucsi_sync_control_common(ucsi, cmd, cci, data, size, msg_out,
+				       msg_out_size);
 	switch (ret) {
 	case -EBUSY:
 		/* EC may return -EBUSY if CCI.busy is set.
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 5b7ad9e99cb9..196920a206f8 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -63,7 +63,8 @@ void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
 EXPORT_SYMBOL_GPL(ucsi_notify_common);
 
 int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
-			     void *data, size_t size)
+			     void *data, size_t size, void *msg_out,
+			     size_t msg_out_size)
 {
 	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
 	int ret;
@@ -75,6 +76,17 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
 
 	reinit_completion(&ucsi->complete);
 
+	if (msg_out && msg_out_size) {
+		if (!ucsi->ops->write_message_out) {
+			ret = -EOPNOTSUPP;
+			goto out_clear_bit;
+		}
+
+		ret = ucsi->ops->write_message_out(ucsi, msg_out, msg_out_size);
+		if (ret)
+			goto out_clear_bit;
+	}
+
 	ret = ucsi->ops->async_control(ucsi, command);
 	if (ret)
 		goto out_clear_bit;
@@ -110,11 +122,12 @@ static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 		ctrl |= UCSI_ACK_CONNECTOR_CHANGE;
 	}
 
-	return ucsi->ops->sync_control(ucsi, ctrl, NULL, NULL, 0);
+	return ucsi->ops->sync_control(ucsi, ctrl, NULL, NULL, 0, NULL, 0);
 }
 
 static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
-			    void *data, size_t size, bool conn_ack)
+			    void *data, size_t size, void *msg_out,
+			    size_t msg_out_size, bool conn_ack)
 {
 	int ret, err;
 
@@ -123,10 +136,12 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 	if (size > UCSI_MAX_DATA_LENGTH(ucsi))
 		return -EINVAL;
 
-	ret = ucsi->ops->sync_control(ucsi, command, cci, data, size);
+	ret = ucsi->ops->sync_control(ucsi, command, cci, data, size,
+				      msg_out, msg_out_size);
 
 	if (*cci & UCSI_CCI_BUSY)
-		return ucsi_run_command(ucsi, UCSI_CANCEL, cci, NULL, 0, false) ?: -EBUSY;
+		return ucsi_run_command(ucsi, UCSI_CANCEL, cci,
+					NULL, 0, NULL, 0, false) ?: -EBUSY;
 	if (ret)
 		return ret;
 
@@ -158,7 +173,8 @@ static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
 	int ret;
 
 	command = UCSI_GET_ERROR_STATUS | UCSI_CONNECTOR_NUMBER(connector_num);
-	ret = ucsi_run_command(ucsi, command, &cci, &error, sizeof(error), false);
+	ret = ucsi_run_command(ucsi, command, &cci, &error,
+			       sizeof(error), NULL, 0, false);
 	if (ret < 0)
 		return ret;
 
@@ -208,7 +224,8 @@ static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
 }
 
 static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
-				    void *data, size_t size, bool conn_ack)
+				    void *data, size_t size, void *msg_out,
+				    size_t msg_out_size, bool conn_ack)
 {
 	u8 connector_num;
 	u32 cci;
@@ -236,7 +253,8 @@ static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
 
 	mutex_lock(&ucsi->ppm_lock);
 
-	ret = ucsi_run_command(ucsi, cmd, &cci, data, size, conn_ack);
+	ret = ucsi_run_command(ucsi, cmd, &cci, data, size,
+			       msg_out, msg_out_size, conn_ack);
 
 	if (cci & UCSI_CCI_ERROR)
 		ret = ucsi_read_error(ucsi, connector_num);
@@ -250,10 +268,23 @@ static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
 int ucsi_send_command(struct ucsi *ucsi, u64 command,
 		      void *data, size_t size)
 {
-	return ucsi_send_command_common(ucsi, command, data, size, false);
+	return ucsi_send_command_common(ucsi, command, data,
+					size, NULL, 0, false);
 }
 EXPORT_SYMBOL_GPL(ucsi_send_command);
 
+int ucsi_write_message_out_command(struct ucsi *ucsi, u64 command,
+				   void *data, size_t size, void *msg_out,
+				   size_t msg_out_size)
+{
+	if (msg_out_size > UCSI_MAX_MSG_OUT_DATA_LEN(ucsi))
+		return -EINVAL;
+
+	return ucsi_send_command_common(ucsi, command, data,
+					size, msg_out, msg_out_size, false);
+}
+EXPORT_SYMBOL_GPL(ucsi_write_message_out_command);
+
 /* -------------------------------------------------------------------------- */
 
 struct ucsi_work {
@@ -681,7 +712,8 @@ static int ucsi_get_connector_status(struct ucsi_connector *con, bool conn_ack)
 			  UCSI_MAX_DATA_LENGTH(con->ucsi));
 	int ret;
 
-	ret = ucsi_send_command_common(con->ucsi, command, &con->status, size, conn_ack);
+	ret = ucsi_send_command_common(con->ucsi, command, &con->status, size,
+				       NULL, 0, conn_ack);
 
 	return ret < 0 ? ret : 0;
 }
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index cff9ddc2ae21..c8e4d7b9c25a 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -65,6 +65,7 @@ struct dentry;
  * @read_cci: Read CCI register
  * @poll_cci: Read CCI register while polling with notifications disabled
  * @read_message_in: Read message data from UCSI
+ * @write_message_out: Write message data to UCSI
  * @sync_control: Blocking control operation
  * @async_control: Non-blocking control operation
  * @update_altmodes: Squashes duplicate DP altmodes
@@ -82,8 +83,9 @@ struct ucsi_operations {
 	int (*read_cci)(struct ucsi *ucsi, u32 *cci);
 	int (*poll_cci)(struct ucsi *ucsi, u32 *cci);
 	int (*read_message_in)(struct ucsi *ucsi, void *val, size_t val_len);
+	int (*write_message_out)(struct ucsi *ucsi, void *data, size_t data_len);
 	int (*sync_control)(struct ucsi *ucsi, u64 command, u32 *cci,
-			    void *data, size_t size);
+			    void *data, size_t size, void *msg_out, size_t msg_out_size);
 	int (*async_control)(struct ucsi *ucsi, u64 command);
 	bool (*update_altmodes)(struct ucsi *ucsi, u8 recipient,
 				struct ucsi_altmode *orig,
@@ -503,6 +505,9 @@ struct ucsi {
 };
 
 #define UCSI_MAX_DATA_LENGTH(u) (((u)->version < UCSI_VERSION_2_0) ? 0x10 : 0xff)
+#define UCSI_MAX_MSG_OUT_DATA_LEN(u) \
+	(((u)->version >= UCSI_VERSION_3_0) ? 255 : \
+	 (((u)->version >= UCSI_VERSION_2_0) ? 256 : 16))
 
 #define UCSI_MAX_SVID		5
 #define UCSI_MAX_ALTMODES	(UCSI_MAX_SVID * 6)
@@ -564,13 +569,17 @@ struct ucsi_connector {
 
 int ucsi_send_command(struct ucsi *ucsi, u64 command,
 		      void *retval, size_t size);
+int ucsi_write_message_out_command(struct ucsi *ucsi, u64 command,
+				   void *retval, size_t size,
+				   void *msg_out, size_t msg_out_size);
 
 void ucsi_altmode_update_active(struct ucsi_connector *con);
 int ucsi_resume(struct ucsi *ucsi);
 
 void ucsi_notify_common(struct ucsi *ucsi, u32 cci);
 int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
-			     void *data, size_t size);
+			     void *data, size_t size, void *msg_out,
+			     size_t msg_out_size);
 
 #if IS_ENABLED(CONFIG_POWER_SUPPLY)
 int ucsi_register_port_psy(struct ucsi_connector *con);
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 6b92f296e985..60b12961e1a4 100644
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
+	return 0;
+}
+
 static int ucsi_acpi_async_control(struct ucsi *ucsi, u64 command)
 {
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
@@ -101,19 +116,22 @@ static const struct ucsi_operations ucsi_acpi_ops = {
 	.read_cci = ucsi_acpi_read_cci,
 	.poll_cci = ucsi_acpi_poll_cci,
 	.read_message_in = ucsi_acpi_read_message_in,
+	.write_message_out = ucsi_acpi_write_message_out,
 	.sync_control = ucsi_sync_control_common,
 	.async_control = ucsi_acpi_async_control
 };
 
 static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
-				  void *val, size_t len)
+				  void *val, size_t len, void *msg_out,
+				  size_t msg_out_size)
 {
 	u16 bogus_change = UCSI_CONSTAT_POWER_LEVEL_CHANGE |
 			   UCSI_CONSTAT_PDOS_CHANGE;
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
 	int ret;
 
-	ret = ucsi_sync_control_common(ucsi, command, cci, val, len);
+	ret = ucsi_sync_control_common(ucsi, command, cci, val, len,
+				       msg_out, msg_out_size);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 199799b319c2..0592938078a9 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -608,7 +608,8 @@ static int ucsi_ccg_async_control(struct ucsi *ucsi, u64 command)
 }
 
 static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
-				 void *data, size_t size)
+				 void *data, size_t size, void *msg_out,
+				 size_t msg_out_size)
 {
 	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
 	struct ucsi_connector *con;
@@ -630,7 +631,8 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
 		ucsi_ccg_update_set_new_cam_cmd(uc, con, &command);
 	}
 
-	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
+	ret = ucsi_sync_control_common(ucsi, command, cci, data, size,
+				       msg_out, msg_out_size);
 
 	switch (UCSI_COMMAND(command)) {
 	case UCSI_GET_CURRENT_CAM:
diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 0187c1c4b21a..1be18d101842 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -89,7 +89,8 @@ static int yoga_c630_ucsi_async_control(struct ucsi *ucsi, u64 command)
 static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
 				       u64 command,
 				       u32 *cci,
-				       void *data, size_t size)
+				       void *data, size_t size,
+				       void *msg_out, size_t msg_out_size)
 {
 	int ret;
 
@@ -126,7 +127,8 @@ static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
 		return 0;
 	}
 
-	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
+	ret = ucsi_sync_control_common(ucsi, command, cci,
+				       data, size, msg_out, msg_out_size);
 	if (ret < 0)
 		return ret;
 
-- 
2.43.0


