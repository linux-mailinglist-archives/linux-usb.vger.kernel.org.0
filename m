Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7489FF5BA3
	for <lists+linux-usb@lfdr.de>; Sat,  9 Nov 2019 00:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfKHXFz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Nov 2019 18:05:55 -0500
Received: from vsmx011.vodafonemail.xion.oxcs.net ([153.92.174.89]:54594 "EHLO
        vsmx011.vodafonemail.xion.oxcs.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726095AbfKHXFz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Nov 2019 18:05:55 -0500
Received: from vsmx003.vodafonemail.xion.oxcs.net (unknown [192.168.75.197])
        by mta-5-out.mta.xion.oxcs.net (Postfix) with ESMTP id DF76959D3F7;
        Fri,  8 Nov 2019 23:05:52 +0000 (UTC)
Received: from lazy.lzy (unknown [93.212.126.195])
        by mta-7-out.mta.xion.oxcs.net (Postfix) with ESMTPA id 6EF28534352;
        Fri,  8 Nov 2019 23:05:38 +0000 (UTC)
Received: from lazy.lzy (localhost [127.0.0.1])
        by lazy.lzy (8.15.2/8.14.5) with ESMTPS id xA8N5b6n012018
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 9 Nov 2019 00:05:37 +0100
Received: (from red@localhost)
        by lazy.lzy (8.15.2/8.15.2/Submit) id xA8N5aYW012017;
        Sat, 9 Nov 2019 00:05:36 +0100
Date:   Sat, 9 Nov 2019 00:05:36 +0100
From:   Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>,
        Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        USB list <linux-usb@vger.kernel.org>,
        linux-block@vger.kernel.org,
        Kernel development list <linux-kernel@vger.kernel.org>
Subject: Re: reeze while write on external usb 3.0 hard disk [Bug 204095]
Message-ID: <20191108230536.GA11931@lazy.lzy>
References: <20191017175306.GA3014@lazy.lzy>
 <Pine.LNX.4.44L0.1910171522200.18407-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1910171522200.18407-100000@netrider.rowland.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-VADE-STATUS: LEGIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 17, 2019 at 03:23:34PM -0400, Alan Stern wrote:
> On Thu, 17 Oct 2019, Piergiorgio Sartor wrote:
> 
> > > Here is one more thing you can try.  I have no idea whether it will 
> > > make any difference, but the Changelog entry for the patch you 
> > > identified suggests that it might help.
> > > 
> > > Alan Stern
> > > 
> > > 
> > > 
> > > Index: usb-devel/drivers/usb/storage/scsiglue.c
> > > ===================================================================
> > > --- usb-devel.orig/drivers/usb/storage/scsiglue.c
> > > +++ usb-devel/drivers/usb/storage/scsiglue.c
> > > @@ -68,7 +68,6 @@ static const char* host_info(struct Scsi
> > >  static int slave_alloc (struct scsi_device *sdev)
> > >  {
> > >  	struct us_data *us = host_to_us(sdev->host);
> > > -	int maxp;
> > >  
> > >  	/*
> > >  	 * Set the INQUIRY transfer length to 36.  We don't use any of
> > > @@ -78,15 +77,6 @@ static int slave_alloc (struct scsi_devi
> > >  	sdev->inquiry_len = 36;
> > >  
> > >  	/*
> > > -	 * USB has unusual scatter-gather requirements: the length of each
> > > -	 * scatterlist element except the last must be divisible by the
> > > -	 * Bulk maxpacket value.  Fortunately this value is always a
> > > -	 * power of 2.  Inform the block layer about this requirement.
> > > -	 */
> > > -	maxp = usb_maxpacket(us->pusb_dev, us->recv_bulk_pipe, 0);
> > > -	blk_queue_virt_boundary(sdev->request_queue, maxp - 1);
> > > -
> > > -	/*
> > >  	 * Some host controllers may have alignment requirements.
> > >  	 * We'll play it safe by requiring 512-byte alignment always.
> > >  	 */
> > 
> > Hi,
> > 
> > I tested the patch.
> > 
> > Assumming I did everything properly, add patch,
> > test, issue not showing up, remove patch, re-test,
> > issue present.
> > 
> > It seems this patch you provide solves the issue.
> > 
> > Thanks a lot for the support and the solution.
> > 
> > I guess now this patch will be integrated into
> > mainline sometimes.
> > Please let me know, in this thread or directly, in
> > which kernel it will be available.
> 
> I'm busy for the next few days, but I will submit the patch next week.

Hi again,

this message to let you know I tested
kernel 5.3.9 (always from Fedora), to
which Greg Kroah-Hartman added your
patch, and everything seems to work
fine, no problems detected so far.

Thanks,

bye,

-- 

piergiorgio
