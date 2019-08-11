Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40417890A5
	for <lists+linux-usb@lfdr.de>; Sun, 11 Aug 2019 10:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbfHKIXJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 11 Aug 2019 04:23:09 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41461 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfHKIXJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 11 Aug 2019 04:23:09 -0400
Received: by mail-pg1-f196.google.com with SMTP id x15so37642227pgg.8
        for <linux-usb@vger.kernel.org>; Sun, 11 Aug 2019 01:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wo4/uRiHIALFdqkgpwktSoLWl4QtwkIFB23okqQapww=;
        b=RYEuc9J/vOST/W8tZzIQFZNhcC0yZxjak4y3HFNOKsVzosFaj1j7+3cCSOlDO6aLob
         zYwcRhY0EbmDXngqblcVApgs6Ies9CuaXAimU1RXSz+M1rMSmXKtL7bnCwF2cOQ3Cod5
         eTnRFr5flDU+XlSS2jM7wFNzqOBCNMIH8WXHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wo4/uRiHIALFdqkgpwktSoLWl4QtwkIFB23okqQapww=;
        b=eN14J9X1lUJvGx1c4t0To2qS6k8ENjSwnvlq0C7/AGfrhiJGkwCa6/qD7ZtOBcGMuu
         WNS7oqIZ/eJLqzUutV470UxoSJ2smz31kcajRlUtO3fkrQtgDxrWp8CTzrk+fGqPto1N
         fGneVyTri26qRq8OZqcmYBttKTi6bWVXXaXkCJvYD37R8cYC6QTQCTqTLV0rqfc6xFmQ
         I5cB/sQIo1XcVqR7w68z6Lqq8fUVJqfdz1LbPH0SO+G7ST4R0of3WOfjr4V4x202Xm1c
         c5E25PD8KCtn9zsS+0F3ANyZSjrFUWruux+sMwp+BEdYyAVHXKn5/nlmrMaPz+kd/xwy
         Cyew==
X-Gm-Message-State: APjAAAXBW96uICwcipdrrgzGKUZg09Mj3LT+3gGtU9gzhEYkCDM4vpoj
        WRfDMMRG76SObLe81PsQlbR5ht8ofT8=
X-Google-Smtp-Source: APXvYqymMdyFVk+KzTCVYi2Yr41UUABkv/0v1F5H5bRd/n3h6adkpBkfYEJXBbx789agxpQrjrHTlQ==
X-Received: by 2002:a17:90a:8a15:: with SMTP id w21mr18096468pjn.134.1565511788520;
        Sun, 11 Aug 2019 01:23:08 -0700 (PDT)
Received: from ikjn-glaptop.roam.corp.google.com (36-224-206-174.dynamic-ip.hinet.net. [36.224.206.174])
        by smtp.gmail.com with ESMTPSA id d14sm122742498pfo.154.2019.08.11.01.23.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 01:23:08 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH] xhci: fix memleak on setup address fails.
Date:   Sun, 11 Aug 2019 16:22:59 +0800
Message-Id: <20190811082259.48176-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Xhci re-enables a slot on transaction error in set_address using
xhci_disable_slot() + xhci_alloc_dev().

But in this case, xhci_alloc_dev() creates debugfs entries upon an
existing device without cleaning up old entries, thus memory leaks.

So this patch simply moves calling xhci_debugfs_free_dev() from
xhci_free_dev() to xhci_disable_slot().

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---
 drivers/usb/host/xhci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 03d1e552769b..c24c5bf9ef9c 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3814,7 +3814,6 @@ static void xhci_free_dev(struct usb_hcd *hcd, struct usb_device *udev)
 		virt_dev->eps[i].ep_state &= ~EP_STOP_CMD_PENDING;
 		del_timer_sync(&virt_dev->eps[i].stop_cmd_timer);
 	}
-	xhci_debugfs_remove_slot(xhci, udev->slot_id);
 	virt_dev->udev = NULL;
 	ret = xhci_disable_slot(xhci, udev->slot_id);
 	if (ret)
@@ -3832,6 +3831,8 @@ int xhci_disable_slot(struct xhci_hcd *xhci, u32 slot_id)
 	if (!command)
 		return -ENOMEM;
 
+	xhci_debugfs_remove_slot(xhci, slot_id);
+
 	spin_lock_irqsave(&xhci->lock, flags);
 	/* Don't disable the slot if the host controller is dead. */
 	state = readl(&xhci->op_regs->status);
-- 
2.23.0.rc1.153.gdeed80330f-goog

