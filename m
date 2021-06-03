Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67D6639A52B
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jun 2021 17:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbhFCQBO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Jun 2021 12:01:14 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:33017 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229922AbhFCQBN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Jun 2021 12:01:13 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 443505C01B3;
        Thu,  3 Jun 2021 11:59:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 03 Jun 2021 11:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lassieur.org; h=
        from:to:cc:subject:date:message-id:mime-version:content-type
        :content-transfer-encoding; s=fm3; bh=FKaencyOJIIckXD48NYlMT/Yt7
        QnYZdwexcdK5P4E7o=; b=AtlqY4pnT1k/VMiueBrXphj+GG+/EMrRDu3lwpVuGo
        7A0U8DOXHJcpPx1zc0Y+lbvq3MvagHyqriexDm4Klcr6TgRHY0YGZkbwiHzceq4W
        /dIRpSCwFLMU7MHf1JqxAs2U+OMzU7nmqD4FUMufdNvPIVBKDATpoHmHyO40iYk8
        0S9Js93TkNBwOp9kd/I/u5drO/tTU1TLTCp2Ayt0dG/dTbD/qc9wYjBV435nRrtC
        nYUaDFEceqILUsf6vzREHr5LY+swZxgsHFmwn3k8+u7JXPlB2iDoAIzQqfXdHUWB
        prUohK9bQKPM1C0SUMnzbjJJfmr+GgVlDW2rvVTuHEvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FKaenc
        yOJIIckXD48NYlMT/Yt7QnYZdwexcdK5P4E7o=; b=O5iuWm+tlHEMz1PCfIICMh
        0S/6qV8M8AjzAtg3i6SmrmT8fSM6g9lJAeuMWawSt8a4HAPAlmVTn8jJjynuY65Q
        S9r7H7y2VUodugT4kEflsYeVVkIesRmF4NEnYIWdHEsvvCOsj/M/uwVOvLk9DuUn
        2Ld/ot97rzBoewpqBxAVkcGJcWLk/QrPSDaevEs1M0G9o6XcWdL3Y+IV7TlJ30Ev
        R2Rs00AtIIOQGtd149YyprmvepK+g7AENnrBHOOdHI4ptLQ1c8RfC3/KmQHAYeJy
        kUi3AnNQ66eCYkxhdTdmf5scyVSBb5SrC7KwXkEYVWHC6cHQfeQK3O+xRNsR7FPQ
        ==
X-ME-Sender: <xms:Xvy4YF4-P5wbj_LX8jKrfOPGu1yghxnV5FCB-l0Wxa983eC1rJMLeQ>
    <xme:Xvy4YC4elKPa49EyFReXH3em3LlwtadVB78K4tszQi5Rq3jZ1jBymAjZme0bHX36L
    yiuiaR-BCCsctuaJwg>
X-ME-Received: <xmr:Xvy4YMeF9manpqVZEkkfKjPsx552QqPRzm-eS2F7d-YCqbemKtzp33pgvAtvI94pgNI4Qso2Tdzz5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelledgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofggtgfgsehtkeertd
    ertdejnecuhfhrohhmpeevlhormhgvnhhtucfnrghsshhivghurhcuoegtlhgvmhgvnhht
    sehlrghsshhivghurhdrohhrgheqnecuggftrfgrthhtvghrnhepgeffudfhveeiveefge
    fghffhveeuieejgedvfeeuvedutedtudeijeefgfffudeunecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghlvghmvghntheslhgrshhsihgvuh
    hrrdhorhhg
X-ME-Proxy: <xmx:Xvy4YOIrf32uXIu4ZUVZOuGQBNiGndy7Qpxt2A_OrqBFN1wydjm7IA>
    <xmx:Xvy4YJJ_Ll3ALIIaPD12HkSbk4SiIHrRsLqLefiZtV2cAv1rUfq6dw>
    <xmx:Xvy4YHwZ6Cp9yhbC0XkQ8WxFxmNMh7pV-EsduQEweCRmw0Ib7iAtdQ>
    <xmx:YPy4YJ2yU0i0ikUZ2csJZaiiYWAVkWglpmqZFzCafPICeXNnNXwAcw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jun 2021 11:59:26 -0400 (EDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20Lassieur?= <clement@lassieur.org>
To:     linux-usb@vger.kernel.org
Cc:     hminas@synopsys.com, jmaselbas@kalray.eu,
        felipe.balbi@linux.intel.com,
        =?UTF-8?q?Cl=C3=A9ment=20Lassieur?= <clement@lassieur.org>
Subject: [PATCH] usb: dwc2: Don't reset the core after setting turnaround time
Date:   Thu,  3 Jun 2021 17:59:21 +0200
Message-Id: <20210603155921.940651-1-clement@lassieur.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Every time the hub signals a reset while we (device) are hsotg->connected,
dwc2_hsotg_core_init_disconnected() is called, which in turn calls
dwc2_hs_phy_init().

GUSBCFG.USBTrdTim is cleared upon Core Soft Reset, so if
hsotg->params.phy_utmi_width is 8-bit, the value of GUSBCFG.USBTrdTim (the
default one: 0x5, corresponding to 16-bit) is always different from
hsotg->params.phy_utmi_width, thus dwc2_core_reset() is called every
time (usbcfg != usbcfg_old), which causes 2 issues:

1) The call to dwc2_core_reset() does another reset 300us after the initial
Chirp K of the first reset (which should last at least Tuch = 1ms), and
messes up the High-speed Detection Handshake: both hub and device drive
current into the D+ and D- lines at the same time.

2) GUSBCFG.USBTrdTim is cleared by the second reset, so its value is always
the default one (0x5).

Setting GUSBCFG.USBTrdTim after the potential call to dwc2_core_reset()
fixes both issues.  It is now set even when select_phy is false because the
cost of the Core Soft Reset is removed.

Fixes: 1e868545f2bb ("usb: dwc2: gadget: Move gadget phy init into core phy init")
Signed-off-by: Clément Lassieur <clement@lassieur.org>
---
 drivers/usb/dwc2/core.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index 6f70ab9577b4..272ae5722c86 100644
--- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -1111,15 +1111,6 @@ static int dwc2_hs_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
 		usbcfg &= ~(GUSBCFG_ULPI_UTMI_SEL | GUSBCFG_PHYIF16);
 		if (hsotg->params.phy_utmi_width == 16)
 			usbcfg |= GUSBCFG_PHYIF16;
-
-		/* Set turnaround time */
-		if (dwc2_is_device_mode(hsotg)) {
-			usbcfg &= ~GUSBCFG_USBTRDTIM_MASK;
-			if (hsotg->params.phy_utmi_width == 16)
-				usbcfg |= 5 << GUSBCFG_USBTRDTIM_SHIFT;
-			else
-				usbcfg |= 9 << GUSBCFG_USBTRDTIM_SHIFT;
-		}
 		break;
 	default:
 		dev_err(hsotg->dev, "FS PHY selected at HS!\n");
@@ -1141,6 +1132,24 @@ static int dwc2_hs_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
 	return retval;
 }
 
+static void dwc2_set_turnaround_time(struct dwc2_hsotg *hsotg)
+{
+	u32 usbcfg;
+
+	if (hsotg->params.phy_type != DWC2_PHY_TYPE_PARAM_UTMI)
+		return;
+
+	usbcfg = dwc2_readl(hsotg, GUSBCFG);
+
+	usbcfg &= ~GUSBCFG_USBTRDTIM_MASK;
+	if (hsotg->params.phy_utmi_width == 16)
+		usbcfg |= 5 << GUSBCFG_USBTRDTIM_SHIFT;
+	else
+		usbcfg |= 9 << GUSBCFG_USBTRDTIM_SHIFT;
+
+	dwc2_writel(hsotg, usbcfg, GUSBCFG);
+}
+
 int dwc2_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
 {
 	u32 usbcfg;
@@ -1158,6 +1167,9 @@ int dwc2_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
 		retval = dwc2_hs_phy_init(hsotg, select_phy);
 		if (retval)
 			return retval;
+
+		if (dwc2_is_device_mode(hsotg))
+			dwc2_set_turnaround_time(hsotg);
 	}
 
 	if (hsotg->hw_params.hs_phy_type == GHWCFG2_HS_PHY_TYPE_ULPI &&
-- 
2.30.1

