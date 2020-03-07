Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8078817CE5B
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2020 14:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgCGNPe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 7 Mar 2020 08:15:34 -0500
Received: from unicorn.mansr.com ([81.2.72.234]:59632 "EHLO unicorn.mansr.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726105AbgCGNPe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 7 Mar 2020 08:15:34 -0500
X-Greylist: delayed 437 seconds by postgrey-1.27 at vger.kernel.org; Sat, 07 Mar 2020 08:15:34 EST
Received: by unicorn.mansr.com (Postfix, from userid 51770)
        id 165E615F0E; Sat,  7 Mar 2020 13:08:16 +0000 (GMT)
From:   Mans Rullgard <mans@mansr.com>
To:     Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: musb: fix crash with highmen PIO and usbmon
Date:   Sat,  7 Mar 2020 13:07:20 +0000
Message-Id: <20200307130720.16652-1-mans@mansr.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When handling a PIO bulk transfer with highmem buffer, a temporary
mapping is assigned to urb->transfer_buffer.  After the transfer is
complete, an invalid address is left behind in this pointer.  This is
not ordinarily a problem since nothing touches that buffer before the
urb is released.  However, when usbmon is active, usbmon_urb_complete()
calls (indirectly) mon_bin_get_data() which does access the transfer
buffer if it is set.  To prevent an invalid memory access here, reset
urb->tranfer_buffer to NULL when finished.

Fixes: 8e8a55165469 ("usb: musb: host: Handle highmem in PIO mode")
Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 drivers/usb/musb/musb_host.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 1c813c37462a..b67b40de1947 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -1459,8 +1459,10 @@ void musb_host_tx(struct musb *musb, u8 epnum)
 	qh->segsize = length;
 
 	if (qh->use_sg) {
-		if (offset + length >= urb->transfer_buffer_length)
+		if (offset + length >= urb->transfer_buffer_length) {
 			qh->use_sg = false;
+			urb->transfer_buffer = NULL;
+		}
 	}
 
 	musb_ep_select(mbase, epnum);
@@ -1977,8 +1979,10 @@ void musb_host_rx(struct musb *musb, u8 epnum)
 	urb->actual_length += xfer_len;
 	qh->offset += xfer_len;
 	if (done) {
-		if (qh->use_sg)
+		if (qh->use_sg) {
 			qh->use_sg = false;
+			urb->transfer_buffer = NULL;
+		}
 
 		if (urb->status == -EINPROGRESS)
 			urb->status = status;
-- 
2.25.1

