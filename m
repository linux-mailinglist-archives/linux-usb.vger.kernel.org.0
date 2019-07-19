Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0BF6E2C0
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jul 2019 10:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbfGSIoN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jul 2019 04:44:13 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44449 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbfGSIoM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Jul 2019 04:44:12 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1hoOUp-00006H-N9; Fri, 19 Jul 2019 10:44:07 +0200
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Richard Leitner <richard.leitner@skidata.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: [PATCH 1/3] Revert "usb: usb251xb: Add US lanes inversion dts-bindings"
Date:   Fri, 19 Jul 2019 10:44:05 +0200
Message-Id: <20190719084407.28041-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
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

This reverts commit 3342ce35a1, as there is no need for this separate
property and it breaks compatibility with existing devicetree files
(arch/arm64/boot/dts/freescale/imx8mq.dtsi).

CC: stable@vger.kernel.org #5.2
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 Documentation/devicetree/bindings/usb/usb251xb.txt | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
index bc7945e9dbfe..17915f64b8ee 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.txt
+++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
@@ -64,10 +64,8 @@ Optional properties :
  - power-on-time-ms : Specifies the time it takes from the time the host
 	initiates the power-on sequence to a port until the port has adequate
 	power. The value is given in ms in a 0 - 510 range (default is 100ms).
- - swap-dx-lanes : Specifies the downstream ports which will swap the
-	differential-pair (D+/D-), default is not-swapped.
- - swap-us-lanes : Selects the upstream port differential-pair (D+/D-)
-	swapping (boolean, default is not-swapped)
+ - swap-dx-lanes : Specifies the ports which will swap the differential-pair
+	(D+/D-), default is not-swapped.
 
 Examples:
 	usb2512b@2c {
-- 
2.20.1

