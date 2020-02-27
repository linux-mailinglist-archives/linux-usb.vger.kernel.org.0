Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBAB3171532
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 11:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbgB0KmU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 05:42:20 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48845 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728846AbgB0KmU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Feb 2020 05:42:20 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7GcR-0003f7-Ay; Thu, 27 Feb 2020 11:42:15 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7GcP-0004nu-6A; Thu, 27 Feb 2020 11:42:13 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Peter.Chen@nxp.com, gregkh@linuxfoundation.org,
        shawnguo@kernel.org, linux-imx@nxp.com, stern@rowland.harvard.edu,
        jun.li@freescale.com
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 2/3] Partially Revert "usb: chipidea: host: turn on vbus before add hcd if early vbus on is required"
Date:   Thu, 27 Feb 2020 11:42:11 +0100
Message-Id: <20200227104212.12562-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200227104212.12562-1-m.felsch@pengutronix.de>
References: <20200227104212.12562-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit 659459174188 ("usb: chipidea: host: turn on vbus before add hcd if
early vbus on is required") enabled the vbus regulator but didn't assign
the reg_vbus. So the vbus regulator can't be disabled anymore.

Since the port_power() callback is executed exclusive (without enabling
the port power (PP) bit) we can do the special handling within the
callback without the need of a special flag.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/usb/chipidea/host.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index 48e4a5ca1835..f1832847a023 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -37,6 +37,8 @@ static int ehci_ci_portpower(struct usb_hcd *hcd, int portnum, bool enable)
 	struct ci_hdrc *ci = dev_get_drvdata(dev);
 	int ret = 0;
 	int port = HCS_N_PORTS(ehci->hcs_params);
+	u32 __iomem *status_reg = &ehci->regs->port_status[portnum];
+	u32 temp = ehci_readl(ehci, status_reg) & ~PORT_RWC_BITS;
 
 	if (priv->reg_vbus && enable != priv->enabled) {
 		if (port > 1) {
@@ -57,6 +59,11 @@ static int ehci_ci_portpower(struct usb_hcd *hcd, int portnum, bool enable)
 		priv->enabled = enable;
 	}
 
+	if (enable)
+		ehci_writel(ehci, temp | PORT_POWER, status_reg);
+	else
+		ehci_writel(ehci, temp & ~PORT_POWER, status_reg);
+
 	if (enable && (ci->platdata->phy_mode == USBPHY_INTERFACE_MODE_HSIC)) {
 		/*
 		 * Marvell 28nm HSIC PHY requires forcing the port to HS mode.
@@ -142,19 +149,8 @@ static int host_start(struct ci_hdrc *ci)
 	priv = (struct ehci_ci_priv *)ehci->priv;
 	priv->reg_vbus = NULL;
 
-	if (ci->platdata->reg_vbus && !ci_otg_is_fsm_mode(ci)) {
-		if (ci->platdata->flags & CI_HDRC_TURN_VBUS_EARLY_ON) {
-			ret = regulator_enable(ci->platdata->reg_vbus);
-			if (ret) {
-				dev_err(ci->dev,
-				"Failed to enable vbus regulator, ret=%d\n",
-									ret);
-				goto put_hcd;
-			}
-		} else {
-			priv->reg_vbus = ci->platdata->reg_vbus;
-		}
-	}
+	if (ci->platdata->reg_vbus && !ci_otg_is_fsm_mode(ci))
+		priv->reg_vbus = ci->platdata->reg_vbus;
 
 	if (ci->platdata->pins_host)
 		pinctrl_select_state(ci->platdata->pctl,
@@ -162,7 +158,7 @@ static int host_start(struct ci_hdrc *ci)
 
 	ret = usb_add_hcd(hcd, 0, 0);
 	if (ret) {
-		goto disable_reg;
+		goto put_hcd;
 	} else {
 		struct usb_otg *otg = &ci->otg;
 
@@ -181,10 +177,6 @@ static int host_start(struct ci_hdrc *ci)
 
 	return ret;
 
-disable_reg:
-	if (ci->platdata->reg_vbus && !ci_otg_is_fsm_mode(ci) &&
-			(ci->platdata->flags & CI_HDRC_TURN_VBUS_EARLY_ON))
-		regulator_disable(ci->platdata->reg_vbus);
 put_hcd:
 	usb_put_hcd(hcd);
 
@@ -203,9 +195,6 @@ static void host_stop(struct ci_hdrc *ci)
 		ci->role = CI_ROLE_END;
 		synchronize_irq(ci->irq);
 		usb_put_hcd(hcd);
-		if (ci->platdata->reg_vbus && !ci_otg_is_fsm_mode(ci) &&
-			(ci->platdata->flags & CI_HDRC_TURN_VBUS_EARLY_ON))
-				regulator_disable(ci->platdata->reg_vbus);
 	}
 	ci->hcd = NULL;
 	ci->otg.host = NULL;
-- 
2.20.1

