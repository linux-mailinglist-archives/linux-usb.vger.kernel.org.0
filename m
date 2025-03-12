Return-Path: <linux-usb+bounces-21694-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC17A5E4E6
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 21:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D72E19C05D3
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 20:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089B61EEA2D;
	Wed, 12 Mar 2025 20:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QAKra6lR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2542F1EA7C8
	for <linux-usb@vger.kernel.org>; Wed, 12 Mar 2025 20:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741809620; cv=none; b=WnmUURpDw8ItYWw8nVIpSNza0+IbT/oQZMgHHk+FNgCeARMiMfonS1Err6Y4mrl1BURcMuJG2RK1yb/XApNQ8YB2J7HiIaPIVuFuU3q0WuJKT/FwxbPWY5PHRyrwdHYaUYJiqtRslJzFPnNrCTAd8KLjhhqP7vcURMSedPs+yKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741809620; c=relaxed/simple;
	bh=0GWy3rp0F7KpgF0wRntfFfUSkJ3mXo1eZ4Tv31fz+NU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XUUg019aICGJIa09Gb9j3MAFHXBt6+yUj+Esl5ez5dvMkLDisFbLMdCyAQn0B0hPGLI9xvesXaBlxu/8l/DGTnBhq0kblmhtH8i6jkjAeFDWHWPE8dZ5uoXAXvPQqC1LgrtdJphInA9jeVDN8ykuxyyzOTQLLjtriTaJf5++VC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QAKra6lR; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2242ce15cc3so3312575ad.1
        for <linux-usb@vger.kernel.org>; Wed, 12 Mar 2025 13:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741809617; x=1742414417; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VDEU9Q/7+kilAtJ4k6780hVL8+VoEsG1QL4aEk8tmxQ=;
        b=QAKra6lRa8Yqut8W4HDU+3znz2V3GW9seMe5fmfLTOUxkqI3JxxKW2mkSGcF+WYrf9
         B4NcXCaG0dhTABxWAVM/zB38q+lKSqs8nvfovINd5zsSb4c4LVRC/+2O9nW4EktJ8J15
         7p5Q7v8aGdBF0dUgPr16j8cZDqW29CZpXCok6KxUS8cKyDGLy/jGJKgReWQehTEawHz9
         FjXNvzkKn3lMiPhn9uZcp7BuIBUzAt9AbmPN41PvRAz/mEPpFEopBE+OjGA4p7Uh6nod
         0k5M6x9dAtkxxc/Zaz9zKSOf+ThUTrYQRaym4nHuIToO7hBJbhKp/Z2swzKaQTu3Rfzk
         pc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809617; x=1742414417;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDEU9Q/7+kilAtJ4k6780hVL8+VoEsG1QL4aEk8tmxQ=;
        b=RTTkUBu6CZRh0gvcaz5NVdHDEE1h8qPbA79SZaftSBiqh2LiOeO5Q6p/wgUysYVgeJ
         3GXEnl/OA/UffYGfocmb7tFkL5WMwQKkdjsOz6065FkSSKgImU9aRvISUggVW3aW92QV
         Kf+2KJD/9/6vrwkl/axzLHHsLfV2K88F/6FsmM32iUhaNTVkE17tYuIpWwgVFstO3EyH
         l3g7b6xVskeOW0n9V5J6XbuS1zNQ0Y6TOtDbiURdzYRiiMf8FiARUDC2w6Plr1WV4GS7
         ipoLwF9nVHOK3x0LAQChzsgApQi6EOXFu7MCXJm1068nOnNCutRdHZUanqnvFeFhbpa6
         UDvg==
X-Forwarded-Encrypted: i=1; AJvYcCXsZyuF66VlPKswyDk68crK4ztGSGFWEPqx9R+gzRl2moVoPhQ4WAbrU5jcFqqF44RwD2as8SYKJf4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx00ISp8rUXdVxXKIUnmrJrovrCWlcT4QBzh+pP52z7qXvz1lR8
	v9vFsi7KILLTYcKYWouPHXDbxkimOvHqqUxavuIOEE0Z3BsPAPb5dRfS56dJdfknz6iB4ArOXtX
	I1A==
X-Google-Smtp-Source: AGHT+IG+7wN0jLCNhozwudp+CmZ2bIOC2JWCQMC5PPVbBuF1mi37k+/+m0ELnNvF8x64iohsHTAqLd5wRsg=
X-Received: from plbjy16.prod.google.com ([2002:a17:903:42d0:b0:223:37b7:2388])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:234d:b0:220:c34c:5760
 with SMTP id d9443c01a7336-22428c240demr280258275ad.51.1741809617329; Wed, 12
 Mar 2025 13:00:17 -0700 (PDT)
Date: Wed, 12 Mar 2025 19:59:11 +0000
In-Reply-To: <20250312195951.1579682-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250312195951.1579682-1-jthies@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250312195951.1579682-3-jthies@google.com>
Subject: [PATCH v1 2/3] usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions
From: Jameson Thies <jthies@google.com>
To: tzungbi@kernel.org, ukaszb@chromium.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, groeck@chromium.org, swboyd@chromium.org, 
	akuchynski@chromium.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

Add support for cros_ec_ucsi to load based on "google,cros-ec-ucsi"
compatible devices and "GOOG0021" ACPI nodes.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index c605c8616726..d916893b8908 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -5,11 +5,13 @@
  * Copyright 2024 Google LLC.
  */
 
+#include <linux/acpi.h>
 #include <linux/container_of.h>
 #include <linux/dev_printk.h>
 #include <linux/jiffies.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_usbpd_notify.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -226,7 +228,6 @@ static void cros_ucsi_destroy(struct cros_ucsi_data *udata)
 static int cros_ucsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct cros_ec_dev *ec_data = dev_get_drvdata(dev->parent);
 	struct cros_ucsi_data *udata;
 	int ret;
 
@@ -236,7 +237,14 @@ static int cros_ucsi_probe(struct platform_device *pdev)
 
 	udata->dev = dev;
 
-	udata->ec = ec_data->ec_dev;
+	if (is_acpi_device_node(dev->fwnode) || is_of_node(dev->fwnode)) {
+		udata->ec = dev_get_drvdata(pdev->dev.parent);
+	} else {
+		struct cros_ec_dev *ec_data = dev_get_drvdata(dev->parent);
+
+		udata->ec = ec_data->ec_dev;
+	}
+
 	if (!udata->ec)
 		return dev_err_probe(dev, -ENODEV, "couldn't find parent EC device\n");
 
@@ -317,10 +325,24 @@ static const struct platform_device_id cros_ucsi_id[] = {
 };
 MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
 
+static const struct acpi_device_id cros_ec_ucsi_acpi_device_ids[] = {
+	{ "GOOG0021", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, cros_ec_ucsi_acpi_device_ids);
+
+static const struct of_device_id cros_ucsi_of_match[] = {
+	{ .compatible = "google,cros-ec-ucsi", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, cros_ucsi_of_match);
+
 static struct platform_driver cros_ucsi_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.pm = &cros_ucsi_pm_ops,
+		.acpi_match_table = cros_ec_ucsi_acpi_device_ids,
+		.of_match_table = cros_ucsi_of_match,
 	},
 	.id_table = cros_ucsi_id,
 	.probe = cros_ucsi_probe,
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


