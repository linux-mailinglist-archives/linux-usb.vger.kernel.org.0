Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3A68F992
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 15:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbfD3NKV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 09:10:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:34492 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726264AbfD3NKV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 30 Apr 2019 09:10:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 5F1CCADD4;
        Tue, 30 Apr 2019 13:10:20 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv3] UAS: fix alignment of scatter/gather segments
Date:   Tue, 30 Apr 2019 15:10:00 +0200
Message-Id: <20190430131000.9723-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is the UAS version of

747668dbc061b3e62bc1982767a3a1f9815fcf0e
usb-storage: Set virt_boundary_mask to avoid SG overflows

We are not as likely to be vulnerable as storage, as it is unlikelier
that UAS is run over a controller without native support for SG,
but the issue exists.
The issue has been existing since the inception of the driver.

v2: improved comments
v3: removed vi artifacts from log text

Fixes: 115bb1ffa54c ("USB: Add UAS driver")
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/storage/uas.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 6d71b8fff9df..3856f34b89b8 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -789,24 +789,33 @@ static int uas_slave_alloc(struct scsi_device *sdev)
 {
 	struct uas_dev_info *devinfo =
 		(struct uas_dev_info *)sdev->host->hostdata;
+	int maxp;
 
 	sdev->hostdata = devinfo;
 
 	/*
-	 * USB has unusual DMA-alignment requirements: Although the
-	 * starting address of each scatter-gather element doesn't matter,
-	 * the length of each element except the last must be divisible
-	 * by the Bulk maxpacket value.  There's currently no way to
-	 * express this by block-layer constraints, so we'll cop out
-	 * and simply require addresses to be aligned at 512-byte
-	 * boundaries.  This is okay since most block I/O involves
-	 * hardware sectors that are multiples of 512 bytes in length,
-	 * and since host controllers up through USB 2.0 have maxpacket
-	 * values no larger than 512.
+	 * We have two requirements here. We must satisfy the requirements
+	 * of the physical HC and the demands of the protocol, as we
+	 * definitely want no additional memory allocation in this path
+	 * ruling out using bounce buffers.
 	 *
-	 * But it doesn't suffice for Wireless USB, where Bulk maxpacket
-	 * values can be as large as 2048.  To make that work properly
-	 * will require changes to the block layer.
+	 * For a transmission on USB to continue we must never send
+	 * a package that is smaller than maxpacket. Hence the length of each
+         * scatterlist element except the last must be divisible by the
+         * Bulk maxpacket value.
+	 * If the HC does not ensure that through SG,
+	 * the upper layer must do that. We must assume nothing
+	 * about the capabilities off the HC, so we use the most
+	 * pessimistic requirement.
+	 */
+
+	maxp = usb_maxpacket(devinfo->udev, devinfo->data_in_pipe, 0);
+	blk_queue_virt_boundary(sdev->request_queue, maxp - 1);
+
+	/*
+	 * The protocol has no requirements on alignment in the strict sense.
+	 * Controllers may or may not have alignment restrictions.
+	 * As this is not exported, we use an extremely conservative guess.
 	 */
 	blk_queue_update_dma_alignment(sdev->request_queue, (512 - 1));
 
-- 
2.16.4

