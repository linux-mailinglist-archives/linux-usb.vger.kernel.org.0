Return-Path: <linux-usb+bounces-17951-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B32CF9DBDE7
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2024 00:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73917282240
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 23:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA8B1C9B77;
	Thu, 28 Nov 2024 23:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nm8Jcc5h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECD51C82F0
	for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 23:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732836049; cv=none; b=MrR5pDT2CzKR0aYB7JI3cUM+zF2ddvrTbGZ/6Vdn5XFuuVw9HYo+lIufu6FiGwnVcQm+Ly4j8RaWqyuUYclxK5TBdnkOfhOw/CjD6WHulm5DR64pdDkjAehzL8pkvewaySr6PhCElNEUbboUC3Qbho/U9kfLCHzio2D/CPqv5EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732836049; c=relaxed/simple;
	bh=tbcZYXU6HcwHtSy5LuzFDa9JvHECIlXLmldxQYaGrnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TVj51yTQ0Uy72GrR3rYIpyere8RrGSYKhLeZzYD1+vkYkeAV6an/eI4GEctvZSmFZ2IEECwm9Qt8weCB7n1rmXLvnbNluv0yUOB6T9RzTKYfTQNFMMhQzQqh199DrGtIvIia3HUDKo2g0L2AvcoKI4hwBnIdj1Xy04jfvuzZdkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nm8Jcc5h; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ffdbc0c103so21059981fa.3
        for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 15:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732836045; x=1733440845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NO7pr5IjtQ7DDii6MRKHjZ3m6XUBJXvLyCa0CyvruQQ=;
        b=nm8Jcc5h0W0qRIp7uU6i4ZNZoKl6Afbp55O/asdljxD+vZtjMAUIpOxoGTxDga9ZEp
         Rz2XHF0qzU1/rJlC/BcIv8MdZpISLDBsAuTfeYL9pxnIcwEfZVu5zuJGxB+ww0yhZL1Z
         G2/y91qvOKMHlMRliZKXPmwNNKMXqxUG4JBuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732836045; x=1733440845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NO7pr5IjtQ7DDii6MRKHjZ3m6XUBJXvLyCa0CyvruQQ=;
        b=dI42JfsiMOB7IdA9b/v/qBWiu3dz2WRhJekguK8AeZMcEWoGgtLdm4YS+L2rdK1eE+
         70bDMRy+WM3RsWjIHkn/at++NoBNyxDHEHiOIVOqrJhZaPSlMjqvWSQ3loKolZePy8pj
         Lh7P8Fmh4LfBmn5V6MkZ4j0LBRJM1cDiIRYSKAc3TJtldQqjcOjR8XRY+wI5KC685PUW
         aVXSDwfR9LuL/xMy7sBCk41vd5DReZgpWeHdW7FwQFyd7cIJ36ToZNO8AkH10ugMjU2A
         jpN4pexDCbsL688h92fEGJ8PF76oH46+jGYQK9akO23uarPpyYpkwtv+JrfI2P7QPD0Q
         j7mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUibTErmRpf/ZrhnILEJGNJa0htvQi33Vgm0nzuBo2+TP8232cb7JsWl3kb9tqYZGl6Lz6Jvob5RaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSyKCBqIz2MPbt4EiezXjZ/ru/89UkLYn1gvaV6h1UcOHyyXM6
	ZGvV7NqIeXMF5Kx4WIhzbC2gbs3SUoGM3/kdscSlQnPLyWA9JMiE42obAe1Y
X-Gm-Gg: ASbGncsh8yRkSk5GfOTmuiw8RhZtrJs1m6Toy3PIoylZw+9sAdu+DAslk2jHC2JAUL0
	cCm6ZLaESjMODdgLnrffLIJbpUUlyjIAcE1CO6EpFhDpvpygD0jZCOaTOLyRDO33Aav7kCqb3oP
	w+PN6MqME40/eLKlrDVTse5+KO8qEmaCv9nedjrcF8CoCk08gHkUrQEJvdkIXd9bl35rBUSErCu
	niAqQX+1BKzYKdE3rNToFHJP6ihPQCp27Ww02jAC3OGekZ7oi7hUZBb5X+QciFD4/ksSl7GDgq6
	SrJl3sy9He6MDtZLU3xfRwk3MJ8djuGYmJs=
X-Google-Smtp-Source: AGHT+IGmiebKIbZzhcAjX1oLllwlbZw4xh5D+KuARx/TSvORsh+S7wRIiiNwsgWUZtSjqXFexldF4g==
X-Received: by 2002:a05:651c:1502:b0:2fc:9674:60b5 with SMTP id 38308e7fff4ca-2ffd60a9703mr75687331fa.25.1732836045246;
        Thu, 28 Nov 2024 15:20:45 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5997d5672sm110757566b.77.2024.11.28.15.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 15:20:44 -0800 (PST)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v8 3/3] usb: typec: cros_ec_ucsi: Recover from write timeouts
Date: Thu, 28 Nov 2024 23:20:35 +0000
Message-ID: <20241128232035.1525978-4-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241128232035.1525978-1-ukaszb@chromium.org>
References: <20241128232035.1525978-1-ukaszb@chromium.org>
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
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 88 ++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index c588d9a57643..6daf61e7e62a 100644
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
@@ -99,12 +105,43 @@ static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
 	return 0;
 }
 
+static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
+{
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
+}
+
 struct ucsi_operations cros_ucsi_ops = {
 	.read_version = cros_ucsi_read_version,
 	.read_cci = cros_ucsi_read_cci,
 	.read_message_in = cros_ucsi_read_message_in,
 	.async_control = cros_ucsi_async_control,
-	.sync_control = ucsi_sync_control_common,
+	.sync_control = cros_ucsi_sync_control,
 };
 
 static void cros_ucsi_work(struct work_struct *work)
@@ -118,6 +155,54 @@ static void cros_ucsi_work(struct work_struct *work)
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
@@ -162,6 +247,7 @@ static int cros_ucsi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, udata);
 
 	INIT_WORK(&udata->work, cros_ucsi_work);
+	INIT_DELAYED_WORK(&udata->write_tmo, cros_ucsi_write_timeout);
 	init_completion(&udata->complete);
 
 	udata->ucsi = ucsi_create(dev, &cros_ucsi_ops);
-- 
2.47.0.338.g60cca15819-goog


