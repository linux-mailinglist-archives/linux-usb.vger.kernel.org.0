Return-Path: <linux-usb+bounces-5371-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F4583657D
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 15:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86A3E1F23107
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 14:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FAED3D980;
	Mon, 22 Jan 2024 14:32:53 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ACA3D57D
	for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 14:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705933972; cv=none; b=c4/vc1oOfOshM0876qHlxzoM6x+mSyEcktZrshtslPKHrDFs7PjBZrZKoIhxdYPlPaWFsfPGSGGovT9TzFDIeVbXuD5hD8aw8lUu4TaxmlWZPQm9vVYXRFMaDKVpmF0YgKLv/tXSjuHe9Npj4pkwKdzy17267PM7Xob4pOuKcEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705933972; c=relaxed/simple;
	bh=iTv19rICNpl1lnVCWMxVhw3rYmY8g6Kbzqytd3+JnzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eRIeCpXwKcGCnd+PhOuWLloLGR9SE09zXoE17+ls+EiH2+WU5JJ3K0WYNuYBG+ESPD+KdDyFfZ5QWEtull3dCoCNXPJw/47SzDmZdQEkmSU6HXsh4EWv+I8NBMTwGlaQhOeD5uHTidCqt5YVIVd6jBDB7COkPolA+xyX1u6SlEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4TJXY62N1tz4x0K8
	for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 15:24:42 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:955e:bba5:7ff4:cfb6])
	by michel.telenet-ops.be with bizsmtp
	id dqQb2B0010ZxL6o06qQbSv; Mon, 22 Jan 2024 15:24:35 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rRvDF-00GGww-Rw;
	Mon, 22 Jan 2024 15:24:34 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rRvE2-00CFAf-Sl;
	Mon, 22 Jan 2024 15:24:34 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/4] staging: board: Remove Armadillo-800-EVA board staging code
Date: Mon, 22 Jan 2024 15:24:32 +0100
Message-Id: <6d51e06a8586997b31eecead55a369f01c5696a7.1705932585.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705932585.git.geert+renesas@glider.be>
References: <cover.1705932585.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commits 1399ebacbf590dfb ("drm: renesas: shmobile: Add DT
support"), 138588e9fa237f97 ("ARM: dts: renesas: r8a7740: Add LCDC
nodes"), and c9a0ed13382660c9 ("ARM: dts: renesas: armadillo800eva: Add
LCD panel"), there is no longer any use for the Atmark Techno
Armadillo-800-EVA board staging code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 drivers/staging/board/Makefile          |  1 -
 drivers/staging/board/armadillo800eva.c | 88 -------------------------
 2 files changed, 89 deletions(-)
 delete mode 100644 drivers/staging/board/armadillo800eva.c

diff --git a/drivers/staging/board/Makefile b/drivers/staging/board/Makefile
index 5db091b5ca01596a..b6a00c93c2cc10dd 100644
--- a/drivers/staging/board/Makefile
+++ b/drivers/staging/board/Makefile
@@ -1,3 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y	:= board.o
-obj-$(CONFIG_ARCH_R8A7740)	+= armadillo800eva.o
diff --git a/drivers/staging/board/armadillo800eva.c b/drivers/staging/board/armadillo800eva.c
deleted file mode 100644
index 0225234dd7aa6b1c..0000000000000000
--- a/drivers/staging/board/armadillo800eva.c
+++ /dev/null
@@ -1,88 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Staging board support for Armadillo 800 eva.
- * Enable not-yet-DT-capable devices here.
- *
- * Based on board-armadillo800eva.c
- *
- * Copyright (C) 2012 Renesas Solutions Corp.
- * Copyright (C) 2012 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
- */
-
-#include <linux/dma-mapping.h>
-#include <linux/fb.h>
-#include <linux/kernel.h>
-#include <linux/platform_device.h>
-#include <linux/videodev2.h>
-
-#include <video/sh_mobile_lcdc.h>
-
-#include "board.h"
-
-static struct fb_videomode lcdc0_mode = {
-	.name		= "AMPIER/AM-800480",
-	.xres		= 800,
-	.yres		= 480,
-	.left_margin	= 88,
-	.right_margin	= 40,
-	.hsync_len	= 128,
-	.upper_margin	= 20,
-	.lower_margin	= 5,
-	.vsync_len	= 5,
-	.sync		= 0,
-};
-
-static struct sh_mobile_lcdc_info lcdc0_info = {
-	.clock_source	= LCDC_CLK_BUS,
-	.ch[0] = {
-		.chan		= LCDC_CHAN_MAINLCD,
-		.fourcc		= V4L2_PIX_FMT_RGB565,
-		.interface_type	= RGB24,
-		.clock_divider	= 5,
-		.flags		= 0,
-		.lcd_modes	= &lcdc0_mode,
-		.num_modes	= 1,
-		.panel_cfg = {
-			.width	= 111,
-			.height = 68,
-		},
-	},
-};
-
-static struct resource lcdc0_resources[] = {
-	DEFINE_RES_MEM_NAMED(0xfe940000, 0x4000, "LCD0"),
-	DEFINE_RES_IRQ(177 + 32),
-};
-
-static struct platform_device lcdc0_device = {
-	.name		= "sh_mobile_lcdc_fb",
-	.num_resources	= ARRAY_SIZE(lcdc0_resources),
-	.resource	= lcdc0_resources,
-	.id		= 0,
-	.dev	= {
-		.platform_data	= &lcdc0_info,
-		.coherent_dma_mask = DMA_BIT_MASK(32),
-	},
-};
-
-static const struct board_staging_clk lcdc0_clocks[] __initconst = {
-	{ "lcdc0", NULL, "sh_mobile_lcdc_fb.0" },
-};
-
-static const struct board_staging_dev armadillo800eva_devices[] __initconst = {
-	{
-		.pdev	 = &lcdc0_device,
-		.clocks	 = lcdc0_clocks,
-		.nclocks = ARRAY_SIZE(lcdc0_clocks),
-		.domain	 = "/system-controller@e6180000/pm-domains/c5/a4lc@1"
-	},
-};
-
-static void __init armadillo800eva_init(void)
-{
-	board_staging_gic_setup_xlate("arm,pl390", 32);
-	board_staging_register_devices(armadillo800eva_devices,
-				       ARRAY_SIZE(armadillo800eva_devices));
-}
-
-board_staging("renesas,armadillo800eva", armadillo800eva_init);
-- 
2.34.1


