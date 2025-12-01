Return-Path: <linux-usb+bounces-31068-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B7833C9741C
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 13:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E26934E18E8
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 12:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4113130C343;
	Mon,  1 Dec 2025 12:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K1rpz7Ru"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2527830F818
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 12:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591991; cv=none; b=kofgxhWrAcsE7VAyFcjCzXVC/0i+Laycp+8kRz7fsJREk5HiQDszmsKfmObjukkQ5Ksmob4mPq6lU2CHUNXQw96WsyAM89u4zWDt98I0cH5/RDpkrgpzu5HHS0mGh4TbNQZKlVh+HvgNvQnyaEALD37KIFrqh49q6gn/1p8bXa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591991; c=relaxed/simple;
	bh=Aw9cRokS/uZtiRRUzr7HvgFMTdAZMAC2OR3yeCxVV8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lH2NH7yZSfwF24+YMNt7Nlodl6S/S8wcIFGBR1ssVlmwvMNQR1AgKfxN3xX64jSnlbTCAbd9HJs44C0f+majIqrfSPZz/dEh19ZuewOl0S+2lMIpQblbmyRdYvAOYsd+baEcP8oupdo7BMBG+HxdMXlNlE1NKQF9sQjI9JioFb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K1rpz7Ru; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b79b9113651so27198466b.3
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 04:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764591987; x=1765196787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tm2xzdVNcbrW6Xwd+l1xE/GsVThA2I1Dhuida+Cqw6c=;
        b=K1rpz7RumWjD4tlEsj1XyqgMbh6/7eMxnRItyFnkAE6JSKueRwfmAiPPCzgpnU/8Qn
         VjvfXmbCjbmHVFfIorVPVrYYz25qPcxgAqFN7F3Fj94JdcoBQ/MZe3Bjlt+dec2w6Zxc
         AP49oy79Wb7n5maf9l+RQN4nAX5sxWJ+9Cvdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591987; x=1765196787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tm2xzdVNcbrW6Xwd+l1xE/GsVThA2I1Dhuida+Cqw6c=;
        b=B2lC1ScvbwmDLFQwjDPZHadKTzdJfksF0MUTvjZFas+tgGDRguQqb7IzwvApjkY2/E
         C+nRSMmetojUSe32C1IKl7+gr2Uj6bZKSiynSFT/b+UzRZYB/DdmJMNt4R9cGLGBlFXR
         pbFdIs3z/7vcaCta9qAdw5P5SwXFnTFzhkq0udr5u/rqyVGtmsEel3PGqGxAAwgLFs3S
         bvWqnrliaaC4qScEzzZPaRK6rcTX1OVvAvMjrBT7F9bF+1eBG7eg78C9SERS+v4Co9Hz
         ocKi+vBvThN2b0dR5YvrUH2A4dlVE4tTo/x/IA5/FXFcad11ztkjU2h5Ahz8iQN5mKdc
         UXKA==
X-Forwarded-Encrypted: i=1; AJvYcCUGU3EuXh0lTBsia4H68dDRkOy8Yu2ceNwea+2tpMyxGdJoxoKBKN0BTHcxCGoro/ti/ZFviUE+ChA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVJk45S9Scxl6WtocNvz7NPi9QCoQ1fW4YDnYed3Mqswdn2T5R
	1Hus+kRPVc+6e88oTPd4DNIiLZ12X+oIXixKHUCouHnDyv1nv/YkAglAwSDt9b3IHw==
X-Gm-Gg: ASbGncuD/CfXqABBA8Dvz7AYVPBf8YEC4bJy+X9sBEsGF0xI1pv9GJaxrdX84a0Ozru
	mpklERk2B+jkx20cbPsLpvufGXO3+Qq9+Bi3rja+fVdRuaVfae2jAXywmUbwR1sk1NDdv/kyp3r
	7H77R1k/qcUikRxwBtmWlre3wq0xzV0BrhlgyYiBAwxSbGSqF5m0pTPJMjCL4w5D3qmjm8+uJHs
	hQSIdKU0zAttEpW/5/IOi+ZsldYKyVAIRWyoOxBiTAN/+sClf0OTZ5Q4C+Va3pgs8/5qbP2Ooc+
	OJkrZ688/CYP4LhVHzgSy8b6/Dy0m0WQpTw144+neIqRdeFm1sSqXT0Q4xbMZQo30oYBABiDwU4
	PgeIYewKXrayiOvFgiJG5HltmhnD8qOrvccWA4vHtUZ0nfaz9W/DmKkOcxUGhVlVsanvLjhImkz
	dPDwbbmRDu6T6qywI6SkxGU6eUbjpE3vr++vjvc6WY5yccI6+B7XXcjro3lI3aZxG+iIn7Dx0+q
	TDzQFRqCqw=
X-Google-Smtp-Source: AGHT+IGhiJudIaKRHf4l8rAikemNGaJh4kR2eXwxXLj3hd7r42POxmccuoXvUuS74QXXqJ13JrDiDQ==
X-Received: by 2002:a17:907:7f19:b0:b73:9b49:2dc7 with SMTP id a640c23a62f3a-b76c558f4b0mr2627081066b.52.1764591987274;
        Mon, 01 Dec 2025 04:26:27 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (218.127.147.34.bc.googleusercontent.com. [34.147.127.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e331sm1229049266b.24.2025.12.01.04.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:26:26 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Pavan Holla <pholla@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 7/8] usb: typec: ucsi: Support for Thunderbolt alt mode
Date: Mon,  1 Dec 2025 12:26:03 +0000
Message-ID: <20251201122604.1268071-8-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.158.g65b55ccf14-goog
In-Reply-To: <20251201122604.1268071-1-akuchynski@chromium.org>
References: <20251201122604.1268071-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes it possible to bind a driver to a Thunderbolt
alt mode adapter devices.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/Makefile      |   4 +
 drivers/usb/typec/ucsi/thunderbolt.c | 199 +++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.c        |  17 ++-
 drivers/usb/typec/ucsi/ucsi.h        |  20 +++
 4 files changed, 235 insertions(+), 5 deletions(-)
 create mode 100644 drivers/usb/typec/ucsi/thunderbolt.c

diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
index dbc571763eff..c7e38bf01350 100644
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
index 000000000000..b48aba30fb9f
--- /dev/null
+++ b/drivers/usb/typec/ucsi/thunderbolt.c
@@ -0,0 +1,199 @@
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
+struct ucsi_tbt {
+	struct ucsi_connector *con;
+	struct typec_altmode *alt;
+	struct work_struct work;
+
+	int cam;
+	u32 header;
+};
+
+static int ucsi_thunderbolt_send_set_new_cam(struct ucsi_tbt *tbt,
+				const int enter)
+{
+	int ret;
+	const u64 command = UCSI_SET_NEW_CAM |
+				UCSI_CONNECTOR_NUMBER(tbt->con->num) |
+				UCSI_SET_NEW_CAM_SET_ENTER(enter) |
+				UCSI_SET_NEW_CAM_SET_AM(tbt->cam);
+
+	tbt->con->ucsi->message_in_size = 0;
+	ret = ucsi_send_command(tbt->con->ucsi, command);
+
+	return ret < 0 ? ret : 0;
+}
+
+static void ucsi_thunderbolt_work(struct work_struct *work)
+{
+	struct ucsi_tbt *tbt = container_of(work, struct ucsi_tbt, work);
+	const int ret = typec_altmode_vdm(tbt->alt, tbt->header, NULL, 0);
+
+	if (ret)
+		dev_err(&tbt->alt->dev, "VDM 0x%x failed\n", tbt->header);
+}
+
+static int ucsi_thunderbolt_send_vdm(struct ucsi_tbt *tbt,
+					const int cmd, const int cmdt,
+					const int svdm_version)
+{
+	if (svdm_version < 0)
+		return svdm_version;
+
+	tbt->header = VDO(USB_TYPEC_TBT_SID, 1, svdm_version, cmd);
+	tbt->header |= VDO_OPOS(TYPEC_TBT_MODE);
+	tbt->header |= VDO_CMDT(cmdt);
+
+	schedule_work(&tbt->work);
+
+	return 0;
+}
+
+static int ucsi_thunderbolt_enter(struct typec_altmode *alt, u32 *vdo)
+{
+	struct ucsi_tbt *tbt = typec_altmode_get_drvdata(alt);
+	struct ucsi *ucsi = tbt->con->ucsi;
+	int svdm_version;
+	u64 command;
+	u8 cur = 0;
+	int ret = 0;
+
+	if (!ucsi_con_mutex_lock(tbt->con))
+		return -ENOTCONN;
+
+	command = UCSI_GET_CURRENT_CAM | UCSI_CONNECTOR_NUMBER(tbt->con->num);
+	ucsi->message_in_size = 0;
+	ret = ucsi_send_command(ucsi, command);
+	if (ret < 0) {
+		if (tbt->con->ucsi->version > 0x0100)
+			goto err_unlock;
+		cur = 0xff;
+	} else {
+		memcpy(&cur, ucsi->message_in, ucsi->message_in_size);
+	}
+
+	if (cur != 0xff) {
+		ret = tbt->con->port_altmode[cur] == alt ? 0 : -EBUSY;
+	} else {
+		ret = ucsi_thunderbolt_send_set_new_cam(tbt, 1);
+		if (!ret) {
+			svdm_version = typec_altmode_get_svdm_version(alt);
+			ret = ucsi_thunderbolt_send_vdm(tbt, CMD_ENTER_MODE, CMDT_RSP_ACK,
+					svdm_version);
+		}
+	}
+
+err_unlock:
+	ucsi_con_mutex_unlock(tbt->con);
+
+	return ret;
+}
+
+static int ucsi_thunderbolt_exit(struct typec_altmode *alt)
+{
+	struct ucsi_tbt *tbt = typec_altmode_get_drvdata(alt);
+	int svdm_version;
+	int ret;
+
+	if (!ucsi_con_mutex_lock(tbt->con))
+		return -ENOTCONN;
+
+	ret = ucsi_thunderbolt_send_set_new_cam(tbt, 0);
+	if (!ret) {
+		svdm_version = typec_altmode_get_svdm_version(alt);
+		ret = ucsi_thunderbolt_send_vdm(tbt, CMD_EXIT_MODE, CMDT_RSP_ACK,
+					svdm_version);
+	}
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
+	const int cmd_type = PD_VDO_CMDT(header);
+	const int cmd = PD_VDO_CMD(header);
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
+		ucsi_thunderbolt_send_vdm(tbt, cmd, CMDT_RSP_ACK, svdm_version);
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
+	typec_altmode_set_drvdata(alt, tbt);
+	typec_altmode_set_ops(alt, &ucsi_thunderbolt_ops);
+	INIT_WORK(&tbt->work, ucsi_thunderbolt_work);
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
index 3d4c277bcd49..d2b00b3a8fd1 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_tbt.h>
 
 #include "ucsi.h"
 #include "trace.h"
@@ -442,6 +443,9 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
 				alt = ucsi_register_displayport(con, override,
 								i, desc);
 			break;
+		case USB_TYPEC_TBT_SID:
+			alt = ucsi_register_thunderbolt(con, override, i, desc);
+			break;
 		default:
 			alt = typec_port_register_altmode(con->port, desc);
 			break;
@@ -678,12 +682,15 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
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
+				(adev[i]->svid == USB_TYPEC_NVIDIA_VLINK_SID &&
+				 adev[i]->vdo != USB_TYPEC_NVIDIA_VLINK_DBG_VDO))
+				ucsi_displayport_remove_partner((void *)pdev);
+			else if (adev[i]->svid == USB_TYPEC_TBT_SID)
+				ucsi_thunderbolt_remove_partner((void *)pdev);
 		}
 		typec_unregister_altmode(adev[i]);
 		adev[i++] = NULL;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index a5ef35d9dce5..b405cce554af 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -242,6 +242,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_ERROR_SET_SINK_PATH_REJECTED	BIT(14)
 
 #define UCSI_SET_NEW_CAM_ENTER(x)		(((x) >> 23) & 0x1)
+#define UCSI_SET_NEW_CAM_SET_ENTER(x)		(((x) & 1) << 23)
 #define UCSI_SET_NEW_CAM_GET_AM(x)		(((x) >> 24) & 0xff)
 #define UCSI_SET_NEW_CAM_AM_MASK		(0xff << 24)
 #define UCSI_SET_NEW_CAM_SET_AM(x)		(((x) & 0xff) << 24)
@@ -613,6 +614,25 @@ static inline void
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
+static inline void
+ucsi_thunderbolt_remove_partner(struct typec_altmode *adev) { }
+#endif /* CONFIG_TYPEC_TBT_ALTMODE */
+
 #ifdef CONFIG_DEBUG_FS
 void ucsi_debugfs_init(void);
 void ucsi_debugfs_exit(void);
-- 
2.52.0.158.g65b55ccf14-goog


