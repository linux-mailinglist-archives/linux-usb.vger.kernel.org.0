Return-Path: <linux-usb+bounces-29247-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A54BD62BF
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 22:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 312E5420EF3
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 20:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D945E30BF5D;
	Mon, 13 Oct 2025 20:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bMO52PQz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3478830EF81
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 20:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760387663; cv=none; b=OTnpiHuAkUNKD0noXvl9hsWJciZYyXVEBUR7lEJRZmKV4R5cSPDxgGT9xrEVnUogiSYMGC0QekdBAwHO4dG1mL+gp0egMgc7TVem5cgrj1D9t5lDRhEBQaC1GR1XGuZkDl2nDiDOwLqk+kZoA5jctS0bOY5S+56GgoLHajD+uNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760387663; c=relaxed/simple;
	bh=R1YnFh8aXUGKuVVtnPClepvt/LVUGJ/UtnMqEulZIYo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dUFwHb6GPtDWxiW4cSGWH83XoGLQx+kpy60zRVKn3U6qN3UD7tiFBI7uUMpySaT2tey78u33q0psgn7JVMX3GnI3WlilJS6ifs9j2Oa0J7MC9uqpAQnpDJgocswqeMQpKDEktLmO9BjtFJT+jQvqEsPqWIFw/mii02resk4l0y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bMO52PQz; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-78144a8c310so8716017b3.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 13:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760387660; x=1760992460; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GFnB74J1pAvDm1nl6YVxkFp2KLUlGXZiPBf1NrkOorI=;
        b=bMO52PQzI4F9dPx84r//NPWVXxaBOt65XYRWH9LDhdRM7bXFtZStQCFKaejRJhfSlS
         OQr9g6hDIBxLYdnioYiARYTbaxVzMeBwdhU7ELfWZMgScGo2JrGUCwXWky8qDrcDaBPU
         SnCMo5/9alVda50NLSfhgeblc94Nb4NkQSO8rzGm+CZ5gldUd04tQp/WMU4+hYyC9Rha
         MoWgdQsvzv6eEzhFeqahauHedOUl9E8y/T7WtB2jbbYcUpqo92hJssxkD6zG2ZnfXccf
         YuUH5Q98qKN6joDtJ3EwZ3w/f5xDidnCDT40rTwBvJ6nrP5mYhT6rDbPYqrkF99cJvhU
         YbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760387660; x=1760992460;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GFnB74J1pAvDm1nl6YVxkFp2KLUlGXZiPBf1NrkOorI=;
        b=AwoBapPuuMUk70RSzyBtVqpsOdfQfVAwaH95rRmGBNgOb+NrpnVxb9Mdv2IQJni7gg
         Hg5gt1Vosj2ZLKhVA9Q096YtFLKaWIP0vvgw/3woWdyrQj6X3806xu7a63fUQX3c7WeW
         nMwevb8cLswVPHoOIhrYHsIDnIKkEzldTxpTaB8O41e78MDqGULJGXuffzEWXSjoz2Lv
         b/Gg2OhE/56qo91eeGLkbkNoC59mJz7CEyi06BDWEhLaJbilFWHu02//aaQnWPKIVr2Z
         4iM8wqw0yb/vwvPkhMO9KladF+Wo3xBqlIYdiD6PYCmkNoy2oNquE83e0Snb275ETHhC
         FEug==
X-Forwarded-Encrypted: i=1; AJvYcCW19fhSIqw8vdNh0aA9ROcmbTwucUocyGT5iZZJ9xRGbZY6w6adJUf/SPxo5WHNzw17+3nS91FpFhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrlbZ9d8DirvzlENYW2hHa2QRhwPsdM/Zy/Fes62cbnjjKs+7l
	RIsKCadBLRcDrGJgFQLN+kO6Cd7IasGAG6vM+yTXJ4EnEiHN679+86ZutStC4ZX4KHm2ZAbKbCr
	QksU7FQ==
X-Google-Smtp-Source: AGHT+IEjUm82raEjN7d+M3tvikmOo78EaMWdJ4VaMRN5Im1/+9AxanQNq/18YLWj74gbMAzsjUUto92DYFo=
X-Received: from ywbjh10.prod.google.com ([2002:a05:690c:710a:b0:780:e432:6fc7])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690c:7487:b0:781:64f:3145
 with SMTP id 00721157ae682-781064f72ecmr131650497b3.67.1760387660244; Mon, 13
 Oct 2025 13:34:20 -0700 (PDT)
Date: Mon, 13 Oct 2025 20:33:27 +0000
In-Reply-To: <20251013203331.398517-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251013203331.398517-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251013203331.398517-4-jthies@google.com>
Subject: [PATCH v4 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is defined
 in OF or ACPI
From: Jameson Thies <jthies@google.com>
To: dmitry.baryshkov@oss.qualcomm.com, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, krzk+dt@kernel.org, robh@kernel.org, 
	bleung@chromium.org, heikki.krogerus@linux.intel.com, ukaszb@chromium.org, 
	tzungbi@kernel.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

On devices with a UCSI PPM in the EC, check for cros_ec_ucsi to be
defined in the OF device tree or an ACPI node. If it is defined by
either OF or ACPI, it does not need to be added as a subdevice of
cros_ec_dev mfd. cros_ec_ucsi will load from the OF or ACPI node.

Signed-off-by: Jameson Thies <jthies@google.com>
Reviewed-by: Benson Leung <bleung@chromium.org>
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
2.51.0.858.gf9c4a03a3a-goog


