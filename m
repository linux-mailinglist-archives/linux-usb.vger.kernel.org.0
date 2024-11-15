Return-Path: <linux-usb+bounces-17624-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EC31D9CF2B2
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 18:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9D8FB395EA
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 15:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0667F18B484;
	Fri, 15 Nov 2024 15:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dpij7YxI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1E31D5ADC
	for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2024 15:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731685966; cv=none; b=VFxV+MX+kkYX3llOxvTPkBeqsgpRW9q2dUvQ4GGcjouwYMBHceZBz81vvHeMAqd5glhBpcMOiPTCfkQDss39m4Iucrx5eMAyxj8DH6uuR1Vhpu3VFhTC8+lkw9qiCdreqvdcwgSzSO6Jdj0DRfrvQHxdYoY2y1m3t17waxi2Nzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731685966; c=relaxed/simple;
	bh=IA0lrnNas0YoO/jbHCyNZSl7uiH/6eRgBzzm6A//b1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=acFgxqR2vnhFFixMgV5jlZm8fkrmEMoALB9TpegOGB1HfBvUDhpBbwd+kzaheBLTgoZ6Xnp8sqae2xunwF//gTD9lbQMaLzlFBllzRKimOcTnjHdxop/LVd4xM+K8MZwU4cMxtFbwMJ0jloL6wsMzNvvKiLVUY3OVyfU4/xxXXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dpij7YxI; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cf7b79c6a6so2825071a12.0
        for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2024 07:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731685963; x=1732290763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+h/4OtNQOmknexdS73X7hyoeknIzANxsH8Xqm1Epi0=;
        b=Dpij7YxIZ4wLGG9S4Z23L3K5noCBMVWvNmn44HIf/G/oFzTVhsLpKbJXPH7NrLFnyS
         UvEdigEWpi/f/lcYfQ9ehuRlRiD6eC+HmbKjfg5A0TLrW0gkWF0r00aayF5zoSKLICXh
         lhM8T8a9KtlEvy8q+IUPFq253fKQ6VEpJH0ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731685963; x=1732290763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+h/4OtNQOmknexdS73X7hyoeknIzANxsH8Xqm1Epi0=;
        b=Ho6NE/Aj19HP9FqB0M44hW9f1Q+v/EW1DzNxYN26Ri4JXLET3PELd2S3a6ESeo2bUA
         ScpN+7nsifw10mSofcq4utpoRzYSGXWYuvZs0iDjW47TECdykGQDWwzXne30jSWLTr9X
         8I3VytB3Jp2mIZ7ns56RDDNKNpgZVQ6Aox03ISkVrASwDEWm3cQIdQhc1YdMkGzMQxw/
         yEbvZ2e2Fhdo9OiUJpGlarxDFGcwgYEWEcUsBdC+QSoLHGtLpNThSXPDEL4desu3BQMq
         SbCdCgfj3umBzxtx0uJrghs2UrxU8EDJgsffqxlehCbxt4zNbeNUqhBnFOyxqL72OKPf
         ousQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAmVSC2n1cFCCPAc0PmmgQCMvRsnQlkZ2w++6dXVLCAISToTSclGXSPFUFqV2zM15oLW9PWi5RvEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdJ9qKF8VxJkU5QbyeJ5Yj9O74GPDfQezno0NAmaaBI3Nh3bT1
	WlaeMtPRhmZ2BALqf1IFkhV9fusJYBEEy106YJL9ShF2HiNUwN40ciZYywh+
X-Google-Smtp-Source: AGHT+IHIW/jLgqdVPuNl3GJnBFPcKnN15+ULgCZmftrtTOho9nPQQD34rXutZqYJHJ2kxZxYaBb9qw==
X-Received: by 2002:a17:907:2d93:b0:a9e:82f3:d4ab with SMTP id a640c23a62f3a-aa207687241mr701475266b.9.1731685963146;
        Fri, 15 Nov 2024 07:52:43 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e086244sm187758166b.177.2024.11.15.07.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 07:52:42 -0800 (PST)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v7 3/3] usb: typec: cros_ec_ucsi: Recover from write timeouts
Date: Fri, 15 Nov 2024 15:52:34 +0000
Message-ID: <20241115155234.1587589-4-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241115155234.1587589-1-ukaszb@chromium.org>
References: <20241115155234.1587589-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

In a suspend-resume edge case, the OPM is timing out in ucsi_resume and
the PPM is getting stuck waiting for a command complete ack. Add a write
timeout recovery task that will get us out of this state.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 83 ++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index aae0bf106494..3e6b59aba275 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -7,6 +7,7 @@
 
 #include <linux/container_of.h>
 #include <linux/dev_printk.h>
+#include <linux/jiffies.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_data/cros_ec_commands.h>
@@ -29,6 +30,9 @@
  */
 #define WRITE_TMO_MS		5000
 
+/* Number of times to attempt recovery from a write timeout before giving up. */
+#define WRITE_TMO_CTR_MAX	5
+
 struct cros_ucsi_data {
 	struct device *dev;
 	struct ucsi *ucsi;
@@ -36,6 +40,8 @@ struct cros_ucsi_data {
 	struct cros_ec_device *ec;
 	struct notifier_block nb;
 	struct work_struct work;
+	struct delayed_work write_tmo;
+	int tmo_counter;
 
 	struct completion complete;
 	unsigned long flags;
@@ -101,7 +107,33 @@ static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
 
 static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
 {
-	return ucsi_sync_control_common(ucsi, cmd);
+	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
+	int ret;
+
+	ret = ucsi_sync_control_common(ucsi, cmd);
+	if (ret)
+		goto out;
+
+	/* Successful write. Cancel any pending recovery work. */
+	cancel_delayed_work_sync(&udata->write_tmo);
+
+	return 0;
+out:
+	/* EC may return -EBUSY if CCI.busy is set. Convert this to a timeout.
+	 */
+	if (ret == -EBUSY)
+		ret = -ETIMEDOUT;
+
+	/* Schedule recovery attempt when we timeout or tried to send a command
+	 * while still busy.
+	 */
+	if (ret == -ETIMEDOUT) {
+		cancel_delayed_work_sync(&udata->write_tmo);
+		schedule_delayed_work(&udata->write_tmo,
+				      msecs_to_jiffies(WRITE_TMO_MS));
+	}
+
+	return ret;
 }
 
 struct ucsi_operations cros_ucsi_ops = {
@@ -123,6 +155,54 @@ static void cros_ucsi_work(struct work_struct *work)
 	ucsi_notify_common(udata->ucsi, cci);
 }
 
+static void cros_ucsi_write_timeout(struct work_struct *work)
+{
+	struct cros_ucsi_data *udata =
+		container_of(work, struct cros_ucsi_data, write_tmo.work);
+	u32 cci;
+	u64 cmd;
+
+	if (cros_ucsi_read(udata->ucsi, UCSI_CCI, &cci, sizeof(cci))) {
+		dev_err(udata->dev,
+			"Reading CCI failed; no write timeout recovery possible.");
+		return;
+	}
+
+	if (cci & UCSI_CCI_BUSY) {
+		udata->tmo_counter++;
+
+		if (udata->tmo_counter <= WRITE_TMO_CTR_MAX)
+			schedule_delayed_work(&udata->write_tmo,
+					      msecs_to_jiffies(WRITE_TMO_MS));
+		else
+			dev_err(udata->dev,
+				"PPM unresponsive - too many write timeouts.");
+
+		return;
+	}
+
+	/* No longer busy means we can reset our timeout counter. */
+	udata->tmo_counter = 0;
+
+	/* Need to ack previous command which may have timed out. */
+	if (cci & UCSI_CCI_COMMAND_COMPLETE) {
+		cmd = UCSI_ACK_CC_CI | UCSI_ACK_COMMAND_COMPLETE;
+		cros_ucsi_async_control(udata->ucsi, &cmd);
+
+		/* Check again after a few seconds that the system has
+		 * recovered to make sure our async write above was successful.
+		 */
+		schedule_delayed_work(&udata->write_tmo,
+				      msecs_to_jiffies(WRITE_TMO_MS));
+		return;
+	}
+
+	/* We recovered from a previous timeout. Treat this as a recovery from
+	 * suspend and call resume.
+	 */
+	ucsi_resume(udata->ucsi);
+}
+
 static int cros_ucsi_event(struct notifier_block *nb,
 			   unsigned long host_event, void *_notify)
 {
@@ -167,6 +247,7 @@ static int cros_ucsi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, udata);
 
 	INIT_WORK(&udata->work, cros_ucsi_work);
+	INIT_DELAYED_WORK(&udata->write_tmo, cros_ucsi_write_timeout);
 	init_completion(&udata->complete);
 
 	udata->ucsi = ucsi_create(dev, &cros_ucsi_ops);
-- 
2.47.0.338.g60cca15819-goog


