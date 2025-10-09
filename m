Return-Path: <linux-usb+bounces-29063-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BDFBC70AF
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 03:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4445189EB6E
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 01:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDEE19F464;
	Thu,  9 Oct 2025 01:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DUtQdUQ/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202D7176AC8
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 01:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759971804; cv=none; b=emha6x4S8VLc/fiKOQS/ZPwYpEMyhv/VA42kRIhHt2GkR/pKkA7290wx9TIS/y9Hw2DmiccMr0s5y5F36lfouqpteBaTLDy1aRUyfHk2kIQ7OPh2aabWc1NQRX+hNLx2akRLR/lHjWuFl26U73UjL0RAgw2LsFu3u0Vl+qMucAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759971804; c=relaxed/simple;
	bh=00pwX8rLB5k8Lb3COtxEncyyDckCIf4Wtb9DdeVqR3Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LK9/weTWVluREXye1N6yFMODSfsHe3u0e4/DfoNg7kd5xDQnHwKtGOgV3NKdjgcz67fbNiliYK4zy+gthaGXIJ8/VEr0RYHVVX+YQpA3+WR2IsNjtiNiyCHxBMLE7Npaumht4dPmsn+dm7PB8f5Jtf3buc2f30GBVWUuLvSt7eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DUtQdUQ/; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-3c134c93f63so1207029fac.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 18:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759971802; x=1760576602; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kCeRiv6OyS5ejnolBPMxDl1i4JKGbiO+/woSsXQ2sg0=;
        b=DUtQdUQ/KdrO3VMrApaSW5GRZJsnbHPigjWw5EYvd8qpxISNbqxCl+bYLTpVYDWRiE
         835bSiCZwOWJojPkizxRHGEGYzeAP6FQ7onghHkvLJ4SZYjrpriPhYMOJLsvhE1IwWU4
         UvUXsIG+Xm4RQ4ArONKMsEF/icJcpIN5p2nENXLUmkqQGuo7zngW/W5q80GJ1syF6v28
         q/VJk97izsVHNgAQqvlaWXGuiOP88I20yCdNADSq/OPHKn4MAxdE2Rm2v2v0lxN+DAv6
         ecoqOHMOMLCOl/1jjbYDA8+chSch+mz8WP5lCZOkNMIQz1zUpLt1oJPvYwb2r/hGnCBS
         fN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759971802; x=1760576602;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kCeRiv6OyS5ejnolBPMxDl1i4JKGbiO+/woSsXQ2sg0=;
        b=GMfzH5AJe/ceItHNV/IFMK8AuVQFr7pdO1fivJJLJF1nAzJ+Q+hV89QKakddiw8uy2
         thtztGdaN5hl6hx753IBO4ZetKlmhylmNJmBSDHBoBtdKt5ccMFyX7Jhhio9Zm6fmWKw
         eZ+x3e3ro7X6geVZ+spePI0uVxzRDqhpQhk0N6V7lZoK0Vsu1XR1yTCYK1rEyw8kWAqO
         YTgMpL5ih+OlTEK8GYjTGzoqJypmCiEvqfRGZm4OAjzo3yK3hz638fvPEdimKLczm40S
         CrCzC4FSLNgZbilO23ffmhqbI6sYhaZwHuOMyJrIyo+nmi4xoD/1CnQ3V3Bq6E4nbY3Z
         OSjw==
X-Forwarded-Encrypted: i=1; AJvYcCVfeTV8BNI6BSR0p6bTuimgrc4D/jJKkoGmSJCovhYG6Fp6fk+ecGqzwWP0b+HtqHATX+60V4fOtVs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3aZrsA7Ckaxpy9h1FHIPnbJwbLb2h5369jAdcmKERcpRWUEOj
	nVRLo14AZ8I62nO9cNdhdEN3S361AfncE0SivP6/wnSClUfQfuR6V2xmue5n0do0FCroqOflO9q
	EO4h9FQ==
X-Google-Smtp-Source: AGHT+IF0qbDcxH3MGVrqr+Rn2sXSBv3+09P7txZ+7QoM8RfbyeoIQUaC8Byu4yqvRximfoLKLV3kORtUsFI=
X-Received: from oabyy48.prod.google.com ([2002:a05:6871:25b0:b0:34b:1c16:5c46])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:e992:b0:3b1:8e5d:d42a
 with SMTP id 586e51a60fabf-3c0fb72a8famr2648272fac.49.1759971802265; Wed, 08
 Oct 2025 18:03:22 -0700 (PDT)
Date: Thu,  9 Oct 2025 01:03:08 +0000
In-Reply-To: <20251009010312.2203812-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251009010312.2203812-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251009010312.2203812-4-jthies@google.com>
Subject: [PATCH v3 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is defined
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
 drivers/mfd/cros_ec_dev.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index dc80a272726b..1928c2ea2b8f 100644
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
@@ -264,6 +260,23 @@ static int ec_device_probe(struct platform_device *pdev)
 		}
 	}
 
+	/*
+	 * FW nodes can load cros_ec_ucsi, but early PDC devices did not define
+	 * the required nodes. On PDC systems without FW nodes for cros_ec_ucsi,
+	 * the driver should be added as an mfd subdevice.
+	 */
+	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
+	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&
+	    !acpi_dev_found("GOOG0021") &&
+	    !of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi")) {
+		retval = mfd_add_hotplug_devices(ec->dev,
+						 cros_ec_ucsi_cells,
+						 ARRAY_SIZE(cros_ec_ucsi_cells));
+
+		if (retval)
+			dev_warn(ec->dev, "failed to add cros_ec_ucsi: %d\n", retval);
+	}
+
 	/*
 	 * UCSI provides power supply information so we don't need to separately
 	 * load the cros_usbpd_charger driver.
-- 
2.51.0.710.ga91ca5db03-goog


