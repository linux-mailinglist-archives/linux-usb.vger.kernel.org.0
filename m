Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40B06A88FA
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 21:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730075AbfIDOsP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 10:48:15 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:34215 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727789AbfIDOsP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Sep 2019 10:48:15 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 3C4F43C04C1;
        Wed,  4 Sep 2019 16:48:11 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ltf0MkXfjDAh; Wed,  4 Sep 2019 16:48:05 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id A21723C005E;
        Wed,  4 Sep 2019 16:48:05 +0200 (CEST)
Received: from vmlxhi-070.adit-jv.com (10.72.93.148) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Wed, 4 Sep 2019
 16:48:05 +0200
From:   Veeraiyan Chidambaram <external.veeraiyan.c@de.adit-jv.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
CC:     <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
Subject: [PATCH v2] usb: gadget: udc: renesas_usb3: add suspend event support
Date:   Wed, 4 Sep 2019 16:48:01 +0200
Message-ID: <1567608481-771-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <TYAPR01MB454435E0431173D3C7F76D65D8B80@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <TYAPR01MB454435E0431173D3C7F76D65D8B80@TYAPR01MB4544.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.93.148]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>

In R-Car Gen3 USB 3.0 Function, if host is detached an interrupt
will be generated and Suspended state bit is set in interrupt status
register. Interrupt handler will call driver->suspend(composite_suspend)
if suspended state bit is set. composite_suspend will call
ffs_func_suspend which will post FUNCTIONFS_SUSPEND and will be consumed
by user space application via /dev/ep0.

To be able to detect the host detach, USB_INT_1_B2_SPND to cover the
Suspended bit of the B2_SPND_OUT[9] from the USB Status Register
(USB_STA) register and perform appropriate action in the
usb3_irq_epc_int_1 function.

Without this commit, disconnection of the phone from R-Car H3 ES2.0
Salvator-X CN11 port is not recognized and reverse role switch does
not happen. If phone is connected again it does not enumerate.

With this commit, disconnection will be recognized and reverse role
switch will happen by a user space application. If phone is connected
again it will enumerate properly and will become visible in the
output of 'lsusb'.

Signed-off-by: Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index eaa3339b30a2..8d5207afdad9 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -767,6 +767,20 @@ static void usb3_irq_epc_int_1_resume(struct renesas_usb3 *usb3)
 	usb3_transition_to_default_state(usb3, false);
 }
 
+static void usb3_irq_epc_int_1_suspend(struct renesas_usb3 *usb3)
+{
+	usb3_disable_irq_1(usb3, USB_INT_1_B2_SPND);
+
+	if (usb3->driver &&
+	    usb3->driver->suspend &&
+	    usb3->gadget.speed != USB_SPEED_UNKNOWN &&
+	    usb3->gadget.state != USB_STATE_NOTATTACHED) {
+		if (usb3->driver && usb3->driver->suspend)
+			usb3->driver->suspend(&usb3->gadget);
+		usb_gadget_set_state(&usb3->gadget, USB_STATE_SUSPENDED);
+	}
+}
+
 static void usb3_irq_epc_int_1_disable(struct renesas_usb3 *usb3)
 {
 	usb3_stop_usb3_connection(usb3);
@@ -852,6 +866,9 @@ static void usb3_irq_epc_int_1(struct renesas_usb3 *usb3, u32 int_sta_1)
 	if (int_sta_1 & USB_INT_1_B2_RSUM)
 		usb3_irq_epc_int_1_resume(usb3);
 
+	if (int_sta_1 & USB_INT_1_B2_SPND)
+		usb3_irq_epc_int_1_suspend(usb3);
+
 	if (int_sta_1 & USB_INT_1_SPEED)
 		usb3_irq_epc_int_1_speed(usb3);
 
-- 
2.7.4

