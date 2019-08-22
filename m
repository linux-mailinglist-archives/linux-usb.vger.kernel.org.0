Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10A5B99BFF
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2019 19:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392118AbfHVRaM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 13:30:12 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:52708 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2392115AbfHVRaL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Aug 2019 13:30:11 -0400
Received: (qmail 3634 invoked by uid 2102); 22 Aug 2019 13:30:10 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 22 Aug 2019 13:30:10 -0400
Date:   Thu, 22 Aug 2019 13:30:10 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>
cc:     USB list <linux-usb@vger.kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: f_mass_storage vs drivers/target
In-Reply-To: <4c8a9941fb54dffd823335c9f4bc01f3158fb1d5.camel@kernel.crashing.org>
Message-ID: <Pine.LNX.4.44L0.1908221315100.1311-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 22 Aug 2019, Benjamin Herrenschmidt wrote:

> On Thu, 2019-08-22 at 14:58 +1000, Benjamin Herrenschmidt wrote:
> > 
> > Ah lovely ... the 338x fails in EP autoconf with f_tcm, digging...
> > 
> > While digging I found this gem:
> > 
> > 	/* USB3380: use same address for usb and hardware endpoints */
> > 	snprintf(name, sizeof(name), "ep%d%s", usb_endpoint_num(desc),
> > 			usb_endpoint_dir_in(desc) ? "in" : "out");
> > 	ep = gadget_find_ep_by_name(_gadget, name);
> > 	if (ep && usb_gadget_ep_match_desc(_gadget, ep, desc, ep_comp))
> > 		return ep;
> > 
> > Any idea what's that supposed to achieve ?

It looks like in one mode, the endpoint number has to be the value 
predetermined by the hardware.  In the other mode, any hardware 
endpoint can be assigned any endpoint number.

> > When ep_match is called, usb_endpoint_num() hasn't been set yet so
> > it's always 0 and always fails... or am I missing something ?
> 
> Two problems:
> 
>  - net2280.c doesn't set a max EP size, so autoconfig fails since
> f_tcm specifies one. What about this ?
> 
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -940,12 +940,14 @@ int usb_gadget_ep_match_desc(struct usb_gadget *gadget,
>         if (usb_endpoint_dir_out(desc) && !ep->caps.dir_out)
>                 return 0;
>  
> -       if (max > ep->maxpacket_limit)
> +       if (ep->maxpacket_limit && max > ep->maxpacket_limit)
>                 return 0;
> 
> (ie assume that ep->maxpacket_limit 0 means the UDC supports any
> legal size)

That looks reasonable.

>  - No UDC driver other than dummy sets max_streams, and f_tcm requires 4,
> so f_tcm will fail with *any* superspeed UDC driver as far as I can tell.
> 
> Was it ever tested with USB 3 ?

Note that USB 2 does not support streams at all.

> I'm not sure what the right fix here yet is as I yet have to learn about
> what those USB3 streams are :-) For now I've commented things out.

They are for multiplexing multiple data streams over a single USB 
endpoint.  As far as I know, the only use case for such a thing is USB 
Mass Storage.

Alan Stern

> It's still not working yet as configuring f_tcm seems to be a black art
> with no useful documentation or examples anywhere (the device shows up on
> the host but doesn't bind to any mass storage driver ... yet).
> 
> Cheers,
> Ben.

