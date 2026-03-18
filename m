Return-Path: <linux-usb+bounces-35078-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNlpBX0mu2kcfwIAu9opvQ
	(envelope-from <linux-usb+bounces-35078-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 23:26:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 898C22C35A5
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 23:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A470C301DEF2
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 22:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F89374742;
	Wed, 18 Mar 2026 22:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nkcstpCf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9643093B8
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 22:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773872762; cv=none; b=Dtb8blt3yfIUcGTmCzcLC9WWoKLK8Xi65yDHcvFkvnd8+y57NQWRWpLRt27x7neZdUqKT5qO97LPKmGQ8B7VCxUPL6PKGjhvf/u6IRIESqlkWVa8+RdT5oZBiXz6cgdpD4hwT3vQs5tK9LJcs0NMOcaDEgvi42UGWz/1fCSu8n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773872762; c=relaxed/simple;
	bh=OeBPU0ptbnymoxeBRbm+z2VUde+0lwf752SsP2MFbuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SwnSFXRESn9pYg+4HaMaNxpnApevkRGQ+2Dr1QRfbA6o1+qQPKxd5YNAq3dVD9JiPUnPAwJv0wKjIFMBWugXZkdoMCWfy5kwzHHNZfPRksLLpdErXfyTIbUEb22GjbeafytOsDMITYYOZkMC1IB3a5TZTy1hJ0Wp7Uv+6L0UkCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nkcstpCf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773872761; x=1805408761;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OeBPU0ptbnymoxeBRbm+z2VUde+0lwf752SsP2MFbuw=;
  b=nkcstpCfs8z7016gPC92VQDPWmqjhiaSzXY3aBQhY45ORjKSbbhUqA9l
   tNyLXoLJ5U8fcqFue7tHqLI7W2TCJ+ehNTh9Jkn+qz0P8RmsNI0YKUP0z
   A2VKCd+Qocpwo2bNOh7JTF3NG+kPY8XByEoF1M1Jm5O/Iib2UXUOtgUKf
   qwh24N1ulvQSJ7hr56iTLiJ492SyH6cwGuXSoeXq2ZCoFDPKSuX4wu99h
   GYWnVFsUjSbGJgODXu5BObmbAsp7uwZ25aoFhYV64KBpM8k1Bj21RWsUW
   MvJUrgXnJ5wFm8OpYkOlBhk8mJjqr7aVBkbr5UlBP5Mj/6wy05QAe/C5H
   A==;
X-CSE-ConnectionGUID: UMcZbvjFSb++nrKgUmxq7g==
X-CSE-MsgGUID: AciGFFysSEa1zvvZBKcpAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74637572"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="74637572"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 15:26:01 -0700
X-CSE-ConnectionGUID: koNbe8/+RiaLSBXFyocZyw==
X-CSE-MsgGUID: slbH4fWHRCKFja5fLLRXhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="227467434"
Received: from clke07vm102.fm.intel.com (HELO clke07vm102.amr.corp.intel.com) ([10.80.128.226])
  by fmviesa005.fm.intel.com with ESMTP; 18 Mar 2026 15:26:00 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	dmitry.baryshkov@oss.qualcomm.com,
	johan@kernel.org,
	asutosh.pathak@intel.com,
	Pooja Katiyar <pooja.katiyar@intel.com>
Subject: [PATCH 1/3] usb: typec: ucsi: Add support for message_out data structure
Date: Wed, 18 Mar 2026 15:25:29 -0700
Message-ID: <2f65ebbcf05ab74044ec8e2aa9c06145625bf510.1773090896.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773090896.git.pooja.katiyar@intel.com>
References: <cover.1773090896.git.pooja.katiyar@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35078-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pooja.katiyar@intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.988];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 898C22C35A5
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
 drivers/usb/typec/ucsi/cros_ec_ucsi.c   |  6 ++-
 drivers/usb/typec/ucsi/ucsi.c           | 52 ++++++++++++++++++++-----
 drivers/usb/typec/ucsi/ucsi.h           | 13 ++++++-
 drivers/usb/typec/ucsi/ucsi_acpi.c      | 22 ++++++++++-
 drivers/usb/typec/ucsi/ucsi_ccg.c       |  6 ++-
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c |  6 ++-
 6 files changed, 85 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index 6bca2dce211c..d0d25ab707b4 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -112,12 +112,14 @@ static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
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
index f38a4d7ebc42..153a59248a61 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -57,7 +57,8 @@ void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
 EXPORT_SYMBOL_GPL(ucsi_notify_common);
 
 int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
-			     void *data, size_t size)
+			     void *data, size_t size, void *msg_out,
+			     size_t msg_out_size)
 {
 	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
 	int ret;
@@ -69,6 +70,17 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
 
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
@@ -104,11 +116,12 @@ static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
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
 
@@ -117,10 +130,12 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
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
 
@@ -152,7 +167,8 @@ static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
 	int ret;
 
 	command = UCSI_GET_ERROR_STATUS | UCSI_CONNECTOR_NUMBER(connector_num);
-	ret = ucsi_run_command(ucsi, command, &cci, &error, sizeof(error), false);
+	ret = ucsi_run_command(ucsi, command, &cci, &error,
+			       sizeof(error), NULL, 0, false);
 	if (ret < 0)
 		return ret;
 
@@ -202,7 +218,8 @@ static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
 }
 
 static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
-				    void *data, size_t size, bool conn_ack)
+				    void *data, size_t size, void *msg_out,
+				    size_t msg_out_size, bool conn_ack)
 {
 	u8 connector_num;
 	u32 cci;
@@ -230,7 +247,8 @@ static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
 
 	mutex_lock(&ucsi->ppm_lock);
 
-	ret = ucsi_run_command(ucsi, cmd, &cci, data, size, conn_ack);
+	ret = ucsi_run_command(ucsi, cmd, &cci, data, size,
+			       msg_out, msg_out_size, conn_ack);
 
 	if (cci & UCSI_CCI_ERROR)
 		ret = ucsi_read_error(ucsi, connector_num);
@@ -242,10 +260,23 @@ static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
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
@@ -673,7 +704,8 @@ static int ucsi_get_connector_status(struct ucsi_connector *con, bool conn_ack)
 			  UCSI_MAX_DATA_LENGTH(con->ucsi));
 	int ret;
 
-	ret = ucsi_send_command_common(con->ucsi, command, &con->status, size, conn_ack);
+	ret = ucsi_send_command_common(con->ucsi, command, &con->status, size,
+				       NULL, 0, conn_ack);
 
 	return ret < 0 ? ret : 0;
 }
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 43a0d01ade8f..82565f502bdf 100644
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
@@ -500,6 +502,9 @@ struct ucsi {
 };
 
 #define UCSI_MAX_DATA_LENGTH(u) (((u)->version < UCSI_VERSION_2_0) ? 0x10 : 0xff)
+#define UCSI_MAX_MSG_OUT_DATA_LEN(u) \
+	(((u)->version >= UCSI_VERSION_3_0) ? 255 : \
+	 (((u)->version >= UCSI_VERSION_2_0) ? 256 : 16))
 
 #define UCSI_MAX_SVID		5
 #define UCSI_MAX_ALTMODES	(UCSI_MAX_SVID * 6)
@@ -561,13 +566,17 @@ struct ucsi_connector {
 
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


