Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4D6FBA7
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 16:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbfD3Oj0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 10:39:26 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:35578 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726073AbfD3Oj0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 10:39:26 -0400
Received: (qmail 3134 invoked by uid 2102); 30 Apr 2019 10:39:25 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 30 Apr 2019 10:39:25 -0400
Date:   Tue, 30 Apr 2019 10:39:25 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     David Laight <David.Laight@ACULAB.COM>
cc:     Oliver Neukum <oneukum@suse.com>,
        "gregKH@linuxfoundation.org" <gregKH@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] UAS: fix alignment of scatter/gather segments
In-Reply-To: <734e89837b454acea32b990fa2aff902@AcuMS.aculab.com>
Message-ID: <Pine.LNX.4.44L0.1904301023570.1465-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 30 Apr 2019, David Laight wrote:

> From: Alan Stern
> > Sent: 29 April 2019 18:55
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
> 
> The hardware requirement is that packets that need to be joined
> together to make a long request must be 'full'.
> In many cases this means a zero length packet must be sent to
> correctly terminate a request that is a multiple of the packet size.

With mass storage this happens only when there's an error.  In other
cases the sender and receiver both know beforehand how long a bulk
transfer will be, so there's no need to mark an early termination with
a zero-length packet.

> Since the software has to add the zero length packet there is
> no real difference between a single scatter-gather transmit and
> multiple single packet trnasmits.

In fact, zero-length packets have nothing to do with it.  The source of
the data doesn't matter: It could be scatter-gather, a single
contiguous buffer, or even a Ouija board.  All that matters is that the
data shows up at the receiver as a series of packets in which all
(except possibly the last) are full size.  The receiver doesn't care 
how those packets were assembled.

> For USB2 bulk transfers the packet size is 512, and for USB3 1024.
> The old comment suggested 2048 for some unsupported interface.

Wireless USB.  And to be fair, the old comment also said that 
supporting such a large value would require changes outside the USB 
stack.

> > Are you sure that xHCI has this requirement?  I haven't checked the
> > spec.  I know that UHCI, OHCI, and EHCI do need this alignment (and
> > OHCI and EHCI do in fact have hardware support for scatter-gather).
> > 
> > More precisely, what matters is whether the controller is able to merge
> > two different DMA segments into a single packet.  UHCI can't.  OHCI and
> > EHCI can, but only if the first segment ends at a page boundary and the
> > second begins at a page boundary -- it's easier just to say that the
> > segments have to be maxpacket-aligned.
> 
> XHCI (for USB2 or USB3) can handle almost arbitrary fragments.
> There are a couple of annoying restrictions (IIRC):
> - Fragments cannot cross a 64k boundary.
>   (How much would it cost the hardware to have a 32bit (or even 64bit)
>   counter.)
> - The 'Link TRB' between ring segments must be aligned to a packet boundary.
> I believe the Linux XHCI driver now handles both these cases.
> (It hadn't used to - which is why I know anything about USB3 and XHCI.)
> 
> I also recall issues with non word aligned buffers for some controllers.
> 
> > > The second, old, comment is about controllers.
> > 
> > Well, if the drivers would use bounce buffers to work around the
> > controllers' issues then they wouldn't have this special requirement.
> > So it really is a combination of what the hardware can do and what the
> > driver can do.
> 
> Indeed.
> So any comment should refer to what the linux usb drivers requires
> of their 'user', not what happens on the USB wire.

The comment said nothing about the wire.  It was actually rather vague, 
just saying "USB" -- this could mean the hardware protocol or the USB 
host controller driver.

> It might me that you do end up having to request 1k aligned
> buffers for XHCI, but the comment should say that you are
> adding a far stronger restriction than that required by the
> driver and controller.

Depends on the driver.  For xHCI the restriction is stronger than 
required; for all the others (as far as I know) it is not.

> Given that XHCI is the most common interface (at least on x86)
> if the 1k alignment forces extra bounce buffers in any code
> paths it could be a performance issue.

If that happens we can ask the controller driver to export a 
"scatter-gather required alignment" parameter.  It seems premature to 
worry about it now.

Alan Stern

