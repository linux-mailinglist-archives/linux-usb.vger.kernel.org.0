Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0218477EE8E
	for <lists+linux-usb@lfdr.de>; Thu, 17 Aug 2023 03:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347447AbjHQBKJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Aug 2023 21:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347485AbjHQBJr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Aug 2023 21:09:47 -0400
Received: from vps3.drown.org (vps3.drown.org [96.126.122.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C521E19E
        for <linux-usb@vger.kernel.org>; Wed, 16 Aug 2023 18:09:45 -0700 (PDT)
X-Envelope-From: dan-netdev@drown.org
Received: from vps3.drown.org (vps3.drown.org [IPv6:2600:3c00::f03c:91ff:fedf:5654])
        by vps3.drown.org (Postfix) with ESMTPSA id A0E583A0591;
        Wed, 16 Aug 2023 20:09:44 -0500 (CDT)
Date:   Wed, 16 Aug 2023 20:09:43 -0500
From:   Dan Drown <dan-netdev@drown.org>
To:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: [PATCH] usb: cdc-acm: move ldisc dcd notification outside of acm's
 read lock
Message-ID: <ZN1zV/zjPgpGlHXo@vps3.drown.org>
References: <2e5758f57081786db37482a50bc0e58b@f9ae53fa8754>
 <cf57f9ef-90f4-7ef5-405e-78f79007f7bc@suse.com>
 <ZNzaYJ7CC/G280ct@vps3.drown.org>
 <1eb2b49d-52c9-c113-7c60-81634edfd646@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1eb2b49d-52c9-c113-7c60-81634edfd646@suse.com>
X-Spam-Status: No, score=1.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

dcd_change notification call moved outside of the acm->read_lock
to protect any future tty ldisc that calls wait_serial_change()

Signed-off-by: Dan Drown <dan-netdev@drown.org>
---
 drivers/usb/class/cdc-acm.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 9b34199474c4..dfb28c7c3069 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -319,23 +319,24 @@ static void acm_process_notification(struct acm *acm, unsigned char *buf)
 		}
 
 		difference = acm->ctrlin ^ newctrl;
+
+		if ((difference & USB_CDC_SERIAL_STATE_DCD) && acm->port.tty) {
+			struct tty_ldisc *ld = tty_ldisc_ref(acm->port.tty);
+			if (ld) {
+				if (ld->ops->dcd_change)
+					ld->ops->dcd_change(acm->port.tty, newctrl & USB_CDC_SERIAL_STATE_DCD);
+				tty_ldisc_deref(ld);
+			}
+		}
+
 		spin_lock_irqsave(&acm->read_lock, flags);
 		acm->ctrlin = newctrl;
 		acm->oldcount = acm->iocount;
 
 		if (difference & USB_CDC_SERIAL_STATE_DSR)
 			acm->iocount.dsr++;
-		if (difference & USB_CDC_SERIAL_STATE_DCD) {
-			if (acm->port.tty) {
-				struct tty_ldisc *ld = tty_ldisc_ref(acm->port.tty);
-				if (ld) {
-					if (ld->ops->dcd_change)
-						ld->ops->dcd_change(acm->port.tty, newctrl & USB_CDC_SERIAL_STATE_DCD);
-					tty_ldisc_deref(ld);
-				}
-			}
+		if (difference & USB_CDC_SERIAL_STATE_DCD)
 			acm->iocount.dcd++;
-		}
 		if (newctrl & USB_CDC_SERIAL_STATE_BREAK) {
 			acm->iocount.brk++;
 			tty_insert_flip_char(&acm->port, 0, TTY_BREAK);
-- 
2.41.0

