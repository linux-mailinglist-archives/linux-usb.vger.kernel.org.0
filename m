Return-Path: <linux-usb+bounces-30525-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FE5C5EE91
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 19:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B14184E250A
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 18:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A5B2DC338;
	Fri, 14 Nov 2025 18:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Av+w+qI7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742512DBF5E
	for <linux-usb@vger.kernel.org>; Fri, 14 Nov 2025 18:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763145489; cv=none; b=gxIhH3iZ8BFEGekZdsabbSMjpBZEJiYVNA38V9wIiy0UYjycBUGNVizQuZS5QCWDNEQNdVka7eOHA4xNglpOVfQKqn/qayjee06hL+vqfuFI3qi9xUOustQQULLIMKybxpqDZrUswmZEY10N7XSJEJW4eDmEQq7fK5lC67FFjGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763145489; c=relaxed/simple;
	bh=KN1iUY3pMbpi96LU6FxJ+gNz1p0HdFSZucMgccIckK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TpkLMCOrrSltvgzipEibjzlvfSjNVKmG7uXr9XVa+niEb95KgrVup/fLQSv2sMnfsf7g2F4Ytp9iKAKHTS3wbqY1u1YW3jNjyroeNPzl9Nt/lUfx2rmVz8rDuPpb2U+ndNNmw34Zl8ZkzhFLl/OmwavA4QXLOWBBVfBAoZCpi7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Av+w+qI7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477632d45c9so17796795e9.2
        for <linux-usb@vger.kernel.org>; Fri, 14 Nov 2025 10:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763145485; x=1763750285; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wdQW0c/GxIV3qmXtgKGGNXagb1YyKxNf2gm2aS/eVQo=;
        b=Av+w+qI7/4zbijbc/ThPP1AW9icILtxUHmGfan0xzOFMfWkzJkozqBB6j5Tf2/3c21
         yQC0uv5iUCH1N7fV7Vg18y1TdRVDVRw8fS6lZ9qwPRam6wQOESZ4yfvysBRSIntDgG3J
         f4UtRXgz9C7RQxgTzivGBPrN29A0gtmaZjB4VcecJP5UeJXKB5r9RSpcvmHvtx8Eguoi
         +tWqKuIT6DpSNp81pbEaTUnYBjhdVWxlonFLbUAn7VMhQF1entxPnUId0qpqQ8acfpZr
         SJEtsfJ0lHJV6u7Bv47v8Pl54EPL+tqu9X1ZSJvhAWvIvXqu6unu+gdfzu2WluMu643W
         WbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763145485; x=1763750285;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdQW0c/GxIV3qmXtgKGGNXagb1YyKxNf2gm2aS/eVQo=;
        b=anTlT0takBwsqvhb3/Rvb1dOsQ2we601SOm6sPkAPGiZhc6ei4L5Ypgpm6QcSR4m+H
         UG20PH9hUbm6+jIo0PcJ6KgSI+bEYfeEmvSsh7EcS8dcapQOwQyD6Y8KURV4sdV4gQv1
         v4MSxssJlXROTTUMxzR8jFvk2aPzU0Lj7Y1cQ5P8oblUrCNgdX/QpDQsuDyaicwltCZn
         O+Tm6H6wvxnIWseO/AguJOgap05ziBS2wlcok0xRY/9UgSFu1fvefZjh6UyDUqaNLPHi
         HAW0PqAXgmP9P4FuBboAsYbFs82YA0/hzNQmGYd1l8HMUjE7HCJaL8heMmASLp/z4Bpq
         h3hw==
X-Forwarded-Encrypted: i=1; AJvYcCVYi3eQxI6IGJ0HUpkOxzg40vb4+yU+x8myORq7L+XNcJqR+kXka5Kfjp2nYYL2jyytSchzY2yI640=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd7XGuA2gMAMsbk2RVaAw5m6sdwuDkgdy7fIoijS6RJu6qYpvR
	qHoDfjCLwq/u6LmS+xXDUSEWG3zOCZuxWWv4w5C15xB75dKhO8xIKYcijAlon0Pko+grKYmAldA
	AF3UorjvYzg==
X-Gm-Gg: ASbGncva5GzZ94Br11UWhEujz+oCs2O6tGUivFxjPI1ZR/mKh6yCVlqf27LI5z5C1Cd
	Sfqjv/HX7xWH6b6C/hxUQe2iZeXgdEAtXmRC5iqt5qfMsskXRIp7Xp0C06sUbG7R91CmRvTDHCX
	H2TnZbcqMYlAcLAlXq4NklDS/NRnhLo8OPfols3W5ppxKaGCW0ScXWFcpbztP++sUvVK4V+UKrh
	kUt2/X+LP9JKJSRO7Yd8rc5BnmraAe7talLjIm3h7uGYrn3nVW+/5myMH2+LSvCn1CIfjNwsC6X
	tCqGJMAu9P7aOfuK2Yq2Jvk/4F6Kzyh9Ik6gg1Tu2DHJF2vs/sG1O441OWhmYU3TCG7Dz6kmDkm
	OCqG+F/YB9LXbv1uow6hDSgswoLfFq9iv5r8uOAsWgYMYOCWrBwlL2J//jr1v7HyXtouywOTUcu
	JnHRToog==
X-Google-Smtp-Source: AGHT+IFkbJsEQRTFKF+Dc2WMQ8aon51S9SwbwvC464IC1v6W8sViuH5i3J0Rf/dkNCtQsQogWnhqeQ==
X-Received: by 2002:a05:600c:1f87:b0:471:1435:b0ea with SMTP id 5b1f17b1804b1-4778fe795b0mr38730085e9.24.1763145484789;
        Fri, 14 Nov 2025 10:38:04 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:326d:9344:48bd:e2fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477969b3c12sm3968975e9.13.2025.11.14.10.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 10:38:04 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 14 Nov 2025 19:37:55 +0100
Subject: [PATCH] usb: ohci-da8xx: remove unused platform data
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-davinci-usb-v1-1-737380353a74@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAJ3F2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0MT3ZTEssy85Ezd0uIk3UQzsySjJEtzS4u0ZCWgjoKi1LTMCrBp0bG
 1tQCeoKAjXQAAAA==
X-Change-ID: 20251114-davinci-usb-a66b2b9798fc
To: Alan Stern <stern@rowland.harvard.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3089;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZnhmZKz1F4Gj8HQooc0oTKmhGP7//dBQbhluvebYA2w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpF3cIZvfFPE4lo6tX82drxHzM0+PE15T5phswt
 naMuHGSJKqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRd3CAAKCRAFnS7L/zaE
 wzmkEACwEhsN2gU1twPprcHx0hX9Vz5ovE2E384ww+AqPgAQKpOdHBFFZxzApigpqJ1ArO7MOE8
 YvtkSE3dNHvNN1wPHmbKMsuaf96e2MxTasCgXairD4gZCHXIr07kZj3Xb9mGrQ+52/hb9xhJZB+
 XIz3/1kKW7Vh8yOTmL4kUTgwVFpTw+YXjYuSz4pRTswCm+dhbNjFmFrZKBh0zkg3U1f+rGygyJ1
 MM3ZNfSsknZ9ZRv8drCKsYVV6j5zwVzhFX6XhRDHHPF8COCF1FOQykqdW/6SWDJv72kQxv5x4Ma
 SP0xqOpvBCXDYuZCSu26+VLhQFz1Cb53C1l4kmYk2UcMUvjnKhH0rJExi1A8uvL/xanNwajhZWt
 zJyWPlPZBirJRhHncgoN7LcuLWTLjGQPBAM/EIKf5JiMugwROg4qJKaCYGfLhP6nrunAJX1yz3U
 HwCKONyFZif/UFIgj74Gnk1dou5n7GzCnh4iTF1q+DIPY8obtaLq63CKCW+26wXfVECQtHaqwZv
 of0BreiBcCYZ/8xuq88Ptkhg0WNTIxxh7deoUDAssIx4ODDf9kNZFXi5RH5pCGn2WYFVeztS30T
 Lul9KfwjjT8NQq1wWIgQrc2atzQ5hQ1II0mwCK6PQ2S1KxK7nlBKm38f6iBixWRyAA6h92FxvKi
 Sts5+fXy7tCX7Ow==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support any board files for DaVinci in mainline and so
struct da8xx_ohci_root_hub is no longer used. Remove it together with
all the code it's used for.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/usb/host/ohci-da8xx.c             | 17 -----------------
 include/linux/platform_data/usb-davinci.h | 22 ----------------------
 2 files changed, 39 deletions(-)

diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
index 3c5ca2d7c92ed786af41d98ed124926ae06d4025..0938c0e7a8b6d54cf1981298119d51a3bfe49148 100644
--- a/drivers/usb/host/ohci-da8xx.c
+++ b/drivers/usb/host/ohci-da8xx.c
@@ -18,7 +18,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
-#include <linux/platform_data/usb-davinci.h>
 #include <linux/regulator/consumer.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
@@ -166,17 +165,6 @@ static int ohci_da8xx_has_oci(struct usb_hcd *hcd)
 	return 0;
 }
 
-static int ohci_da8xx_has_potpgt(struct usb_hcd *hcd)
-{
-	struct device *dev		= hcd->self.controller;
-	struct da8xx_ohci_root_hub *hub	= dev_get_platdata(dev);
-
-	if (hub && hub->potpgt)
-		return 1;
-
-	return 0;
-}
-
 static int ohci_da8xx_regulator_event(struct notifier_block *nb,
 				unsigned long event, void *data)
 {
@@ -228,7 +216,6 @@ static int ohci_da8xx_register_notify(struct usb_hcd *hcd)
 static int ohci_da8xx_reset(struct usb_hcd *hcd)
 {
 	struct device *dev		= hcd->self.controller;
-	struct da8xx_ohci_root_hub *hub	= dev_get_platdata(dev);
 	struct ohci_hcd	*ohci		= hcd_to_ohci(hcd);
 	int result;
 	u32 rh_a;
@@ -266,10 +253,6 @@ static int ohci_da8xx_reset(struct usb_hcd *hcd)
 		rh_a &= ~RH_A_NOCP;
 		rh_a |=  RH_A_OCPM;
 	}
-	if (ohci_da8xx_has_potpgt(hcd)) {
-		rh_a &= ~RH_A_POTPGT;
-		rh_a |= hub->potpgt << 24;
-	}
 	ohci_writel(ohci, rh_a, &ohci->regs->roothub.a);
 
 	return result;
diff --git a/include/linux/platform_data/usb-davinci.h b/include/linux/platform_data/usb-davinci.h
deleted file mode 100644
index 879f5c78b91a30fb05681668797a5f07c6bf43b9..0000000000000000000000000000000000000000
--- a/include/linux/platform_data/usb-davinci.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/*
- * USB related definitions
- *
- * Copyright (C) 2009 MontaVista Software, Inc. <source@mvista.com>
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
- */
-
-#ifndef __ASM_ARCH_USB_H
-#define __ASM_ARCH_USB_H
-
-/* Passed as the platform data to the OHCI driver */
-struct	da8xx_ohci_root_hub {
-	/* Time from power on to power good (in 2 ms units) */
-	u8	potpgt;
-};
-
-void davinci_setup_usb(unsigned mA, unsigned potpgt_ms);
-
-#endif	/* ifndef __ASM_ARCH_USB_H */

---
base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
change-id: 20251114-davinci-usb-a66b2b9798fc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


