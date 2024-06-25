Return-Path: <linux-usb+bounces-11643-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 785B5916B26
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 16:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98A4CB27126
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 14:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D6C16F910;
	Tue, 25 Jun 2024 14:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="siXzvUSb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DA516DEA4
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 14:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719327275; cv=none; b=l6aAqHW14kT7AQUUa0rtMi7E+dwNH82tHdvP0S1n9pDEMKMudvAyyWGI0kxUxuiVsFpB2ka+7oHo9JqhlVvqr/QriuSNN4lTATP/MVhLinTdg+8MWgLHk+ieoD90mELFVWS3KiR5b8dDbVpTPpvcQ/eDIu9clux7E1efOXq8TEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719327275; c=relaxed/simple;
	bh=CEvbvB7gJ/H3MYji/elAM+3tUMhYqRgw3bCCMI7tq6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MnnRABd2kTwfoj4G1kTcRgeH6gt2lkGcgjSX+RiO4yY0tdmsmJLCbTzaD7enrlE5szl2KBxWpwvvZ5q319tfKuVkJOSPtVL0b/C8HHLpG/5XWL+Prly8pjVPxTk6YV9N8npMwViv0psE0DLPYL/mAHrAZVzhU/6DXWxmZAm8qEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=siXzvUSb; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cdebf9f53so3028643e87.2
        for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 07:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719327271; x=1719932071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LEiFtfgfs0Ngipd4ntmJnXIdkp4mmOLM3swdnA1V8U=;
        b=siXzvUSbCZRFg4mAFwp2sLY3cLxRoVuGXR76XiXORXpEhhEtvK/aUPt/ufbKWWssYu
         0l9eLCtQFa7s7MoVxQhMZ3akKw3Nv75e4i7bzSWGhF3tgXhCWbg7djuGEinj7hUIONvl
         QBnl6dwObTKrAQfQKyD5/lWQNxjN7qlPS75lPLakmua7e9ogD+CQJUoxtN0y0N7vfcld
         Agn6FH2QYHa74pn1BejMgwMH9mrKIAjIGSwMb/hC4EYpuAmP66ve4v0ADfZvzNNlmn2m
         C0l7gHHLRMtYLesAAiOubDDwiGrXvmg40iRooID0qKD0QekszvvvrT+mRt3LxFqSodJ1
         EM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719327271; x=1719932071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LEiFtfgfs0Ngipd4ntmJnXIdkp4mmOLM3swdnA1V8U=;
        b=fn0HO443721NWqF15m0KVstEnYxd7/0Qw6YAonJnwIcUmtfIRHhJFFjOT4pkqsRuV8
         ibdF4O+vI6N1fYq0lvFNJ6QuOclpe2B2crInJrsFrLxFp8oYiyCVruWedRoTA1K4BXFJ
         fL+pXblg8YvtClS9Rbl8MJAfTAeh1gQff1MNKlYaIHEYCr6dI4pz+Q3isvTtA352qNka
         xkedpsv+J7q187VkmzH/bRrgQjTbvjzFlBsC1X2e+tG7hlMI7jvVsCA0CccayPXG2SXX
         m3gb2j78fouSNNJuGJKgZ4SKXd60nX6ntias0l/5IBGC2Q29yq4I3c+/WwSBvY4kQEAQ
         tX2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWK8GKf57Zr6DYiXbgO1aUjzPOJWX0ZX873O06+CLDepZEy4hzdKDJADPG5bAN4QkBUsHNuupbt/qM6NC+yAbHEHr516rBEC75g
X-Gm-Message-State: AOJu0YwGhIcobPcUtTbi8okoh97ScWy0zBO905liS8LSCKetb6EHeEA4
	+5fL8PFsc4dMg6xJpfpzkmc17/1/Sn95OK85Faq3jSZphtFRx8yhOSgqn2n6vI0=
X-Google-Smtp-Source: AGHT+IFF6rSU92qoqZYqmPJ7GZVrJ4GdjaT3kYYiAox4XIiLATWxaA6Yqp82cc6AN1alytvjPcOf9w==
X-Received: by 2002:a19:700d:0:b0:52c:df90:203b with SMTP id 2adb3069b0e04-52ce0680324mr4031473e87.56.1719327270943;
        Tue, 25 Jun 2024 07:54:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd64328b7sm1251877e87.221.2024.06.25.07.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:54:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 17:54:27 +0300
Subject: [PATCH v3 2/7] usb: typec: ucsi: simplify command sending API
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-ucsi-rework-interface-v3-2-7a6c8e17be3a@linaro.org>
References: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
In-Reply-To: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Nikita Travkin <nikita@trvn.ru>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17266;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CEvbvB7gJ/H3MYji/elAM+3tUMhYqRgw3bCCMI7tq6c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmetojeYJ2SPPKAueLrxUGEqYqt29fy+1b8hmE9
 AdjEIQc5zOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnraIwAKCRCLPIo+Aiko
 1eolB/0RMUBUttUqaEx5AdUlrGhbzYzR91kJ7QFCP0NILdTtC52gZoHAeTDjXy8YEU7qDH3MdHZ
 5+85mSqeIA89apvxJU0RQzYX4uQH913N+WuNHMj+KF4v+7ZF8CiD2mtMU1N0Y6ML8yq/TX1IstE
 JtSeuZFs6wEkUNCy57sPnm9dnOi9MQ7sBf4KvRSi6wt1oAOpw1GHn4tJmHj3hMmj+KoSIc3zAYe
 2hk7+5DbYNHsT8OA3wsHcc4HdDwOopupWp6ZEMBCxENcwUEtki3rMXvBq+TA2z5aoofULPVPxUV
 Z7sokLiWNWi0jf3DyfPRuyhvC+2+R+IJpswDMqtItcftcZvi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The sync_write and async_write are used only for writing UCSI commands
to the UCSI_CONTROL offsets. Rename sync_write and async_write
operations to sync_control and async_control accordingly. Drop the
offset and length fields and pass u64 command instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c           | 18 +++++++----------
 drivers/usb/typec/ucsi/ucsi.h           | 10 ++++------
 drivers/usb/typec/ucsi/ucsi_acpi.c      | 31 ++++++++++++++----------------
 drivers/usb/typec/ucsi/ucsi_ccg.c       | 34 +++++++++++++++------------------
 drivers/usb/typec/ucsi/ucsi_glink.c     | 14 ++++++--------
 drivers/usb/typec/ucsi/ucsi_stm32g0.c   | 24 +++++++++++------------
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 20 +++++++------------
 7 files changed, 64 insertions(+), 87 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 297d939e8da8..52903eea7274 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -60,7 +60,7 @@ static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 		ctrl |= UCSI_ACK_CONNECTOR_CHANGE;
 	}
 
-	return ucsi->ops->sync_write(ucsi, UCSI_CONTROL, &ctrl, sizeof(ctrl));
+	return ucsi->ops->sync_control(ucsi, ctrl);
 }
 
 static int ucsi_exec_command(struct ucsi *ucsi, u64 command);
@@ -126,7 +126,7 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 	u32 cci;
 	int ret;
 
-	ret = ucsi->ops->sync_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
+	ret = ucsi->ops->sync_control(ucsi, cmd);
 	if (ret)
 		return ret;
 
@@ -1321,8 +1321,7 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 	 */
 	if (cci & UCSI_CCI_RESET_COMPLETE) {
 		command = UCSI_SET_NOTIFICATION_ENABLE;
-		ret = ucsi->ops->async_write(ucsi, UCSI_CONTROL, &command,
-					     sizeof(command));
+		ret = ucsi->ops->async_control(ucsi, command);
 		if (ret < 0)
 			goto out;
 
@@ -1343,8 +1342,7 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 	}
 
 	command = UCSI_PPM_RESET;
-	ret = ucsi->ops->async_write(ucsi, UCSI_CONTROL, &command,
-				     sizeof(command));
+	ret = ucsi->ops->async_control(ucsi, command);
 	if (ret < 0)
 		goto out;
 
@@ -1365,9 +1363,7 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 
 		/* If the PPM is still doing something else, reset it again. */
 		if (cci & ~UCSI_CCI_RESET_COMPLETE) {
-			ret = ucsi->ops->async_write(ucsi, UCSI_CONTROL,
-						     &command,
-						     sizeof(command));
+			ret = ucsi->ops->async_control(ucsi, command);
 			if (ret < 0)
 				goto out;
 		}
@@ -1895,7 +1891,7 @@ struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops)
 {
 	struct ucsi *ucsi;
 
-	if (!ops || !ops->read || !ops->sync_write || !ops->async_write)
+	if (!ops || !ops->read || !ops->sync_control || !ops->async_control)
 		return ERR_PTR(-EINVAL);
 
 	ucsi = kzalloc(sizeof(*ucsi), GFP_KERNEL);
@@ -1971,7 +1967,7 @@ void ucsi_unregister(struct ucsi *ucsi)
 	cancel_work_sync(&ucsi->resume_work);
 
 	/* Disable notifications */
-	ucsi->ops->async_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
+	ucsi->ops->async_control(ucsi, cmd);
 
 	if (!ucsi->connector)
 		return;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 1280cac314fe..3ad64acffda1 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -57,8 +57,8 @@ struct dentry;
 /**
  * struct ucsi_operations - UCSI I/O operations
  * @read: Read operation
- * @sync_write: Blocking write operation
- * @async_write: Non-blocking write operation
+ * @sync_control: Blocking control operation
+ * @async_control: Non-blocking control operation
  * @update_altmodes: Squashes duplicate DP altmodes
  * @update_connector: Update connector capabilities before registering
  * @connector_status: Updates connector status, called holding connector lock
@@ -70,10 +70,8 @@ struct dentry;
 struct ucsi_operations {
 	int (*read)(struct ucsi *ucsi, unsigned int offset,
 		    void *val, size_t val_len);
-	int (*sync_write)(struct ucsi *ucsi, unsigned int offset,
-			  const void *val, size_t val_len);
-	int (*async_write)(struct ucsi *ucsi, unsigned int offset,
-			   const void *val, size_t val_len);
+	int (*sync_control)(struct ucsi *ucsi, u64 command);
+	int (*async_control)(struct ucsi *ucsi, u64 command);
 	bool (*update_altmodes)(struct ucsi *ucsi, struct ucsi_altmode *orig,
 				struct ucsi_altmode *updated);
 	void (*update_connector)(struct ucsi_connector *con);
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index adf32ca0f761..f54e4722d8f6 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -61,22 +61,20 @@ static int ucsi_acpi_read(struct ucsi *ucsi, unsigned int offset,
 	return 0;
 }
 
-static int ucsi_acpi_async_write(struct ucsi *ucsi, unsigned int offset,
-				 const void *val, size_t val_len)
+static int ucsi_acpi_async_control(struct ucsi *ucsi, u64 command)
 {
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
 
-	memcpy(ua->base + offset, val, val_len);
-	ua->cmd = *(u64 *)val;
+	memcpy(ua->base + UCSI_CONTROL, &command, sizeof(command));
+	ua->cmd = command;
 
 	return ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_WRITE);
 }
 
-static int ucsi_acpi_sync_write(struct ucsi *ucsi, unsigned int offset,
-				const void *val, size_t val_len)
+static int ucsi_acpi_sync_control(struct ucsi *ucsi, u64 command)
 {
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
-	bool ack = UCSI_COMMAND(*(u64 *)val) == UCSI_ACK_CC_CI;
+	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
 	int ret;
 
 	if (ack)
@@ -84,7 +82,7 @@ static int ucsi_acpi_sync_write(struct ucsi *ucsi, unsigned int offset,
 	else
 		set_bit(UCSI_ACPI_COMMAND_PENDING, &ua->flags);
 
-	ret = ucsi_acpi_async_write(ucsi, offset, val, val_len);
+	ret = ucsi_acpi_async_control(ucsi, command);
 	if (ret)
 		goto out_clear_bit;
 
@@ -102,8 +100,8 @@ static int ucsi_acpi_sync_write(struct ucsi *ucsi, unsigned int offset,
 
 static const struct ucsi_operations ucsi_acpi_ops = {
 	.read = ucsi_acpi_read,
-	.sync_write = ucsi_acpi_sync_write,
-	.async_write = ucsi_acpi_async_write
+	.sync_control = ucsi_acpi_sync_control,
+	.async_control = ucsi_acpi_async_control
 };
 
 static int
@@ -125,8 +123,8 @@ ucsi_zenbook_read(struct ucsi *ucsi, unsigned int offset, void *val, size_t val_
 
 static const struct ucsi_operations ucsi_zenbook_ops = {
 	.read = ucsi_zenbook_read,
-	.sync_write = ucsi_acpi_sync_write,
-	.async_write = ucsi_acpi_async_write
+	.sync_control = ucsi_acpi_sync_control,
+	.async_control = ucsi_acpi_async_control
 };
 
 static int ucsi_gram_read(struct ucsi *ucsi, unsigned int offset,
@@ -157,13 +155,12 @@ static int ucsi_gram_read(struct ucsi *ucsi, unsigned int offset,
 	return ret;
 }
 
-static int ucsi_gram_sync_write(struct ucsi *ucsi, unsigned int offset,
-				const void *val, size_t val_len)
+static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command)
 {
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
 	int ret;
 
-	ret = ucsi_acpi_sync_write(ucsi, offset, val, val_len);
+	ret = ucsi_acpi_sync_control(ucsi, command);
 	if (ret < 0)
 		return ret;
 
@@ -177,8 +174,8 @@ static int ucsi_gram_sync_write(struct ucsi *ucsi, unsigned int offset,
 
 static const struct ucsi_operations ucsi_gram_ops = {
 	.read = ucsi_gram_read,
-	.sync_write = ucsi_gram_sync_write,
-	.async_write = ucsi_acpi_async_write
+	.sync_control = ucsi_gram_sync_control,
+	.async_control = ucsi_acpi_async_control
 };
 
 static const struct dmi_system_id ucsi_acpi_quirks[] = {
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index dda7c7c94e08..76b39bb9762d 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -610,25 +610,23 @@ static int ucsi_ccg_read(struct ucsi *ucsi, unsigned int offset,
 	return ret;
 }
 
-static int ucsi_ccg_async_write(struct ucsi *ucsi, unsigned int offset,
-				const void *val, size_t val_len)
+static int ucsi_ccg_async_control(struct ucsi *ucsi, u64 command)
 {
 	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
-	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(offset);
+	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(UCSI_CONTROL);
 
 	/*
-	 * UCSI may read CCI instantly after async_write,
+	 * UCSI may read CCI instantly after async_control,
 	 * clear CCI to avoid caller getting wrong data before we get CCI from ISR
 	 */
 	spin_lock(&uc->op_lock);
 	uc->op_data.cci = 0;
 	spin_unlock(&uc->op_lock);
 
-	return ccg_write(uc, reg, val, val_len);
+	return ccg_write(uc, reg, (u8 *)&command, sizeof(command));
 }
 
-static int ucsi_ccg_sync_write(struct ucsi *ucsi, unsigned int offset,
-			       const void *val, size_t val_len)
+static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
 {
 	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
 	struct ucsi_connector *con;
@@ -639,19 +637,17 @@ static int ucsi_ccg_sync_write(struct ucsi *ucsi, unsigned int offset,
 	pm_runtime_get_sync(uc->dev);
 	set_bit(DEV_CMD_PENDING, &uc->flags);
 
-	if (offset == UCSI_CONTROL && val_len == sizeof(uc->last_cmd_sent)) {
-		uc->last_cmd_sent = *(u64 *)val;
+	uc->last_cmd_sent = command;
 
-		if (UCSI_COMMAND(uc->last_cmd_sent) == UCSI_SET_NEW_CAM &&
-		    uc->has_multiple_dp) {
-			con_index = (uc->last_cmd_sent >> 16) &
-				    UCSI_CMD_CONNECTOR_MASK;
-			con = &uc->ucsi->connector[con_index - 1];
-			ucsi_ccg_update_set_new_cam_cmd(uc, con, (u64 *)val);
-		}
+	if (UCSI_COMMAND(uc->last_cmd_sent) == UCSI_SET_NEW_CAM &&
+	    uc->has_multiple_dp) {
+		con_index = (uc->last_cmd_sent >> 16) &
+			UCSI_CMD_CONNECTOR_MASK;
+		con = &uc->ucsi->connector[con_index - 1];
+		ucsi_ccg_update_set_new_cam_cmd(uc, con, &command);
 	}
 
-	ret = ucsi_ccg_async_write(ucsi, offset, val, val_len);
+	ret = ucsi_ccg_async_control(ucsi, command);
 	if (ret)
 		goto err_clear_bit;
 
@@ -668,8 +664,8 @@ static int ucsi_ccg_sync_write(struct ucsi *ucsi, unsigned int offset,
 
 static const struct ucsi_operations ucsi_ccg_ops = {
 	.read = ucsi_ccg_read,
-	.sync_write = ucsi_ccg_sync_write,
-	.async_write = ucsi_ccg_async_write,
+	.sync_control = ucsi_ccg_sync_control,
+	.async_control = ucsi_ccg_async_control,
 	.update_altmodes = ucsi_ccg_update_altmodes
 };
 
diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 2fa973afe4e6..ebd76257c4fc 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -143,21 +143,19 @@ static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned i
 	return 0;
 }
 
-static int pmic_glink_ucsi_async_write(struct ucsi *__ucsi, unsigned int offset,
-				       const void *val, size_t val_len)
+static int pmic_glink_ucsi_async_control(struct ucsi *__ucsi, u64 command)
 {
 	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(__ucsi);
 	int ret;
 
 	mutex_lock(&ucsi->lock);
-	ret = pmic_glink_ucsi_locked_write(ucsi, offset, val, val_len);
+	ret = pmic_glink_ucsi_locked_write(ucsi, UCSI_CONTROL, &command, sizeof(command));
 	mutex_unlock(&ucsi->lock);
 
 	return ret;
 }
 
-static int pmic_glink_ucsi_sync_write(struct ucsi *__ucsi, unsigned int offset,
-				      const void *val, size_t val_len)
+static int pmic_glink_ucsi_sync_control(struct ucsi *__ucsi, u64 command)
 {
 	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(__ucsi);
 	unsigned long left;
@@ -169,7 +167,7 @@ static int pmic_glink_ucsi_sync_write(struct ucsi *__ucsi, unsigned int offset,
 	ucsi->sync_val = 0;
 	reinit_completion(&ucsi->sync_ack);
 	ucsi->sync_pending = true;
-	ret = pmic_glink_ucsi_locked_write(ucsi, offset, val, val_len);
+	ret = pmic_glink_ucsi_locked_write(ucsi, UCSI_CONTROL, &command, sizeof(command));
 	mutex_unlock(&ucsi->lock);
 
 	left = wait_for_completion_timeout(&ucsi->sync_ack, 5 * HZ);
@@ -217,8 +215,8 @@ static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
 
 static const struct ucsi_operations pmic_glink_ucsi_ops = {
 	.read = pmic_glink_ucsi_read,
-	.sync_write = pmic_glink_ucsi_sync_write,
-	.async_write = pmic_glink_ucsi_async_write,
+	.sync_control = pmic_glink_ucsi_sync_control,
+	.async_control = pmic_glink_ucsi_async_control,
 	.update_connector = pmic_glink_ucsi_update_connector,
 	.connector_status = pmic_glink_ucsi_connector_status,
 };
diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
index ac69288e8bb0..396e2090e7c3 100644
--- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
+++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
@@ -359,8 +359,7 @@ static int ucsi_stm32g0_read(struct ucsi *ucsi, unsigned int offset, void *val,
 	return 0;
 }
 
-static int ucsi_stm32g0_async_write(struct ucsi *ucsi, unsigned int offset, const void *val,
-				    size_t len)
+static int ucsi_stm32g0_async_control(struct ucsi *ucsi, u64 command)
 {
 	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
 	struct i2c_client *client = g0->client;
@@ -373,19 +372,19 @@ static int ucsi_stm32g0_async_write(struct ucsi *ucsi, unsigned int offset, cons
 	unsigned char *buf;
 	int ret;
 
-	buf = kmalloc(len + 1, GFP_KERNEL);
+	buf = kmalloc(sizeof(command) + 1, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
-	buf[0] = offset;
-	memcpy(&buf[1], val, len);
-	msg[0].len = len + 1;
+	buf[0] = UCSI_CONTROL;
+	memcpy(&buf[1], &command, sizeof(command));
+	msg[0].len = sizeof(command) + 1;
 	msg[0].buf = buf;
 
 	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
 	kfree(buf);
 	if (ret != ARRAY_SIZE(msg)) {
-		dev_err(g0->dev, "i2c write %02x, %02x error: %d\n", client->addr, offset, ret);
+		dev_err(g0->dev, "i2c write %02x, %02x error: %d\n", client->addr, UCSI_CONTROL, ret);
 
 		return ret < 0 ? ret : -EIO;
 	}
@@ -393,11 +392,10 @@ static int ucsi_stm32g0_async_write(struct ucsi *ucsi, unsigned int offset, cons
 	return 0;
 }
 
-static int ucsi_stm32g0_sync_write(struct ucsi *ucsi, unsigned int offset, const void *val,
-				   size_t len)
+static int ucsi_stm32g0_sync_control(struct ucsi *ucsi, u64 command)
 {
 	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
-	bool ack = UCSI_COMMAND(*(u64 *)val) == UCSI_ACK_CC_CI;
+	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
 	int ret;
 
 	if (ack)
@@ -405,7 +403,7 @@ static int ucsi_stm32g0_sync_write(struct ucsi *ucsi, unsigned int offset, const
 	else
 		set_bit(COMMAND_PENDING, &g0->flags);
 
-	ret = ucsi_stm32g0_async_write(ucsi, offset, val, len);
+	ret = ucsi_stm32g0_async_control(ucsi, command);
 	if (ret)
 		goto out_clear_bit;
 
@@ -449,8 +447,8 @@ static irqreturn_t ucsi_stm32g0_irq_handler(int irq, void *data)
 
 static const struct ucsi_operations ucsi_stm32g0_ops = {
 	.read = ucsi_stm32g0_read,
-	.sync_write = ucsi_stm32g0_sync_write,
-	.async_write = ucsi_stm32g0_async_write,
+	.sync_control = ucsi_stm32g0_sync_control,
+	.async_control = ucsi_stm32g0_async_control,
 };
 
 static int ucsi_stm32g0_register(struct ucsi *ucsi)
diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 8bee0b469041..e5e8ba0c0eaa 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -56,23 +56,17 @@ static int yoga_c630_ucsi_read(struct ucsi *ucsi, unsigned int offset,
 	}
 }
 
-static int yoga_c630_ucsi_async_write(struct ucsi *ucsi, unsigned int offset,
-				      const void *val, size_t val_len)
+static int yoga_c630_ucsi_async_control(struct ucsi *ucsi, u64 command)
 {
 	struct yoga_c630_ucsi *uec = ucsi_get_drvdata(ucsi);
 
-	if (offset != UCSI_CONTROL ||
-	    val_len != YOGA_C630_UCSI_WRITE_SIZE)
-		return -EINVAL;
-
-	return yoga_c630_ec_ucsi_write(uec->ec, val);
+	return yoga_c630_ec_ucsi_write(uec->ec, (u8*)&command);
 }
 
-static int yoga_c630_ucsi_sync_write(struct ucsi *ucsi, unsigned int offset,
-				     const void *val, size_t val_len)
+static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi, u64 command)
 {
 	struct yoga_c630_ucsi *uec = ucsi_get_drvdata(ucsi);
-	bool ack = UCSI_COMMAND(*(u64 *)val) == UCSI_ACK_CC_CI;
+	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
 	int ret;
 
 	if (ack)
@@ -82,7 +76,7 @@ static int yoga_c630_ucsi_sync_write(struct ucsi *ucsi, unsigned int offset,
 
 	reinit_completion(&uec->complete);
 
-	ret = yoga_c630_ucsi_async_write(ucsi, offset, val, val_len);
+	ret = yoga_c630_ucsi_async_control(ucsi, command);
 	if (ret)
 		goto out_clear_bit;
 
@@ -100,8 +94,8 @@ static int yoga_c630_ucsi_sync_write(struct ucsi *ucsi, unsigned int offset,
 
 const struct ucsi_operations yoga_c630_ucsi_ops = {
 	.read = yoga_c630_ucsi_read,
-	.sync_write = yoga_c630_ucsi_sync_write,
-	.async_write = yoga_c630_ucsi_async_write,
+	.sync_control = yoga_c630_ucsi_sync_control,
+	.async_control = yoga_c630_ucsi_async_control,
 };
 
 static void yoga_c630_ucsi_notify_ucsi(struct yoga_c630_ucsi *uec, u32 cci)

-- 
2.39.2


