Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA002771344
	for <lists+linux-usb@lfdr.de>; Sun,  6 Aug 2023 04:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjHFCdE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Aug 2023 22:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjHFCdD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Aug 2023 22:33:03 -0400
X-Greylist: delayed 406 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 05 Aug 2023 19:33:02 PDT
Received: from vps3.drown.org (vps3.drown.org [96.126.122.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 554231FEB
        for <linux-usb@vger.kernel.org>; Sat,  5 Aug 2023 19:33:02 -0700 (PDT)
X-Envelope-From: dan-netdev@drown.org
Received: from vps3.drown.org (vps3.drown.org [IPv6:2600:3c00::f03c:91ff:fedf:5654])
        by vps3.drown.org (Postfix) with ESMTPSA id 32C9B3A04EC
        for <linux-usb@vger.kernel.org>; Sat,  5 Aug 2023 21:26:15 -0500 (CDT)
Date:   Sat, 5 Aug 2023 21:26:13 -0500
From:   Dan Drown <dan-netdev@drown.org>
To:     linux-usb@vger.kernel.org
Subject: [PATCH] usb: cdc-acm: add PPS support
Message-ID: <ZM8ExV6bAvJtIA1d@vps3.drown.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=1.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds support for PPS to CDC devices. Changes to the DCD pin
are monitored and passed to the ldisc system, which is used by
pps-ldisc.

Signed-off-by: Dan Drown <dan-netdev@drown.org>
---
 drivers/usb/class/cdc-acm.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 11da5fb284d0..9b34199474c4 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -28,6 +28,7 @@
 #include <linux/serial.h>
 #include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
+#include <linux/tty_ldisc.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/uaccess.h>
@@ -324,8 +325,17 @@ static void acm_process_notification(struct acm *acm, unsigned char *buf)
 
 		if (difference & USB_CDC_SERIAL_STATE_DSR)
 			acm->iocount.dsr++;
-		if (difference & USB_CDC_SERIAL_STATE_DCD)
+		if (difference & USB_CDC_SERIAL_STATE_DCD) {
+			if (acm->port.tty) {
+				struct tty_ldisc *ld = tty_ldisc_ref(acm->port.tty);
+				if (ld) {
+					if (ld->ops->dcd_change)
+						ld->ops->dcd_change(acm->port.tty, newctrl & USB_CDC_SERIAL_STATE_DCD);
+					tty_ldisc_deref(ld);
+				}
+			}
 			acm->iocount.dcd++;
+		}
 		if (newctrl & USB_CDC_SERIAL_STATE_BREAK) {
 			acm->iocount.brk++;
 			tty_insert_flip_char(&acm->port, 0, TTY_BREAK);
-- 
2.41.0

