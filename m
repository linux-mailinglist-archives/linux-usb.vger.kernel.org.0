Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00E402854AF
	for <lists+linux-usb@lfdr.de>; Wed,  7 Oct 2020 00:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgJFWjV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Oct 2020 18:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbgJFWjV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Oct 2020 18:39:21 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1453C061755
        for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2020 15:39:19 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id 67so236499iob.8
        for <linux-usb@vger.kernel.org>; Tue, 06 Oct 2020 15:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ib0eyhUXlWV6asnuirsfhCRPVZwzgeyIC0n7EYZIvoo=;
        b=GUFmjh2R0+zGWILln724So2HoUcwz7/h53QJ8br/zVxEJrc9LkLLYpZHhdqCAyaVEg
         3E8jeIhkhXwlHIomg6xkBBOAlJ+XVfXu5lOMBXetLtisMOVZzX86b4Y6xWGZVMWelikq
         JP+7kyDeZLNN8KwBi1sIFi4AfoKAgeRFgNejQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ib0eyhUXlWV6asnuirsfhCRPVZwzgeyIC0n7EYZIvoo=;
        b=jv8CuufVnF6gQeu1LoMtJ7HvVFvJE/ECFbBkoeJg8QsERLYAgUwZRU+P9wOe74w31c
         0zHN79JBXoxBQoosmLec8TaJ8pKUCAkA4BkJIiHko6lMOOc2cgzsOZoYhLs3/DTaeDEk
         mqy95gE0UeYuW+shddyBRK6QdvxcKglWxOHDfYAIqyFhttq3o7hjGMhGNgyrUIi+8p+z
         Zg87u9JWBz4KOQI0nkjOtOpHskw5KNr3pYFefVgaRv5gBULSlDZzllC/FEPtCKfeP/jY
         4D/3aOBBZ+HAqAslHb6tV6oosQNjUv2aoREjT9r5w3MUiDAvKF16BYqO8cEeGgXzEr9K
         cb1g==
X-Gm-Message-State: AOAM530ZUzgsriH/ZFb/01BOrYAIYWUJMtqfejxv9ZMq0OObSL69lrEu
        Ke/tUDp+tJ14iKlw01UhgoMRWA==
X-Google-Smtp-Source: ABdhPJzksRQgQUeLdoUwBa1cp9SIh1BGf9Q6SMoRQWk2jEso3MTag113qD0BmcVhyZN2hqUwvbFARg==
X-Received: by 2002:a5e:820d:: with SMTP id l13mr53155iom.3.1602023959106;
        Tue, 06 Oct 2020 15:39:19 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id c18sm100911ild.35.2020.10.06.15.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 15:39:18 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     valentina.manea.m@gmail.com, shuah@kernel.org,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        andreyknvl@google.com
Cc:     Shuah Khan <skhan@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] usbip: vhci_hcd: fix calling usb_hcd_giveback_urb() with irqs enabled
Date:   Tue,  6 Oct 2020 16:39:14 -0600
Message-Id: <20201006223914.39257-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

kcov testing uncovered call to usb_hcd_giveback_urb() without disabling
interrupts.

Link: https://lore.kernel.org/linux-usb/CAAeHK+wb4k-LGTjK9F5YbJNviF_+yU+wE_=Vpo9Rn7KFN8vG6Q@mail.gmail.com/

usb_hcd_giveback_urb() is called from vhci's urb_enqueue, when it
determines it doesn't need to xmit the urb and can give it back.
This path runs in task context.

Disable irqs around usb_hcd_giveback_urb() call.

Reported-by: Andrey Konovalov <andreyknvl@google.com>
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---

Changes in v2: Changelog updated with correct information.
 drivers/usb/usbip/vhci_hcd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 1b598db5d8b9..66cde5e5f796 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -797,8 +797,14 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 	usb_hcd_unlink_urb_from_ep(hcd, urb);
 no_need_unlink:
 	spin_unlock_irqrestore(&vhci->lock, flags);
-	if (!ret)
+	if (!ret) {
+		/* usb_hcd_giveback_urb() should be called with
+		 * irqs disabled
+		 */
+		local_irq_disable();
 		usb_hcd_giveback_urb(hcd, urb, urb->status);
+		local_irq_enable();
+	}
 	return ret;
 }
 
-- 
2.25.1

