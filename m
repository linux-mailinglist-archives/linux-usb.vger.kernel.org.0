Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED24DD42B
	for <lists+linux-usb@lfdr.de>; Sat, 19 Oct 2019 00:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404867AbfJRWWr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 18:22:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:37618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729994AbfJRWFm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Oct 2019 18:05:42 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1CD7B22466;
        Fri, 18 Oct 2019 22:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571436342;
        bh=0K1mygL3oJRRaNMfeI7bjrL+a8KoQGX3ZDU9u0jJ3dg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ns2Y0BsaTOL1itcmphvGQvwKU1aft6McU0dNenmYMuXazh0+uWKzpxoynnZJW+fGw
         +Z/Q0Abizk8GoAPF7ysPFTFAdvGAIReqOqgMUi7AOB/zgl2cDrZ5Gvv9tNaa0vHtcT
         NJ0zja0qeKugXoG7lisjtpdCNM/aECQWWrdAsEYs=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Fabrice Gasnier <fabrice.gasnier@st.com>,
        Artur Petrosyan <arturp@synopsys.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 009/100] usb: dwc2: fix unbalanced use of external vbus-supply
Date:   Fri, 18 Oct 2019 18:03:54 -0400
Message-Id: <20191018220525.9042-9-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018220525.9042-1-sashal@kernel.org>
References: <20191018220525.9042-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Fabrice Gasnier <fabrice.gasnier@st.com>

[ Upstream commit cd7cd0e6cedfda8da6668a4af6748f96bbb6fed4 ]

When using external vbus supply regulator, it should be enabled
synchronously with PWR bit in HPRT register. This also fixes
unbalanced use of this optional regulator (This can be reproduced
easily when unbinding the driver).

Fixes: 531ef5ebea96 ("usb: dwc2: add support for host mode external
vbus supply")

Tested-by: Artur Petrosyan <arturp@synopsys.com>
Acked-by: Minas Harutyunyan <hminas@synopsys.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/dwc2/hcd.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index aad7edc29bddd..a5c8329fd4625 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -3568,6 +3568,7 @@ static int dwc2_hcd_hub_control(struct dwc2_hsotg *hsotg, u16 typereq,
 	u32 port_status;
 	u32 speed;
 	u32 pcgctl;
+	u32 pwr;
 
 	switch (typereq) {
 	case ClearHubFeature:
@@ -3616,8 +3617,11 @@ static int dwc2_hcd_hub_control(struct dwc2_hsotg *hsotg, u16 typereq,
 			dev_dbg(hsotg->dev,
 				"ClearPortFeature USB_PORT_FEAT_POWER\n");
 			hprt0 = dwc2_read_hprt0(hsotg);
+			pwr = hprt0 & HPRT0_PWR;
 			hprt0 &= ~HPRT0_PWR;
 			dwc2_writel(hsotg, hprt0, HPRT0);
+			if (pwr)
+				dwc2_vbus_supply_exit(hsotg);
 			break;
 
 		case USB_PORT_FEAT_INDICATOR:
@@ -3827,8 +3831,11 @@ static int dwc2_hcd_hub_control(struct dwc2_hsotg *hsotg, u16 typereq,
 			dev_dbg(hsotg->dev,
 				"SetPortFeature - USB_PORT_FEAT_POWER\n");
 			hprt0 = dwc2_read_hprt0(hsotg);
+			pwr = hprt0 & HPRT0_PWR;
 			hprt0 |= HPRT0_PWR;
 			dwc2_writel(hsotg, hprt0, HPRT0);
+			if (!pwr)
+				dwc2_vbus_supply_init(hsotg);
 			break;
 
 		case USB_PORT_FEAT_RESET:
@@ -3845,6 +3852,7 @@ static int dwc2_hcd_hub_control(struct dwc2_hsotg *hsotg, u16 typereq,
 			dwc2_writel(hsotg, 0, PCGCTL);
 
 			hprt0 = dwc2_read_hprt0(hsotg);
+			pwr = hprt0 & HPRT0_PWR;
 			/* Clear suspend bit if resetting from suspend state */
 			hprt0 &= ~HPRT0_SUSP;
 
@@ -3858,6 +3866,8 @@ static int dwc2_hcd_hub_control(struct dwc2_hsotg *hsotg, u16 typereq,
 				dev_dbg(hsotg->dev,
 					"In host mode, hprt0=%08x\n", hprt0);
 				dwc2_writel(hsotg, hprt0, HPRT0);
+				if (!pwr)
+					dwc2_vbus_supply_init(hsotg);
 			}
 
 			/* Clear reset bit in 10ms (FS/LS) or 50ms (HS) */
@@ -4400,6 +4410,7 @@ static int _dwc2_hcd_start(struct usb_hcd *hcd)
 	struct dwc2_hsotg *hsotg = dwc2_hcd_to_hsotg(hcd);
 	struct usb_bus *bus = hcd_to_bus(hcd);
 	unsigned long flags;
+	u32 hprt0;
 	int ret;
 
 	dev_dbg(hsotg->dev, "DWC OTG HCD START\n");
@@ -4416,12 +4427,16 @@ static int _dwc2_hcd_start(struct usb_hcd *hcd)
 
 	dwc2_hcd_reinit(hsotg);
 
-	/* enable external vbus supply before resuming root hub */
-	spin_unlock_irqrestore(&hsotg->lock, flags);
-	ret = dwc2_vbus_supply_init(hsotg);
-	if (ret)
-		return ret;
-	spin_lock_irqsave(&hsotg->lock, flags);
+	hprt0 = dwc2_read_hprt0(hsotg);
+	/* Has vbus power been turned on in dwc2_core_host_init ? */
+	if (hprt0 & HPRT0_PWR) {
+		/* Enable external vbus supply before resuming root hub */
+		spin_unlock_irqrestore(&hsotg->lock, flags);
+		ret = dwc2_vbus_supply_init(hsotg);
+		if (ret)
+			return ret;
+		spin_lock_irqsave(&hsotg->lock, flags);
+	}
 
 	/* Initialize and connect root hub if one is not already attached */
 	if (bus->root_hub) {
@@ -4443,6 +4458,7 @@ static void _dwc2_hcd_stop(struct usb_hcd *hcd)
 {
 	struct dwc2_hsotg *hsotg = dwc2_hcd_to_hsotg(hcd);
 	unsigned long flags;
+	u32 hprt0;
 
 	/* Turn off all host-specific interrupts */
 	dwc2_disable_host_interrupts(hsotg);
@@ -4451,6 +4467,7 @@ static void _dwc2_hcd_stop(struct usb_hcd *hcd)
 	synchronize_irq(hcd->irq);
 
 	spin_lock_irqsave(&hsotg->lock, flags);
+	hprt0 = dwc2_read_hprt0(hsotg);
 	/* Ensure hcd is disconnected */
 	dwc2_hcd_disconnect(hsotg, true);
 	dwc2_hcd_stop(hsotg);
@@ -4459,7 +4476,9 @@ static void _dwc2_hcd_stop(struct usb_hcd *hcd)
 	clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
 	spin_unlock_irqrestore(&hsotg->lock, flags);
 
-	dwc2_vbus_supply_exit(hsotg);
+	/* keep balanced supply init/exit by checking HPRT0_PWR */
+	if (hprt0 & HPRT0_PWR)
+		dwc2_vbus_supply_exit(hsotg);
 
 	usleep_range(1000, 3000);
 }
-- 
2.20.1

