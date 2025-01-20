Return-Path: <linux-usb+bounces-19532-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F5FA16900
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 10:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BDBB160371
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 09:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECAA81AAA23;
	Mon, 20 Jan 2025 09:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TCC/enwz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB02198E6D
	for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 09:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364611; cv=none; b=kQ9zw+NZaNPaQMAYMminNuwmAG6iQO4UoCddgWynnwz6xOt8jEhWhmDDIhq0U7e7UPl4vdUGJY3whnG6bHIeMUeHy8jkHu5mYFYF9LND/RNfrQQcumVZS1iKYHFnhCrnJ20JXaHC1kRGoh4wD2AAWpVpClH8zJmA2d65hB3lm0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364611; c=relaxed/simple;
	bh=sYOPK5n0Y8mPKJ42apx1GpzU8l3v2hgaZerBeQUeFAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X5HYk9Tes4U3z4Q4QbBy9U3Qea4arOK1/0Xmda4sC2PZaoIcjO32xTtKUukzaBWQ7uVLqVxAxVgAjwnydA9KULyfrjeozb8hiDzme1OgLQDAyeozJK73JBGiM0nb3rcA3lLCjevXjwCBqkv2FQlLdLv1msDY/nOLsUYAaNQ9Ye4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TCC/enwz; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so4016472e87.3
        for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 01:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737364607; x=1737969407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0mGuVToP5GgJ7674F4ibSkeejzkyIQRftxnK/ZUBoic=;
        b=TCC/enwzaUUEutSPQEG0DJwFT0yGz+sv+XFPVapLjPlWERy3sM9t8coN9izyHpBAYZ
         q4K3iyolH2kdWjuRWn6E/1Yc95g9vabek5u0Vaz3evOiSR2v/S2qZ/BiTGLgt6ESLMQe
         2IXSdxWBWKrARIa76D7giPLlqmR5e8SZkyNFuk0Tc7ZFF1UOGPkmHAdOmZbLbmb711gD
         u6Nr2rswvgQkQiX4hDOp9tMeFHzCWDAamjQ//0zXlJhhYggq0oOE4EzXZZ2qAEfILfuL
         o6q3TpXASmBhhFcfZQQWrNgFAQmseIXSfBmqIOXSxsxhkJK1AKlimy2S1mfPIu7G7Gn3
         hi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737364607; x=1737969407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mGuVToP5GgJ7674F4ibSkeejzkyIQRftxnK/ZUBoic=;
        b=WwGntAYFEYBZlHb+8/dO6VNTxQmyxpF/Dr+66ZDg0VkHsBfGtlaFGVupo3ROfA0eaa
         zr9/XkoGo7wjnqbH1gh/WmB9IjLT3yDLJC2fetpb1j8m4oeRc60z06u1TLDVHHZ+dF1t
         +L38xSgLFb/KixyEvdOtZZsG1Ec/EtxVhB87eGI140alzfQvMkLFdYEG/cnm+C3lsUpZ
         C/yOXYhlh5FJYnK+U9qxb1exeEPV9TLSs+lErIOeQ/wnEQXEpwF1/JV7Etp64qiUZp57
         knSInxwiCUTT3bhhKKa9MrH3lYY+bMUZqZypmSAVpgsk3z58jClIZag6ju9YJaD5mJel
         nDDw==
X-Gm-Message-State: AOJu0YwT1Q/icezj3up9430CFnFY/LXprLTAJwqpjp44mr7N4D6m9kiq
	9EBTBAmsKvFsrRrhKadvLJttNyR8ahZYVa7r1S69axtmfBLnvhyHnxFQrQ0TsSk=
X-Gm-Gg: ASbGncs24cAE1cmkKiXxagKrbaV3v9XU6D+E+ZxHXL6CYb3ofY3vfCdZ5xkfU8YQSX+
	0ayuZVi/PzeJwnnW02r2OHYAYXFyOrEhIZGX2F8ptdaeJKmUPGBFelXC4nZRmRXGLLSI1uh6BD2
	2q26VeayVW3A8PKB0ogFHlr0VRjYP02Nu0BBOJ1CIqVB8cYgTGy3nNSuIcUGoWdz7BHhzOUrSEH
	fW6ZY1TZxL+WSe43w4dlHq2N8wnWpBB4a6+qRzO+ZLi7Nq3CtmYS4OK/aT9JgOk+ie91ZoAfo6x
	wA==
X-Google-Smtp-Source: AGHT+IEPqjTMZr9kF5L4Q9EICOFU0VTJqKLJSHILO6JoUiQm8KOXLZzkt7cXnID/70dql3+8kTYIxg==
X-Received: by 2002:ac2:528a:0:b0:53f:6c6a:f99f with SMTP id 2adb3069b0e04-5439c21f277mr3124071e87.8.1737364607280;
        Mon, 20 Jan 2025 01:16:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af729ccsm1223639e87.188.2025.01.20.01.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:16:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 Jan 2025 11:16:43 +0200
Subject: [PATCH v2 1/3] usb: typec: ucsi: return CCI and message from
 sync_control callback
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-ucsi-merge-commands-v2-1-462a1ec22ecc@linaro.org>
References: <20250120-ucsi-merge-commands-v2-0-462a1ec22ecc@linaro.org>
In-Reply-To: <20250120-ucsi-merge-commands-v2-0-462a1ec22ecc@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 =?utf-8?q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6611;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=sYOPK5n0Y8mPKJ42apx1GpzU8l3v2hgaZerBeQUeFAQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnjhR7CHqMGxYwPKr+Wqe3YuDg6fGoumP4Bin+y
 2+vSRsDLUOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ44UewAKCRCLPIo+Aiko
 1dLVB/9C1mWAa1lMJAfYX8Ho/+mXiOg1gDWhkpLtqojW6w8lHhDkzh6ABJe1hRpTeGaeYzLB432
 Y7+EGG8zcIMz/mWatzH2Bu+l/TLgeqtEFhRQKcqTuam6ItOTCerZmHp23e86bzmNOzKyDhxSKxo
 WCU8pQmFoKWkGUQYCRrJ0PS0skrel3rYBW6ZlCRuhlWkfNKnURacAnceFA6xFjglc146yWnoUhp
 cSjYCpayEnMBb8TKMyNteFhzPaGF3l0lTi65TxqxikvrYjyz2W5yWdyz3Gz+kx+GpLTWyU2khJO
 tG1pG9pgJnSiUPh/Ye2+kscyCofC77sSobyc2Sn5dfMiymyY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Some of the drivers emulate or handle some of the commands in the
platform-specific way. The code ends up being split between several
callbacks, which complicates emulation.

In preparation to reworking such drivers, move read_cci() and
read_message_in() calls into ucsi_sync_control_common().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c |  5 +++--
 drivers/usb/typec/ucsi/ucsi.c         | 19 +++++++++++--------
 drivers/usb/typec/ucsi/ucsi.h         |  6 ++++--
 drivers/usb/typec/ucsi/ucsi_acpi.c    |  5 +++--
 drivers/usb/typec/ucsi/ucsi_ccg.c     |  5 +++--
 5 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index c605c8616726874434d5812731420fbc6f12790e..744f0709a40eddeed17f23e986f60e9f985381fd 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -105,12 +105,13 @@ static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
 	return 0;
 }
 
-static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
+static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci,
+				  void *data, size_t size)
 {
 	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
 	int ret;
 
-	ret = ucsi_sync_control_common(ucsi, cmd);
+	ret = ucsi_sync_control_common(ucsi, cmd, cci, data, size);
 	switch (ret) {
 	case -EBUSY:
 		/* EC may return -EBUSY if CCI.busy is set.
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index fcf499cc9458c0d12015a7e36e5f1ac448c3a431..559390a07a4e427c9b520dffaac905277d071638 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -55,7 +55,8 @@ void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
 }
 EXPORT_SYMBOL_GPL(ucsi_notify_common);
 
-int ucsi_sync_control_common(struct ucsi *ucsi, u64 command)
+int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
+			     void *data, size_t size)
 {
 	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
 	int ret;
@@ -80,6 +81,13 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command)
 	else
 		clear_bit(COMMAND_PENDING, &ucsi->flags);
 
+	if (!ret && cci)
+		ret = ucsi->ops->read_cci(ucsi, cci);
+
+	if (!ret && data &&
+	    (*cci & UCSI_CCI_COMMAND_COMPLETE))
+		ret = ucsi->ops->read_message_in(ucsi, data, size);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(ucsi_sync_control_common);
@@ -95,7 +103,7 @@ static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 		ctrl |= UCSI_ACK_CONNECTOR_CHANGE;
 	}
 
-	return ucsi->ops->sync_control(ucsi, ctrl);
+	return ucsi->ops->sync_control(ucsi, ctrl, NULL, NULL, 0);
 }
 
 static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
@@ -108,9 +116,7 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 	if (size > UCSI_MAX_DATA_LENGTH(ucsi))
 		return -EINVAL;
 
-	ret = ucsi->ops->sync_control(ucsi, command);
-	if (ucsi->ops->read_cci(ucsi, cci))
-		return -EIO;
+	ret = ucsi->ops->sync_control(ucsi, command, cci, data, size);
 
 	if (*cci & UCSI_CCI_BUSY)
 		return ucsi_run_command(ucsi, UCSI_CANCEL, cci, NULL, 0, false) ?: -EBUSY;
@@ -127,9 +133,6 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 	else
 		err = 0;
 
-	if (!err && data && UCSI_CCI_LENGTH(*cci))
-		err = ucsi->ops->read_message_in(ucsi, data, size);
-
 	/*
 	 * Don't ACK connection change if there was an error.
 	 */
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 5ff369c24a2fc445e8559201d563c31d83b2c876..9ffc8debd7d77d118db042f2749cf429a848f8df 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -76,7 +76,8 @@ struct ucsi_operations {
 	int (*read_version)(struct ucsi *ucsi, u16 *version);
 	int (*read_cci)(struct ucsi *ucsi, u32 *cci);
 	int (*read_message_in)(struct ucsi *ucsi, void *val, size_t val_len);
-	int (*sync_control)(struct ucsi *ucsi, u64 command);
+	int (*sync_control)(struct ucsi *ucsi, u64 command, u32 *cci,
+			    void *data, size_t size);
 	int (*async_control)(struct ucsi *ucsi, u64 command);
 	bool (*update_altmodes)(struct ucsi *ucsi, struct ucsi_altmode *orig,
 				struct ucsi_altmode *updated);
@@ -528,7 +529,8 @@ void ucsi_altmode_update_active(struct ucsi_connector *con);
 int ucsi_resume(struct ucsi *ucsi);
 
 void ucsi_notify_common(struct ucsi *ucsi, u32 cci);
-int ucsi_sync_control_common(struct ucsi *ucsi, u64 command);
+int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
+			     void *data, size_t size);
 
 #if IS_ENABLED(CONFIG_POWER_SUPPLY)
 int ucsi_register_port_psy(struct ucsi_connector *con);
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 5c55155519634d95b6e544632f869c2867093617..8b02082201ec5b85031472563b8b8d1eea6134de 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -122,12 +122,13 @@ static int ucsi_gram_read_message_in(struct ucsi *ucsi, void *val, size_t val_le
 	return ret;
 }
 
-static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command)
+static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
+				  void *data, size_t size)
 {
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
 	int ret;
 
-	ret = ucsi_sync_control_common(ucsi, command);
+	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 740171f24ef9fae9abdb52d7995abe692e0a7623..02ac04a52239327475a3590734b77f3ac74bb589 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -628,7 +628,8 @@ static int ucsi_ccg_async_control(struct ucsi *ucsi, u64 command)
 	return ccg_write(uc, reg, (u8 *)&command, sizeof(command));
 }
 
-static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
+static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
+				 void *data, size_t size)
 {
 	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
 	struct ucsi_connector *con;
@@ -652,7 +653,7 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
 		ucsi_ccg_update_set_new_cam_cmd(uc, con, &command);
 	}
 
-	ret = ucsi_sync_control_common(ucsi, command);
+	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
 
 err_put:
 	pm_runtime_put_sync(uc->dev);

-- 
2.39.5


