Return-Path: <linux-usb+bounces-19350-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CE3A111AE
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 21:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6509B3A821F
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 20:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A67520F06E;
	Tue, 14 Jan 2025 20:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nI5KfqqV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8D120DD42
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 20:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736885157; cv=none; b=jBztIbOMosg1BWyQZJiJtht2lC3czv7RI4bmHl2R7xZLUI+JVLH6wpsk9Cv9AF6EaYBxPkE273/pf+8AiI0PKsTEAjpGHFREhzBX8rtbKV4aGvw3GgRvUEeaXlKgoBdnIglYCfNQPMVOULq2u1nhmcJbgw1g8e9etDWdyt1KiuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736885157; c=relaxed/simple;
	bh=U9HpxC9pEH0EWD9Q/rURtR7vQ0PaHWPP6MGt75vQgGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DQbIjPaRWYWOh+uOsz9Dx5dii3VOh6ObAMMgSXTriWdmIXjReNqdbPMvBPGz2CBfsym+Ml4apkyNE5Yb2N41FLb9E8LR9++t8PFyBLWDw/fYBLjY57YqBtTvl4gt6UoLPwN3eYeVnX2VGdHecvC09m8AmgoJiftnM1hRAXmgS4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nI5KfqqV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so7442765e9.3
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 12:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736885154; x=1737489954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nu6/XX3P+UDLqPCZUwHTSPpolsKgeM4I+r25no45AIw=;
        b=nI5KfqqVyKqxpIFkLPKRy6IQiWtS2WnJd9vp48Hkbihk5dyqoPsf8TXo8xiN13MZtA
         82qtxXljqDyfLyODuqW2+vjsOtb3HlJtJHliDRPNigje+XLGIRBdII4Sz/8tMM2uwW8Y
         o9flK+kFu3XUzFy6fMyCMnmiI+3zZTG4xmo2GfG96Sx3BfgMh7e0xl6vKCPM8e/m1qF3
         31f2UTpVnhGExsBhHe9kbfJ0uHWpaz8ODkJPYMuuqS4SpiOQplrxrN/3aMZcoV0L3HRf
         kj2xK42yfr1te0e3/TUNaGSIXOP4fYQFF3PAKYoTwLhJyvB2KaV6yw+SxoRCxaIFE0+c
         zDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736885154; x=1737489954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nu6/XX3P+UDLqPCZUwHTSPpolsKgeM4I+r25no45AIw=;
        b=bWCJ67TPPwt3OiCZspJfecDrYhZsL4xYJ6OaRns8NDxrwb/ARsfV6X625Cs0csjhw9
         uXaX7lXRXmpqB04oMNtwOelM1scIBXv69KY6wJuR+f9ViAnpJJTtntGNvA34EMLB0a8u
         MmwHWEdu46+AGctLoxwCL3VrgNxekRy1gtBMyoWaxZaJv5gOSjuJDU6qzStHkU7Zjk+B
         5TWKgDQ7BUGCG/b3PY/NfBu0j6ucvvjI7Qc7j74RS3gb4QBstWurSJw1Egy3a3OaZXQq
         ImBbHlKrT2CXdEeMM1TS9s+csLmxib0Tq3mRYekoI987MVEuNy7GkbeGV+a8V5HaGIhP
         D68w==
X-Gm-Message-State: AOJu0Yx2ZxqMA6JceBQkBWmOg4MiLn12LjfQ0jRBWIrVydU2yd4JOz4K
	KAM/FYFbghEO4bZh2q5imFQIFzaaBoM0tS/oDDPj2O0ZEiEl6wV3PFd9gnlkO0yV3mKJjrM+DUK
	O
X-Gm-Gg: ASbGnctwdUqcGlr4r7nwLVn4yImSx+QFcTJFaRqhyUDlHyRn4CGkDTz559OvGHg8aSy
	RJ4GJcfhatQ3hMedGrcmT5rEhaYq4pEbqqnGdTH4CduTAyri4Gk5ep9mTdVMZNbmL4A7TSQVYNt
	rSERKxgrvVHpQGB7IyRLt7JeXGb0WExzT+wsW6jl1r2T5ItgwdHgswmv5/uLYHyvy6wL1/+lkNN
	zEMp3zHU2vH6EiDZDjhKNsxnvcYGycJcg5jTE37R1oP8ATCj9UdL/NN7P4neW5aS12vdEla
X-Google-Smtp-Source: AGHT+IGBhkeOheEjYD/B1unZiV+4XE8yV1wVFVbnVs8thkNOHSXe8ezrHomgdhQRKHJpnJtTQ3WDig==
X-Received: by 2002:a05:600c:3ca0:b0:436:17f4:9b3b with SMTP id 5b1f17b1804b1-436e270729bmr101202205e9.6.1736885154241;
        Tue, 14 Jan 2025 12:05:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dc8802sm184622025e9.10.2025.01.14.12.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:05:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 14 Jan 2025 21:05:37 +0100
Subject: [PATCH 4/6] USB: phy: Use str_enable_disable-like helpers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-str-enable-disable-usb-v1-4-c8405df47c19@linaro.org>
References: <20250114-str-enable-disable-usb-v1-0-c8405df47c19@linaro.org>
In-Reply-To: <20250114-str-enable-disable-usb-v1-0-c8405df47c19@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Peter Chen <peter.chen@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb-storage@lists.one-eyed-alien.net, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3021;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=U9HpxC9pEH0EWD9Q/rURtR7vQ0PaHWPP6MGt75vQgGI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnhsOTPwA/vm8owUe4EJZse5Hr4rjlTRWXCB2aG
 KDucAG0092JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4bDkwAKCRDBN2bmhouD
 11++EACY8+eR+j3tvSf+ncTv3YQsKVEU2LFwS6tJbJCtwQQAxxSlEHMS38SL3z3TjXBKaWCJhHe
 I7Wvb5qUM66zzBAbOq8HxnfInql3Vuh/7o3+qBSmnjj6JgFZ/1miQRUPjTBxVUniz4H5z5WF2Ur
 p0mIfk1MqxGLV+dZkzanl6GwmamqQsRP5GR2zluh77lUmb0fJ5/Tw7tZ/8WsY463w19lqZYAsrW
 tLWR+TfRKuVvJORSgxABSxAxsOyQehKbiTPVW+VpOwBLfiydGkmRbLqNawdvPeW1KM0YM7eeS1o
 YeW+dujSWP10wXtF7/B4bM8bXByrPxuCgMyRxo3i+3prm7sQ+CBmse57sSPb7pLwwiI8VtSSnzX
 xyA7aQk6X1trGVNnAvFX7UiiPlWQwU4czybDh27fiLvixBADIsU2xvgIuXDU+fuqXzrs25j0YzY
 ZpozRJLPjCAAVQ4zmJmNNDgjsRRw5CJgkXFK+/XiAxmaPOMs7bwnj4WqXEkgDkZ9e1LTL9UL8EQ
 nLugIwjUe9M/Q6inM/mdBXLYQCIqgxBMEyEQiC5DZeC9KvXDrIKDxjq/b9be9+DmL+cj2S2BeG4
 GIzWLaWePDlxjuY18oKvhroo/E9Nm09ltQk+dxiRCzEMz+rSSypXWNGBbna5xt3VfZx8P3Nc23P
 hytQ2OSgUK9arkw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/phy/phy-fsl-usb.c | 3 ++-
 drivers/usb/phy/phy-mv-usb.c  | 3 ++-
 drivers/usb/phy/phy-tahvo.c   | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
index 42c42e1932326c66c842f03b8060af2909a50aa0..40ac68e52cee73d168960e3588a4a0d87a88e1c1 100644
--- a/drivers/usb/phy/phy-fsl-usb.c
+++ b/drivers/usb/phy/phy-fsl-usb.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/proc_fs.h>
 #include <linux/errno.h>
 #include <linux/interrupt.h>
@@ -529,7 +530,7 @@ int fsl_otg_start_gadget(struct otg_fsm *fsm, int on)
 	if (!otg->gadget || !otg->gadget->dev.parent)
 		return -ENODEV;
 
-	VDBG("gadget %s\n", on ? "on" : "off");
+	VDBG("gadget %s\n", str_on_off(on));
 	dev = otg->gadget->dev.parent;
 
 	if (on) {
diff --git a/drivers/usb/phy/phy-mv-usb.c b/drivers/usb/phy/phy-mv-usb.c
index a7a102f2e163facb7797664a8999207419ae33fd..30d6c8840a5e6af8df05acffa93a806af47047b2 100644
--- a/drivers/usb/phy/phy-mv-usb.c
+++ b/drivers/usb/phy/phy-mv-usb.c
@@ -15,6 +15,7 @@
 #include <linux/clk.h>
 #include <linux/workqueue.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 
 #include <linux/usb.h>
 #include <linux/usb/ch9.h>
@@ -217,7 +218,7 @@ static void mv_otg_start_periphrals(struct mv_otg *mvotg, int on)
 	if (!otg->gadget)
 		return;
 
-	dev_info(mvotg->phy.dev, "gadget %s\n", on ? "on" : "off");
+	dev_info(mvotg->phy.dev, "gadget %s\n", str_on_off(on));
 
 	if (on)
 		usb_gadget_vbus_connect(otg->gadget);
diff --git a/drivers/usb/phy/phy-tahvo.c b/drivers/usb/phy/phy-tahvo.c
index ae7bf3ff89ee176d730d2fb1e7377ce4835b7c6f..88607d0edb01485902f611e4e501dec2946d9939 100644
--- a/drivers/usb/phy/phy-tahvo.c
+++ b/drivers/usb/phy/phy-tahvo.c
@@ -18,6 +18,7 @@
 #include <linux/extcon-provider.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/string_choices.h>
 #include <linux/usb/otg.h>
 #include <linux/mfd/retu.h>
 #include <linux/usb/gadget.h>
@@ -63,7 +64,7 @@ static ssize_t vbus_show(struct device *device,
 			       struct device_attribute *attr, char *buf)
 {
 	struct tahvo_usb *tu = dev_get_drvdata(device);
-	return sprintf(buf, "%s\n", tu->vbus_state ? "on" : "off");
+	return sprintf(buf, "%s\n", str_on_off(tu->vbus_state));
 }
 static DEVICE_ATTR_RO(vbus);
 

-- 
2.43.0


