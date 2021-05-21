Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B92038BB79
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 03:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236570AbhEUBXN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 21:23:13 -0400
Received: from netrider.rowland.org ([192.131.102.5]:41837 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S236106AbhEUBXM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 May 2021 21:23:12 -0400
Received: (qmail 1225044 invoked by uid 1000); 20 May 2021 21:21:49 -0400
Date:   Thu, 20 May 2021 21:21:49 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Guido Kiener <Guido.Kiener@rohde-schwarz.com>,
        dave penkler <dpenkler@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: Recovering from transaction errors [was: Re: [syzbot] INFO: rcu
 detected stall in tx]
Message-ID: <20210521012149.GB1224757@rowland.harvard.edu>
References: <d673611ca53f42a3a629eb051cabc6eb@rohde-schwarz.com>
 <20210519173545.GA1173157@rowland.harvard.edu>
 <12088413-2f7d-a1e5-5e8a-25876d85d18a@synopsys.com>
 <20210520020117.GA1186755@rowland.harvard.edu>
 <74b2133b-2f77-c86f-4c8b-1189332617d3@synopsys.com>
 <20210520210506.GA1218545@rowland.harvard.edu>
 <4f73f443-7509-e740-c6b9-884614dcfd4b@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f73f443-7509-e740-c6b9-884614dcfd4b@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 20, 2021 at 09:23:57PM +0000, Thinh Nguyen wrote:
> Alan Stern wrote:
> >> If the cable is unplugged, then we should get a connection change event
> >> and the driver can handle it properly.
> > 
> > Yes -- unless the driver is in such a tight retry loop that the rest of 
> > the system never gets a chance to process the connection change event.  
> > I've seen bug reports where that happened.
> 
> I see. I'll keep that in mind, but it sounds like HW issue? The driver
> handles retry base on events generated from the HW and the HW should
> properly generate connection event and not get stuck in some loop.

The hardware _does_ generate disconnect events.  The problem is that the 
class driver doesn't react properly to transaction errors and thereby 
prevents the rest of the system from handling the disconnect events.  
It's a bug in the class driver, not in the hardware.

> >>> For the case in question (the syzbot bug report that started this 
> >>> thread), the class driver doesn't try to perform any recovery.  It just 
> >>> resubmits the URB, getting into a tight retry loop which consumes too 
> >>> much CPU time.  Simply giving up would be preferable.
> >>>
> >>> Alan Stern
> >>>
> >>
> >> I see. By giving up, you mean doing port reset right? Otherwise it needs
> >> some other mechanism to synchronize with the device side.
> > 
> > No, I mean the driver should just stop communicating with the device.  
> > That's an appropriate action for lots of drivers.  If the user wants to 
> > re-synchronize with the device, he can unplug the USB cable and plug it 
> > back in again.
> > 
> > Alan Stern
> > 
> 
> Ok. Would it be more difficult to automate this if it requires user
> intervention? I assume syzbot doesn't want the user to do that.

Difficult to automate what, exactly?  Unplugging the USB cable?  How 
could you possibly automate that?

At the moment, I think the best approach is Guido's suggestion to reject 
URBs submitted to endpoints that have gotten a transaction error, until 
the error status has somehow been cleared.  Is that what you would like 
to see automated?

Alan Stern
