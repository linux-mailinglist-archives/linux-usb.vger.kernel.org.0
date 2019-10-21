Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27828DF1FD
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 17:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729312AbfJUPsH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 11:48:07 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:51902 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727607AbfJUPsG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Oct 2019 11:48:06 -0400
Received: (qmail 5469 invoked by uid 2102); 21 Oct 2019 11:48:06 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 Oct 2019 11:48:06 -0400
Date:   Mon, 21 Oct 2019 11:48:06 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>,
        Seth Bollinger <Seth.Bollinger@digi.com>,
        Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        USB list <linux-usb@vger.kernel.org>
Subject: [PATCH] usb-storage: Revert commit 747668dbc061 ("usb-storage: Set
 virt_boundary_mask to avoid SG overflows")
In-Reply-To: <20191017175306.GA3014@lazy.lzy>
Message-ID: <Pine.LNX.4.44L0.1910211145520.1673-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit 747668dbc061 ("usb-storage: Set virt_boundary_mask to avoid SG
overflows") attempted to solve a problem involving scatter-gather I/O
and USB/IP by setting the virt_boundary_mask for mass-storage devices.

However, it now turns out that this interacts badly with commit
09324d32d2a0 ("block: force an unlimited segment size on queues with a
virt boundary"), which was added later.  A typical error message is:

	ehci-pci 0000:00:13.2: swiotlb buffer is full (sz: 327680 bytes),
	total 32768 (slots), used 97 (slots)

There is no longer any reason to keep the virt_boundary_mask setting
for usb-storage.  It was needed in the first place only for handling
devices with a block size smaller than the maxpacket size and where
the host controller was not capable of fully general scatter-gather
operation (that is, able to merge two SG segments into a single USB
packet).  But:

	High-speed or slower connections never use a bulk maxpacket
	value larger than 512;

	The SCSI layer does not handle block devices with a block size
	smaller than 512 bytes;

	All the host controllers capable of SuperSpeed operation can
	handle fully general SG;

	Since commit ea44d190764b ("usbip: Implement SG support to
	vhci-hcd and stub driver") was merged, the USB/IP driver can
	also handle SG.

Therefore all supported device/controller combinations should be okay
with no need for any special virt_boundary_mask.  So in order to fix
the swiotlb problem, this patch reverts commit 747668dbc061.

Reported-and-tested-by: Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>
Link: https://marc.info/?l=linux-usb&m=157134199501202&w=2
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: Seth Bollinger <Seth.Bollinger@digi.com>
CC: <stable@vger.kernel.org>

---


[as1922]


 drivers/usb/storage/scsiglue.c |   10 ----------
 1 file changed, 10 deletions(-)

Index: usb-devel/drivers/usb/storage/scsiglue.c
===================================================================
--- usb-devel.orig/drivers/usb/storage/scsiglue.c
+++ usb-devel/drivers/usb/storage/scsiglue.c
@@ -68,7 +68,6 @@ static const char* host_info(struct Scsi
 static int slave_alloc (struct scsi_device *sdev)
 {
 	struct us_data *us = host_to_us(sdev->host);
-	int maxp;
 
 	/*
 	 * Set the INQUIRY transfer length to 36.  We don't use any of
@@ -78,15 +77,6 @@ static int slave_alloc (struct scsi_devi
 	sdev->inquiry_len = 36;
 
 	/*
-	 * USB has unusual scatter-gather requirements: the length of each
-	 * scatterlist element except the last must be divisible by the
-	 * Bulk maxpacket value.  Fortunately this value is always a
-	 * power of 2.  Inform the block layer about this requirement.
-	 */
-	maxp = usb_maxpacket(us->pusb_dev, us->recv_bulk_pipe, 0);
-	blk_queue_virt_boundary(sdev->request_queue, maxp - 1);
-
-	/*
 	 * Some host controllers may have alignment requirements.
 	 * We'll play it safe by requiring 512-byte alignment always.
 	 */

