Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE5D5FF5C
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2019 03:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfGEBhJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 21:37:09 -0400
Received: from netrider.rowland.org ([192.131.102.5]:36635 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727345AbfGEBhJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jul 2019 21:37:09 -0400
Received: (qmail 1221 invoked by uid 500); 4 Jul 2019 21:37:08 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 4 Jul 2019 21:37:08 -0400
Date:   Thu, 4 Jul 2019 21:37:08 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>
cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>
Subject: Re: Virtual hub, resets etc...
In-Reply-To: <e1e27dc501bdb1c6dfb41019d0d9d3760280f4a7.camel@kernel.crashing.org>
Message-ID: <Pine.LNX.4.44L0.1907042135090.840-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 5 Jul 2019, Benjamin Herrenschmidt wrote:

> On Fri, 2019-07-05 at 07:44 +1000, Benjamin Herrenschmidt wrote:
> > > >    - At some point I had code to reject EP queue() if the device
> > > > is
> > > > suspended with -ESHUTDOWN. The end result was bad ...
> > > > f_mass_storage
> > > > goes into an infinite loop of trying to queue the same stuff in
> > > > start_out_transfer() when that happens. It looks like it's not
> > > > really
> > > > handling errors from queue() in a particularily useful way.
> > > 
> > > Don't reject EP queue requests.  Accept them as you would at any
> > > time;
> > > they will complete after the port is resumed.
> >
> > Except the suspend on a bus reset clears the port enable. You can't
> > resume from that, only reset the port no ? Or am I missing something
> > ?
> 
> Talking of which... do we need this ?
> 
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
> @@ -1976,6 +1976,7 @@ void composite_disconnect(struct usb_gadget *gadget)
>  	 * disconnect callbacks?
>  	 */
>  	spin_lock_irqsave(&cdev->lock, flags);
> +	cdev->suspended = 0;
>  	if (cdev->config)
>  		reset_config(cdev);
>  	if (cdev->driver->disconnect)
> 
> Otherwise with my vhub or with dummy_hcd, a suspend followed by a reset
> will keep that stale suspended flag to 1 (which has no effect at the moment
> but still...)
> 
> If yes, I'll submit a patch accordingly...

According to the USB spec, a host is not supposed to reset a suspended 
port (it's supposed to resume the port and then do the reset).  But of 
course this can happen anyway, so we should handle it properly.

Alan Stern

