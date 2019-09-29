Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E954FC196E
	for <lists+linux-usb@lfdr.de>; Sun, 29 Sep 2019 22:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729057AbfI2UNw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Sep 2019 16:13:52 -0400
Received: from vsmx009.vodafonemail.xion.oxcs.net ([153.92.174.87]:30998 "EHLO
        vsmx009.vodafonemail.xion.oxcs.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726827AbfI2UNv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Sep 2019 16:13:51 -0400
Received: from vsmx001.vodafonemail.xion.oxcs.net (unknown [192.168.75.191])
        by mta-5-out.mta.xion.oxcs.net (Postfix) with ESMTP id 3F170159BD66;
        Sun, 29 Sep 2019 20:13:49 +0000 (UTC)
Received: from lazy.lzy (unknown [87.157.113.162])
        by mta-5-out.mta.xion.oxcs.net (Postfix) with ESMTPA id 8342415A2577;
        Sun, 29 Sep 2019 20:13:34 +0000 (UTC)
Received: from lazy.lzy (localhost [127.0.0.1])
        by lazy.lzy (8.15.2/8.14.5) with ESMTPS id x8TKDWvk003119
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 29 Sep 2019 22:13:32 +0200
Received: (from red@localhost)
        by lazy.lzy (8.15.2/8.15.2/Submit) id x8TKDWCL003118;
        Sun, 29 Sep 2019 22:13:32 +0200
Date:   Sun, 29 Sep 2019 22:13:32 +0200
From:   Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>,
        Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        USB list <linux-usb@vger.kernel.org>,
        linux-block@vger.kernel.org,
        Kernel development list <linux-kernel@vger.kernel.org>
Subject: Re: reeze while write on external usb 3.0 hard disk [Bug 204095]
Message-ID: <20190929201332.GA3099@lazy.lzy>
References: <20190925170741.GA5235@lazy.lzy>
 <Pine.LNX.4.44L0.1909251429370.4444-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1909251429370.4444-100000@netrider.rowland.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-VADE-STATUS: LEGIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 25, 2019 at 02:31:58PM -0400, Alan Stern wrote:
> On Wed, 25 Sep 2019, Piergiorgio Sartor wrote:
> 
> > On Mon, Aug 26, 2019 at 07:38:33PM +0200, Piergiorgio Sartor wrote:
> > > On Tue, Aug 20, 2019 at 06:37:22PM +0200, Piergiorgio Sartor wrote:
> > > > On Tue, Aug 20, 2019 at 09:23:26AM +0200, Christoph Hellwig wrote:
> > > > > On Mon, Aug 19, 2019 at 10:14:25AM -0400, Alan Stern wrote:
> > > > > > Let's bring this to the attention of some more people.
> > > > > > 
> > > > > > It looks like the bug that was supposed to be fixed by commit
> > > > > > d74ffae8b8dd ("usb-storage: Add a limitation for
> > > > > > blk_queue_max_hw_sectors()"), which is part of 5.2.5, but apparently
> > > > > > the bug still occurs.
> > > > > 
> > > > > Piergiorgio,
> > > > > 
> > > > > can you dump the content of max_hw_sectors_kb file for your USB storage
> > > > > device and send that to this thread?
> > > > 
> > > > Hi all,
> > > > 
> > > > for both kernels, 5.1.20 (working) and 5.2.8 (not working),
> > > > the content of /sys/dev/x:y/queue/max_hw_sectors_kb is 512
> > > > for USB storage devices (2.0 and 3.0).
> > > > 
> > > > This is for the PC showing the issue.
> > > > 
> > > > In an other PC, which does not show the issus at the moment,
> > > > the values are 120, for USB2.0, and 256, for USB3.0.
> > > 
> > > Hi again,
> > > 
> > > any news on this?
> > > 
> > > Is there anything I can do to help?
> > > 
> > > Should I report this somewhere else too?
> > > 
> > > Currently this is quite a huge problem for me,
> > > since the only working external storage is an
> > > old 1394 HDD...
> > 
> > Hi all,
> > 
> > I'm now on kernel 5.2.16, from Fedora, and still I
> > see the same issue.
> > 
> > I guess it is not a chipset quirk, since there
> > are two involved here.
> > For the USB 2.0 I've (with "lspci"):
> > 
> > USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB EHCI Controller (prog-if 20 [EHCI])
> > 
> > For USB 3.0 I've:
> > 
> > USB controller: ASMedia Technology Inc. ASM1042 SuperSpeed USB Host Controller (prog-if 30 [XHCI])
> > 
> > Any idea on how to proceed?
> > 
> > Thanks a lot.
> 
> One thing you can try is git bisect from 5.1.20 (or maybe just 5.1.0)  
> to 5.2.8.  If you can identify a particular commit which caused the
> problem to start, that would help.

OK, I tried a bisect (2 days compilations...).
Assuming I've done everything correctly (how to
test this? How to remove the guilty patch?), this
was the result:

09324d32d2a0843e66652a087da6f77924358e62 is the first bad commit
commit 09324d32d2a0843e66652a087da6f77924358e62
Author: Christoph Hellwig <hch@lst.de>
Date:   Tue May 21 09:01:41 2019 +0200

    block: force an unlimited segment size on queues with a virt boundary

    We currently fail to update the front/back segment size in the bio when
    deciding to allow an otherwise gappy segement to a device with a
    virt boundary.  The reason why this did not cause problems is that
    devices with a virt boundary fundamentally don't use segments as we
    know it and thus don't care.  Make that assumption formal by forcing
    an unlimited segement size in this case.

    Fixes: f6970f83ef79 ("block: don't check if adjacent bvecs in one bio can be mergeable")
    Signed-off-by: Christoph Hellwig <hch@lst.de>
    Reviewed-by: Ming Lei <ming.lei@redhat.com>
    Reviewed-by: Hannes Reinecke <hare@suse.com>
    Signed-off-by: Jens Axboe <axboe@kernel.dk>

:040000 040000 57ba04a02f948022c0f6ba24bfa36f3b565b2440 8c925f71ce75042529c001bf244b30565d19ebf3 M      block

What to do now?

Thanks,

bye,

-- 

piergiorgio
