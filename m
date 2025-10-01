Return-Path: <linux-usb+bounces-28846-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D63D9BB19E3
	for <lists+linux-usb@lfdr.de>; Wed, 01 Oct 2025 21:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0832516C852
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 19:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94AED3019C4;
	Wed,  1 Oct 2025 19:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WldEHZah"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAF1284B33
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 19:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759347245; cv=none; b=VWE/8H/iq+R/rQRG3SGksinPk+rg5368h+qLuTm/y0A7gsZmAL25ghx21PsUCWntMX2nRVNod1EwXbf0z7cIYiG7Prj6ZLMBsL9MTG6gNyYgDPPb5BP2gb2ayWhBrYdSR2qqsoKsq3E0pkK9Ks+Bj7xfs/7JMlKQ1uX9rxdAO7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759347245; c=relaxed/simple;
	bh=hjVBX5JMtGNkNIWN8eSwy2vTEb4tpKAWKxH7zqEEOj4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=djQnJCvgogXYLN8ymFVKfBgoebIO1mS33DfaEqvHEHTD/1VKXXqSYkCYcW2+xgCg/KPA2D49f5kWY2e62hK4Z83mN6XlVbCZBY99/52XJ8LePE9p5944XtNote1bAUG7QQVYperFhUaliAZo4NP+DTOfxyyx4xlyk1S4FCaNYKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WldEHZah; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-286a252bfbfso2801945ad.3
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 12:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759347243; x=1759952043; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uUFn2s+3Cx+wxXVgN5taoVqNZX8a68N/oLppB9MWElo=;
        b=WldEHZahpVyAApuvqtQGaXjXeyXFkUHxvKaxEZZHiXkF6icrwM12MVi8ZVTGwrzCNJ
         9QNIHaKiTqlZZOaYrjMf2lk8kmF5rw2JpGnKsbYxk54fUoBbhb3Ftkxf3ZtAwu44X1S1
         dJTYKe0+J8ASmVC5Rl2rVDb19HVP3tC7VwwwWUZbSfIwnu4EHkLlQluJCjDBiT5NfJbB
         sbHNwM0c+7JC6QufjpNoGRgg5uHi8jZFwrQCcesp3+JbHUne2mbTDDIQBcm1qX6Md+vw
         8Vfjt9uAUzy3JSiemMiC5DtEmUmoCVcTvAyPQI5TPdh+ya0VR68hD12c1a5HnUglMqhv
         iWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759347243; x=1759952043;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uUFn2s+3Cx+wxXVgN5taoVqNZX8a68N/oLppB9MWElo=;
        b=CcvS7NRMBPzJSHpDKFrOxC+fQ+d8HunZeNQv0ox7zhMVe/l+CejBXOph1G02jKRV38
         NL2VU+pgkJ72PzLlJP93L/9BrkrRtEGZuDGyE1dKlBXXYJl/BVfTkwVfVuGJdMByrPIQ
         MUfsVci+/bZatWAdEbs0SA9ZVPf+muyDRUzeXSS6PM0QhO5Hyv3kks5mGIzCIDerBOVk
         D0wrhkSkuAa/gHIXvWB8ZLwiCGxPB5YlconYgCf1rsjyEESD/bJF8q01SHOTovWXJGbV
         QxkhTI67+WxLTEWCiskes4RvdMUXbpMNeOTvTywFD+3NDGQ8vufxwMStRGva1IetEAmF
         OwuA==
X-Forwarded-Encrypted: i=1; AJvYcCVufuqlVlwPVwpzoOmVYQCpXe7hCYzC/3gF3SSmmD2zilqgCHvIdpecLnNL+Q+OMhhbVJZdv7fzaF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvbsSpdImwF2AqyxTvug9NoH2V8g88RqWZTji9IwbW/fkKHaiK
	t571ctg83dgtBS5bq6i5+STWHIAd1QbPnmmBR/4PwlOYfzbkuAgL2JnvvOZXoBEx2diF2u/yfTL
	YGf/ViA==
X-Google-Smtp-Source: AGHT+IEuxbvUY4/T7dbFkwsFtVOPEwyefNF8rTwItwF8+xb481LkR2wSDNCKWoFQXCU9ZimIwrDCqEO8hzo=
X-Received: from plkp3.prod.google.com ([2002:a17:902:6b83:b0:27e:ec80:30c6])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19e3:b0:26a:8171:dafa
 with SMTP id d9443c01a7336-28e7f2c5848mr68118035ad.21.1759347243022; Wed, 01
 Oct 2025 12:34:03 -0700 (PDT)
Date: Wed,  1 Oct 2025 19:33:43 +0000
In-Reply-To: <20251001193346.1724998-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251001193346.1724998-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001193346.1724998-4-jthies@google.com>
Subject: [PATCH v2 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is defined
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
2.51.0.618.g983fd99d29-goog


