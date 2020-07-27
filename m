Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0CB22E66E
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 09:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgG0HXI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 03:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgG0HXH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jul 2020 03:23:07 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3B3C0619D2
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2020 00:23:06 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id a1so11313021edt.10
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2020 00:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Q7vEuh+TCFRtmIhZa9bVqmvhpFWEmKru9M7JItowJEI=;
        b=CjbHGDKGTNs/YhppnfpDb7I89Azs+0QMF/+RGqDpTlwELGMsZc7ZSNivaXqw1GlMQX
         j2/sMcKC9HU30DDdIrCxV/S1j9albImS+ZZtSWOtG+XhFPbjEZjfYCwGBE2wBtn6i2B9
         0e3soOGkoOv4uk2bC0F9NQjbajud0GKCgHE28YGxjzaHyzoSgmLenx61dbj06PScxMFM
         83QnOvtZ/2BXV7GHb5Xy5Roc62LJeQhvIDHriTIZI/+WBp4d9VsNEMpCzgA6YRqPOiYy
         dnYd5uHn5qdXjggysrw5ySuK5JWdJfDeu0p6aWazZR3EOLNzur82MJt7KUTaBNTeRSp9
         8jiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Q7vEuh+TCFRtmIhZa9bVqmvhpFWEmKru9M7JItowJEI=;
        b=esUriqPE2u+Am6ndewToM4/yZoEGATOHH05MnhdUlt+3MZQq77/Bm2MRLDthLLQN+9
         5jMVkKgq08Jz+ditPdT0id3+O8v3OD/5G+MoKc1aqq62d/nCJKclbOuF9SkN47nAHWfE
         maZeNS8l1cEGnKhujgALgA+oepIjwN6tK9wwBhVPYZzZ4773c7mRUC5qF/mGKTjbJsVI
         s25W0rhl5bVFwX/PzLHCMhpaaeQqP6Q6i3jMBAgS8pb9zcCnZ5JEZqgPrHcZ9Fli5XN3
         kM0tzLdqtprnvnEbUnqC/gogTyg2/gG03vgDjtpySPw6dhcmRYr0fPulIJi27PEi29qw
         2SpA==
X-Gm-Message-State: AOAM533jYPtndhfa7Aqln0UWf8ZcKHEbNTklGOPFa1P/FyULaILHd30y
        h1qCzgSb3BZ0Jl72q60coeA=
X-Google-Smtp-Source: ABdhPJxQeoyqVzox3EvXE0KA1JWY3vfw5C/nVCedYYu4GAnRsJ3Jb41ARe+wRRXZBefCbBiaK9ahGA==
X-Received: by 2002:a05:6402:1c0f:: with SMTP id ck15mr19316587edb.155.1595834584827;
        Mon, 27 Jul 2020 00:23:04 -0700 (PDT)
Received: from ruhe.localdomain (109-186-98-97.bb.netvision.net.il. [109.186.98.97])
        by smtp.gmail.com with ESMTPSA id m6sm6370728ejq.85.2020.07.27.00.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 00:23:04 -0700 (PDT)
From:   eli.billauer@gmail.com
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     hdegoede@redhat.com, stern@rowland.harvard.edu,
        Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH] usb: core: Solve race condition in usb_kill_anchored_urbs
Date:   Mon, 27 Jul 2020 10:22:25 +0300
Message-Id: <20200727072225.25195-1-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Eli Billauer <eli.billauer@gmail.com>

usb_kill_anchored_urbs() is commonly used to cancel all URBs on an
anchor just before releasing resources which the URBs rely on. By doing
so, users of this function rely on that no completer callbacks will take
place from any URB on the anchor after it returns.

However if this function is called in parallel with __usb_hcd_giveback_urb
processing a URB on the anchor, the latter may call the completer
callback after usb_kill_anchored_urbs() returns. This can lead to a
kernel panic due to use after release of memory in interrupt context.

The race condition is that __usb_hcd_giveback_urb() first unanchors the URB
and then makes the completer callback. Such URB is hence invisible to
usb_kill_anchored_urbs(), allowing it to return before the completer has
been called, since the anchor's urb_list is empty.

This patch adds a call to usb_wait_anchor_empty_timeout() prior to
returning. This function waits until urb_list is empty (it should
already be), but more importantly, until @suspend_wakeups is zero.

The latter condition resolves the race condition, since @suspend_wakeups
is incremented by __usb_hcd_giveback_urb() before unanchoring a URB and
decremented after completing it. @suspend_wakeups is hence an upper limit
of the number of unanchored but uncompleted URBs. By waiting for it to be
zero, the race condition is eliminated, in the same way that another
problem was solved for the same race condition in commit 6ec4147e7bdb
("usb-anchor: Delay usb_wait_anchor_empty_timeout wake up till completion
is done").

An arbitrary timeout of 1000 ms should cover any sane completer
callback. The wait condition may also fail if the anchor is populated
while usb_kill_anchored_urbs() is called. Both timeout scenarios are
alarmingly weird, hence a WARN() is issued.

Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---
 drivers/usb/core/urb.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index da923ec17612..7fa23615199f 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -772,11 +772,12 @@ void usb_block_urb(struct urb *urb)
 EXPORT_SYMBOL_GPL(usb_block_urb);
 
 /**
- * usb_kill_anchored_urbs - cancel transfer requests en masse
+ * usb_kill_anchored_urbs -  kill all URBs associated with an anchor
  * @anchor: anchor the requests are bound to
  *
- * this allows all outstanding URBs to be killed starting
- * from the back of the queue
+ * This kills all outstanding URBs starting from the back of the queue,
+ * with guarantee that no completer callbacks will take place from the
+ * anchor after this function returns.
  *
  * This routine should not be called by a driver after its disconnect
  * method has returned.
@@ -784,6 +785,7 @@ EXPORT_SYMBOL_GPL(usb_block_urb);
 void usb_kill_anchored_urbs(struct usb_anchor *anchor)
 {
 	struct urb *victim;
+	int ret;
 
 	spin_lock_irq(&anchor->lock);
 	while (!list_empty(&anchor->urb_list)) {
@@ -798,6 +800,10 @@ void usb_kill_anchored_urbs(struct usb_anchor *anchor)
 		spin_lock_irq(&anchor->lock);
 	}
 	spin_unlock_irq(&anchor->lock);
+
+	ret = usb_wait_anchor_empty_timeout(anchor, 1000);
+
+	WARN(!ret, "Returning with non-empty anchor due to timeout");
 }
 EXPORT_SYMBOL_GPL(usb_kill_anchored_urbs);
 
-- 
2.17.1

