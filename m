Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26140703B0
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2019 17:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728952AbfGVP0L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jul 2019 11:26:11 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:30857 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728943AbfGVP0L (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jul 2019 11:26:11 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 45sllk58yyzPG;
        Mon, 22 Jul 2019 17:24:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1563809090; bh=iHgNDr1Bbl/f8tKjFoz8vhRt5LL6BMZBiY7i1pBRxP4=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=lLfY8WmLg6WkvblY6TwZyiDldCap5A0mCCkWAvvXOXdkplRsozbdQTRXm3T5tYYWl
         Popk+sB8ra1Bt/AcyH/9+fb3B11i1LNY0U/ovcEdytS53vkiFBIcQE8UdpsfzY+p2L
         ULPR3dn50x/czlYTFbBnj/tEIwGK++vFewn09AUAvBBYDMLODP3Ixb6yQT5PuBrcTX
         44Jkg6RIpL3WejZ3YtlwqdZSBtfxTDEE2fmPNuccA4jEcs3Tycsg/0HriSMJlriNd0
         wpD+AxKiu8IUpNni77+7K3n7zu3UrBfLLDnnA/YbbV7w8H5fcKGbOp8Swz6UanH9Lk
         hfVgoBhvHRicA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date:   Mon, 22 Jul 2019 17:26:09 +0200
Message-Id: <182a9556e77de6cf40e9406f7371766106b356b2.1563809035.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1563809035.git.mirq-linux@rere.qmqm.pl>
References: <cover.1563809035.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v5 5/6] usb: gadget: u_serial: diagnose missed console
 messages
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ladislav Michl <ladis@linux-mips.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Insert markers in console stream marking places where data
is missing. This makes the hole in the data stand out clearly
instead of glueing together unrelated messages.

Example output as seen from USB host side:

[    0.064078] pinctrl core: registered pin 16 (UART3_RTS_N PC0) on 70000868.pinmux
[    0.064130] pinctrl
[missed 114987 bytes]
[    4.302299] udevd[134]: starting version 3.2.5
[    4.306845] random: udevd: uninitialized urandom read (16 bytes read)

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
  v5: no changes
  v4: no changes
  v3: added example output
    + lowercase "missed"
  v2: commit message massage

---
 drivers/usb/gadget/function/u_serial.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 0da00546006f..a248ed0fd5d2 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -88,6 +88,7 @@ struct gs_console {
 	spinlock_t		lock;
 	struct usb_request	*req;
 	struct kfifo		buf;
+	size_t			missed;
 };
 
 /*
@@ -931,6 +932,15 @@ static void __gs_console_push(struct gs_console *cons)
 	if (!size)
 		return;
 
+	if (cons->missed && ep->maxpacket >= 64) {
+		char buf[64];
+		size_t len;
+
+		len = sprintf(buf, "\n[missed %zu bytes]\n", cons->missed);
+		kfifo_in(&cons->buf, buf, len);
+		cons->missed = 0;
+	}
+
 	req->length = size;
 	if (usb_ep_queue(ep, req, GFP_ATOMIC))
 		req->length = 0;
@@ -952,10 +962,13 @@ static void gs_console_write(struct console *co,
 {
 	struct gs_console *cons = container_of(co, struct gs_console, console);
 	unsigned long flags;
+	size_t n;
 
 	spin_lock_irqsave(&cons->lock, flags);
 
-	kfifo_in(&cons->buf, buf, count);
+	n = kfifo_in(&cons->buf, buf, count);
+	if (n < count)
+		cons->missed += count - n;
 
 	if (cons->req && !cons->req->length)
 		schedule_work(&cons->work);
-- 
2.20.1

