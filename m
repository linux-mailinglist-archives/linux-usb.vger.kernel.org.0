Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95D90D9815
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 19:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436481AbfJPRBV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 13:01:21 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:42250 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726052AbfJPRBV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Oct 2019 13:01:21 -0400
Received: (qmail 2878 invoked by uid 2102); 16 Oct 2019 13:01:20 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 16 Oct 2019 13:01:20 -0400
Date:   Wed, 16 Oct 2019 13:01:20 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>
cc:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        USB list <linux-usb@vger.kernel.org>,
        <linux-block@vger.kernel.org>,
        Kernel development list <linux-kernel@vger.kernel.org>
Subject: Re: reeze while write on external usb 3.0 hard disk [Bug 204095]
In-Reply-To: <20191013181116.GA3858@lazy.lzy>
Message-ID: <Pine.LNX.4.44L0.1910161258081.1304-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 13 Oct 2019, Piergiorgio Sartor wrote:

> On Mon, Sep 30, 2019 at 08:25:01PM +0200, Piergiorgio Sartor wrote:
> > On Sun, Sep 29, 2019 at 09:01:48PM -0400, Alan Stern wrote:
> > > On Sun, 29 Sep 2019, Piergiorgio Sartor wrote:
> > > 
> > > > On Wed, Sep 25, 2019 at 02:31:58PM -0400, Alan Stern wrote:
> > > > > On Wed, 25 Sep 2019, Piergiorgio Sartor wrote:
> > > > > 
> > > > > > On Mon, Aug 26, 2019 at 07:38:33PM +0200, Piergiorgio Sartor wrote:
> > > > > > > On Tue, Aug 20, 2019 at 06:37:22PM +0200, Piergiorgio Sartor wrote:
> > > > > > > > On Tue, Aug 20, 2019 at 09:23:26AM +0200, Christoph Hellwig wrote:
> > > > > > > > > On Mon, Aug 19, 2019 at 10:14:25AM -0400, Alan Stern wrote:
> > > > > > > > > > Let's bring this to the attention of some more people.
> > > > > > > > > > 
> > > > > > > > > > It looks like the bug that was supposed to be fixed by commit
> > > > > > > > > > d74ffae8b8dd ("usb-storage: Add a limitation for
> > > > > > > > > > blk_queue_max_hw_sectors()"), which is part of 5.2.5, but apparently
> > > > > > > > > > the bug still occurs.
> > > > > > > > > 
> > > > > > > > > Piergiorgio,
> > > > > > > > > 
> > > > > > > > > can you dump the content of max_hw_sectors_kb file for your USB storage
> > > > > > > > > device and send that to this thread?
> > > > > > > > 
> > > > > > > > Hi all,
> > > > > > > > 
> > > > > > > > for both kernels, 5.1.20 (working) and 5.2.8 (not working),
> > > > > > > > the content of /sys/dev/x:y/queue/max_hw_sectors_kb is 512
> > > > > > > > for USB storage devices (2.0 and 3.0).
> > > > > > > > 
> > > > > > > > This is for the PC showing the issue.
> > > > > > > > 
> > > > > > > > In an other PC, which does not show the issus at the moment,
> > > > > > > > the values are 120, for USB2.0, and 256, for USB3.0.
> > > 
> > > > > One thing you can try is git bisect from 5.1.20 (or maybe just 5.1.0)  
> > > > > to 5.2.8.  If you can identify a particular commit which caused the
> > > > > problem to start, that would help.
> > > > 
> > > > OK, I tried a bisect (2 days compilations...).
> > > > Assuming I've done everything correctly (how to
> > > > test this? How to remove the guilty patch?), this
> > > > was the result:
> > > > 
> > > > 09324d32d2a0843e66652a087da6f77924358e62 is the first bad commit
> > > > commit 09324d32d2a0843e66652a087da6f77924358e62
> > > > Author: Christoph Hellwig <hch@lst.de>
> > > > Date:   Tue May 21 09:01:41 2019 +0200
> > > > 
> > > >     block: force an unlimited segment size on queues with a virt boundary
> > > > 
> > > >     We currently fail to update the front/back segment size in the bio when
> > > >     deciding to allow an otherwise gappy segement to a device with a
> > > >     virt boundary.  The reason why this did not cause problems is that
> > > >     devices with a virt boundary fundamentally don't use segments as we
> > > >     know it and thus don't care.  Make that assumption formal by forcing
> > > >     an unlimited segement size in this case.
> > > > 
> > > >     Fixes: f6970f83ef79 ("block: don't check if adjacent bvecs in one bio can be mergeable")
> > > >     Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > >     Reviewed-by: Ming Lei <ming.lei@redhat.com>
> > > >     Reviewed-by: Hannes Reinecke <hare@suse.com>
> > > >     Signed-off-by: Jens Axboe <axboe@kernel.dk>
> > > > 
> > > > :040000 040000 57ba04a02f948022c0f6ba24bfa36f3b565b2440 8c925f71ce75042529c001bf244b30565d19ebf3 M      block
> > > > 
> > > > What to do now?
> > > 
> > > Here's how to verify that the bisection got a correct result.  First, 
> > > do a git checkout of commit 09324d32d2a0, build the kernel, and make 
> > > sure that it exhibits the problem.
> > > 
> > > Next, have git write out the contents of that commit in the form of a
> > > patch (git show commit-id >patchfile), and revert it (git apply -R
> > > patchfile).  Build the kernel from that tree, and make sure that it
> > > does not exhibit the problem.  If it doesn't, you have definitely shown
> > > that this commit is the cause (or at least, is _one_ of the causes).
> > 
> > I tried as suggested, i.e. jumping to commit
> > 09324d32d2a0843e66652a087da6f77924358e62, testing,
> > removing the patch, testing.
> > The result was as expected.
> > I was able to reproduce the issue with the commit,
> > I was not able to reproduce it without.
> > It seems this patch / commit is causing the problem.
> > Directly or indirectly.
> > 
> > What are the next steps?
> 
> Hi all,
> 
> I tested kernel 5.3.5 (Fedora kernel-5.3.5-200.fc30.x86_64),
> with same problematic results.
> 
> Again, what should be done now?
> Could you please revert the patch?
> 
> Or is there something else to check?

Here is one more thing you can try.  I have no idea whether it will 
make any difference, but the Changelog entry for the patch you 
identified suggests that it might help.

Alan Stern



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

