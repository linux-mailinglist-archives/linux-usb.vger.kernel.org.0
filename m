Return-Path: <linux-usb+bounces-28805-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CB4BAAE0C
	for <lists+linux-usb@lfdr.de>; Tue, 30 Sep 2025 03:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0EA8189DB46
	for <lists+linux-usb@lfdr.de>; Tue, 30 Sep 2025 01:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58D420E334;
	Tue, 30 Sep 2025 01:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="upmmxI4E"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79231FF1C8
	for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 01:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759195475; cv=none; b=joG6ZGSoxXZmQ7WOY5nPgyPGet+SkW60XGcsxtWJqIPTkozb9ArQN2LkkB0SWJDwHGaaNEjCpjG9FeY9f+myQCTutHWqPv5jE+AikbFOrF1HBU9hvSt/+gFZpgZkC8XjpvSryHTAkKGRjwOWDdmsqFf7tiElfbVjgY7Gqe69UXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759195475; c=relaxed/simple;
	bh=n5cziPQ61KRp5AtyPFgy8VJF4Lqvc2a81X5suV1ETHU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DUs2tJbyTVMcPrxE/7gIGaS4FJHsN8+kCfR76gYyp5CvSPRFNeP/TX3uKtnMh1YWoghCO6h1xVmqw9EL8RRdrwQajOS02T115t+rbkvvCi4Dxp815ptLVRvDTd/njuQ5pUIttvCQc/WSsqdXRhfcuLGqQOQ3C4xd4eN9kKEGlYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=upmmxI4E; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-27eca7298d9so110614355ad.0
        for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 18:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759195473; x=1759800273; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kogf9tvbfBCb39vdLAEVilZDn5JXEZ0lPob5kpAtHeE=;
        b=upmmxI4ETaz3upbs8OaweRTJP7ZvxBkAr7RbCJ1ApUn5UsLh1C8iQ/V7h8NBEhNc02
         Nr7Vv4zRGfOTdlwm1M2Rjw2sG6OriH3SQEO4mTlXB4FWosLspGSO7qreCfA4VYpx+CQX
         ouDIDksvIBcWlwq4Bpt0OBsFfg+CdywSken9RsI74VTlfyVilSLv3ZR1yK3D0FgkN/ZU
         UuD0Mk5OSqfHwzaamzdbGsxVkLv4Y/70h9iPMtRj/q3UN2e3shJGpXR91O1XD0SyLiCW
         03t+ebt63JvzlSzNaF4nacXAUXwj0DQ4H70MSCWPbuktQkZIDpl9U02Jop1Nk3vbuSZT
         +5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759195473; x=1759800273;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kogf9tvbfBCb39vdLAEVilZDn5JXEZ0lPob5kpAtHeE=;
        b=kQOWLObU1uwWzaIJhJwl16p8d9tgxleaoCXNjCmaq1DpjzCmnd03sdRUjCRfF4wM/I
         HMJK8QuNmH8AXEcsCFvaGk14MXniN93aK8eF1lUNoaxv6V2RJy/25ojzqqsjYLRw9qRf
         HoVzaoMC1I0/bZi/SS4aM97XoQ5r0FpMhLIAlky9vcM3wjft5munnGVql5sScW/xgvwk
         Hcu2ea7qrWIzMzV/bXZoywAVvJaCSPiqwIfP0uwcrh0U297bbQhuPtIxfyy9rVGFzm9+
         LCyMGgCe+dLV8vJlCRMkGY5+jWoz7Zkd0jspvdzBuss3LDDuFtO8HgldLM4NNlZo45x+
         FYtw==
X-Forwarded-Encrypted: i=1; AJvYcCXznwU+OS2JDer5e3B1KRp9qGP9w5UjMEonWl8ZM/MVS+Nk72CXrvvyMCiVmxGQOONl9o2AwJ1hFSc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyph1Y+bM3jFBoxYxWMpAfZK0iTJHGxSJ4vNsXZJri88ljPdzfc
	6jwcRVbqE5hdcFL7cGaOp9yqfy24qAiLc8UzOCVwBwWGCsRuLsva5wQn8WS0RzoNLaGl0y/z2us
	hOaJJEQ==
X-Google-Smtp-Source: AGHT+IHrgMj/I7ewzUlfQ+tAFdK6lsLgX95aSaFSACakL6kqrbRRIQLYFBi7WQqIgbhinM2CjM73dUzXSCk=
X-Received: from plblk8.prod.google.com ([2002:a17:903:8c8:b0:269:96fe:32ad])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e88d:b0:272:f9c3:31f7
 with SMTP id d9443c01a7336-27ed4a5e907mr193803585ad.50.1759195473033; Mon, 29
 Sep 2025 18:24:33 -0700 (PDT)
Date: Tue, 30 Sep 2025 01:23:48 +0000
In-Reply-To: <20250930012352.413066-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250930012352.413066-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.570.gb178f27e6d-goog
Message-ID: <20250930012352.413066-4-jthies@google.com>
Subject: [PATCH v1 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is defined
 in OF or ACPI
From: Jameson Thies <jthies@google.com>
To: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	robh@kernel.org, bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	ukaszb@chromium.org, tzungbi@kernel.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

On devices with a UCSI PPM in the EC, check for cros_ec_ucsi to be
defined in the OF device tree or an ACPI node. If it is defined by
either OF or ACPI, it does not need to be added as a subdevice of
cros_ec_dev.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/mfd/cros_ec_dev.c | 40 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index dc80a272726b..b0523f6541d2 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2014 Google, Inc.
  */
 
+#include <linux/acpi.h>
 #include <linux/dmi.h>
 #include <linux/kconfig.h>
 #include <linux/mfd/core.h>
@@ -131,11 +132,6 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_ec_rtc_cells,
 		.num_cells	= ARRAY_SIZE(cros_ec_rtc_cells),
 	},
-	{
-		.id		= EC_FEATURE_UCSI_PPM,
-		.mfd_cells	= cros_ec_ucsi_cells,
-		.num_cells	= ARRAY_SIZE(cros_ec_ucsi_cells),
-	},
 	{
 		.id		= EC_FEATURE_HANG_DETECT,
 		.mfd_cells	= cros_ec_wdt_cells,
@@ -177,6 +173,16 @@ static const struct mfd_cell cros_ec_vbc_cells[] = {
 	{ .name = "cros-ec-vbc", }
 };
 
+static int ucsi_acpi_match(struct device *dev, const void *data)
+{
+	struct acpi_device_id ucsi_acpi_device_ids[] = {
+		{ "GOOG0021", 0 },
+		{"", 0},
+	};
+	return !!acpi_match_device(ucsi_acpi_device_ids, dev);
+}
+
+
 static void cros_ec_class_release(struct device *dev)
 {
 	kfree(to_cros_ec_dev(dev));
@@ -264,6 +270,30 @@ static int ec_device_probe(struct platform_device *pdev)
 		}
 	}
 
+	/*
+	 * FW nodes can load cros_ec_ucsi, but early PDC devices did not define
+	 * the required nodes. On PDC systems without FW nodes for cros_ec_ucsi,
+	 * the driver should be added as an mfd subdevice.
+	 */
+	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
+	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM)) {
+		struct device *acpi_dev = device_find_child(ec->ec_dev->dev,
+							    NULL,
+							    ucsi_acpi_match);
+
+		if (!!acpi_dev) {
+			put_device(acpi_dev);
+		} else if (!of_find_compatible_node(NULL, NULL,
+						    "google,cros-ec-ucsi")) {
+			retval = mfd_add_hotplug_devices(
+				ec->dev, cros_ec_ucsi_cells,
+				ARRAY_SIZE(cros_ec_ucsi_cells));
+			if (retval)
+				dev_warn(ec->dev,
+				    "failed to add cros_ec_ucsi: %d\n", retval);
+		}
+	}
+
 	/*
 	 * UCSI provides power supply information so we don't need to separately
 	 * load the cros_usbpd_charger driver.
-- 
2.51.0.570.gb178f27e6d-goog


