Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD9C187487
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 22:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732664AbgCPVLl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 17:11:41 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35908 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732649AbgCPVLj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 17:11:39 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02GLBcQk086219;
        Mon, 16 Mar 2020 16:11:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584393098;
        bh=SFrCHb0A1T1BvpOkErRDWTnOVHSkp0b7Mo1KhTr3F84=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hEttRZMz/L0NOVb/3Dli1UwntksCK/olBtlGtUOaa8Yg2AUK9Z7698jo+fQ5YAGPB
         YVnAeKDG6Ui7WtD8IgbcVm7dvmwbRSlac+a/i0BCovQC1LSgo+IM2OeM2X+bJYnOa0
         6oPetGJN15Cfbi9vmysj3Nh7LF4GFawi1mAyIif4=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02GLBbZi028888;
        Mon, 16 Mar 2020 16:11:38 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Mar 2020 16:11:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Mar 2020 16:11:37 -0500
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02GLBbLj119954;
        Mon, 16 Mar 2020 16:11:37 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 7/8] usb: musb: fix crash with highmen PIO and usbmon
Date:   Mon, 16 Mar 2020 16:11:35 -0500
Message-ID: <20200316211136.2274-8-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200316211136.2274-1-b-liu@ti.com>
References: <20200316211136.2274-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Mans Rullgard <mans@mansr.com>

When handling a PIO bulk transfer with highmem buffer, a temporary
mapping is assigned to urb->transfer_buffer.  After the transfer is
complete, an invalid address is left behind in this pointer.  This is
not ordinarily a problem since nothing touches that buffer before the
urb is released.  However, when usbmon is active, usbmon_urb_complete()
calls (indirectly) mon_bin_get_data() which does access the transfer
buffer if it is set.  To prevent an invalid memory access here, reset
urb->transfer_buffer to NULL when finished (musb_host_rx()), or do not
set it at all (musb_host_tx()).

Fixes: 8e8a55165469 ("usb: musb: host: Handle highmem in PIO mode")
Signed-off-by: Mans Rullgard <mans@mansr.com>
Cc: stable@vger.kernel.org
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/musb_host.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 1c813c37462a..8736f4251a22 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -1436,10 +1436,7 @@ void musb_host_tx(struct musb *musb, u8 epnum)
 	 * We need to map sg if the transfer_buffer is
 	 * NULL.
 	 */
-	if (!urb->transfer_buffer)
-		qh->use_sg = true;
-
-	if (qh->use_sg) {
+	if (!urb->transfer_buffer) {
 		/* sg_miter_start is already done in musb_ep_program */
 		if (!sg_miter_next(&qh->sg_miter)) {
 			dev_err(musb->controller, "error: sg list empty\n");
@@ -1447,9 +1444,8 @@ void musb_host_tx(struct musb *musb, u8 epnum)
 			status = -EINVAL;
 			goto done;
 		}
-		urb->transfer_buffer = qh->sg_miter.addr;
 		length = min_t(u32, length, qh->sg_miter.length);
-		musb_write_fifo(hw_ep, length, urb->transfer_buffer);
+		musb_write_fifo(hw_ep, length, qh->sg_miter.addr);
 		qh->sg_miter.consumed = length;
 		sg_miter_stop(&qh->sg_miter);
 	} else {
@@ -1458,11 +1454,6 @@ void musb_host_tx(struct musb *musb, u8 epnum)
 
 	qh->segsize = length;
 
-	if (qh->use_sg) {
-		if (offset + length >= urb->transfer_buffer_length)
-			qh->use_sg = false;
-	}
-
 	musb_ep_select(mbase, epnum);
 	musb_writew(epio, MUSB_TXCSR,
 			MUSB_TXCSR_H_WZC_BITS | MUSB_TXCSR_TXPKTRDY);
@@ -1977,8 +1968,10 @@ void musb_host_rx(struct musb *musb, u8 epnum)
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
2.17.1

