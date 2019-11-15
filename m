Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCB4EFE32D
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 17:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727835AbfKOQrz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Nov 2019 11:47:55 -0500
Received: from mga09.intel.com ([134.134.136.24]:15381 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727644AbfKOQrz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 Nov 2019 11:47:55 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Nov 2019 08:47:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,308,1569308400"; 
   d="scan'208";a="208179185"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga003.jf.intel.com with ESMTP; 15 Nov 2019 08:47:53 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>, Suwan Kim <suwan.kim027@gmail.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/4] usb: host: xhci: Support running urb giveback in tasklet context
Date:   Fri, 15 Nov 2019 18:50:02 +0200
Message-Id: <1573836603-10871-4-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573836603-10871-1-git-send-email-mathias.nyman@linux.intel.com>
References: <1573836603-10871-1-git-send-email-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Suwan Kim <suwan.kim027@gmail.com>

Patch "USB: HCD: support giveback of URB in tasklet context"[1]
introduced giveback of urb in tasklet context. [1] This patch was
applied to ehci but not xhci. [2] This patch significantly reduces
the hard irq time of xhci. Especially for uvc driver, the hard irq
including the uvc completion function runs quite long but applying
this patch reduces the hard irq time of xhci.

I have tested four SS devices to check if performance degradation
occurs when urb completion functions run in the tasklet context.

As a result of the test, all devices works well and shows very
similar performance with the upstream kernel. Moreover, usb ethernet
adapter show better performance than the upstream kernel about 5% for
RX and 2% for TX. Four SS devices is as follows.

SS devices for test

1. WD My Passport 2TB (external hard drive)
2. Sandisk Ultra Flair USB 3.0 32GB
3. Logitech Brio webcam
4. Iptime 1gigabit ethernet adapter (Mediatek RTL8153)

Test description

1. Mass storage (hard drive) performance test
- run below command 10 times and compute the average performance

    dd if=/dev/sdN iflag=direct of=/dev/null bs=1G count=1

2. Mass storage (flash memory) performance test
- run below command 10 times and compute the average performance

    dd if=/dev/sdN iflag=direct of=/dev/null bs=1G count=1

3. Webcam streaming performance test
- run simple capture program and get the average frame rate per second
- capture 1500 frames
- program link

    https://github.com/asfaca/Webcam-performance-analyzing-tool

- video resolution : 4096 X 2160 (4K) at 30 or 24 fps
- device (Logitech Brio) spec url for the highest resolution and fps

    https://support.logitech.com/en_gb/product/brio-stream/specs

4. USB Ethernet adapter performance test
- directly connect two linux machines with ethernet cable
- run pktgen of linux kernel and send 1500 bytes packets
- run vnstat to measure the network bandwidth for 180 seconds

Test machine

- CPU : Intel i5-7600 @ 3.5GHz

Test results

1. Mass storage (hard drive) performance test

            WD My Passport 2TB (external hard drive)
--------------------------------------------------------------------
    xhci without tasklet        |          xhci with tasklet
--------------------------------------------------------------------
         103.667MB/s            |            103.692MB/s
--------------------------------------------------------------------

2. Mass storage (flash memory) performance test

               Sandisk Ultra Flair USB 3.0 32GB
--------------------------------------------------------------------
    xhci without tasklet        |          xhci with tasklet
--------------------------------------------------------------------
         129.727MB/s            |            130.2MB/s
--------------------------------------------------------------------

3. Webcam streaming performance test

                     Logitech Brio webcam
--------------------------------------------------------------------
    xhci without tasklet        |          xhci with tasklet
--------------------------------------------------------------------
          26.4451 fps           |            26.3949 fps
--------------------------------------------------------------------

4. USB Ethernet adapter performance test

      Iptime 1gigabit ethernet adapter (Mediatek RTL8153)
--------------------------------------------------------------------
    xhci without tasklet        |          xhci with tasklet
--------------------------------------------------------------------
RX      933.86 Mbit/s           |            983.86 Mbit/s
--------------------------------------------------------------------
TX      830.18 Mbit/s           |            882.75 Mbit/s
--------------------------------------------------------------------

[1], https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=94dfd7edfd5c9b605caf7b562de7a813d216e011
[2], https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=428aac8a81058e2303677a8fbf26670229e51d3a

Signed-off-by: Suwan Kim <suwan.kim027@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 2 --
 drivers/usb/host/xhci.c      | 3 ++-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index bfd4d34c2535..6475c3d3b43b 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -657,10 +657,8 @@ static void xhci_giveback_urb_in_irq(struct xhci_hcd *xhci,
 	}
 	xhci_urb_free_priv(urb_priv);
 	usb_hcd_unlink_urb_from_ep(hcd, urb);
-	spin_unlock(&xhci->lock);
 	trace_xhci_urb_giveback(urb);
 	usb_hcd_giveback_urb(hcd, urb, status);
-	spin_lock(&xhci->lock);
 }
 
 static void xhci_unmap_td_bounce_buffer(struct xhci_hcd *xhci,
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 6c17e3fe181a..6721d059f58a 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5301,7 +5301,8 @@ static const struct hc_driver xhci_hc_driver = {
 	 * generic hardware linkage
 	 */
 	.irq =			xhci_irq,
-	.flags =		HCD_MEMORY | HCD_DMA | HCD_USB3 | HCD_SHARED,
+	.flags =		HCD_MEMORY | HCD_DMA | HCD_USB3 | HCD_SHARED |
+				HCD_BH,
 
 	/*
 	 * basic lifecycle operations
-- 
2.7.4

