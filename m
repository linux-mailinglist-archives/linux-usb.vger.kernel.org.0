Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A73946E2BE
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jul 2019 10:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbfGSIoM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jul 2019 04:44:12 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54589 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfGSIoM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Jul 2019 04:44:12 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1hoOUp-00006H-Pk; Fri, 19 Jul 2019 10:44:07 +0200
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Richard Leitner <richard.leitner@skidata.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: [PATCH 2/3] Revert "usb: usb251xb: Add US port lanes inversion property"
Date:   Fri, 19 Jul 2019 10:44:06 +0200
Message-Id: <20190719084407.28041-2-l.stach@pengutronix.de>
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

This property isn't needed and not yet used anywhere. The swap-dx-lanes
property is perfectly fine for doing the swap on the upstream port
lanes.

CC: stable@vger.kernel.org #5.2
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/usb/misc/usb251xb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 4d6ae3795a88..119aeb658c81 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -574,8 +574,6 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	hub->port_swap = USB251XB_DEF_PORT_SWAP;
 	usb251xb_get_ports_field(hub, "swap-dx-lanes", data->port_cnt,
 				 &hub->port_swap);
-	if (of_get_property(np, "swap-us-lanes", NULL))
-		hub->port_swap |= BIT(0);
 
 	/* The following parameters are currently not exposed to devicetree, but
 	 * may be as soon as needed.
-- 
2.20.1

