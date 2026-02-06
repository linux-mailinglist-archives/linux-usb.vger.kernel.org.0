Return-Path: <linux-usb+bounces-33138-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EzrsAFXXhWlKHQQAu9opvQ
	(envelope-from <linux-usb+bounces-33138-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 12:58:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45389FD645
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 12:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC593302A2FA
	for <lists+linux-usb@lfdr.de>; Fri,  6 Feb 2026 11:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC8A3A0B36;
	Fri,  6 Feb 2026 11:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hpx+MOhv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90DD32FA3C
	for <linux-usb@vger.kernel.org>; Fri,  6 Feb 2026 11:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770379085; cv=none; b=YimjE14LSjEJ093pPelZ76lIpWlDZf4l0r/cDY3QFH9l+hkMEjl6Tz44Kz3oTMiKX9wTNcvqhPh+Wy4boNVwSrwhqPCqyJKILb7k78SI9dtTJF2LrG1N2H9eaHd/ZjVlgHyt0W8i6bkn1Krf6Ko2McVXUP5LsWSXWeZl2RcleOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770379085; c=relaxed/simple;
	bh=rUIhMipKm3DSYi4rMpTxaSLCerFl3MWcIQdR3tTgN6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ukoFhBqlihMO9GPKl1IWx3nloSw/lRMnaVIer0JMkK/PqCMFchzmFeasY7/hos80jdVlP9XJYK1jKyjl4/uOej3uUHBzVKaS39ga3VuTQ6RJOn0QzztgZx6KfTSkltSXSG9UATR8zX5U4BPLtK2FaEO3Q9jKrmB9VEc0I9nQQQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hpx+MOhv; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64bea6c5819so2976526a12.3
        for <linux-usb@vger.kernel.org>; Fri, 06 Feb 2026 03:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770379083; x=1770983883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2hyTsbP3mhP9Lt+xVfNMhvW7SHAmDYkzNc2qvfLi+XU=;
        b=Hpx+MOhv6tr+iCPtI5zakPVlZdI5aNLWdwy4PRwJXaVXneSoIqfKNkwkiuNeVww50O
         H+3ysrFAyFoyU8AeqPPjl1gQNcHPpjEBI7WkQ0CYwij8pPLPbdHrDd1etr4aMX9GeUcI
         y/xp2QyMvrrP8gu4QK9W7OBnDQgv4vgEwLRNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770379083; x=1770983883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hyTsbP3mhP9Lt+xVfNMhvW7SHAmDYkzNc2qvfLi+XU=;
        b=qB+8Mmldvs7AOspJNbzKuE/1Hx0VE57NKaA1BnQjknPMRtNv163gyNdDkGyX+R0r7L
         saPxJKUEbJqFzvrae+J1loOwbw3OWtOiuguubN+eDyHn7H/v3N1ctWZnphwOK3xZUj9L
         K8Wvdpg1x+xp3dv6Iur2kx4WOZu4EbWDniqyD2dsp9psZaTFC2UUdXELm6houDscpDZG
         +BHYPineYOREljQywhM1VY8NJGkKtd4XtQd75xmgAzjIDeepkW2/Qv19xpFLEBEqN4qt
         ADoXJjoWvIYQ9mjXQgbSVG5sbfBcyc5rIQJ+cireG2hXwW2DVXiz8Eu9KStaTYkosMN+
         w0mA==
X-Forwarded-Encrypted: i=1; AJvYcCXmd8XVq4yTT6kOpmLe7PG5BWXgK/3RaBN2TS42bHQx/ECeJW9SywOJzrAeJ6l5qhxwZ/HT1LO/y1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyTFazmqlklgVGej+WAOPapz3iNP4y/tRjYS1b32+Nr8bvyfaQ
	58V1/7zWEo208vUXQAMWfXTEPWrU8S3aZHb4+pBjPAsjFsontbSflXoB5NybveD2+g==
X-Gm-Gg: AZuq6aLVDbbQsCCBt16+uv6c1dMisjJrKpRGumCc5kComPKHyb6mvk4/yMOkLVl0AkY
	qox1CZ2xfBPZ+HN1ZQ4RfYzZQRm5bGRb27LvP5A5e4QZOXGcFwm5ACYQemjmA+jEv4ORKcwbRqW
	IKOdma/viGAd/TvtZt1HhUT4oAJ6wF6TcC/4cpR7i2UA6RR30MXRahJjcm96Ea/35XIhAOdUW0t
	mFwqhhiXWB21H/oWu9RtMO+9Q23wyNF+ATwz4ahCdqEAo1jBucbDPqlqe2q9EPLtAYg732dC/L3
	mGnZhu4KrRPq46s+qA70M058Qu63JDCz/ISviTjmq72Ub87PWUB418oXlmRNiP7F9+CJQS4dXlx
	BPt6J3C6wVybLXhq1XGpJ7waYeZ7Gw8DfT7u/9JO97z2UXWCUUtb2mOB3PCSFHWID0zhOwpgjRR
	S9j0UNcwk6YxRxHcPjlnv+MuCLOLsAJObSk+Q7hftjeATMK8tT5QJw/ektAJIhzAGosdjZpflzv
	2E=
X-Received: by 2002:a05:6402:2706:b0:658:377e:f05d with SMTP id 4fb4d7f45d1cf-6598417d31emr1061015a12.24.1770379082989;
        Fri, 06 Feb 2026 03:58:02 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (6.187.91.34.bc.googleusercontent.com. [34.91.187.6])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65983eb68cfsm491210a12.12.2026.02.06.03.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:58:01 -0800 (PST)
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
Subject: [PATCH v2] usb: typec: ucsi: Add Thunderbolt alternate mode support
Date: Fri,  6 Feb 2026 11:57:54 +0000
Message-ID: <20260206115754.828954-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[chromium.org,linuxfoundation.org,oss.qualcomm.com,intel.com,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-33138-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akuchynski@chromium.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 45389FD645
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
Changes in V2:
- Update copyright year to 2026.
- Explicitly include all required headers.
- No functional changes compared to V1.

 drivers/usb/typec/ucsi/Makefile      |   4 +
 drivers/usb/typec/ucsi/thunderbolt.c | 212 +++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.c        |  18 ++-
 drivers/usb/typec/ucsi/ucsi.h        |  20 +++
 4 files changed, 249 insertions(+), 5 deletions(-)
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
index 0000000000000..434d3d8ea5b6e
--- /dev/null
+++ b/drivers/usb/typec/ucsi/thunderbolt.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * UCSI Thunderbolt Alternate Mode Support
+ *
+ * Copyright 2026 Google LLC
+ */
+
+#include <linux/usb/typec_tbt.h>
+#include <linux/usb/pd_vdo.h>
+#include <linux/err.h>
+#include <linux/dev_printk.h>
+#include <linux/device/devres.h>
+#include <linux/gfp_types.h>
+#include <linux/types.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/workqueue.h>
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
2.53.0.rc2.204.g2597b5adb4-goog


