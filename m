Return-Path: <linux-usb+bounces-17342-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C25A9C0EF7
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 20:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0F851F2390D
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 19:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D115217915;
	Thu,  7 Nov 2024 19:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E+pK1ly0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F2B21790B
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 19:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731007912; cv=none; b=FdvJadT25zwNCaJRZuKxZWeFUH9XDupTo6OtwVVJk1nF/YOzp+aciZgIuvT2fLQLLUwaewIheLjiUpFkauvlWD0mBNI5n5mF90QbxICjcnCYdXgTDy1CSQb3fzjX6ehZprrKoiH0epJEV9c8F+cCdG3mTGvT+7naSKJLSJo2ejA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731007912; c=relaxed/simple;
	bh=E2+M2MN8fFlYlxb6VQg1nVCnYvwszeZCoKtjpG3T7lM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c54c6/au+xFslfI3AiUG+PKicg7tStXUjkBQVSlvZJ8GhF3WSJ6OCN9/LmcXtn7VdZEBoIDkERa7sazvMYppfyXbSLYSXWtx1nu6O4DRmfAluXvdq8PLFysMDSbu81/pmHXBcrA85bRN6Dkr1wT9slCh+VVl/ucggykD//ZRFdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E+pK1ly0; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20caccadbeeso14663585ad.2
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2024 11:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731007910; x=1731612710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qahFf7OaEhB1/uoMJ7ZhjCogHtklDwuIFxHOF/W2wEw=;
        b=E+pK1ly0o649jvKF5Xyu1meg7xGtiWHfp0+AXj7SgD363y/WdgeNuONeLhkeV6FGCp
         99RHm34zl1zBZPa2g4dj2+4th4sMhdfMNFKNz60xWic/XEtYWeOXAwHL+EYj38SmSfFl
         VQncJdQZiTsI3XNS8ikO3W3oetiXEjy0G9fT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731007910; x=1731612710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qahFf7OaEhB1/uoMJ7ZhjCogHtklDwuIFxHOF/W2wEw=;
        b=d4Y/SF0+k+iEpL6QhplcD4Rjs9d8btl/J+6feJMeviRTftjWb8DCl17AW50jMZ62U0
         sJUhk2jDKfCBuWmSlYerq9nmNMIw0T5rLdZnz1bAyKKO9qIUxNKhEmzwKFQtVkHUeohW
         IESJ3zOuSWT8aO/WyTu7Kp1sldLBGob1EGxHbeHCs64VISsYCqCOx9AVInvuDx/Tm5zP
         7wLr/H3OaaWTCyo5Lr281RtyWlFSU4xqkJQ7iaoO1OEHCMUeqL5Pu7vS6vHL6eSy3O1S
         sV/pT2MnWhErRD4kornwar9E25J1p3lf4z/uj8UunegHKJnnuybC1ZUPvv3YIBzpYfZR
         d2Ow==
X-Forwarded-Encrypted: i=1; AJvYcCV3SSOPwRFnPxBC508qLeMYLP5HYrtxBU3PeiGOORr4rOUAbO1bW5ldKKCg0YI71OSHhkova8cXUqk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7dJYlx3/dDZu+/0XCkGTTULDe3JoC07JkeNud3I6F71o7GTmp
	/5twUJOwPt0vQbF/APM6TLJFSmWuZy1gspKpWk+P3u5lV+rmljMsD0K3rFKCYg==
X-Google-Smtp-Source: AGHT+IGWkbnkCjIV3dJz/iBdmtY7Ly9vf/uAdEsL99zEhI6TLxL9l3vnmT+LElfo1eNNfah7sutZAg==
X-Received: by 2002:a17:902:e550:b0:20b:c17f:9dad with SMTP id d9443c01a7336-211835cce81mr452975ad.53.1731007910361;
        Thu, 07 Nov 2024 11:31:50 -0800 (PST)
Received: from localhost (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21177e6b9besm16137755ad.248.2024.11.07.11.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 11:31:50 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: jthies@google.com,
	akuchynski@google.com,
	pmalani@chromium.org,
	dmitry.baryshkov@linaro.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] platform/chrome: cros_ec_typec: Thunderbolt support
Date: Thu,  7 Nov 2024 11:29:59 -0800
Message-ID: <20241107112955.v3.6.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241107193021.2690050-1-abhishekpandit@chromium.org>
References: <20241107193021.2690050-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for entering and exiting Thunderbolt alt-mode using AP
driven alt-mode.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Changes in v3:
- Fix usage of TBT sid and mode.
- Removed unused vdm operations during altmode registration

Changes in v2:
- Refactored thunderbolt support into cros_typec_altmode.c

 drivers/platform/chrome/Makefile             |  3 +
 drivers/platform/chrome/cros_ec_typec.c      | 23 +++---
 drivers/platform/chrome/cros_typec_altmode.c | 85 ++++++++++++++++++++
 drivers/platform/chrome/cros_typec_altmode.h | 14 ++++
 4 files changed, 114 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
index 2f90d4db8099..b9b1281de063 100644
--- a/drivers/platform/chrome/Makefile
+++ b/drivers/platform/chrome/Makefile
@@ -21,6 +21,9 @@ cros-ec-typec-objs			:= cros_ec_typec.o cros_typec_vdm.o
 ifneq ($(CONFIG_TYPEC_DP_ALTMODE),)
 	cros-ec-typec-objs		+= cros_typec_altmode.o
 endif
+ifneq ($(CONFIG_TYPEC_TBT_ALTMODE),)
+	cros-ec-typec-objs		+= cros_typec_altmode.o
+endif
 obj-$(CONFIG_CROS_EC_TYPEC)		+= cros-ec-typec.o
 
 obj-$(CONFIG_CROS_EC_LPC)		+= cros_ec_lpcs.o
diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 3a6f5f2717b9..558b618df63c 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -302,18 +302,19 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 
 	/*
 	 * Register TBT compatibility alt mode. The EC will not enter the mode
-	 * if it doesn't support it, so it's safe to register it unconditionally
-	 * here for now.
+	 * if it doesn't support it and it will not enter automatically by
+	 * design so we can use the |ap_driven_altmode| feature to check if we
+	 * should register it.
 	 */
-	memset(&desc, 0, sizeof(desc));
-	desc.svid = USB_TYPEC_TBT_SID;
-	desc.mode = TYPEC_ANY_MODE;
-	amode = typec_port_register_altmode(port->port, &desc);
-	if (IS_ERR(amode))
-		return PTR_ERR(amode);
-	port->port_altmode[CROS_EC_ALTMODE_TBT] = amode;
-	typec_altmode_set_drvdata(amode, port);
-	amode->ops = &port_amode_ops;
+	if (typec->ap_driven_altmode) {
+		memset(&desc, 0, sizeof(desc));
+		desc.svid = USB_TYPEC_TBT_SID;
+		desc.mode = TBT_MODE;
+		amode = cros_typec_register_thunderbolt(port, &desc);
+		if (IS_ERR(amode))
+			return PTR_ERR(amode);
+		port->port_altmode[CROS_EC_ALTMODE_TBT] = amode;
+	}
 
 	port->state.alt = NULL;
 	port->state.mode = TYPEC_STATE_USB;
diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index 3598b8a6ceee..9cf2cef6c277 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -8,6 +8,7 @@
 #include "cros_ec_typec.h"
 
 #include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_tbt.h>
 #include <linux/usb/pd_vdo.h>
 
 #include "cros_typec_altmode.h"
@@ -67,6 +68,8 @@ static int cros_typec_altmode_enter(struct typec_altmode *alt, u32 *vdo)
 
 	if (data->sid == USB_TYPEC_DP_SID)
 		req.mode_to_enter = CROS_EC_ALTMODE_DP;
+	else if (data->sid == USB_TYPEC_TBT_SID)
+		req.mode_to_enter = CROS_EC_ALTMODE_TBT;
 	else
 		return -EOPNOTSUPP;
 
@@ -196,6 +199,53 @@ static int cros_typec_displayport_vdm(struct typec_altmode *alt, u32 header,
 	return 0;
 }
 
+static int cros_typec_thunderbolt_vdm(struct typec_altmode *alt, u32 header,
+				      const u32 *data, int count)
+{
+	struct cros_typec_altmode_data *adata = typec_altmode_get_drvdata(alt);
+
+	int cmd_type = PD_VDO_CMDT(header);
+	int cmd = PD_VDO_CMD(header);
+	int svdm_version;
+
+	svdm_version = typec_altmode_get_svdm_version(alt);
+	if (svdm_version < 0)
+		return svdm_version;
+
+	switch (cmd_type) {
+	case CMDT_INIT:
+		if (PD_VDO_SVDM_VER(header) < svdm_version) {
+			typec_partner_set_svdm_version(adata->port->partner,
+						       PD_VDO_SVDM_VER(header));
+			svdm_version = PD_VDO_SVDM_VER(header);
+		}
+
+		adata->header = VDO(adata->sid, 1, svdm_version, cmd);
+		adata->header |= VDO_OPOS(adata->mode);
+
+		switch (cmd) {
+		case CMD_ENTER_MODE:
+			/* Don't respond to the enter mode vdm because it
+			 * triggers mux configuration. This is handled directly
+			 * by the cros_ec_typec driver so the Thunderbolt driver
+			 * doesn't need to be involved.
+			 */
+			break;
+		default:
+			adata->header |= VDO_CMDT(CMDT_RSP_ACK);
+			schedule_work(&adata->work);
+			break;
+		}
+
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+
 static int cros_typec_altmode_vdm(struct typec_altmode *alt, u32 header,
 				      const u32 *data, int count)
 {
@@ -204,6 +254,9 @@ static int cros_typec_altmode_vdm(struct typec_altmode *alt, u32 header,
 	if (adata->sid == USB_TYPEC_DP_SID)
 		return cros_typec_displayport_vdm(alt, header, data, count);
 
+	if (adata->sid == USB_TYPEC_TBT_SID)
+		return cros_typec_thunderbolt_vdm(alt, header, data, count);
+
 	return -EINVAL;
 }
 
@@ -273,3 +326,35 @@ cros_typec_register_displayport(struct cros_typec_port *port,
 	return alt;
 }
 #endif
+
+#if IS_ENABLED(CONFIG_TYPEC_TBT_ALTMODE)
+struct typec_altmode *
+cros_typec_register_thunderbolt(struct cros_typec_port *port,
+				struct typec_altmode_desc *desc)
+{
+	struct typec_altmode *alt;
+	struct cros_typec_altmode_data *data;
+
+	alt = typec_port_register_altmode(port->port, desc);
+	if (IS_ERR(alt))
+		return alt;
+
+	data = devm_kzalloc(&alt->dev, sizeof(*data), GFP_KERNEL);
+	if (!data) {
+		typec_unregister_altmode(alt);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	INIT_WORK(&data->work, cros_typec_altmode_work);
+	data->alt = alt;
+	data->port = port;
+	data->ap_mode_entry = true;
+	data->sid = desc->svid;
+	data->mode = desc->mode;
+
+	typec_altmode_set_ops(alt, &cros_typec_altmode_ops);
+	typec_altmode_set_drvdata(alt, data);
+
+	return alt;
+}
+#endif
diff --git a/drivers/platform/chrome/cros_typec_altmode.h b/drivers/platform/chrome/cros_typec_altmode.h
index c6f8fb02c99c..810b553ddcd8 100644
--- a/drivers/platform/chrome/cros_typec_altmode.h
+++ b/drivers/platform/chrome/cros_typec_altmode.h
@@ -31,4 +31,18 @@ static inline int cros_typec_displayport_status_update(struct typec_altmode *alt
 	return 0;
 }
 #endif
+
+#if IS_ENABLED(CONFIG_TYPEC_TBT_ALTMODE)
+struct typec_altmode *
+cros_typec_register_thunderbolt(struct cros_typec_port *port,
+				struct typec_altmode_desc *desc);
+#else
+static inline struct typec_altmode *
+cros_typec_register_thunderbolt(struct cros_typec_port *port,
+				struct typec_altmode_desc *desc)
+{
+	return typec_port_register_altmode(port->port, desc);
+}
+#endif
+
 #endif /* __CROS_TYPEC_ALTMODE_H__ */
-- 
2.47.0.277.g8800431eea-goog


