Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5E73D1607
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 20:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236675AbhGURfn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 13:35:43 -0400
Received: from netrider.rowland.org ([192.131.102.5]:56897 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S238426AbhGURfj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 13:35:39 -0400
Received: (qmail 643149 invoked by uid 1000); 21 Jul 2021 14:16:12 -0400
Date:   Wed, 21 Jul 2021 14:16:12 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Guido Kiener <Guido.Kiener@rohde-schwarz.com>
Cc:     dave penkler <dpenkler@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "qiang.zhang@windriver.com" <qiang.zhang@windriver.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "paulmck@kernel.org" <paulmck@kernel.org>,
        USB <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: usbtmc: Fix RCU stall warning
Message-ID: <20210721181612.GA642536@rowland.harvard.edu>
References: <312e0c8295c94e8382dfa5dd20659d13@rohde-schwarz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <312e0c8295c94e8382dfa5dd20659d13@rohde-schwarz.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 21, 2021 at 05:08:48PM +0000, Guido Kiener wrote:
> > > > Subject: *EXT* Re: [PATCH] USB: usbtmc: Fix RCU stall warning
> > > >
> > > > On Wed, Jul 21, 2021 at 11:44:23AM +0200, dave penkler wrote:
> > > > > Sorry, the issue this patch is trying to fix occurs because the
> > > > > current usbtmc driver resubmits the URB when it gets an EPROTO return.
> > > > > The dummy usb host controller driver used in the syzbot tests
> > > > > keeps returning the resubmitted URB with EPROTO causing a loop
> > > > > that starves RCU. With an actual HCI driver it either recovers or returns an
> > EPIPE.
> > > >
> > > > Are you sure about that?  Have you ever observed a usbtmc device
> > > > recovering and continuing to operate after an EPROTO error?
> > >
> > > I can't speak for Dave and his investigations. However as you remember
> > > I did tests with EPROTO errors, see thread:
> > > https://marc.info/?l=linux-usb&m=162163776930423&w=2
> > > In the thread you can see the recovering.
> > 
> > Ah yes, now I remember.
> > 
> > That message doesn't show the _device_ recovering and continuing to operate,
> > though.  It shows the _system_ recovering and realizing that the device has been
> > disconnected.
> > 
> > What I was asking about was whether you knew of a case where there was an
> > EPROTO error but afterward the usbtmc device continued to work -- no
> > disconnection.  Assuming such cases are vanishingly rare, there's no harm in
> > having the driver give up whenever it encounters EPROTO.
> 
> I have no idea how often the EPROTO error can happen during normal operation and believe you that it's vanishingly rare.
> When it happens, does the USB hardware protocol automatically retransmit the lost/invalid packet?

When a low-level protocol error occurs, the USB host controller hardware 
does automatically retransmit the packet.  USB has a "3 strikes and you're 
out" approach: The error doesn't get reported until there have been three 
failed transmission attempts.

On the other hand, dummy-hcd never has these errors (for obvious reasons) 
unless the function driver has been unbound, which always results in a 
disconnect.  Or if the host-side driver does something wrong, like trying to 
communicate with a nonexistent endpoint.

> If yes, we should think about an error counter.

What for?

Besides, the ehci-hcd driver already has a higher-level retry loop for 
low-level protocol errors.  It makes at least 32 attempts before giving up 
on a transaction.

> If not, then we really can stop the INT pipe and the user will detect that something is wrong when reading the status.

Or in the most likely case, the system will realize (after a few hundred 
milliseconds) that the device has been disconnected and will clean up.  The 
only question is whether the usbtmc driver should make multiple futile 
attempts to restart the transmission during those milliseconds.  I think it 
shouldn't.

Alan Stern
