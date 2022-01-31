Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F13204A4A9E
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jan 2022 16:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379623AbiAaPci (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jan 2022 10:32:38 -0500
Received: from netrider.rowland.org ([192.131.102.5]:36743 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1379586AbiAaPci (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jan 2022 10:32:38 -0500
Received: (qmail 274409 invoked by uid 1000); 31 Jan 2022 10:32:37 -0500
Date:   Mon, 31 Jan 2022 10:32:37 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Michael Grzeschik <mgr@pengutronix.de>, linux-usb@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca
Subject: Re: [PATCH] dummy_hcd: add isoc support
Message-ID: <YfgBFao+zbVhH8pk@rowland.harvard.edu>
References: <164154749753.1224575.16682991529695492259@Monstersaurus>
 <20220126132249.2133168-1-m.grzeschik@pengutronix.de>
 <YfFyM9Dadim3t88s@rowland.harvard.edu>
 <20220126183138.GB6506@pengutronix.de>
 <164363090018.533872.2376373763275566038@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164363090018.533872.2376373763275566038@Monstersaurus>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 31, 2022 at 12:08:20PM +0000, Kieran Bingham wrote:
> Hi Michael, Alan,
> 
> Quoting Michael Grzeschik (2022-01-26 18:31:38)
> > On Wed, Jan 26, 2022 at 11:09:23AM -0500, Alan Stern wrote:
> > >On Wed, Jan 26, 2022 at 02:22:49PM +0100, Michael Grzeschik wrote:
> > >> With this patch, the dummy_hcd gains first support for isoc transfers.
> > >> It will complete the whole urb with all packages.
> > >
> > >"packets", not "packages".
> > 
> > Right.
> > 
> > >>  Even if the gadget
> > >> side did not enqueue any request, the urb will be handled.
> > >>
> > >> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > >
> > >I don't like this idea.  If support for isochronous transfers is added,
> > >it should be done correctly.  That is, the implementation should support
> > >scheduling of transfers, periodic bandwidth reservation, high-bandwidth
> > >transfers, and so on.
> > >
> > >The whole point of dummy-hcd is to emulate a real host controller as
> > >closely as possible.  Real isochronous transfers do not complete all at
> > >once.
> 
> Being able to at least test uvc-gadget in a virtual environment would
> already be a big benefit. As this is emulation, not simulation is it
> essential that an exact mapping of the hardware is in place?

It doesn't have to be exact, but it should be close enough to test the 
essential aspects of isochronous transfers.  In particular, people will 
need to be able to test the timing aspects -- they are a big part of the 
isochronous mechanism.

> Is there anything we can do to support the progression of this
> development?
> 
> I.e. could we support this method first with a 
>   WARN_ONCE("This does not fully emulate Isochronous support");

No, as Greg said, don't do that.

Improve the emulation in the patch so that it does do proper scheduling 
for isochronous transfers.  You don't have to worry about all the 
aspects of this -- for example, since dummy-hcd supports only one device 
at a time, it should be okay to leave out checks for overcommitting 
periodic transfer times during a frame or microframe.  (dummy-hcd 
doesn't currently do that sort of check for interrupt transfers.)  But 
the emulation should be sufficiently realistic to return -EXDEV errors 
for URBs or packets that were submitted too late.

Alternatively, you can simply keep the patch that Michael submitted as 
an out-of-tree resource for people who want to test uvc-gadget.

> That would allow infrastructure to be built up that uses this
> functionality, which would then in turn feed back into providing a means
> to actually test the improvements to the isochronous support on top.

Without realistic timing emulation, the tests would be only minimally 
useful.

Alan Stern
