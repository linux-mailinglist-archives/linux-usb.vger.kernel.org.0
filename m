Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B92E5DEF53
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 16:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729406AbfJUOVV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 10:21:21 -0400
Received: from mail-wr1-f74.google.com ([209.85.221.74]:39434 "EHLO
        mail-wr1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbfJUOVU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Oct 2019 10:21:20 -0400
Received: by mail-wr1-f74.google.com with SMTP id j14so7082962wrm.6
        for <linux-usb@vger.kernel.org>; Mon, 21 Oct 2019 07:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=jJrAgqlpvuBPJgHHfjlb9pSf3SBUtlgCGQgAJchUub0=;
        b=qjQmbbITFUt2D/FTw+FbgTnQYQD1w10My5T/IQ/ls1RkPXwiuwPGovJl6qEe2ePCXJ
         JkZj1F7AuI5MgGcG9DC9rsXYuADo6uF+tq6+pJTBYZ5ol8Vl2pNI3ATKlQkIAG9eZmK3
         xsK7Od75N9arZD5gNyXYEgxS4qF2hgHB1o7hLYtpFYj3+HpaTvP+4tz2IKriAMg3mV3G
         qaqFVouJq9HuV9ICRw3rACqT7d/K9PW62QDwWGfUZ0FhgwZNOcYhvF4ScIT2I+iB0awN
         ueJv0uTk9L0sxi4kAQLZ1W8cCDr3IIfT1uRpwDDua1vb1AFXo1nLap3/qkrvEp8s/4Va
         xt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=jJrAgqlpvuBPJgHHfjlb9pSf3SBUtlgCGQgAJchUub0=;
        b=fwjLhzSd/m6+ibfjcDotRLB1mS+6Bf6UStU7MTkKZ/Fbq0KMwCD0QGmsKGr1OwS0a9
         9+EG/BybFMwZu5+X9zOBxQl8Hij4wATdwapqeIcBsg8cMY+4cOVu6aObBH9/vvIuzhcm
         yxvT+wDS9T6WEVz0siY2xU2XPwD/ma+2Z0ArMoOHJ7bpBat6KFnL9mR0OrgUqaySwRaY
         xThBY9UiymiCltS8D0M6M68k+7DSx/JgKr1JguO0MepdIeYAEK9DhAZsm5Ofsokz5BG2
         971UfMNHsRHBQh3Jzr73kXquTg6GDk8kwo6wO3dtolODG4zK3+LW7J88E1gvENMUhZgx
         2n/w==
X-Gm-Message-State: APjAAAW/466XcMrIy2TOFU1QJvmqREoCuVJsor3DBUTJqbPtQgPjzZRr
        6ttEhwKwkEdYLhrVyprAOYyfUdj+TpPp8CPhZImsUj/FEztJ4hEKac/hu20UAJpx29VfY4CC0A+
        kMBlUycHCjSRM6YXxSpsdyy2FeliRy+RHFfXunZtb0+sp30dX5mmxtFdpl1YBSDz6CtR2Y76CDd
        /c
X-Google-Smtp-Source: APXvYqwdd7t7IaswdXyXqA5kjVNYhyBSPsRl+F3RcDqT8xR7RAGjsPpuXPlsZ6sBEqwNKnhes7lh55vTla8gEiIU
X-Received: by 2002:a05:6000:11c4:: with SMTP id i4mr19839228wrx.277.1571667676755;
 Mon, 21 Oct 2019 07:21:16 -0700 (PDT)
Date:   Mon, 21 Oct 2019 16:20:59 +0200
In-Reply-To: <cover.1571667489.git.andreyknvl@google.com>
Message-Id: <4ae9e68ebca02f08a93ac61fe065057c9a01f0a8.1571667489.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1571667489.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH v2 2/2] USB: dummy-hcd: use usb_urb_dir_in instead of usb_pipein
From:   Andrey Konovalov <andreyknvl@google.com>
To:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "Jacky . Cao @ sony . com" <Jacky.Cao@sony.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
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

