Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 415A4456AC
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2019 09:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbfFNHrW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jun 2019 03:47:22 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:16061 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbfFNHrV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Jun 2019 03:47:21 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0351090000>; Fri, 14 Jun 2019 00:47:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 14 Jun 2019 00:47:20 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 14 Jun 2019 00:47:20 -0700
Received: from jckuo-lt.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 07:47:18 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <pdeschrijver@nvidia.com>,
        <afrid@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <nkristam@nvidia.com>,
        <skomatineni@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH 2/8] clk: tegra: don't enable PLLE HW sequencer at init
Date:   Fri, 14 Jun 2019 15:46:50 +0800
Message-ID: <20190614074652.21960-3-jckuo@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190614074652.21960-1-jckuo@nvidia.com>
References: <20190614074652.21960-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560498441; bh=0y6D2RBvajc0M/fTjBfcOd4qCrAhXSgcSFikZbfauPw=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-Originating-IP:
         X-ClientProxiedBy:Content-Type;
        b=fIhclZ5tSXvUJqp1EiVtMXF2lNKkg+wjSnuEjmdwzUsPfj4JhA8jxvKJWOjBEumin
         oFaj3M042oehVgpMT8sjk5OVmK7bh4GyqjJRtmvtqQmqTDbbDro3yGecxsU09U6XNc
         kN8pK/CyOiyxi/6amCO9oOpOYLBLh+qhiL1btZOJVs1ncfGPkBkwO8Gqzj+I9CgK7g
         4EiMASF1ijYykxFiK/ZifteEck1eYzDFD/YFyYy8wtPxEumj8oswEZ6QLCTQmc1o7m
         PYO+rnsC/7LeyYW/evSe6G7132rIJmsKXyVShnzEpLjtgFiBfkM1RCA/xVXICIxpnc
         JBchUjOpIN0Gg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PLLE hardware power sequencer references PEX/SATA UPHY PLL hardware
power sequencers' output to enable/disable PLLE. PLLE hardware power
sequencer has to be enabled only after PEX/SATA UPHY PLL's sequencers
are enabled.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 1583f5fc992f..e6de65987fd2 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -2469,18 +2469,6 @@ static int clk_plle_tegra210_enable(struct clk_hw *hw)
 	pll_writel(val, PLLE_SS_CTRL, pll);
 	udelay(1);
 
-	val = pll_readl_misc(pll);
-	val &= ~PLLE_MISC_IDDQ_SW_CTRL;
-	pll_writel_misc(val, pll);
-
-	val = pll_readl(pll->params->aux_reg, pll);
-	val |= (PLLE_AUX_USE_LOCKDET | PLLE_AUX_SS_SEQ_INCLUDE);
-	val &= ~(PLLE_AUX_ENABLE_SWCTL | PLLE_AUX_SS_SWCTL);
-	pll_writel(val, pll->params->aux_reg, pll);
-	udelay(1);
-	val |= PLLE_AUX_SEQ_ENABLE;
-	pll_writel(val, pll->params->aux_reg, pll);
-
 out:
 	if (pll->lock)
 		spin_unlock_irqrestore(pll->lock, flags);
-- 
2.17.1

