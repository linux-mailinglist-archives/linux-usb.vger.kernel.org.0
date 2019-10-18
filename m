Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 978FBDC7E4
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2019 16:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634289AbfJRO4L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 10:56:11 -0400
Received: from mail-vs1-f74.google.com ([209.85.217.74]:35135 "EHLO
        mail-vs1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbfJRO4K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Oct 2019 10:56:10 -0400
Received: by mail-vs1-f74.google.com with SMTP id i23so1491920vsp.2
        for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2019 07:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=jJrAgqlpvuBPJgHHfjlb9pSf3SBUtlgCGQgAJchUub0=;
        b=LHGXl+96GCCafj44rx1w4BJ44kfh5N1GeLZ2bZO9vbb8TehuPgLCqRDT6tgJ4/HC6Z
         vP1zk8gkByuRNp3q6BvGPuKUMCzYm8976r9524jDwGpNYTaMuSp2fHhqnUOqfHLSDqFE
         NXIvXrIGKNDzwTGcxISGYCkY45j3UWX7LcwksViWNJvCGQ0CaS7I1VfXDgSBxpJBDacx
         35xu2PpFPvKgFXyL2HbajZvN1H8+IjrlEb+6B6/PJwqXZH70L82WVnDwrCDONN/m1tF6
         di7ScEMSiX50ewDO67JkdnpVxegqlmMZP+B2y+RC4omWSWUiPzj7nM41a8YLNrcA/QjX
         Ly3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=jJrAgqlpvuBPJgHHfjlb9pSf3SBUtlgCGQgAJchUub0=;
        b=eFJRETrsVHh+eH0nWMvPWorrXfLUSFBM9XlEDGFl1cEES7uek7Z6p7Q15raxDlHAmJ
         6r7IaBjEM0OcDoDULlHtUe3hVKFFFIiiFVA8F8mt/rwwoEY9ZFtC/XyFYMNB9y4PchwX
         EjFotCaxEe/0V6Ey2dqOGYSvM7x2ytnKsy93vDJvCfvwe4jt+S4ecDGraF/mo0QfSBLQ
         Pu9DoA32nSZOAabVFoP65cisJbVjOl+YTMeMRov/wwPWKJ1U6LU9Ae5sFOek9t33NNnu
         80LfQuf14LfRHEZllxdBVpu2m5xgKzgO4qp+krdkX5uLEwLm3t+B+D8+E+NjLpcPW+JK
         IykA==
X-Gm-Message-State: APjAAAWjGeXzVNWY+H7TBcEgjlKKgUAvsJJammUoabbbqC/AnVSZ/BZC
        jUvL1VNrrhkazsqV31EHCIPySDdDiVJ6y2fQuPR60hWn9Dryj+vcOu5AMt+MtNmk1S78FD8o/n9
        /Q+6lV8Ou9eth1S+vndxIYcgNVqd4c9lSuWHVGEGscvmyb3ZDi7xrfOJl7EmoZrycE2Hw0BNIBf
        cg
X-Google-Smtp-Source: APXvYqxf0a90XEvKlT2nyc5pJGFwuUZnDE9/+BonADLMsdMQI39KMjwdFqt1UFnoTvyMqHue3Zebmva0xsLb7PeY
X-Received: by 2002:a67:ecd7:: with SMTP id i23mr5742002vsp.83.1571410568129;
 Fri, 18 Oct 2019 07:56:08 -0700 (PDT)
Date:   Fri, 18 Oct 2019 16:55:57 +0200
In-Reply-To: <7a9d6e35873d52ec0ab1e6b9827d9299a1f4fb0d.1571409250.git.andreyknvl@google.com>
Message-Id: <88ef7ea47af847738cb34b6d5b862349d9024cc7.1571409250.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <7a9d6e35873d52ec0ab1e6b9827d9299a1f4fb0d.1571409250.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH 2/2] USB: dummy-hcd: use usb_urb_dir_in instead of usb_pipein
From:   Andrey Konovalov <andreyknvl@google.com>
To:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "Jacky . Cao @ sony . com" <Jacky.Cao@sony.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit fea3409112a9 ("USB: add direction bit to urb->transfer_flags") has
added a usb_urb_dir_in() helper function that can be used to determine
the direction of the URB. With that patch USB_DIR_IN control requests with
wLength == 0 are considered out requests by real USB HCDs. This patch
changes dummy-hcd to use the usb_urb_dir_in() helper to match that
behavior.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index a8f1e5707c14..4c9d1e49d5ed 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1321,7 +1321,7 @@ static int dummy_perform_transfer(struct urb *urb, struct dummy_request *req,
 	u32 this_sg;
 	bool next_sg;
 
-	to_host = usb_pipein(urb->pipe);
+	to_host = usb_urb_dir_in(urb);
 	rbuf = req->req.buf + req->req.actual;
 
 	if (!urb->num_sgs) {
@@ -1409,7 +1409,7 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
 
 		/* FIXME update emulated data toggle too */
 
-		to_host = usb_pipein(urb->pipe);
+		to_host = usb_urb_dir_in(urb);
 		if (unlikely(len == 0))
 			is_short = 1;
 		else {
@@ -1830,7 +1830,7 @@ static void dummy_timer(struct timer_list *t)
 
 		/* find the gadget's ep for this request (if configured) */
 		address = usb_pipeendpoint (urb->pipe);
-		if (usb_pipein(urb->pipe))
+		if (usb_urb_dir_in(urb))
 			address |= USB_DIR_IN;
 		ep = find_endpoint(dum, address);
 		if (!ep) {
@@ -2385,7 +2385,7 @@ static inline ssize_t show_urb(char *buf, size_t size, struct urb *urb)
 			s = "?";
 			break;
 		 } s; }),
-		ep, ep ? (usb_pipein(urb->pipe) ? "in" : "out") : "",
+		ep, ep ? (usb_urb_dir_in(urb) ? "in" : "out") : "",
 		({ char *s; \
 		switch (usb_pipetype(urb->pipe)) { \
 		case PIPE_CONTROL: \
-- 
2.23.0.866.gb869b98d4c-goog

