Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2BF456AA
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2019 09:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfFNHrT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jun 2019 03:47:19 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:16049 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbfFNHrT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Jun 2019 03:47:19 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0351060003>; Fri, 14 Jun 2019 00:47:19 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 14 Jun 2019 00:47:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 14 Jun 2019 00:47:18 -0700
Received: from jckuo-lt.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 07:47:16 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <pdeschrijver@nvidia.com>,
        <afrid@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <nkristam@nvidia.com>,
        <skomatineni@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH 1/8] clk: tegra: Add PLLE HW power sequencer control
Date:   Fri, 14 Jun 2019 15:46:49 +0800
Message-ID: <20190614074652.21960-2-jckuo@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190614074652.21960-1-jckuo@nvidia.com>
References: <20190614074652.21960-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560498439; bh=EJI7wfVIK8X8lBoGLuzdrYmOj+GleZkOEyqz3XrNkn8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-Originating-IP:
         X-ClientProxiedBy:Content-Type;
        b=oLtUon4LOyfGQdBd0X0gjlVqjGe/8EKCwKgec/qpPxOCDkGYF+hIfmJqTMLXhkVCC
         U77YWe/xRKiM/Rxkj36IZPBZs9c67PBwF5ThFKChaG2o+Deot/EigUlBIXQnX9crkg
         2Rt+/JTOKrROg+vcijA0sUqb+D5cSQZkikgtWTo4lJ18eFX7aN+laBIzfIMiqpr9Mr
         NSS5NmDyHbO8VD4yhk38usmqFDVCV1OllkeIux2dDPi//8NpSDUzYJlFHTCq/8WRVB
         5fzXiWUNbndhxwUg4LF+zz5V3BrlAapXIfjgkqnM/Fu0Cn1qgh8wSM0InLDvOgf4nb
         3xrsc32MIhUWA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PLLE hardware power sequencer has to be enabled after PEX/SATA
UPHY PLL's sequencers are enabled.

tegra210_plle_hw_sequence_start() for XUSB PADCTL driver to enable
PLLE hardware sequencer at proper time.

tegra210_plle_hw_sequence_is_enabled() for XUSB PADCTL driver to
check whether PLLE hardware sequencer has been enabled or not.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 45 ++++++++++++++++++++++++++++++++
 include/linux/clk/tegra.h        |  2 ++
 2 files changed, 47 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index e1ba62d2b1a0..14d330669f36 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -398,6 +398,14 @@ static const char *mux_pllmcp_clkm[] = {
 #define PLLRE_BASE_DEFAULT_MASK		0x1c000000
 #define PLLRE_MISC0_WRITE_MASK		0x67ffffff
 
+/* PLLE */
+#define PLLE_MISC_IDDQ_SW_CTRL		(1 << 14)
+#define PLLE_AUX_USE_LOCKDET		(1 << 3)
+#define PLLE_AUX_SS_SEQ_INCLUDE		(1 << 31)
+#define PLLE_AUX_ENABLE_SWCTL		(1 << 4)
+#define PLLE_AUX_SS_SWCTL		(1 << 6)
+#define PLLE_AUX_SEQ_ENABLE		(1 << 24)
+
 /* PLLX */
 #define PLLX_USE_DYN_RAMP		1
 #define PLLX_BASE_LOCK			(1 << 27)
@@ -484,6 +492,43 @@ static const char *mux_pllmcp_clkm[] = {
 #define PLLU_MISC0_WRITE_MASK		0xbfffffff
 #define PLLU_MISC1_WRITE_MASK		0x00000007
 
+bool tegra210_plle_hw_sequence_is_enabled(void)
+{
+	u32 val;
+
+	val = readl_relaxed(clk_base + PLLE_AUX);
+	if (val & PLLE_AUX_SEQ_ENABLE)
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(tegra210_plle_hw_sequence_is_enabled);
+
+void tegra210_plle_hw_sequence_start(void)
+{
+	u32 val;
+
+	if (tegra210_plle_hw_sequence_is_enabled())
+		return;
+
+	val = readl_relaxed(clk_base + PLLE_MISC0);
+	val &= ~PLLE_MISC_IDDQ_SW_CTRL;
+	writel_relaxed(val, clk_base + PLLE_MISC0);
+
+	val = readl_relaxed(clk_base + PLLE_AUX);
+	val |= (PLLE_AUX_USE_LOCKDET | PLLE_AUX_SS_SEQ_INCLUDE);
+	val &= ~(PLLE_AUX_ENABLE_SWCTL | PLLE_AUX_SS_SWCTL);
+	writel_relaxed(val, clk_base + PLLE_AUX);
+
+	fence_udelay(1, clk_base);
+
+	val |= PLLE_AUX_SEQ_ENABLE;
+	writel_relaxed(val, clk_base + PLLE_AUX);
+
+	fence_udelay(1, clk_base);
+}
+EXPORT_SYMBOL_GPL(tegra210_plle_hw_sequence_start);
+
 void tegra210_xusb_pll_hw_control_enable(void)
 {
 	u32 val;
diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index b8aef62cc3f5..07b6d6145c95 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -110,6 +110,8 @@ static inline void tegra_cpu_clock_resume(void)
 }
 #endif
 
+extern void tegra210_plle_hw_sequence_start(void);
+extern bool tegra210_plle_hw_sequence_is_enabled(void);
 extern void tegra210_xusb_pll_hw_control_enable(void);
 extern void tegra210_xusb_pll_hw_sequence_start(void);
 extern void tegra210_sata_pll_hw_control_enable(void);
-- 
2.17.1

