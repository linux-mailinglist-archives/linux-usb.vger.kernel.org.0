Return-Path: <linux-usb+bounces-19483-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42753A14DF4
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 11:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C2FB3A7BF8
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 10:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45631FE460;
	Fri, 17 Jan 2025 10:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q57TZJLF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0AE1FDE1B
	for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 10:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737110993; cv=none; b=ZHLtXnOHGaOeGuXZerlma0S/PrQg5nL/wNtRj0Eh/8K42rPTOI54/py1VtZoFpcEb3cd9IEt2S+l/9rKjhDaFPQq9A4O+RNO7f5UFP0VoIK8Q004sH3D1kGEezCJyXtEzgjBc65giNnv4h5eMCxxPw9eQKGZFHy6gdUXxOdf/v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737110993; c=relaxed/simple;
	bh=heR3VU+nxs99VRFMxd5VRCD07Xmz+D63MnVIf+KUZ+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=drwrfKT1Py7ZPnTNyIuzaCDMGjaBoXd2fqgEkWthQR4CP96u0cqLaKtRf0E+AXn0XOzat3alDa4JzHL/X8KjPm4U6spjCuIJe7lYXp5z4vCl2cg41r1H9h/JXT1XPdcgQNjpPnpZVGSETfZ4XgJNkAh3AWYpR7CoAg9u+nYiHmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q57TZJLF; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3003d7ca01cso20164111fa.0
        for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 02:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737110989; x=1737715789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hibVCX0t4Pp4PQDIRaZNNKRSG9poNjEEnaBSc7dWujQ=;
        b=q57TZJLFdPioDkOtgp7RPUAFjD/bDqHVGiygD6YjqXQ5btWBR3l5qerwCysE0ASGwx
         Q+IOu/UDydTcgNXnVh34XtZdnNw07TzCQxcS0I/Sum4H3EsnrfubG8M/dZwQHbJD6ax1
         VLURzlxcFYWcROUUKx+w2WtmqcZ96CriHCtUv4JFC34SjWvPD4nBu89VEgAfLxGy4Ci5
         Xhb7JONFAW2gkx+GD77L+BKVvDII5DcFZUde5LJPEduQmv3jbe8D3AXSk7gr6tjEESy6
         FhtSWEL9XSDC7vpP/2+sgXxUkTtKSkuxM44Xvk350IW14v7aT3THauOM6L8vLqOF7kGy
         k2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737110989; x=1737715789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hibVCX0t4Pp4PQDIRaZNNKRSG9poNjEEnaBSc7dWujQ=;
        b=b5VBdHivQ5/IB5ZthxIxH45XKjp23h5QzVQeE5IAdMKP8waSYpwFCV7X61bZKAX121
         8Z0The0L0BeqTHZEtDTIYw3ONt8CJUGOaukaX4gzEkQF/fpvi4fTQeKjNNRvwR+EI9+s
         dd5Ht5PyxjI0LuXZVeS0OlR15Yj9ks5CMUyM0aY9JI/qpnYocnsiloafhCmGIxtAy9lo
         h9uWPdCoaXZtrAJtlOur3PjRdXuR1MmhbW101In9cfIDLPLaotdEmqepHiE4EIzDfYc+
         DY3I8WH43ocE66HK7M1+T9wnGGXBx5hO0JXVVQdTcCYNmH22TFTV98l1/MMEUe4RCazw
         FzgA==
X-Gm-Message-State: AOJu0Yx1MbMcu2o//pqyOXhEvlgtgxIP9/YvpUt9blB0E6nCDmck4kPg
	SvR3b5C1IlR4g9uqQ13TE8UzL5GMaoux8/joyu0sy6Z/hQgivkLnlgbkQcfiWpY=
X-Gm-Gg: ASbGncsqeXHRM5+g5A2SsS7Lx1ObskHjtkrzhrt/d11R/2iRrrI/ftAqD0/ClmWi66I
	4YKmokP/h57duaa1274/OoK7ITtR0kFDDdxm7nUTtkndrphgfjKfSBSa8JD8LeBduYYxEPtzPZf
	k8aJL1PZNP7d15AburBDGwhbzR/QCcV0+1yxIlLdI+t915LYIfAXPLXxuTJ+JUYpyFGZbL6Vh3C
	mRI/wtm50PsgcXoU6PHIzITYdtUr4yx+mFM8Rk9HT+lzDpQjwyYxmD0vD1HwKy0
X-Google-Smtp-Source: AGHT+IEiYTZQWrWOUKWjqhOVqBylp4MRFwJV7aM47B9T1N1DKb2eq5WqGCcUbHP2ESgQN4USFGOnVg==
X-Received: by 2002:a2e:bc27:0:b0:302:40ec:a1b3 with SMTP id 38308e7fff4ca-3072caa166amr7459741fa.21.1737110989365;
        Fri, 17 Jan 2025 02:49:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a3446c8sm3803321fa.27.2025.01.17.02.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 02:49:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Jan 2025 12:49:42 +0200
Subject: [PATCH 2/3] usb: typec: ucsi: ccg: move command quirks to
 ucsi_ccg_sync_control()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-ucsi-merge-commands-v1-2-e20c19934d59@linaro.org>
References: <20250117-ucsi-merge-commands-v1-0-e20c19934d59@linaro.org>
In-Reply-To: <20250117-ucsi-merge-commands-v1-0-e20c19934d59@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3833;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=heR3VU+nxs99VRFMxd5VRCD07Xmz+D63MnVIf+KUZ+4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnijXGr/9bjVSYjTyTv0PnZm4zPbHPTKkO89qzs
 +zEEfSMzpWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4o1xgAKCRCLPIo+Aiko
 1d0bB/4uri+jTSEL0p4zZ/3Tk6Q8cRfI5JIyJGiP8j+Q5NQ1GoP0JNWbXoOSTNmCwzfadWZC82K
 tVcZymG9oGop3auC8If9QBCPOEsb72b654eTK6IpjNlqRwgNfNLUWPYdjjKbs971jRu1Zw3aW1I
 IdB5TgFvlVWko2d1PuNTNY6j57lBSwK/DQs653p23xLg09MRtLS1wgpbYTGQxCZfkXYVNFEATZp
 HrQxUKGdAePtlggrshEFEybo20Pn2araqjL9L4fOtU/6etXTQqFUSJNa+jpQBfd993fbSMP5AG6
 6/613qcaKmB4ZZrFA2nyfVV6fTp9RhPSJP2hz0fuY7hoeviO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

It is easier to keep all command-specific quirks in a single place. Move
them to ucsi_ccg_sync_control() as the code now allows us to return
modified messages data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 62 ++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 02ac04a52239327475a3590734b77f3ac74bb589..47498ee6cca89a9cc3fee872703b8d27487ea7ae 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -222,7 +222,6 @@ struct ucsi_ccg {
 	u16 fw_build;
 	struct work_struct pm_work;
 
-	u64 last_cmd_sent;
 	bool has_multiple_dp;
 	struct ucsi_ccg_altmode orig[UCSI_MAX_ALTMODES];
 	struct ucsi_ccg_altmode updated[UCSI_MAX_ALTMODES];
@@ -538,9 +537,10 @@ static void ucsi_ccg_update_set_new_cam_cmd(struct ucsi_ccg *uc,
  * first and then vdo=0x3
  */
 static void ucsi_ccg_nvidia_altmode(struct ucsi_ccg *uc,
-				    struct ucsi_altmode *alt)
+				    struct ucsi_altmode *alt,
+				    u64 command)
 {
-	switch (UCSI_ALTMODE_OFFSET(uc->last_cmd_sent)) {
+	switch (UCSI_ALTMODE_OFFSET(command)) {
 	case NVIDIA_FTB_DP_OFFSET:
 		if (alt[0].mid == USB_TYPEC_NVIDIA_VLINK_DBG_VDO)
 			alt[0].mid = USB_TYPEC_NVIDIA_VLINK_DP_VDO |
@@ -578,37 +578,11 @@ static int ucsi_ccg_read_cci(struct ucsi *ucsi, u32 *cci)
 static int ucsi_ccg_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
 {
 	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
-	struct ucsi_capability *cap;
-	struct ucsi_altmode *alt;
 
 	spin_lock(&uc->op_lock);
 	memcpy(val, uc->op_data.message_in, val_len);
 	spin_unlock(&uc->op_lock);
 
-	switch (UCSI_COMMAND(uc->last_cmd_sent)) {
-	case UCSI_GET_CURRENT_CAM:
-		if (uc->has_multiple_dp)
-			ucsi_ccg_update_get_current_cam_cmd(uc, (u8 *)val);
-		break;
-	case UCSI_GET_ALTERNATE_MODES:
-		if (UCSI_ALTMODE_RECIPIENT(uc->last_cmd_sent) ==
-		    UCSI_RECIPIENT_SOP) {
-			alt = val;
-			if (alt[0].svid == USB_TYPEC_NVIDIA_VLINK_SID)
-				ucsi_ccg_nvidia_altmode(uc, alt);
-		}
-		break;
-	case UCSI_GET_CAPABILITY:
-		if (uc->fw_build == CCG_FW_BUILD_NVIDIA_TEGRA) {
-			cap = val;
-			cap->features &= ~UCSI_CAP_ALT_MODE_DETAILS;
-		}
-		break;
-	default:
-		break;
-	}
-	uc->last_cmd_sent = 0;
-
 	return 0;
 }
 
@@ -639,11 +613,9 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
 	mutex_lock(&uc->lock);
 	pm_runtime_get_sync(uc->dev);
 
-	uc->last_cmd_sent = command;
-
-	if (UCSI_COMMAND(uc->last_cmd_sent) == UCSI_SET_NEW_CAM &&
+	if (UCSI_COMMAND(command) == UCSI_SET_NEW_CAM &&
 	    uc->has_multiple_dp) {
-		con_index = (uc->last_cmd_sent >> 16) &
+		con_index = (command >> 16) &
 			UCSI_CMD_CONNECTOR_MASK;
 		if (con_index == 0) {
 			ret = -EINVAL;
@@ -655,6 +627,30 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
 
 	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
 
+	switch (UCSI_COMMAND(command)) {
+	case UCSI_GET_CURRENT_CAM:
+		if (uc->has_multiple_dp)
+			ucsi_ccg_update_get_current_cam_cmd(uc, (u8 *)data);
+		break;
+	case UCSI_GET_ALTERNATE_MODES:
+		if (UCSI_ALTMODE_RECIPIENT(command) == UCSI_RECIPIENT_SOP) {
+			struct ucsi_altmode *alt = data;
+
+			if (alt[0].svid == USB_TYPEC_NVIDIA_VLINK_SID)
+				ucsi_ccg_nvidia_altmode(uc, alt, command);
+		}
+		break;
+	case UCSI_GET_CAPABILITY:
+		if (uc->fw_build == CCG_FW_BUILD_NVIDIA_TEGRA) {
+			struct ucsi_capability *cap = data;
+
+			cap->features &= ~UCSI_CAP_ALT_MODE_DETAILS;
+		}
+		break;
+	default:
+		break;
+	}
+
 err_put:
 	pm_runtime_put_sync(uc->dev);
 	mutex_unlock(&uc->lock);

-- 
2.39.5


