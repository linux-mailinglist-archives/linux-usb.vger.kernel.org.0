Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729E61D366C
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 18:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbgENQ0F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 12:26:05 -0400
Received: from netrider.rowland.org ([192.131.102.5]:45369 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726117AbgENQ0F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 12:26:05 -0400
Received: (qmail 10249 invoked by uid 500); 14 May 2020 12:26:04 -0400
Date:   Thu, 14 May 2020 12:26:04 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: musb: return -ESHUTDOWN in urb when three-strikes
 error happened
Message-ID: <20200514162604.GA9571@rowland.harvard.edu>
References: <20200513213620.21541-1-b-liu@ti.com>
 <20200514013205.GA10515@rowland.harvard.edu>
 <20200514142803.GA11463@iaqt7>
 <20200514144053.GC12181@rowland.harvard.edu>
 <20200514150259.GB11463@iaqt7>
 <20200514153731.GC11463@iaqt7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514153731.GC11463@iaqt7>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 14, 2020 at 10:37:31AM -0500, Bin Liu wrote:
> On Thu, May 14, 2020 at 10:02:59AM -0500, Bin Liu wrote:
> > On Thu, May 14, 2020 at 10:40:53AM -0400, Alan Stern wrote:
> > > On Thu, May 14, 2020 at 09:28:03AM -0500, Bin Liu wrote:
> > > > On Wed, May 13, 2020 at 09:32:05PM -0400, Alan Stern wrote:
> > > > > On Wed, May 13, 2020 at 04:36:20PM -0500, Bin Liu wrote:
> > > > > > When a USB device attached to a hub got disconnected, MUSB controller
> > > > > > generates RXCSR_RX_ERROR interrupt for the 3-strikes-out error.
> > > > > > 
> > > > > > Currently the MUSB host driver returns -EPROTO in current URB, then the
> > > > > > USB device driver could immediately resubmit the URB which causes MUSB
> > > > > > generate RXCSR_RX_ERROR interrupt again. This circle causes interrupt
> > > > > > storm then the hub never got a chance to report the USB device detach.
> > > > > > 
> > > > > > To fix the interrupt storm, change the URB return code to -ESHUTDOWN for
> > > > > > MUSB_RXCSR_H_ERROR interrupt, so that the USB device driver will not
> > > > > > immediately resubmit the URB.
> > > > > > 
> > > > > > Signed-off-by: Bin Liu <b-liu@ti.com>
> > > > > 
> > > > > Strictly speaking, this is not the right thing to do.  It goes against 
> > > > > the API described in error-codes.rst.  A better approach would be to fix 
> > > > 
> > > > error-codes.rst says:
> > > > 
> > > > -ESHUTDOWN              The device or host controller has been
> > > > 			disabled due to some problem that could not
> > > > 			be worked around, such as a physical
> > > > 			disconnect.
> > > > 
> > > > So -ESHUTDOWN is applicable in this case - the device is disconnected
> > > > behind a hub.
> > > 
> > > Yes, but you don't _know_ that the device was disconnected.  All you 
> > > know is that there was a 3-strikes error.  Other problems can cause such 
> > > errors (noise, for example).
> > 
> > Yes, I know this. But we don't have a solution then. I cannot add
> > resubmit delay in those ~500 device drivers.
> 
> By the way I don't think noise could last long enough to cause 3-strikes
> error. A shortest USB packet is about 3-bytes long, a noise should be
> just a glitch, it won't last at least 3-bytes long to supress the bus
> and 3 times on the exact timing when the host expecting a response
> packet. I cannot think of any other reason which can cause the 3-strikes
> error other than the device is off the bus.

Heh.  I heard from somebody (many years ago) about a setup where one of 
his USB devices stopped working whenever he turned on the fluorescent 
lights.

Yes, I agree that noise is pretty uncommon, and the vast majority of 
3-strikes errors are caused by disconnection or device firmware bugs.  
That's why I didn't NAK this patch.

Still, it's worth pointing out that this change abuses the API (perhaps 
mentioning it in a comment).  And it still would be preferable to fix 
the drivers in question, impractical though that may be.  (I have a hard 
time believing there are really 500 of them getting this wrong...)

Alan Stern
