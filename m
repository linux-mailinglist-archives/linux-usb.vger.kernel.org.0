Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D777AE1F66
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 17:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406756AbfJWPee (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 11:34:34 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:40158 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2403853AbfJWPee (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 11:34:34 -0400
Received: (qmail 5537 invoked by uid 2102); 23 Oct 2019 11:34:33 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 23 Oct 2019 11:34:33 -0400
Date:   Wed, 23 Oct 2019 11:34:33 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>, Oliver Neukum <oneukum@suse.com>
cc:     Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>,
        Seth Bollinger <Seth.Bollinger@digi.com>,
        Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        USB list <linux-usb@vger.kernel.org>
Subject: [PATCH] UAS: Revert commit 3ae62a42090f ("UAS: fix alignment of
 scatter/gather segments") 
In-Reply-To: <20191023015348.GA16123@lst.de>
Message-ID: <Pine.LNX.4.44L0.1910231132470.1878-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit 3ae62a42090f ("UAS: fix alignment of scatter/gather segments"),
copying a similar commit for usb-storage, attempted to solve a problem
involving scatter-gather I/O and USB/IP by setting the
virt_boundary_mask for mass-storage devices.

However, it now turns out that the analogous change in usb-storage
interacted badly with commit 09324d32d2a0 ("block: force an unlimited
segment size on queues with a virt boundary"), which was added later.
A typical error message is:

	ehci-pci 0000:00:13.2: swiotlb buffer is full (sz: 327680 bytes),
	total 32768 (slots), used 97 (slots)

There is no longer any reason to keep the virt_boundary_mask setting
in the uas driver.  It was needed in the first place only for
handling devices with a block size smaller than the maxpacket size and
where the host controller was not capable of fully general
scatter-gather operation (that is, able to merge two SG segments into
a single USB packet).  But:

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
with no need for any special virt_boundary_mask.  So in order to head
off potential problems similar to those affecting usb-storage, this
patch reverts commit 3ae62a42090f.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: Oliver Neukum <oneukum@suse.com>
CC: <stable@vger.kernel.org>

---


[as1923]


 drivers/usb/storage/uas.c |   20 --------------------
 1 file changed, 20 deletions(-)

Index: usb-devel/drivers/usb/storage/uas.c
===================================================================
--- usb-devel.orig/drivers/usb/storage/uas.c
+++ usb-devel/drivers/usb/storage/uas.c
@@ -789,30 +789,10 @@ static int uas_slave_alloc(struct scsi_d
 {
 	struct uas_dev_info *devinfo =
 		(struct uas_dev_info *)sdev->host->hostdata;
-	int maxp;
 
 	sdev->hostdata = devinfo;
 
 	/*
-	 * We have two requirements here. We must satisfy the requirements
-	 * of the physical HC and the demands of the protocol, as we
-	 * definitely want no additional memory allocation in this path
-	 * ruling out using bounce buffers.
-	 *
-	 * For a transmission on USB to continue we must never send
-	 * a package that is smaller than maxpacket. Hence the length of each
-         * scatterlist element except the last must be divisible by the
-         * Bulk maxpacket value.
-	 * If the HC does not ensure that through SG,
-	 * the upper layer must do that. We must assume nothing
-	 * about the capabilities off the HC, so we use the most
-	 * pessimistic requirement.
-	 */
-
-	maxp = usb_maxpacket(devinfo->udev, devinfo->data_in_pipe, 0);
-	blk_queue_virt_boundary(sdev->request_queue, maxp - 1);
-
-	/*
 	 * The protocol has no requirements on alignment in the strict sense.
 	 * Controllers may or may not have alignment restrictions.
 	 * As this is not exported, we use an extremely conservative guess.

