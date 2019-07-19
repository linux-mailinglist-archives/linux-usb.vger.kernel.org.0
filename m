Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4926E2BD
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jul 2019 10:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfGSIoM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jul 2019 04:44:12 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44889 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbfGSIoM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Jul 2019 04:44:12 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1hoOUp-00006H-SO; Fri, 19 Jul 2019 10:44:07 +0200
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Richard Leitner <richard.leitner@skidata.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: [PATCH 3/3] usb: usb251xb: Reallow swap-dx-lanes to apply to the upstream port
Date:   Fri, 19 Jul 2019 10:44:07 +0200
Message-Id: <20190719084407.28041-3-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719084407.28041-1-l.stach@pengutronix.de>
References: <20190719084407.28041-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a partial revert of 73d31def1aab "usb: usb251xb: Create a ports
field collector method", which broke a existing devicetree
(arch/arm64/boot/dts/freescale/imx8mq.dtsi).

There is no reason why the swap-dx-lanes property should not apply to
the upstream port. The reason given in the breaking commit was that it's
inconsitent with respect to other port properties, but in fact it is not.
All other properties which only apply to the downstream ports explicitly
reject port 0, so there is pretty strong precedence that the driver
referred to the upstream port as port 0. So there is no inconsistency in
this property at all, other than the swapping being also applicable to
the upstream port.

CC: stable@vger.kernel.org #5.2
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/usb/misc/usb251xb.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 119aeb658c81..6ca9111d150a 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -375,7 +375,8 @@ static int usb251xb_connect(struct usb251xb *hub)
 
 #ifdef CONFIG_OF
 static void usb251xb_get_ports_field(struct usb251xb *hub,
-				    const char *prop_name, u8 port_cnt, u8 *fld)
+				    const char *prop_name, u8 port_cnt,
+				    bool ds_only, u8 *fld)
 {
 	struct device *dev = hub->dev;
 	struct property *prop;
@@ -383,7 +384,7 @@ static void usb251xb_get_ports_field(struct usb251xb *hub,
 	u32 port;
 
 	of_property_for_each_u32(dev->of_node, prop_name, prop, p, port) {
-		if ((port >= 1) && (port <= port_cnt))
+		if ((port >= ds_only ? 1 : 0) && (port <= port_cnt))
 			*fld |= BIT(port);
 		else
 			dev_warn(dev, "port %u doesn't exist\n", port);
@@ -501,15 +502,15 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 
 	hub->non_rem_dev = USB251XB_DEF_NON_REMOVABLE_DEVICES;
 	usb251xb_get_ports_field(hub, "non-removable-ports", data->port_cnt,
-				 &hub->non_rem_dev);
+				 true, &hub->non_rem_dev);
 
 	hub->port_disable_sp = USB251XB_DEF_PORT_DISABLE_SELF;
 	usb251xb_get_ports_field(hub, "sp-disabled-ports", data->port_cnt,
-				 &hub->port_disable_sp);
+				 true, &hub->port_disable_sp);
 
 	hub->port_disable_bp = USB251XB_DEF_PORT_DISABLE_BUS;
 	usb251xb_get_ports_field(hub, "bp-disabled-ports", data->port_cnt,
-				 &hub->port_disable_bp);
+				 true, &hub->port_disable_bp);
 
 	hub->max_power_sp = USB251XB_DEF_MAX_POWER_SELF;
 	if (!of_property_read_u32(np, "sp-max-total-current-microamp",
@@ -573,7 +574,7 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	 */
 	hub->port_swap = USB251XB_DEF_PORT_SWAP;
 	usb251xb_get_ports_field(hub, "swap-dx-lanes", data->port_cnt,
-				 &hub->port_swap);
+				 false, &hub->port_swap);
 
 	/* The following parameters are currently not exposed to devicetree, but
 	 * may be as soon as needed.
-- 
2.20.1

