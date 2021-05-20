Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D30738B8B8
	for <lists+linux-usb@lfdr.de>; Thu, 20 May 2021 23:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhETVG3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 17:06:29 -0400
Received: from netrider.rowland.org ([192.131.102.5]:33175 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229708AbhETVG2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 May 2021 17:06:28 -0400
Received: (qmail 1218970 invoked by uid 1000); 20 May 2021 17:05:06 -0400
Date:   Thu, 20 May 2021 17:05:06 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Guido Kiener <Guido.Kiener@rohde-schwarz.com>,
        dave penkler <dpenkler@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Recovering from transaction errors [was: Re: [syzbot] INFO: rcu
 detected stall in tx]
Message-ID: <20210520210506.GA1218545@rowland.harvard.edu>
References: <d673611ca53f42a3a629eb051cabc6eb@rohde-schwarz.com>
 <20210519173545.GA1173157@rowland.harvard.edu>
 <12088413-2f7d-a1e5-5e8a-25876d85d18a@synopsys.com>
 <20210520020117.GA1186755@rowland.harvard.edu>
 <74b2133b-2f77-c86f-4c8b-1189332617d3@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74b2133b-2f77-c86f-4c8b-1189332617d3@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 20, 2021 at 08:30:01PM +0000, Thinh Nguyen wrote:
> Hm... looks like we have a couple of issues in the uas storage class
> driver and the xhci driver.
> 
> We may need to fix that in the uas storage driver because it doesn't
> seem to handle it. (check uas_data_cmplt() in uas.c).

Hmmm.  I see that if there is an error, the driver assumes no data was 
transferred.  It shouldn't make that assumption; it should always use 
urb->actual_length.

It also doesn't indicate to the SCSI layer when a command gets an error 
and it doesn't try to do any recovery.  Of course, the SCSI error 
handler may initiate some recovery actions.

> As for the xhci driver, there maybe a case where the stream URB never
> gets to complete because the transaction err_count is not properly
> updated. The err_count for transaction error is stored in ep_ring, but
> the xhci driver may not be able to lookup the correct ep_ring based on
> TRB address for streams. There are cases for streams where the event
> TRBs have their TRB pointer field cleared to '0' (xhci spec section
> 4.12.2). If the xhci driver doesn't see ep_ring for transaction error,
> it automatically does a soft-retry. This is seen from one of our
> testings that the driver was repeatedly doing soft-retry until the class
> driver timed out.
> 
> Hi Mathias, maybe you have some comment on this? Thanks.
> 
> > 
> > The fact is that only a small percentage of -EPROTO errors are 
> > recoverable.  Some of them can be handled by a port reset, which can be 
> > pretty awkward to perform but does occasionally work.  A lot of them 
> > occur because the USB cable has been unplugged; obviously there's no way 
> > to recover from that.  With only a few exceptions, the best and simplest 
> > approach is not to try to recover at all.
> 
> If the cable is unplugged, then we should get a connection change event
> and the driver can handle it properly.

Yes -- unless the driver is in such a tight retry loop that the rest of 
the system never gets a chance to process the connection change event.  
I've seen bug reports where that happened.

> Yes, it's probably simplest to do a port reset and let the transfer be
> incomplete/corrupted. However, I think we should give
> ClearFeature(ep_halt) some more thoughts as I think it can be a recovery
> mechanism for storage class driver, even though that it may not be
> foolproof.

When you say storage class driver, which one are you talking about,
usb-storage or uas?  usb-storage already has a pretty robust recovery 
mechanism.

> > For the case in question (the syzbot bug report that started this 
> > thread), the class driver doesn't try to perform any recovery.  It just 
> > resubmits the URB, getting into a tight retry loop which consumes too 
> > much CPU time.  Simply giving up would be preferable.
> > 
> > Alan Stern
> > 
> 
> I see. By giving up, you mean doing port reset right? Otherwise it needs
> some other mechanism to synchronize with the device side.

No, I mean the driver should just stop communicating with the device.  
That's an appropriate action for lots of drivers.  If the user wants to 
re-synchronize with the device, he can unplug the USB cable and plug it 
back in again.

Alan Stern
