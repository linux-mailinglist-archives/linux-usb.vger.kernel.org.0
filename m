Return-Path: <linux-usb+bounces-19482-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C07A14DF2
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 11:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD9BB188AA63
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 10:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771F91FDE24;
	Fri, 17 Jan 2025 10:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RY5NEWlS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6FF1FC7EC
	for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 10:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737110991; cv=none; b=XrmZBn1Nf93SjLPhxqJV8MxhjjkqsYuTJ4ErN1DoQrL8dJekAHtlUYxlkwhoKw8EA36SqV9fRbRgpi/OvmZCSu3PhxU14zHpDCfhZTZJCVsqE9XhfmviptTxteRejN87n5rOqY7UfxzZoDywfBDxAX+t4I/7KQlGxDqhao4Dt30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737110991; c=relaxed/simple;
	bh=TgGTst054AUF5BLRcEqWxsTahGtW5ErSDs4mFY9yptU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KlF9lB1/Hpul8SrUt8LKw6L8T4O4uw5QrHiSxJDFNufo8MaQ9RPm7ZfydeAzisvuRSXzOTPRVyYifTeamR/+8vrV1gdrx3SyoICJYWeCAsH9Zk1rn1NsWy43/+v2/Ud/WWqwUmbc1S98U9oagCOryx43COeNgWTfaCfP4bsg6m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RY5NEWlS; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3072f8dc069so4145161fa.3
        for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 02:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737110987; x=1737715787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIsJjgqcD3CKuAw91D8+xLiCuc1mT42VX6rCIWe3wr0=;
        b=RY5NEWlSS7sPRcN8bcNJAfEeYq3p7+PoNkxqOkCwdJv3OUTPJrsJ0lrwHNYjxMqTt3
         DD5vEkpBLsHtQ7+Q48OB8GOMHbqysUZZWUpxa0NgZaV5swW4tklv6xu42ERtZ7ZkCoZ0
         uGx2EhCk8l46jcM5zLYOZs5VMu+0dZhIYJqk4RAzbrbomJwM8MD6v1EOHnrv1cvCpd50
         pdoIqir17mkbCjy5EZ4VafECz/NZbFWSkKj4TtmXChRvF2courwK+5Prv00oGdchj1qC
         5Xr0rYXEPltFQiqx4rwQpX6DR7I57KXgtLhq4k1DEFUTTXufbvwQJ++VFanv7yslFvlk
         O2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737110987; x=1737715787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIsJjgqcD3CKuAw91D8+xLiCuc1mT42VX6rCIWe3wr0=;
        b=T71TW4LSdV98TTuXG05x52OrEpe1gIYjdoJX1LksUTb+dPEg0lXWCSusYajiJkSW8R
         t1tgFo0gs4mz1MiGs0FRqyqiY4HsAYBMfRTphn88JE05T7CETZZrMwZyL1Du4qBV2ITN
         k7smeIfxaqd0Bk/PS29PR4qeXl+d4MFhiSLW6XvupCT84nG0D1QGfnSMM6pjaHY8MvKd
         xooJwv3K3MeOgVM9yg1Kf4aiaXn9Xnhv6/nG4z9aFI9v9chAHj490ImWEeFV+svJAiji
         JxOGl5RVsWItKMSdohy4WRJh9KWqq/Ifikdg3EXAgkiwgX6zIodsPRHmQ9vevvcAGK2w
         UWBg==
X-Gm-Message-State: AOJu0YzpyIIPmoroVfnfpkRVW2ePUZ8ULZmeWwWX8GduQ9j7MrtOJ4jd
	xZL86w9ONy8IS5NH5CvfsBu2eP19WDmV8b+nTFayd9HTQoCmHnTLpN5mnvt8FWx90UTYkSTi9Ba
	rFbE=
X-Gm-Gg: ASbGnctmsn9+AR5MRNfctbl76Go2gwlSL7b0NvzU89JQ2WXsxx1qJScqAcVsIAZzswj
	oT3hV8905J3iRmGpNUOHRurrYR3RMc4k86PqTYnwirz6G8tidKv1Ep8QPW+N7QbyYPliMRihzq+
	0m/N81ndxryybmL9lfxIhGkctP1FC9f/yra9/UvgTaTMfipP8qHIQtrEv9pZ8N0ncEy6y6IK1Uj
	W31o6ixTy1wxSwknS+h+fy1RSjjUr5u1ocZkXegB0hz7i4Z4mLkq9TFcDmpOpv7
X-Google-Smtp-Source: AGHT+IG7JzmugXSREVxuRHqTKN33noZpMABdtBvn0teNbwq88+AybiOF55u0wVoH3J2QQ01RCzY8DA==
X-Received: by 2002:a2e:8e27:0:b0:302:2598:dec2 with SMTP id 38308e7fff4ca-3072ca75098mr6134391fa.14.1737110987070;
        Fri, 17 Jan 2025 02:49:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a3446c8sm3803321fa.27.2025.01.17.02.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 02:49:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Jan 2025 12:49:41 +0200
Subject: [PATCH 1/3] usb: typec: ucsi: return CCI and message from
 sync_control callback
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-ucsi-merge-commands-v1-1-e20c19934d59@linaro.org>
References: <20250117-ucsi-merge-commands-v1-0-e20c19934d59@linaro.org>
In-Reply-To: <20250117-ucsi-merge-commands-v1-0-e20c19934d59@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5724;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TgGTst054AUF5BLRcEqWxsTahGtW5ErSDs4mFY9yptU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnijXFQSDpFhCcDmKnHLcipMMYLKILoKTxMV5DL
 McXFISagRaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4o1xQAKCRCLPIo+Aiko
 1TuCB/0SkqhhxSoA/uUxGd073w+q0JADO3Fr1lLWVld5rXTG6fkEPCpms5A84xFzqCIILVNthoG
 9bsxf1BDSqcy5wcpYzviMvgwkmwhmh8CR5+RtahtEpjvMLHkodZJOWXG4AUSBlRGw07TDnlF0an
 nzNNZ4k0c3hgbPqniEc9IZ7zEiE+y27cM5jsoGI2GsSW0CqzeRr8G2Ung5KsTtiFqu+hhd8o/+3
 dwjYekW0aLmNmKHnIernbTE7W/mT0v8N7jfxu63+sEuoW19GUOUmqHrirxCLfg61T+yYQSwd5vh
 itCUzCi4witBE6KypugDxqGnXm4JygNfls9Vu2+7rx11E1on
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Some of the drivers emulate or handle some of the commands in the
platform-specific way. The code ends up being split between several
callbacks, which complicates emulation.

In preparation to reworking such drivers, move read_cci() and
read_message_in() calls into ucsi_sync_control_common().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c      | 19 +++++++++++--------
 drivers/usb/typec/ucsi/ucsi.h      |  6 ++++--
 drivers/usb/typec/ucsi/ucsi_acpi.c |  5 +++--
 drivers/usb/typec/ucsi/ucsi_ccg.c  |  5 +++--
 4 files changed, 21 insertions(+), 14 deletions(-)

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


