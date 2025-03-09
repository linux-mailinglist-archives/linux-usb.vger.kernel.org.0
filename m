Return-Path: <linux-usb+bounces-21547-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2648CA5847A
	for <lists+linux-usb@lfdr.de>; Sun,  9 Mar 2025 14:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BC19188BD56
	for <lists+linux-usb@lfdr.de>; Sun,  9 Mar 2025 13:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66301F872B;
	Sun,  9 Mar 2025 13:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2asBxSH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870D91F4C81;
	Sun,  9 Mar 2025 13:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741527059; cv=none; b=HPhaXVGFwIw9STqK1TfIdnxtXCb3CB6+CX1uAXPAvSCLxS5DUnkWh924vTCc+KI6hcOc3trJg5ceWbSyZE1V85vTIah8rGyB0Stti4trfmeyUjRAqdhpZVr3O4Du4OcgdK3eVcpiNmaJfaHdt4oTxeMk3IhEyxrQ/+3VIr3258s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741527059; c=relaxed/simple;
	bh=CfAl8uYEwHl0U2A9hTdnxU032c2ix/2WrdgWL1vtLIw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oeaPc2YqBo690+d/ztjsLQxlBkZ/ihoFc23c7+4wQf+MQVAYvkULUBrgJW7vh0HwLw8cN0baymDJRkmdL68XpV8rYjmiuwIkZTQ72lmPi3s8KcsY3lX+iMfVFZKeitv/uZa6PzS1PGqvObX9cbQSYUwGqAZxzHU85zSrjJzta+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2asBxSH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43bc63876f1so28805845e9.3;
        Sun, 09 Mar 2025 06:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741527055; x=1742131855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lsm9QoyKmW3RuyIdQZEQJ299DykBb6Yk0DvMS1wP270=;
        b=k2asBxSHcr4Uue71TKur9KAAnJEzRsJhY9XQc59gAhUHy77KDyadHpCemxnPY4H8nL
         0wZBG95kKW8QFimMNqRoycWMnTnzj1bA/8cwbrjelUETKWLmYSXSWUt48ZXB6YVaXFn0
         8d41G8ZdfVW3M/MSRgvch1i+L9pOUM5HLi5kpMrPcIFkLHe8Fpw5e1ZNBBQM8vB6gW+e
         EjcW5yaF0W/vDZ3Lo2KEUpTRFGo4oYvKkuvHlavhxqf2AG3nUzQwH6aSxGAgPpIEUiQ9
         kBe0tNhjUXgD1GHXkzGshg1lFWG5qo2jfqJOYdkdF205j3Usz08DAjbflgqhBnIFN6bx
         d/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741527055; x=1742131855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lsm9QoyKmW3RuyIdQZEQJ299DykBb6Yk0DvMS1wP270=;
        b=dzauXwtGQIJVVDKMEQgzZAWzRIm0+5iGkCfBfFFoi7OokXUA/g7GufDNB00O8eccj+
         D2OytlP8awBHKsxyd0I8w9HRGHbduOOJRAIlyoRubgD/waW0sv3sKnkdPQExUYikVdpS
         hUtUQyJSRRoBK3Rl6PS5Zmk9p8CHP8T8FbHTTnTB80ShNbHB9ZL18wk0YrhdGhC8vX19
         gYX+c7QSFbedp++mynDeEcEax+ySBkQG34X9dmbEYacvKHqcOg735YKi+e/HzPrlgcot
         9W2opar+FmEJ6JMRcjVphT5vFaOogtdTqEKDMlMPnPWpRtuyiWPAIVIpI1pgK9izWOzJ
         JGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuauVWRgFAzTBdlvGfvm5CKo7xdpFwwGxGNVkQZNiRLWxlYuQBnRri2OIkFh3aVoOhQ/Mz6fJ/lDVlyvK0@vger.kernel.org, AJvYcCW+isMlLrZZy6CQ8Hv9pCauJllB1SbPqAP1NklRxX/VL1VCj3XmOPCCZmuZXsFt1fq7YwHkWqgd+4Yi@vger.kernel.org, AJvYcCWVX5UeWWUsX/T+f5l71Q6rBAMxeXcis/m3DekXtsmCODlodBxZDrOv7y6kTox+t4TjVMyoe/C3TSRl@vger.kernel.org, AJvYcCWeuIjxZhmsOjb9Djb9XesWKGXYLEgTWkYdvKtyX6LdY4+tj/yUG5jbBU/o06LUnc5K6Mg82kKiyMDf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/p73H2q7X9oWMBwpacUX/YbP8oC2Y9mbu2mZSdym35DYmL3Lz
	Y3A2ZN97imdpVDglmiaWBFLCFVWHRAjp0weA5yApPtaVfBIvBBpm
X-Gm-Gg: ASbGncuxyttIXTgCnpdfkxF/naf8niduAf4oac2zIBKuHYle/vA7ieO7fYht1tFI68p
	ryqtU1LQ+xb//GRFwK5YnhOI6UVpXof9WtB3FwKakbMcNoZDZJqN5FXrr8L6EZPRd4uWqLxTV7z
	MffcX5GSeWwtnC7se4EjROZ7vqTxvzPfitBepoTaVR+OK6dGcrROIgQMrwruZ9P3AdEya2pxbS7
	e/HZY/H5GfDNnHB7dH+0mRfHT/QZPWR7aoH82VY9/13zTVBPrPASMDvkd7xy2a9XmZPhXLlZjWl
	mUsFfhb0w0OwR0I3XLswmOoOyYUoWCL3uvrPQaQEynXMubCAyVdlDTkriJI2vYeqXR4V4oAbVL9
	OSqI6HVzVDRjavw==
X-Google-Smtp-Source: AGHT+IGQBAeB/hsNgYTHL5ZMJU5SJxeO0HL1gdICnLID/70MEOy1dVKauV/WmhVjAT1RVmZOqeIuCw==
X-Received: by 2002:a05:6000:1884:b0:390:df83:1f5d with SMTP id ffacd0b85a97d-39132dbb4efmr6514798f8f.35.1741527054531;
        Sun, 09 Mar 2025 06:30:54 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bee262esm11867536f8f.0.2025.03.09.06.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 06:30:54 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH 10/13] phy: airoha: Add support for Airoha AN7581 USB PHY
Date: Sun,  9 Mar 2025 14:29:41 +0100
Message-ID: <20250309132959.19045-11-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309132959.19045-1-ansuelsmth@gmail.com>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Airoha AN7581 USB PHY driver. AN7581 supports up to 2
USB port with USB 2.0 mode always supported and USB 3.0 mode available
only if the Serdes port is correctly configured for USB 3.0.

On xLate probe, the Serdes mode is validated and the driver return error
if the Serdes mode doesn't reflect the expected mode. This is required
as Serdes mode are controlled by the SCU SSR bits and can be either USB
3.0 mode or HSGMII or PCIe 2. In such case USB 3.0 won't work.

If the USB 3.0 mode is not supported, the modes needs to be also
disabled in the xHCI node or the driver will report unsable clock and
fail probe.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                         |   1 +
 drivers/phy/Kconfig                 |   1 +
 drivers/phy/Makefile                |   3 +-
 drivers/phy/airoha/Kconfig          |  13 +
 drivers/phy/airoha/Makefile         |   3 +
 drivers/phy/airoha/phy-airoha-usb.c | 554 ++++++++++++++++++++++++++++
 6 files changed, 574 insertions(+), 1 deletion(-)
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-airoha-usb.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c2dd385e9165..1835e488ccaa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -758,6 +758,7 @@ M:	Christian Marangi <ansuelsmth@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yam
+F:	drivers/phy/airoha/phy-airoha-usb.c
 
 AIRSPY MEDIA DRIVER
 L:	linux-media@vger.kernel.org
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 8d58efe998ec..19c9c518fc3d 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -93,6 +93,7 @@ config PHY_NXP_PTN3222
 	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
 	  Speed and High Speed.
 
+source "drivers/phy/airoha/Kconfig"
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index e281442acc75..71708c6865b8 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -12,7 +12,8 @@ obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
 obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
-obj-y					+= allwinner/	\
+obj-y					+= airoha/	\
+					   allwinner/	\
 					   amlogic/	\
 					   broadcom/	\
 					   cadence/	\
diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
new file mode 100644
index 000000000000..5a2bc2e5d397
--- /dev/null
+++ b/drivers/phy/airoha/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Phy drivers for Mediatek devices
+#
+config PHY_AIROHA_USB
+	tristate "Airoha USB PHY Driver"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Say 'Y' here to add support for Airoha USB PHY driver.
+	  This driver create the basic PHY instance and provides initialize
+	  callback for USB port.
diff --git a/drivers/phy/airoha/Makefile b/drivers/phy/airoha/Makefile
new file mode 100644
index 000000000000..deddab0bbc81
--- /dev/null
+++ b/drivers/phy/airoha/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_PHY_AIROHA_USB)		+= phy-airoha-usb.o
diff --git a/drivers/phy/airoha/phy-airoha-usb.c b/drivers/phy/airoha/phy-airoha-usb.c
new file mode 100644
index 000000000000..efc89c674342
--- /dev/null
+++ b/drivers/phy/airoha/phy-airoha-usb.c
@@ -0,0 +1,554 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Author: Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/soc/airoha,scu-ssr.h>
+#include <linux/bitfield.h>
+#include <linux/math.h>
+#include <linux/module.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/soc/airoha/airoha-scu-ssr.h>
+
+/* U2PHY */
+#define AIROHA_USB_PHY_FMCR0			0x100
+#define   AIROHA_USB_PHY_MONCLK_SEL		GENMASK(27, 26)
+#define   AIROHA_USB_PHY_MONCLK_SEL0		FIELD_PREP_CONST(AIROHA_USB_PHY_MONCLK_SEL, 0x0)
+#define   AIROHA_USB_PHY_MONCLK_SEL1		FIELD_PREP_CONST(AIROHA_USB_PHY_MONCLK_SEL, 0x1)
+#define   AIROHA_USB_PHY_MONCLK_SEL2		FIELD_PREP_CONST(AIROHA_USB_PHY_MONCLK_SEL, 0x2)
+#define   AIROHA_USB_PHY_MONCLK_SEL3		FIELD_PREP_CONST(AIROHA_USB_PHY_MONCLK_SEL, 0x3)
+#define   AIROHA_USB_PHY_FREQDET_EN		BIT(24)
+#define   AIROHA_USB_PHY_CYCLECNT		GENMASK(23, 0)
+#define AIROHA_USB_PHY_FMMONR0			0x10c
+#define   AIROHA_USB_PHY_USB_FM_OUT		GENMASK(31, 0)
+#define AIROHA_USB_PHY_FMMONR1			0x110
+#define   AIROHA_USB_PHY_FRCK_EN		BIT(8)
+
+#define AIROHA_USB_PHY_USBPHYACR4		0x310
+#define   AIROHA_USB_PHY_USB20_FS_CR		GENMASK(10, 8)
+#define   AIROHA_USB_PHY_USB20_FS_CR_MAX	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_CR, 0x0)
+#define   AIROHA_USB_PHY_USB20_FS_CR_NORMAL	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_CR, 0x2)
+#define   AIROHA_USB_PHY_USB20_FS_CR_SMALLER	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_CR, 0x4)
+#define   AIROHA_USB_PHY_USB20_FS_CR_MIN	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_CR, 0x6)
+#define   AIROHA_USB_PHY_USB20_FS_SR		GENMASK(2, 0)
+#define   AIROHA_USB_PHY_USB20_FS_SR_MAX	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_SR, 0x0)
+#define   AIROHA_USB_PHY_USB20_FS_SR_NORMAL	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_SR, 0x2)
+#define   AIROHA_USB_PHY_USB20_FS_SR_SMALLER	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_SR, 0x4)
+#define   AIROHA_USB_PHY_USB20_FS_SR_MIN	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_SR, 0x6)
+#define AIROHA_USB_PHY_USBPHYACR5		0x314
+#define   AIROHA_USB_PHY_USB20_HSTX_SRCAL_EN	BIT(15)
+#define   AIROHA_USB_PHY_USB20_HSTX_SRCTRL	GENMASK(14, 12)
+#define AIROHA_USB_PHY_USBPHYACR6		0x318
+#define   AIROHA_USB_PHY_USB20_BC11_SW_EN	BIT(23)
+#define   AIROHA_USB_PHY_USB20_DISCTH		GENMASK(7, 4)
+#define   AIROHA_USB_PHY_USB20_DISCTH_400	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x0)
+#define   AIROHA_USB_PHY_USB20_DISCTH_420	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x1)
+#define   AIROHA_USB_PHY_USB20_DISCTH_440	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x2)
+#define   AIROHA_USB_PHY_USB20_DISCTH_460	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x3)
+#define   AIROHA_USB_PHY_USB20_DISCTH_480	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x4)
+#define   AIROHA_USB_PHY_USB20_DISCTH_500	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x5)
+#define   AIROHA_USB_PHY_USB20_DISCTH_520	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x6)
+#define   AIROHA_USB_PHY_USB20_DISCTH_540	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x7)
+#define   AIROHA_USB_PHY_USB20_DISCTH_560	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x8)
+#define   AIROHA_USB_PHY_USB20_DISCTH_580	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x9)
+#define   AIROHA_USB_PHY_USB20_DISCTH_600	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0xa)
+#define   AIROHA_USB_PHY_USB20_DISCTH_620	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0xb)
+#define   AIROHA_USB_PHY_USB20_DISCTH_640	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0xc)
+#define   AIROHA_USB_PHY_USB20_DISCTH_660	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0xd)
+#define   AIROHA_USB_PHY_USB20_DISCTH_680	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0xe)
+#define   AIROHA_USB_PHY_USB20_DISCTH_700	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0xf)
+#define   AIROHA_USB_PHY_USB20_SQTH		GENMASK(3, 0)
+#define   AIROHA_USB_PHY_USB20_SQTH_85		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x0)
+#define   AIROHA_USB_PHY_USB20_SQTH_90		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x1)
+#define   AIROHA_USB_PHY_USB20_SQTH_95		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x2)
+#define   AIROHA_USB_PHY_USB20_SQTH_100		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x3)
+#define   AIROHA_USB_PHY_USB20_SQTH_105		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x4)
+#define   AIROHA_USB_PHY_USB20_SQTH_110		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x5)
+#define   AIROHA_USB_PHY_USB20_SQTH_115		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x6)
+#define   AIROHA_USB_PHY_USB20_SQTH_120		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x7)
+#define   AIROHA_USB_PHY_USB20_SQTH_125		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x8)
+#define   AIROHA_USB_PHY_USB20_SQTH_130		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x9)
+#define   AIROHA_USB_PHY_USB20_SQTH_135		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0xa)
+#define   AIROHA_USB_PHY_USB20_SQTH_140		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0xb)
+#define   AIROHA_USB_PHY_USB20_SQTH_145		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0xc)
+#define   AIROHA_USB_PHY_USB20_SQTH_150		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0xd)
+#define   AIROHA_USB_PHY_USB20_SQTH_155		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0xe)
+#define   AIROHA_USB_PHY_USB20_SQTH_160		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0xf)
+
+#define AIROHA_USB_PHY_U2PHYDTM1		0x36c
+#define   AIROHA_USB_PHY_FORCE_IDDIG		BIT(9)
+#define   AIROHA_USB_PHY_IDDIG			BIT(1)
+
+#define AIROHA_USB_PHY_GPIO_CTLD		0x80c
+#define   AIROHA_USB_PHY_C60802_GPIO_CTLD	GENMASK(31, 0)
+#define     AIROHA_USB_PHY_SSUSB_IP_SW_RST	BIT(31)
+#define     AIROHA_USB_PHY_MCU_BUS_CK_GATE_EN	BIT(30)
+#define     AIROHA_USB_PHY_FORCE_SSUSB_IP_SW_RST BIT(29)
+#define     AIROHA_USB_PHY_SSUSB_SW_RST		BIT(28)
+
+#define AIROHA_USB_PHY_U3_PHYA_REG0		0xb00
+#define   AIROHA_USB_PHY_SSUSB_BG_DIV		GENMASK(29, 28)
+#define   AIROHA_USB_PHY_SSUSB_BG_DIV_2		FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_BG_DIV, 0x0)
+#define   AIROHA_USB_PHY_SSUSB_BG_DIV_4		FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_BG_DIV, 0x1)
+#define   AIROHA_USB_PHY_SSUSB_BG_DIV_8		FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_BG_DIV, 0x2)
+#define   AIROHA_USB_PHY_SSUSB_BG_DIV_16	FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_BG_DIV, 0x3)
+#define AIROHA_USB_PHY_U3_PHYA_REG1		0xb04
+#define   AIROHA_USB_PHY_SSUSB_XTAL_TOP_RESERVE	GENMASK(25, 10)
+#define AIROHA_USB_PHY_U3_PHYA_REG6		0xb18
+#define   AIROHA_USB_PHY_SSUSB_CDR_RESERVE	GENMASK(31, 24)
+#define AIROHA_USB_PHY_U3_PHYA_REG8		0xb20
+#define   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY	GENMASK(7, 6)
+#define   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY_32	FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_CDR_RST_DLY, 0x0)
+#define   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY_64	FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_CDR_RST_DLY, 0x1)
+#define   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY_128	FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_CDR_RST_DLY, 0x2)
+#define   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY_216	FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_CDR_RST_DLY, 0x3)
+
+#define AIROHA_USB_PHY_U3_PHYA_DA_REG19		0xc38
+#define   AIROHA_USB_PHY_SSUSB_PLL_SSC_DELTA1_U3 GENMASK(15, 0)
+
+#define AIROHA_USB_PHY_U2_FM_DET_CYCLE_CNT	1024
+#define AIROHA_USB_PHY_REF_CK			20
+#define AIROHA_USB_PHY_U2_SR_COEF		28
+#define AIROHA_USB_PHY_U2_SR_COEF_DIVISOR	1000
+
+#define AIROHA_USB_PHY_FREQDET_SLEEP		1000 /* 1ms */
+#define AIROHA_USB_PHY_FREQDET_TIMEOUT		(AIROHA_USB_PHY_FREQDET_SLEEP * 10)
+
+#define AIROHA_USB_PHY_MAX_INSTANCE		2
+
+struct airoha_usb_phy_instance {
+	struct phy *phy;
+	u32 type;
+};
+
+struct airoha_usb_phy_priv {
+	struct device *dev;
+
+	struct regmap *regmap;
+
+	unsigned int id;
+
+	struct airoha_usb_phy_instance *phys[AIROHA_USB_PHY_MAX_INSTANCE];
+};
+
+static int airoha_usb_phy_u2_slew_rate_calibration(struct airoha_usb_phy_priv *priv)
+{
+	u32 fm_out;
+	u32 srctrl;
+
+	/* Enable HS TX SR calibration */
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR5,
+			AIROHA_USB_PHY_USB20_HSTX_SRCAL_EN);
+
+	usleep_range(1000, 1500);
+
+	/* Enable Free run clock */
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_FMMONR1,
+			AIROHA_USB_PHY_FRCK_EN);
+
+	/* Select Monitor Clock */
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_FMCR0,
+			   AIROHA_USB_PHY_MONCLK_SEL,
+			   priv->id == 0 ? AIROHA_USB_PHY_MONCLK_SEL0 :
+					   AIROHA_USB_PHY_MONCLK_SEL1);
+
+	/* Set cyclecnt */
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_FMCR0,
+			   AIROHA_USB_PHY_CYCLECNT,
+			   FIELD_PREP(AIROHA_USB_PHY_CYCLECNT,
+				      AIROHA_USB_PHY_U2_FM_DET_CYCLE_CNT));
+
+	/* Enable Frequency meter */
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_FMCR0,
+			AIROHA_USB_PHY_FREQDET_EN);
+
+	/* Timeout can happen and we will apply workaround at the end */
+	regmap_read_poll_timeout(priv->regmap, AIROHA_USB_PHY_FMMONR0, fm_out,
+				 fm_out, AIROHA_USB_PHY_FREQDET_SLEEP,
+				 AIROHA_USB_PHY_FREQDET_TIMEOUT);
+
+	/* Disable Frequency meter */
+	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_FMCR0,
+			  AIROHA_USB_PHY_FREQDET_EN);
+
+	/* Disable Free run clock */
+	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_FMMONR1,
+			  AIROHA_USB_PHY_FRCK_EN);
+
+	/* Disable HS TX SR calibration */
+	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR5,
+			  AIROHA_USB_PHY_USB20_HSTX_SRCAL_EN);
+
+	usleep_range(1000, 1500);
+
+	/* Frequency was not detected, use default SR calibration value */
+	if (!fm_out) {
+		srctrl = 0x5;
+		dev_err(priv->dev, "Frequency not detected, using default SR calibration.\n");
+	/* (1024 / FM_OUT) * REF_CK * U2_SR_COEF (round to the nearest digits) */
+	} else {
+		srctrl = AIROHA_USB_PHY_REF_CK * AIROHA_USB_PHY_U2_SR_COEF;
+		srctrl = (srctrl * AIROHA_USB_PHY_U2_FM_DET_CYCLE_CNT) / fm_out;
+		srctrl = DIV_ROUND_CLOSEST(srctrl, AIROHA_USB_PHY_U2_SR_COEF_DIVISOR);
+		dev_dbg(priv->dev, "SR calibration applied: %x\n", srctrl);
+	}
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR5,
+			   AIROHA_USB_PHY_USB20_HSTX_SRCTRL,
+			   FIELD_PREP(AIROHA_USB_PHY_USB20_HSTX_SRCTRL, srctrl));
+
+	return 0;
+}
+
+static int airoha_usb_phy_u2_init(struct airoha_usb_phy_priv *priv)
+{
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR4,
+			   AIROHA_USB_PHY_USB20_FS_CR,
+			   AIROHA_USB_PHY_USB20_FS_CR_MIN);
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR4,
+			   AIROHA_USB_PHY_USB20_FS_SR,
+			   AIROHA_USB_PHY_USB20_FS_SR_NORMAL);
+
+	/* FIXME: evaluate if needed */
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			   AIROHA_USB_PHY_USB20_SQTH,
+			   AIROHA_USB_PHY_USB20_SQTH_130);
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			   AIROHA_USB_PHY_USB20_DISCTH,
+			   AIROHA_USB_PHY_USB20_DISCTH_600);
+
+	/* Enable the USB port and then disable after calibration */
+	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			  AIROHA_USB_PHY_USB20_BC11_SW_EN);
+
+	airoha_usb_phy_u2_slew_rate_calibration(priv);
+
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			AIROHA_USB_PHY_USB20_BC11_SW_EN);
+
+	usleep_range(1000, 1500);
+
+	return 0;
+}
+
+/*
+ * USB 3.0 mode can only work if USB serdes is correctly set.
+ * This is validated in xLate function.
+ */
+static int airoha_usb_phy_u3_init(struct airoha_usb_phy_priv *priv)
+{
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_REG8,
+			   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY,
+			   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY_32);
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_REG6,
+			   AIROHA_USB_PHY_SSUSB_CDR_RESERVE,
+			   FIELD_PREP(AIROHA_USB_PHY_SSUSB_CDR_RESERVE, 0xe));
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_REG0,
+			   AIROHA_USB_PHY_SSUSB_BG_DIV,
+			   AIROHA_USB_PHY_SSUSB_BG_DIV_4);
+
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_REG1,
+			FIELD_PREP(AIROHA_USB_PHY_SSUSB_XTAL_TOP_RESERVE, 0x600));
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_DA_REG19,
+			   AIROHA_USB_PHY_SSUSB_PLL_SSC_DELTA1_U3,
+			   FIELD_PREP(AIROHA_USB_PHY_SSUSB_PLL_SSC_DELTA1_U3, 0x43));
+
+	return 0;
+}
+
+static int airoha_usb_phy_init(struct phy *phy)
+{
+	struct airoha_usb_phy_instance *instance = phy_get_drvdata(phy);
+	struct airoha_usb_phy_priv *priv = dev_get_drvdata(phy->dev.parent);
+
+	if (instance->type == PHY_TYPE_USB2)
+		return airoha_usb_phy_u2_init(priv);
+
+	return airoha_usb_phy_u3_init(priv);
+}
+
+static int airoha_usb_phy_exit(struct phy *phy)
+{
+	return 0;
+}
+
+static int airoha_usb_phy_u2_power_on(struct airoha_usb_phy_priv *priv)
+{
+	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			  AIROHA_USB_PHY_USB20_BC11_SW_EN);
+
+	usleep_range(1000, 1500);
+
+	return 0;
+}
+
+static int airoha_usb_phy_u3_power_on(struct airoha_usb_phy_priv *priv)
+{
+	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_GPIO_CTLD,
+			  AIROHA_USB_PHY_SSUSB_IP_SW_RST |
+			  AIROHA_USB_PHY_MCU_BUS_CK_GATE_EN |
+			  AIROHA_USB_PHY_FORCE_SSUSB_IP_SW_RST |
+			  AIROHA_USB_PHY_SSUSB_SW_RST);
+
+	usleep_range(1000, 1500);
+
+	return 0;
+}
+
+static int airoha_usb_phy_power_on(struct phy *phy)
+{
+	struct airoha_usb_phy_instance *instance = phy_get_drvdata(phy);
+	struct airoha_usb_phy_priv *priv = dev_get_drvdata(phy->dev.parent);
+
+	if (instance->type == PHY_TYPE_USB2)
+		return airoha_usb_phy_u2_power_on(priv);
+
+	return airoha_usb_phy_u3_power_on(priv);
+}
+
+static int airoha_usb_phy_u2_power_off(struct airoha_usb_phy_priv *priv)
+{
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			AIROHA_USB_PHY_USB20_BC11_SW_EN);
+
+	usleep_range(1000, 1500);
+
+	return 0;
+}
+
+static int airoha_usb_phy_u3_power_off(struct airoha_usb_phy_priv *priv)
+{
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_GPIO_CTLD,
+			AIROHA_USB_PHY_SSUSB_IP_SW_RST |
+			AIROHA_USB_PHY_FORCE_SSUSB_IP_SW_RST);
+
+	usleep_range(1000, 1500);
+
+	return 0;
+}
+
+static int airoha_usb_phy_power_off(struct phy *phy)
+{
+	struct airoha_usb_phy_instance *instance = phy_get_drvdata(phy);
+	struct airoha_usb_phy_priv *priv = dev_get_drvdata(phy->dev.parent);
+
+	if (instance->type == PHY_TYPE_USB2)
+		return airoha_usb_phy_u2_power_off(priv);
+
+	return airoha_usb_phy_u3_power_off(priv);
+}
+
+static int airoha_usb_phy_u2_set_mode(struct airoha_usb_phy_priv *priv,
+				      enum phy_mode mode)
+{
+	u32 val = 0;
+
+	/*
+	 * For Device and Host mode, enable force IDDIG.
+	 * For Device set IDDIG, for Host clear IDDIG.
+	 * For OTG disable force and clear IDDIG bit while at it.
+	 */
+	switch (mode) {
+	case PHY_MODE_USB_DEVICE:
+		val |= AIROHA_USB_PHY_IDDIG;
+		fallthrough;
+	case PHY_MODE_USB_HOST:
+		val |= AIROHA_USB_PHY_FORCE_IDDIG;
+		break;
+	case PHY_MODE_USB_OTG:
+		break;
+	default:
+		return 0;
+	}
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U2PHYDTM1,
+			   AIROHA_USB_PHY_FORCE_IDDIG |
+			   AIROHA_USB_PHY_IDDIG, val);
+
+	return 0;
+}
+
+static int airoha_usb_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct airoha_usb_phy_instance *instance = phy_get_drvdata(phy);
+	struct airoha_usb_phy_priv *priv = dev_get_drvdata(phy->dev.parent);
+
+	if (instance->type == PHY_TYPE_USB2)
+		return airoha_usb_phy_u2_set_mode(priv, mode);
+
+	return 0;
+}
+
+static struct phy *airoha_usb_phy_xlate(struct device *dev,
+					const struct of_phandle_args *args)
+{
+	struct airoha_usb_phy_priv *priv = dev_get_drvdata(dev);
+	struct airoha_usb_phy_instance *instance = NULL;
+	struct device_node *phy_np = args->np;
+	int index;
+
+	if (args->args_count != 1) {
+		dev_err(dev, "invalid number of cells in 'phy' property\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	for (index = 0; index < AIROHA_USB_PHY_MAX_INSTANCE; index++)
+		if (phy_np == priv->phys[index]->phy->dev.of_node) {
+			instance = priv->phys[index];
+			break;
+		}
+
+	if (!instance) {
+		dev_err(dev, "failed to find appropriate phy\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	instance->type = args->args[0];
+	if (!(instance->type == PHY_TYPE_USB2 || instance->type == PHY_TYPE_USB3)) {
+		dev_err(dev, "unsupported device type: %d\n", instance->type);
+		return ERR_PTR(-EINVAL);
+	}
+
+	/* Validate Serdes for USB 3.0 */
+	if (instance->type == PHY_TYPE_USB3) {
+		enum airoha_scu_serdes_port serdes_port;
+		int serdes_mode, expcted_mode;
+
+		switch (priv->id) {
+		case 0:
+			serdes_port = AIROHA_SCU_SERDES_USB1;
+			expcted_mode = AIROHA_SCU_SSR_USB1_USB;
+			break;
+		case 1:
+			serdes_port = AIROHA_SCU_SERDES_USB2;
+			expcted_mode = AIROHA_SCU_SSR_USB2_USB;
+			break;
+		default: /* Impossible already validated */
+			return ERR_PTR(-EINVAL);
+		}
+
+		serdes_mode = airoha_scu_ssr_get_serdes_mode(dev, serdes_port);
+		if (serdes_mode < 0) {
+			dev_err(dev, "failed validating serdes mode for port %d: %d\n",
+				priv->id, serdes_mode);
+			return ERR_PTR(serdes_mode);
+		}
+
+		if (serdes_mode != expcted_mode) {
+			dev_err(dev, "wrong serdes mode for port %d\n",
+				priv->id);
+			return ERR_PTR(-EINVAL);
+		}
+	}
+
+	return instance->phy;
+}
+
+static const struct phy_ops airoha_phy = {
+	.init		= airoha_usb_phy_init,
+	.exit		= airoha_usb_phy_exit,
+	.power_on	= airoha_usb_phy_power_on,
+	.power_off	= airoha_usb_phy_power_off,
+	.set_mode	= airoha_usb_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static const struct regmap_config airoha_usb_phy_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int airoha_usb_phy_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct airoha_usb_phy_priv *priv;
+	struct device *dev = &pdev->dev;
+	struct device_node *child_np;
+	void *base;
+	int port;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+	ret = of_property_read_u32(dev->of_node, "airoha,port-id", &priv->id);
+	if (ret)
+		return dev_err_probe(dev, ret, "port ID is mandatory for USB PHY calibration.\n");
+
+	if (priv->id > 1)
+		return dev_err_probe(dev, -EINVAL, "only 2 USB port are supported on the SoC.\n");
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->regmap = devm_regmap_init_mmio(dev, base, &airoha_usb_phy_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	platform_set_drvdata(pdev, priv);
+
+	port = 0;
+	for_each_child_of_node(dev->of_node, child_np) {
+		struct airoha_usb_phy_instance  *instance;
+
+		instance = devm_kzalloc(dev, sizeof(*instance), GFP_KERNEL);
+		if (!instance) {
+			ret = -ENOMEM;
+			goto put_child;
+		}
+
+		priv->phys[port] = instance;
+
+		instance->phy = devm_phy_create(dev, child_np, &airoha_phy);
+		if (IS_ERR(instance->phy)) {
+			dev_err_probe(dev, PTR_ERR(instance->phy), "failed to create phy\n");
+			ret = PTR_ERR(instance->phy);
+			goto put_child;
+		}
+
+		phy_set_drvdata(instance->phy, instance);
+
+		port++;
+	}
+
+	phy_provider = devm_of_phy_provider_register(&pdev->dev, airoha_usb_phy_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+
+put_child:
+	of_node_put(child_np);
+	return ret;
+}
+
+static const struct of_device_id airoha_phy_id_table[] = {
+	{ .compatible = "airoha,an7581-usb-phy" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, airoha_phy_id_table);
+
+static struct platform_driver airoha_usb_driver = {
+	.probe		= airoha_usb_phy_probe,
+	.driver		= {
+		.name	= "airoha-usb-phy",
+		.of_match_table = airoha_phy_id_table,
+	},
+};
+
+module_platform_driver(airoha_usb_driver);
+
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Airoha USB PHY driver");
-- 
2.48.1


