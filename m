Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF7DAD757
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2019 12:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732240AbfIIKzC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Sep 2019 06:55:02 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:55003 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729175AbfIIKzB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Sep 2019 06:55:01 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id AB5FB3C0579;
        Mon,  9 Sep 2019 12:54:58 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VIJIoWAipsX1; Mon,  9 Sep 2019 12:54:52 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 5F5353C0016;
        Mon,  9 Sep 2019 12:54:52 +0200 (CEST)
Received: from vmlxhi-070.adit-jv.com (10.72.93.148) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 9 Sep 2019
 12:54:51 +0200
From:   Veeraiyan Chidambaram <external.veeraiyan.c@de.adit-jv.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
CC:     <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        <external.veeraiyan.c@de.adit-jv.com>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
Subject: [PATCH v3 1/3] usb: renesas_usbhs: enable DVSE interrupt
Date:   Mon, 9 Sep 2019 12:54:39 +0200
Message-ID: <1568026481-17827-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.93.148]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Eugeniu Rosca <erosca@de.adit-jv.com>

Commit [1] enabled the possibility of checking the DVST (Device State
Transition) bit of INTSTS0 (Interrupt Status Register 0) and calling
the irq_dev_state() handler if the DVST bit is set. But neither
commit [1] nor commit [2] actually enabled the DVSE (Device State
Transition Interrupt Enable) bit in the INTENB0 (Interrupt Enable
Register 0). As a consequence, irq_dev_state() handler is getting
called as a side effect of other (non-DVSE) interrupts being fired,
which definitely can't be relied upon, if DVST notifications are of
any value.

Why this doesn't hurt is because usbhsg_irq_dev_state() currently
doesn't do much except of a dev_dbg(). Once more work is added to
the handler (e.g. detecting device "Suspended" state and notifying
other USB gadget components about it), enabling DVSE becomes a hard
requirement. Do it in a standalone commit for better visibility and
clear explanation.

[1] f1407d5 ("usb: renesas_usbhs: Add Renesas USBHS common code")
[2] 2f98382 ("usb: renesas_usbhs: Add Renesas USBHS Gadget")

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Signed-off-by: Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
---
 drivers/usb/renesas_usbhs/mod.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/mod.c b/drivers/usb/renesas_usbhs/mod.c
index 7475c4f64724..87e08b1512ad 100644
--- a/drivers/usb/renesas_usbhs/mod.c
+++ b/drivers/usb/renesas_usbhs/mod.c
@@ -349,10 +349,6 @@ void usbhs_irq_callback_update(struct usbhs_priv *priv, struct usbhs_mod *mod)
 	 *	usbhs_interrupt
 	 */
 
-	/*
-	 * it don't enable DVSE (intenb0) here
-	 * but "mod->irq_dev_state" will be called.
-	 */
 	if (info->irq_vbus)
 		intenb0 |= VBSE;
 
@@ -363,6 +359,9 @@ void usbhs_irq_callback_update(struct usbhs_priv *priv, struct usbhs_mod *mod)
 		if (mod->irq_ctrl_stage)
 			intenb0 |= CTRE;
 
+		if (mod->irq_dev_state)
+			intenb0 |= DVSE;
+
 		if (mod->irq_empty && mod->irq_bempsts) {
 			usbhs_write(priv, BEMPENB, mod->irq_bempsts);
 			intenb0 |= BEMPE;
-- 
2.7.4

