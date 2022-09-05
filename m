Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 927AE5AD164
	for <lists+linux-usb@lfdr.de>; Mon,  5 Sep 2022 13:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237199AbiIELRx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 07:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235874AbiIELRx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 07:17:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C195AC64
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 04:17:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8540CB810EE
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 11:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75603C433D7;
        Mon,  5 Sep 2022 11:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662376669;
        bh=eLVDfhkSdXMqBFSHNZYhUH13MHT5g3vr7IucFBM/Lew=;
        h=From:To:Cc:Subject:Date:From;
        b=Q1ifxxVa/Pz02pXq/5PcMriQwydesrLttd97uHtWOobLLb/PzPh6hR3bjkTA4j87p
         tbpeXIHNAeb5bHW7XDUy6vRcV/jke4h0UFyF7Yb8kWqxBfsFM1HeZknuR3NObzp879
         loH20nH3fhVCKzx66Mo8yn8gSSMnBxCqOXqxV5kA+mxm4qxUg8qas8yxxNGcny/Jsa
         Sa42gD02cb9DHyzBxrBJAAJQTR9OlJPmXw9zSAJQnPpewquV08hrdruhXPInYaXWbh
         5dRgKhRZ4pnreXgAuvHzllMKnC/733nFPthRqn5i/FDQKCg1kWOr9lWsMCOViIVspg
         DS3RNuVRBNQuQ==
From:   Ard Biesheuvel <ardb@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH] usb: clean up after dropping driver registration log spam
Date:   Mon,  5 Sep 2022 13:17:40 +0200
Message-Id: <20220905111740.352348-1-ardb@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8010; i=ardb@kernel.org; h=from:subject; bh=eLVDfhkSdXMqBFSHNZYhUH13MHT5g3vr7IucFBM/Lew=; b=owEB7QES/pANAwAKAcNPIjmS2Y8kAcsmYgBjFdrTgpoeCFhyNRi1wkHSpokJF5qKrdP0Wvx2eDau DPLiqpaJAbMEAAEKAB0WIQT72WJ8QGnJQhU3VynDTyI5ktmPJAUCYxXa0wAKCRDDTyI5ktmPJIOYC/ 4xrvmYpUBrU7J0GouWL8xrqjMUu4CyRrEwnnThee+YBgMlOLQPtqjJQtAiztK9mraP3DqMrLna9DZt fucXpKHMrbGMo3PBMnBf5NR4ONGgi71HfHlgj3cO862ljCfaYdQhriMMTMcNy6NcoMYeZK7qC8WTFR 3jHP6Lf18uIueGAS3z3YVuGHzpoaR0NU4t+DQ6dOIR1/9L/9LJlDvDVcNR2NI5pkn1Ah/nzxajhXGX Fk3f/PmpSS8FLCLn1xtUQ5NVE7yr+dG2N7NrMlggOpRFjXVNRVgAb8EGlhp3LQ08FIotxVaZp1sdh8 hiqNAbyWpUN2M0F/RMWOXAHfHB1GIyWmVeeR8sFVdjFyGey1Bsnp8+Fu+aSAz8TqmRIk8tmgUZdb+J IecYxISqwJMi0gp37aBOiuE0dISNO4YebO4pwb8acGNcdhbK9SELQ0vbAwjK9qq87Bu4vGx2i+fs0l jcCcr2fBIrLLv4P8T1sWkc2zspDdDFSBod1eDTdvhKy0U=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop another couple of pointless pr_info() calls, and drop a number of
instances of hcd_name variables that are no longer referenced now that
they are no longer printed to the log at driver registration time.

Fixes: 10174220f55a ("usb: reduce kernel log spam on driver registration")
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/usb/host/ehci-atmel.c    | 2 --
 drivers/usb/host/ehci-exynos.c   | 1 -
 drivers/usb/host/ehci-npcm7xx.c  | 1 -
 drivers/usb/host/ehci-orion.c    | 2 --
 drivers/usb/host/ehci-platform.c | 2 --
 drivers/usb/host/ehci-spear.c    | 2 --
 drivers/usb/host/ehci-st.c       | 2 --
 drivers/usb/host/ohci-at91.c     | 2 --
 drivers/usb/host/ohci-exynos.c   | 1 -
 drivers/usb/host/ohci-platform.c | 2 --
 drivers/usb/host/ohci-pxa27x.c   | 2 --
 drivers/usb/host/ohci-s3c2410.c  | 2 --
 drivers/usb/host/ohci-spear.c    | 1 -
 drivers/usb/host/ohci-st.c       | 2 --
 drivers/usb/host/u132-hcd.c      | 1 -
 drivers/usb/host/uhci-hcd.c      | 2 --
 16 files changed, 27 deletions(-)

diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
index 0e995019c1df..8b775e7bab06 100644
--- a/drivers/usb/host/ehci-atmel.c
+++ b/drivers/usb/host/ehci-atmel.c
@@ -25,8 +25,6 @@
 
 #define DRIVER_DESC "EHCI Atmel driver"
 
-static const char hcd_name[] = "ehci-atmel";
-
 #define EHCI_INSNREG(index)			((index) * 4 + 0x90)
 #define EHCI_INSNREG08_HSIC_EN			BIT(2)
 
diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
index a65e365e3a04..c8e152c2e0ce 100644
--- a/drivers/usb/host/ehci-exynos.c
+++ b/drivers/usb/host/ehci-exynos.c
@@ -32,7 +32,6 @@
 	(EHCI_INSNREG00_ENA_INCR16 | EHCI_INSNREG00_ENA_INCR8 |	\
 	 EHCI_INSNREG00_ENA_INCR4 | EHCI_INSNREG00_ENA_INCRX_ALIGN)
 
-static const char hcd_name[] = "ehci-exynos";
 static struct hc_driver __read_mostly exynos_ehci_hc_driver;
 
 #define PHY_NUMBER 3
diff --git a/drivers/usb/host/ehci-npcm7xx.c b/drivers/usb/host/ehci-npcm7xx.c
index f4060b3cba1a..63af1a827fcb 100644
--- a/drivers/usb/host/ehci-npcm7xx.c
+++ b/drivers/usb/host/ehci-npcm7xx.c
@@ -24,7 +24,6 @@
 
 #define DRIVER_DESC "EHCI npcm7xx driver"
 
-static const char hcd_name[] = "npcm7xx-ehci";
 static struct hc_driver __read_mostly ehci_npcm7xx_hc_driver;
 
 static int __maybe_unused ehci_npcm7xx_drv_suspend(struct device *dev)
diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
index 2c8b1e6f1fff..a3454a3ea4e0 100644
--- a/drivers/usb/host/ehci-orion.c
+++ b/drivers/usb/host/ehci-orion.c
@@ -65,8 +65,6 @@ struct orion_ehci_hcd {
 	struct phy *phy;
 };
 
-static const char hcd_name[] = "ehci-orion";
-
 static struct hc_driver __read_mostly ehci_orion_hc_driver;
 
 /*
diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index 50491eea9409..fe497c876d76 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -53,8 +53,6 @@ struct ehci_platform_priv {
 	struct delayed_work poll_work;
 };
 
-static const char hcd_name[] = "ehci-platform";
-
 static int ehci_platform_reset(struct usb_hcd *hcd)
 {
 	struct platform_device *pdev = to_platform_device(hcd->self.controller);
diff --git a/drivers/usb/host/ehci-spear.c b/drivers/usb/host/ehci-spear.c
index 13369289d9cc..c4ddd1022f60 100644
--- a/drivers/usb/host/ehci-spear.c
+++ b/drivers/usb/host/ehci-spear.c
@@ -24,8 +24,6 @@
 
 #define DRIVER_DESC "EHCI SPEAr driver"
 
-static const char hcd_name[] = "SPEAr-ehci";
-
 struct spear_ehci {
 	struct clk *clk;
 };
diff --git a/drivers/usb/host/ehci-st.c b/drivers/usb/host/ehci-st.c
index 1086078133f8..f731dc98c533 100644
--- a/drivers/usb/host/ehci-st.c
+++ b/drivers/usb/host/ehci-st.c
@@ -42,8 +42,6 @@ struct st_ehci_platform_priv {
 #define hcd_to_ehci_priv(h) \
 	((struct st_ehci_platform_priv *)hcd_to_ehci(h)->priv)
 
-static const char hcd_name[] = "ehci-st";
-
 #define EHCI_CAPS_SIZE 0x10
 #define AHB2STBUS_INSREG01 (EHCI_CAPS_SIZE + 0x84)
 
diff --git a/drivers/usb/host/ohci-at91.c b/drivers/usb/host/ohci-at91.c
index adf0998f0299..533537ef3c21 100644
--- a/drivers/usb/host/ohci-at91.c
+++ b/drivers/usb/host/ohci-at91.c
@@ -62,8 +62,6 @@ struct ohci_at91_priv {
 
 #define DRIVER_DESC "OHCI Atmel driver"
 
-static const char hcd_name[] = "ohci-atmel";
-
 static struct hc_driver __read_mostly ohci_at91_hc_driver;
 
 static const struct ohci_driver_overrides ohci_at91_drv_overrides __initconst = {
diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index a060be6ae274..8d7977fd5d3b 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -21,7 +21,6 @@
 
 #define DRIVER_DESC "OHCI Exynos driver"
 
-static const char hcd_name[] = "ohci-exynos";
 static struct hc_driver __read_mostly exynos_ohci_hc_driver;
 
 #define to_exynos_ohci(hcd) (struct exynos_ohci_hcd *)(hcd_to_ohci(hcd)->priv)
diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index 79f5c4e08c52..a84305091c43 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -41,8 +41,6 @@ struct ohci_platform_priv {
 	struct reset_control *resets;
 };
 
-static const char hcd_name[] = "ohci-platform";
-
 static int ohci_platform_power_on(struct platform_device *dev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(dev);
diff --git a/drivers/usb/host/ohci-pxa27x.c b/drivers/usb/host/ohci-pxa27x.c
index f2504b884e92..a1dad8745622 100644
--- a/drivers/usb/host/ohci-pxa27x.c
+++ b/drivers/usb/host/ohci-pxa27x.c
@@ -114,8 +114,6 @@
 
 #define PXA_UHC_MAX_PORTNUM    3
 
-static const char hcd_name[] = "ohci-pxa27x";
-
 static struct hc_driver __read_mostly ohci_pxa27x_hc_driver;
 
 struct pxa27x_ohci {
diff --git a/drivers/usb/host/ohci-s3c2410.c b/drivers/usb/host/ohci-s3c2410.c
index 7207c7a3cf49..85a0a9ae0095 100644
--- a/drivers/usb/host/ohci-s3c2410.c
+++ b/drivers/usb/host/ohci-s3c2410.c
@@ -39,8 +39,6 @@
 
 #define DRIVER_DESC "OHCI S3C2410 driver"
 
-static const char hcd_name[] = "ohci-s3c2410";
-
 static struct clk *clk;
 static struct clk *usb_clk;
 
diff --git a/drivers/usb/host/ohci-spear.c b/drivers/usb/host/ohci-spear.c
index 71a3f18fe1be..196951a27f3f 100644
--- a/drivers/usb/host/ohci-spear.c
+++ b/drivers/usb/host/ohci-spear.c
@@ -23,7 +23,6 @@
 
 #define DRIVER_DESC "OHCI SPEAr driver"
 
-static const char hcd_name[] = "SPEAr-ohci";
 struct spear_ohci {
 	struct clk *clk;
 };
diff --git a/drivers/usb/host/ohci-st.c b/drivers/usb/host/ohci-st.c
index 2e542a344aae..82eef3c62e11 100644
--- a/drivers/usb/host/ohci-st.c
+++ b/drivers/usb/host/ohci-st.c
@@ -40,8 +40,6 @@ struct st_ohci_platform_priv {
 #define hcd_to_ohci_priv(h) \
 	((struct st_ohci_platform_priv *)hcd_to_ohci(h)->priv)
 
-static const char hcd_name[] = "ohci-st";
-
 static int st_ohci_platform_power_on(struct platform_device *dev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(dev);
diff --git a/drivers/usb/host/u132-hcd.c b/drivers/usb/host/u132-hcd.c
index d879d6af5710..95240c9c45bd 100644
--- a/drivers/usb/host/u132-hcd.c
+++ b/drivers/usb/host/u132-hcd.c
@@ -3190,7 +3190,6 @@ static int __init u132_hcd_init(void)
 	u132_exiting = 0;
 	if (usb_disabled())
 		return -ENODEV;
-	printk(KERN_INFO "driver %s\n", hcd_name);
 	workqueue = create_singlethread_workqueue("u132");
 	if (!workqueue)
 		return -ENOMEM;
diff --git a/drivers/usb/host/uhci-hcd.c b/drivers/usb/host/uhci-hcd.c
index d90b869f5f40..c22b51af83fc 100644
--- a/drivers/usb/host/uhci-hcd.c
+++ b/drivers/usb/host/uhci-hcd.c
@@ -867,8 +867,6 @@ static int __init uhci_hcd_init(void)
 	if (usb_disabled())
 		return -ENODEV;
 
-	printk(KERN_INFO "uhci_hcd: " DRIVER_DESC "%s\n",
-			ignore_oc ? ", overcurrent ignored" : "");
 	set_bit(USB_UHCI_LOADED, &usb_hcds_loaded);
 
 #ifdef CONFIG_DYNAMIC_DEBUG
-- 
2.35.1

