Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9061EAFC
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 21:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729164AbfD2TmB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 15:42:01 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:55018 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728928AbfD2TmB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 15:42:01 -0400
Received: (qmail 8527 invoked by uid 2102); 29 Apr 2019 15:42:00 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 29 Apr 2019 15:42:00 -0400
Date:   Mon, 29 Apr 2019 15:42:00 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     David Laight <David.Laight@ACULAB.COM>,
        "gregKH@linuxfoundation.org" <gregKH@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] UAS: fix alignment of scatter/gather segments
In-Reply-To: <1556563340.20085.28.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.1904291534560.1632-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 29 Apr 2019, Oliver Neukum wrote:

> On Mo, 2019-04-29 at 13:55 -0400, Alan Stern wrote:
> > On Mon, 29 Apr 2019, Oliver Neukum wrote:
> > 
> > > On Mo, 2019-04-29 at 12:08 -0400, Alan Stern wrote:
> > > > On Mon, 29 Apr 2019, Oliver Neukum wrote:
> > > > 
> > > > > On Mo, 2019-04-29 at 15:06 +0000, David Laight wrote:
> > > > 
> > > > > But the statement the old comment made are no longer correct.
> > > > 
> > > > Perhaps David would be satisfied if the comment were changed to say 
> > > > that _some_ USB controller drivers have this unusual alignment 
> > > > requirement.
> > > 
> > > It would seem to me that every controller that does not do
> > > scatter/gather has this requirement. In other words, this is
> > > the true requirement of USB. It does not come from the
> > > controller. It comes from the protocol's need to not
> > > send a short package.
> > 
> > Are you sure that xHCI has this requirement?  I haven't checked the
> 
> I am sure that it has not. UAS would never have worked.
> Like in the case of storage this patch is necessary
> for virtual controllers.

Okay, yes, I agree with what you say.  With the addition that some
controllers which _do_ support scatter-gather also have this
requirement.

In fact, xhci-hcd may be the only driver that doesn't need this special 
alignment.

Alan Stern

> > spec.  I know that UHCI, OHCI, and EHCI do need this alignment (and
> > OHCI and EHCI do in fact have hardware support for scatter-gather).
> > 
> > More precisely, what matters is whether the controller is able to merge
> > two different DMA segments into a single packet.  UHCI can't.  OHCI and
> 
> Correct. However, we cannot blindly assume in a class driver that
> certain controllers will be used.
> 
> > EHCI can, but only if the first segment ends at a page boundary and the
> > second begins at a page boundary -- it's easier just to say that the
> > segments have to be maxpacket-aligned.
> > 
> > > The second, old, comment is about controllers.
> > 
> > Well, if the drivers would use bounce buffers to work around the 
> > controllers' issues then they wouldn't have this special requirement.  
> > So it really is a combination of what the hardware can do and what the 
> > driver can do.
> 
> Yes, but the point of using an API to specify restrictions to the
> upper layer is to avoid using bounce buffers. Besides, bounce
> buffers in block IO is interesting in terms of VM implications.
> 
> 	Regards
> 		Oliver
> 
> 
> 

