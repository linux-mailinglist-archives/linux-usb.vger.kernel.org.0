Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 673D4554A6B
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jun 2022 15:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350246AbiFVNE4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jun 2022 09:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347800AbiFVNEx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jun 2022 09:04:53 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F3DBE2F
        for <linux-usb@vger.kernel.org>; Wed, 22 Jun 2022 06:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1655903092; x=1687439092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g9p+CdnZ6Dbj2C8XugLowstES1GHafD254UAKc21yY8=;
  b=SH1+ATP6WlkbBHo3DQtZAO7LwB3dP0e3ViGGNb6n7ge8Z0UO9Nh1EgZz
   e5RADSyTGVrqjh0TbOI/0ecShZGMpIEFVpIJdZw5QFpm+9xR3NKMxeTIj
   G6lLOvjyrIx704JYhlTTi3zxqCje1AWkqk6kQSHXwqJXbjpL5vAGVZWWn
   SGHCQLyobsZuklzATkmoZ0KM8ZXYg9oa/I/o0dehagYiMi8YJ0ALLg5/I
   bB8agjsPFB5M7c+j+XX3NMamC+9fxkEk4Gv7JOPXQK9/tBytuqmZ97WER
   +KL4ChXr02SgC/XUUzhlczFUAJDlaItzjB0+lenJE4TBR7EhCB2VEg1nl
   g==;
X-IronPort-AV: E=Sophos;i="5.92,212,1650924000"; 
   d="scan'208";a="24605520"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 22 Jun 2022 15:04:47 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 22 Jun 2022 15:04:47 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 22 Jun 2022 15:04:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1655903087; x=1687439087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g9p+CdnZ6Dbj2C8XugLowstES1GHafD254UAKc21yY8=;
  b=Nltt6A1T4XMs96HKy07ZgjEh+rlKfd2LJHiw+oiIjJtKgWYHzp1yv7cG
   7XTQt0PaYvYQgDITQz/Lu5SzLLpJbnuBUPVDDWmHKQcdd2ulFoCsW1Uet
   u1Lqle3iTUqYigUl8BlfaIrhirmkz3jut900/xQIu5uhp2Kc/lf/EMn9I
   q/usJr/KJcrywbpzGIJJbAZJT7jncZlWvSuDC34wiRkq2lfZwJySWpX3h
   4b0b9bKaxJ2zrbcZwSFnFXDaYV5lUHfjMfTGcenGDv1b2pcBJQeDAB6dW
   7fIlbZCuCOcFKYHz52rYJ9fdKWhOVnzQ95246iWkO0rc86DOzT7Lp796X
   g==;
X-IronPort-AV: E=Sophos;i="5.92,212,1650924000"; 
   d="scan'208";a="24605519"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Jun 2022 15:04:47 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 78D4B280073;
        Wed, 22 Jun 2022 15:04:47 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 2/4] usb: dwc3: core: add gfladj_refclk_lpm_sel quirk
Date:   Wed, 22 Jun 2022 15:04:38 +0200
Message-Id: <20220622130440.955465-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622130440.955465-1-alexander.stein@ew.tq-group.com>
References: <20220622130440.955465-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This selects the SOF/ITP counter be running on ref_clk. As documented
U2_FREECLK_EXISTS has to be set to 0 as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/usb/dwc3/core.c | 8 +++++++-
 drivers/usb/dwc3/core.h | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index cb8742f2a4b0..e000f3898a6a 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -403,6 +403,10 @@ static void dwc3_ref_clk_period(struct dwc3 *dwc)
 	reg |= FIELD_PREP(DWC3_GFLADJ_REFCLK_FLADJ_MASK, fladj)
 	    |  FIELD_PREP(DWC3_GFLADJ_240MHZDECR, decr >> 1)
 	    |  FIELD_PREP(DWC3_GFLADJ_240MHZDECR_PLS1, decr & 1);
+
+	if (dwc->gfladj_refclk_lpm_sel)
+		reg |=  DWC3_GFLADJ_REFCLK_LPM_SEL;
+
 	dwc3_writel(dwc->regs, DWC3_GFLADJ, reg);
 }
 
@@ -784,7 +788,7 @@ static int dwc3_phy_setup(struct dwc3 *dwc)
 	else
 		reg |= DWC3_GUSB2PHYCFG_ENBLSLPM;
 
-	if (dwc->dis_u2_freeclk_exists_quirk)
+	if (dwc->dis_u2_freeclk_exists_quirk || dwc->gfladj_refclk_lpm_sel)
 		reg &= ~DWC3_GUSB2PHYCFG_U2_FREECLK_EXISTS;
 
 	dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
@@ -1519,6 +1523,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				"snps,dis-tx-ipgap-linecheck-quirk");
 	dwc->parkmode_disable_ss_quirk = device_property_read_bool(dev,
 				"snps,parkmode-disable-ss-quirk");
+	dwc->gfladj_refclk_lpm_sel = device_property_read_bool(dev,
+				"snps,gfladj-refclk-lpm-sel-quirk");
 
 	dwc->tx_de_emphasis_quirk = device_property_read_bool(dev,
 				"snps,tx_de_emphasis_quirk");
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 722808d8c0af..92ce2743ccc8 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -391,6 +391,7 @@
 #define DWC3_GFLADJ_30MHZ_SDBND_SEL		BIT(7)
 #define DWC3_GFLADJ_30MHZ_MASK			0x3f
 #define DWC3_GFLADJ_REFCLK_FLADJ_MASK		GENMASK(21, 8)
+#define DWC3_GFLADJ_REFCLK_LPM_SEL		BIT(23)
 #define DWC3_GFLADJ_240MHZDECR			GENMASK(30, 24)
 #define DWC3_GFLADJ_240MHZDECR_PLS1		BIT(31)
 
@@ -1310,6 +1311,7 @@ struct dwc3 {
 	unsigned		dis_del_phy_power_chg_quirk:1;
 	unsigned		dis_tx_ipgap_linecheck_quirk:1;
 	unsigned		parkmode_disable_ss_quirk:1;
+	unsigned		gfladj_refclk_lpm_sel:1;
 
 	unsigned		tx_de_emphasis_quirk:1;
 	unsigned		tx_de_emphasis:2;
-- 
2.25.1

