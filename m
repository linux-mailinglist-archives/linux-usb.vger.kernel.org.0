Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA6102F95A2
	for <lists+linux-usb@lfdr.de>; Sun, 17 Jan 2021 22:54:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729550AbhAQVxt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 17 Jan 2021 16:53:49 -0500
Received: from sender4-of-o54.zoho.com ([136.143.188.54]:21417 "EHLO
        sender4-of-o54.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728042AbhAQVxr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 17 Jan 2021 16:53:47 -0500
X-Greylist: delayed 982 seconds by postgrey-1.27 at vger.kernel.org; Sun, 17 Jan 2021 16:53:47 EST
ARC-Seal: i=1; a=rsa-sha256; t=1610919402; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=k6egs9DlWZXgPsc59vUQj9r9AddqAAw70Tf3/+W0GHa1itUF/8jUoTtEzssLLL1HoncGeSGcEiDq3bfKmd56kH6JX0bAUd7wG1vn8yNMcD+3ngWuO5bFf1gvjZ3Jn/lLSnQJWuCd/5tLVBVzaLm+f9VHae6a48VZB+/ABs1BVfE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1610919402; h=Content-Type:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=2UkjfWZ+OoxPT4m00Bj28JkWgSAu+k2ri07tPeK/R90=; 
        b=flAlDIZYlQTNA9duBPn+kK5VM6Fe5BbFgp40Tfq5Ye04EjGDq1GdDQanmrJ1BZeKcYVWWGAV9OcqWf9eSRltNm2I/Dywhhf4XwjJW3kdlzu5jh/PXonmsg/20mrQzhyF2Q/uyTXRPPaSWxbuTI4dN84a6rIlwmR1x+T2gh8mSrU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=jeremyfiggins.com;
        spf=pass  smtp.mailfrom=jeremy@jeremyfiggins.com;
        dmarc=pass header.from=<kernel@jeremyfiggins.com> header.from=<kernel@jeremyfiggins.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1610919402;
        s=zoho; d=jeremyfiggins.com; i=kernel@jeremyfiggins.com;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        bh=2UkjfWZ+OoxPT4m00Bj28JkWgSAu+k2ri07tPeK/R90=;
        b=B7VkYro71yc8boyjLaVdEGIzmfuN0v/NRASM/MZegghwdFUzPdsPliw88IHLMAHQ
        PsZhgJbgJkOct+2JsKHcbkHONhetba2sI5VIHQu0QFJ7ug9cauQg3G6YAgg764AcMqe
        xlJejREJpaoBaKGDgybXxR2PbtdZuvXnoO6zAzYQ=
Received: from watson (cpe-173-174-84-94.austin.res.rr.com [173.174.84.94]) by mx.zohomail.com
        with SMTPS id 1610919402071692.3197862217197; Sun, 17 Jan 2021 13:36:42 -0800 (PST)
Date:   Sun, 17 Jan 2021 15:36:39 -0600
From:   Jeremy Figgins <kernel@jeremyfiggins.com>
To:     zaitcev@redhat.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: [PATCH] USB: usblp: add USBLP_QUIRK_NO_SET_INTF flag
Message-ID: <YASt5wgOCkXhH2Dv@watson>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Certain devices such as Winbond Virtual Com Port,
which is used in some usb printers, will stop
responding after the usb_control_msg_send()
calls in usb_set_interface(). These devices work
fine without having usb_set_interface() called, so
this flag prevents that call.

The naming is designed to mirror the existing
USB_QUIRK_NO_SET_INTF flag, but that flag is
not sufficient to make these devices work.

Signed-off-by: Jeremy Figgins <kernel@jeremyfiggins.com>
---
 drivers/usb/class/usblp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
index 134dc2005ce9..6e2d58813d7d 100644
--- a/drivers/usb/class/usblp.c
+++ b/drivers/usb/class/usblp.c
@@ -209,6 +209,7 @@ struct quirk_printer_struct {
 #define USBLP_QUIRK_BIDIR	0x1	/* reports bidir but requires unidirectional mode (no INs/reads) */
 #define USBLP_QUIRK_USB_INIT	0x2	/* needs vendor USB init string */
 #define USBLP_QUIRK_BAD_CLASS	0x4	/* descriptor uses vendor-specific Class or SubClass */
+#define USBLP_QUIRK_NO_SET_INTF	0x8	/* device can't handle Set-Interface requests */
 
 static const struct quirk_printer_struct quirk_printers[] = {
 	{ 0x03f0, 0x0004, USBLP_QUIRK_BIDIR }, /* HP DeskJet 895C */
@@ -227,6 +228,7 @@ static const struct quirk_printer_struct quirk_printers[] = {
 	{ 0x0482, 0x0010, USBLP_QUIRK_BIDIR }, /* Kyocera Mita FS 820, by zut <kernel@zut.de> */
 	{ 0x04f9, 0x000d, USBLP_QUIRK_BIDIR }, /* Brother Industries, Ltd HL-1440 Laser Printer */
 	{ 0x04b8, 0x0202, USBLP_QUIRK_BAD_CLASS }, /* Seiko Epson Receipt Printer M129C */
+	{ 0x0416, 0x5011, USBLP_QUIRK_NO_SET_INTF }, /* Winbond Electronics Corp. Virtual Com Port */
 	{ 0, 0 }
 };
 
@@ -1332,7 +1334,11 @@ static int usblp_set_protocol(struct usblp *usblp, int protocol)
 	alts = usblp->protocol[protocol].alt_setting;
 	if (alts < 0)
 		return -EINVAL;
-	r = usb_set_interface(usblp->dev, usblp->ifnum, alts);
+	if (usblp->quirks & USBLP_QUIRK_NO_SET_INTF) {
+		r = 0;
+	} else {
+		r = usb_set_interface(usblp->dev, usblp->ifnum, alts);
+	}
 	if (r < 0) {
 		printk(KERN_ERR "usblp: can't set desired altsetting %d on interface %d\n",
 			alts, usblp->ifnum);
-- 
2.29.0

