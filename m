Return-Path: <linux-usb+bounces-32711-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE0iIO0vd2lVdAEAu9opvQ
	(envelope-from <linux-usb+bounces-32711-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 10:12:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CE985DEF
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 10:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6383F3038ADD
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 09:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B845C303C8A;
	Mon, 26 Jan 2026 09:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DJkSEsGi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687193033E4
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 09:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769418387; cv=none; b=oJTJr/fyIByYsY5kfdzUqCIT4sW0UApP5yzV/Rrt1ukoH5POV0Wg6Z3dItzKluLCF5/fuLuUsNyu28U5FYfQq14FGRUrijgv0AajA2QYNcuzSs3CA6DOLfnEJp1z2nWnETKod6ZWCXVelzRD2Eql9Gc+MNCKFmysesCsL5YzWH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769418387; c=relaxed/simple;
	bh=KY83muG2ZW+6ROgcrhF3RmXusvN2d/Jnw7vj7y215is=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t+dXp+4uEIOZXyscv9FN/A53bUbOQE8aKotnN61k/McYeRlyhp60bxCvRfeNM0Ye9Avm9atSrOxkZWyE1e68+D3gsMiqAGjaF/7kd21rOMrq7xwKg1nmNIVZjfVRsYqQpFGEEa8R+1Wj1FAhYGsIlNekoZKruqFtTVjCvWwL4NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DJkSEsGi; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b87677a8abeso652646866b.1
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 01:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769418384; x=1770023184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L28omD9h5A1Pa+2UFWswURo4v1rX609r7Db36NIyuBA=;
        b=DJkSEsGiBda5ljU3gfdVZhaYDXdn2OP9Ii22Z3KeXQVQYQ6eyPMU7Yf/+dTuazrJ63
         Vr5UCUABDeTGZnn8JCvkqLQLd+MJMKRL9K0OysFY7aFOR2vkJp9DQxZQpuMUczoHd0qO
         d78QBjEzr/KM62C+7r6equnr6FbreROitDQTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769418384; x=1770023184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L28omD9h5A1Pa+2UFWswURo4v1rX609r7Db36NIyuBA=;
        b=lHvqdeNiOqtKSNBXzo7skyvTxBP4HzxrELgWu+KeUdTupUO+KrMM6zfeNz/2LhEyve
         0qpARndPXeIFEzYo/euNbdp7DKK3Ti7bulnrQwjlYtThjEhbPBzXIgYn+655DoqLXiLM
         yS4Ats9X7ML4rVXJZGc8xq9Yzwq0Pzz1YJmgJ6SfmlmDfRxfgOzVFcTU8bkd++VzHQTC
         tJxKA2j7HX+IfrBUU5de+KdizkAttUUmP+YCFtcdurmWJc4fUGbo5WngArW5MJ6JBOff
         m22MwVvKFfJxfIiZoNgWyMzne8c9Sv3bp0AcGqspkdzjfvcp+IpAq8IcAdFM2dzmbzWQ
         FOcg==
X-Forwarded-Encrypted: i=1; AJvYcCXi64yUohw37Saf3M05SUDP/FuwlQxAnIbcTzAhLlVX3xscuvVfuSoEl+FAdlNTmqaLqBrzIHaNOtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGWzUlevjcQOR7uOHURVaScyLSgH2vZ6VXoNJUKPvXVXbPwIQ1
	94kT2EJpxWjI5ilBdnsiN9sebbQmlxwbTWDPALoU+Sr8i2z2KNiZKo9ezplSkqf3yl3U9eSkvTn
	bQsI=
X-Gm-Gg: AZuq6aIknbJ8dXbZaHjNIOcmquWlbz9EwRc10HrQKfZLeOALHba67FVqQU284Sk8rjR
	ADO2ssFiIwexsK6ckCLox6N3RbKGT9Nb7nMbrkq+ltXm1lB2BMg8nLic1T5whSQlTi3l7Ro1ARF
	zzNfmWnDdHPB4Xq+KOHqAs6MfoCsSczuyiW1moL3BOkwJFO6rjKkT+XGOsSelfepgkgknX+2uwV
	l8ZS1NKDxQf5D6iL/Xs2W7rgeGvUvW2jrSwibSgM9e0UUusM1u0vsLV80vDHSdEps8gqe+IGwSj
	GVuqfGjxitCaTKN7tPftYnbh/BMGzY9Bd6HJl2Q6umn2yENWYv3AznTwVVDBMAwLhm7kJOrM8X+
	TylSZk3TZQQADczOiA1IVT0ItnLO/oWc3gv141omD6l86sMhIMiQEJmXRvmqbOveKaLkBa3C+FR
	rYTMH9LA6Cmfhda2u4e9gxXpDUSUnWxrQhuP27BcBmvgfYcVVfBXIKRnGlm8Gu4wm8Q0TJ8Yfj2
	ZNFzna3
X-Received: by 2002:a17:907:9713:b0:b86:f81d:66b1 with SMTP id a640c23a62f3a-b8d0a73aeb1mr251837366b.2.1769418383663;
        Mon, 26 Jan 2026 01:06:23 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b7bb0b0sm614579666b.67.2026.01.26.01.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 01:06:22 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Fedor Pchelkin <boddah8794@gmail.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH] usb: typec: ucsi: Add Thunderbolt alternate mode support
Date: Mon, 26 Jan 2026 09:06:16 +0000
Message-ID: <20260126090616.2224907-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,linuxfoundation.org,oss.qualcomm.com,intel.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32711-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akuchynski@chromium.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-0.981];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C7CE985DEF
X-Rspamd-Action: no action

Introduce support for Thunderbolt (TBT) alternate mode to the UCSI driver.
This allows the driver to manage the entry and exit of TBT altmode by
providing the necessary typec_altmode_ops.

ucsi_altmode_update_active() is invoked when the Connector Partner Changed
bit is set in the GET_CONNECTOR_STATUS data. This ensures that the
alternate mode's active state is synchronized with the current mode the
connector is operating in.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/Makefile      |   4 +
 drivers/usb/typec/ucsi/thunderbolt.c | 205 +++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.c        |  18 ++-
 drivers/usb/typec/ucsi/ucsi.h        |  20 +++
 4 files changed, 242 insertions(+), 5 deletions(-)
 create mode 100644 drivers/usb/typec/ucsi/thunderbolt.c

diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
index dbc571763eff6..c7e38bf01350d 100644
--- a/drivers/usb/typec/ucsi/Makefile
+++ b/drivers/usb/typec/ucsi/Makefile
@@ -17,6 +17,10 @@ ifneq ($(CONFIG_TYPEC_DP_ALTMODE),)
 	typec_ucsi-y			+= displayport.o
 endif
 
+ifneq ($(CONFIG_TYPEC_TBT_ALTMODE),)
+	typec_ucsi-y			+= thunderbolt.o
+endif
+
 obj-$(CONFIG_UCSI_ACPI)			+= ucsi_acpi.o
 obj-$(CONFIG_UCSI_CCG)			+= ucsi_ccg.o
 obj-$(CONFIG_UCSI_STM32G0)		+= ucsi_stm32g0.o
diff --git a/drivers/usb/typec/ucsi/thunderbolt.c b/drivers/usb/typec/ucsi/thunderbolt.c
new file mode 100644
index 0000000000000..e3232544ce4c5
--- /dev/null
+++ b/drivers/usb/typec/ucsi/thunderbolt.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * UCSI Thunderbolt Alternate Mode Support
+ *
+ * Copyright 2025 Google LLC
+ */
+
+#include <linux/usb/typec_tbt.h>
+#include <linux/usb/pd_vdo.h>
+
+#include "ucsi.h"
+
+/**
+ * struct ucsi_tbt - Thunderbolt Alternate Mode private data structure
+ * @con: Pointer to UCSI connector structure
+ * @alt: Pointer to typec altmode structure
+ * @work: Work structure
+ * @cam: An offset into the list of alternate modes supported by the PPM
+ * @header: VDO header
+ */
+struct ucsi_tbt {
+	struct ucsi_connector *con;
+	struct typec_altmode *alt;
+	struct work_struct work;
+	int cam;
+	u32 header;
+};
+
+static void ucsi_thunderbolt_work(struct work_struct *work)
+{
+	struct ucsi_tbt *tbt = container_of(work, struct ucsi_tbt, work);
+
+	if (typec_altmode_vdm(tbt->alt, tbt->header, NULL, 0))
+		dev_err(&tbt->alt->dev, "VDM 0x%x failed\n", tbt->header);
+
+	tbt->header = 0;
+}
+
+static int ucsi_thunderbolt_set_altmode(struct ucsi_tbt *tbt,
+					bool enter, u32 vdo)
+{
+	int svdm_version;
+	int cmd;
+	int ret;
+	u64 command = UCSI_SET_NEW_CAM |
+		      UCSI_CONNECTOR_NUMBER(tbt->con->num) |
+		      UCSI_SET_NEW_CAM_SET_AM(tbt->cam) |
+		      ((u64)vdo << 32);
+
+	if (enter)
+		command |= (1 << 23);
+
+	ret = ucsi_send_command(tbt->con->ucsi, command, NULL, 0);
+	if (ret < 0)
+		return ret;
+
+	svdm_version = typec_altmode_get_svdm_version(tbt->alt);
+	if (svdm_version < 0)
+		return svdm_version;
+
+	if (enter)
+		cmd = CMD_ENTER_MODE;
+	else
+		cmd = CMD_EXIT_MODE;
+	tbt->header = VDO(USB_TYPEC_TBT_SID, 1, svdm_version, cmd);
+	tbt->header |= VDO_OPOS(TYPEC_TBT_MODE);
+	tbt->header |= VDO_CMDT(CMDT_RSP_ACK);
+
+	schedule_work(&tbt->work);
+
+	return 0;
+}
+
+static int ucsi_thunderbolt_enter(struct typec_altmode *alt, u32 *vdo)
+{
+	struct ucsi_tbt *tbt = typec_altmode_get_drvdata(alt);
+	struct ucsi_connector *con = tbt->con;
+	u64 command;
+	u8 cur = 0;
+	int ret;
+
+	if (!ucsi_con_mutex_lock(con))
+		return -ENOTCONN;
+
+	command = UCSI_GET_CURRENT_CAM | UCSI_CONNECTOR_NUMBER(con->num);
+	ret = ucsi_send_command(con->ucsi, command, &cur, sizeof(cur));
+	if (ret < 0) {
+		if (con->ucsi->version > 0x0100)
+			goto err_unlock;
+		cur = 0xff;
+	}
+
+	if (cur != 0xff) {
+		if (cur >= UCSI_MAX_ALTMODES || con->port_altmode[cur] != alt)
+			ret = -EBUSY;
+		else
+			ret = 0;
+		goto err_unlock;
+	}
+
+	ret = ucsi_thunderbolt_set_altmode(tbt, true, *vdo);
+	ucsi_altmode_update_active(tbt->con);
+
+err_unlock:
+	ucsi_con_mutex_unlock(con);
+
+	return ret;
+}
+
+static int ucsi_thunderbolt_exit(struct typec_altmode *alt)
+{
+	struct ucsi_tbt *tbt = typec_altmode_get_drvdata(alt);
+	int ret;
+
+	if (!ucsi_con_mutex_lock(tbt->con))
+		return -ENOTCONN;
+
+	ret = ucsi_thunderbolt_set_altmode(tbt, false, 0);
+
+	ucsi_con_mutex_unlock(tbt->con);
+
+	return ret;
+}
+
+static int ucsi_thunderbolt_vdm(struct typec_altmode *alt,
+				u32 header, const u32 *data, int count)
+{
+	struct ucsi_tbt *tbt = typec_altmode_get_drvdata(alt);
+	int cmd_type = PD_VDO_CMDT(header);
+	int cmd = PD_VDO_CMD(header);
+	int svdm_version;
+
+	if (!ucsi_con_mutex_lock(tbt->con))
+		return -ENOTCONN;
+
+	svdm_version = typec_altmode_get_svdm_version(alt);
+	if (svdm_version < 0) {
+		ucsi_con_mutex_unlock(tbt->con);
+		return svdm_version;
+	}
+
+	switch (cmd_type) {
+	case CMDT_INIT:
+		if (PD_VDO_SVDM_VER(header) < svdm_version) {
+			svdm_version = PD_VDO_SVDM_VER(header);
+			typec_partner_set_svdm_version(tbt->con->partner, svdm_version);
+		}
+		tbt->header = VDO(USB_TYPEC_TBT_SID, 1, svdm_version, cmd);
+		tbt->header |= VDO_OPOS(TYPEC_TBT_MODE);
+		tbt->header |= VDO_CMDT(CMDT_RSP_ACK);
+
+		schedule_work(&tbt->work);
+		break;
+	default:
+		break;
+	}
+
+	ucsi_con_mutex_unlock(tbt->con);
+
+	return 0;
+}
+
+static const struct typec_altmode_ops ucsi_thunderbolt_ops = {
+	.enter = ucsi_thunderbolt_enter,
+	.exit = ucsi_thunderbolt_exit,
+	.vdm = ucsi_thunderbolt_vdm,
+};
+
+struct typec_altmode *ucsi_register_thunderbolt(struct ucsi_connector *con,
+						bool override, int offset,
+						struct typec_altmode_desc *desc)
+{
+	struct typec_altmode *alt;
+	struct ucsi_tbt *tbt;
+
+	alt = typec_port_register_altmode(con->port, desc);
+	if (IS_ERR(alt) || !override)
+		return alt;
+
+	tbt = devm_kzalloc(&alt->dev, sizeof(*tbt), GFP_KERNEL);
+	if (!tbt) {
+		typec_unregister_altmode(alt);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	tbt->cam = offset;
+	tbt->con = con;
+	tbt->alt = alt;
+	INIT_WORK(&tbt->work, ucsi_thunderbolt_work);
+	typec_altmode_set_drvdata(alt, tbt);
+	typec_altmode_set_ops(alt, &ucsi_thunderbolt_ops);
+
+	return alt;
+}
+
+void ucsi_thunderbolt_remove_partner(struct typec_altmode *alt)
+{
+	struct ucsi_tbt *tbt;
+
+	if (alt) {
+		tbt = typec_altmode_get_drvdata(alt);
+		if (tbt)
+			cancel_work_sync(&tbt->work);
+	}
+}
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 251990475faa7..91b6c71dd7396 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_tbt.h>
 
 #include "ucsi.h"
 #include "trace.h"
@@ -417,6 +418,9 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
 				alt = ucsi_register_displayport(con, override,
 								i, desc);
 			break;
+		case USB_TYPEC_TBT_SID:
+			alt = ucsi_register_thunderbolt(con, override, i, desc);
+			break;
 		default:
 			alt = typec_port_register_altmode(con->port, desc);
 			break;
@@ -647,12 +651,15 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 	}
 
 	while (adev[i]) {
-		if (recipient == UCSI_RECIPIENT_SOP &&
-		    (adev[i]->svid == USB_TYPEC_DP_SID ||
-			(adev[i]->svid == USB_TYPEC_NVIDIA_VLINK_SID &&
-			adev[i]->vdo != USB_TYPEC_NVIDIA_VLINK_DBG_VDO))) {
+		if (recipient == UCSI_RECIPIENT_SOP) {
 			pdev = typec_altmode_get_partner(adev[i]);
-			ucsi_displayport_remove_partner((void *)pdev);
+
+			if (adev[i]->svid == USB_TYPEC_DP_SID ||
+			    (adev[i]->svid == USB_TYPEC_NVIDIA_VLINK_SID &&
+			     adev[i]->vdo != USB_TYPEC_NVIDIA_VLINK_DBG_VDO))
+				ucsi_displayport_remove_partner((void *)pdev);
+			else if (adev[i]->svid == USB_TYPEC_TBT_SID)
+				ucsi_thunderbolt_remove_partner((void *)pdev);
 		}
 		typec_unregister_altmode(adev[i]);
 		adev[i++] = NULL;
@@ -1318,6 +1325,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 
 	if (con->partner && (change & UCSI_CONSTAT_PARTNER_CHANGE)) {
 		ucsi_partner_change(con);
+		ucsi_altmode_update_active(con);
 
 		/* Complete pending data role swap */
 		if (!completion_done(&con->complete))
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 4797b4aa1e35b..43a0d01ade8ff 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -600,6 +600,26 @@ static inline void
 ucsi_displayport_remove_partner(struct typec_altmode *adev) { }
 #endif /* CONFIG_TYPEC_DP_ALTMODE */
 
+#if IS_ENABLED(CONFIG_TYPEC_TBT_ALTMODE)
+struct typec_altmode *
+ucsi_register_thunderbolt(struct ucsi_connector *con,
+			  bool override, int offset,
+			  struct typec_altmode_desc *desc);
+
+void ucsi_thunderbolt_remove_partner(struct typec_altmode *adev);
+#else
+static inline struct typec_altmode *
+ucsi_register_thunderbolt(struct ucsi_connector *con,
+			  bool override, int offset,
+			  struct typec_altmode_desc *desc)
+{
+	return typec_port_register_altmode(con->port, desc);
+}
+
+static inline void
+ucsi_thunderbolt_remove_partner(struct typec_altmode *adev) { }
+#endif /* CONFIG_TYPEC_TBT_ALTMODE */
+
 #ifdef CONFIG_DEBUG_FS
 void ucsi_debugfs_init(void);
 void ucsi_debugfs_exit(void);
-- 
2.52.0.457.g6b5491de43-goog


