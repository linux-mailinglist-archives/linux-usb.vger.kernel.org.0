Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53EF69B338
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2019 17:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405184AbfHWPVZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Aug 2019 11:21:25 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:39294 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2390470AbfHWPVZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Aug 2019 11:21:25 -0400
Received: (qmail 4296 invoked by uid 2102); 23 Aug 2019 11:21:23 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 23 Aug 2019 11:21:23 -0400
Date:   Fri, 23 Aug 2019 11:21:23 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>
cc:     USB list <linux-usb@vger.kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: f_mass_storage vs drivers/target
In-Reply-To: <393dedc62684704db87d11f17650cb25de9649b8.camel@kernel.crashing.org>
Message-ID: <Pine.LNX.4.44L0.1908231117260.1628-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 23 Aug 2019, Benjamin Herrenschmidt wrote:

> On Thu, 2019-08-22 at 13:30 -0400, Alan Stern wrote:
> > On Thu, 22 Aug 2019, Benjamin Herrenschmidt wrote:
> > 
> > > On Thu, 2019-08-22 at 14:58 +1000, Benjamin Herrenschmidt wrote:
> > > > 
> > > > Ah lovely ... the 338x fails in EP autoconf with f_tcm, digging...
> > > > 
> > > > While digging I found this gem:
> > > > 
> > > >     /* USB3380: use same address for usb and hardware endpoints */
> > > >     snprintf(name, sizeof(name), "ep%d%s", usb_endpoint_num(desc),
> > > >                     usb_endpoint_dir_in(desc) ? "in" : "out");
> > > >     ep = gadget_find_ep_by_name(_gadget, name);
> > > >     if (ep && usb_gadget_ep_match_desc(_gadget, ep, desc, ep_comp))
> > > >             return ep;
> > > > 
> > > > Any idea what's that supposed to achieve ?
> > 
> > It looks like in one mode, the endpoint number has to be the value 
> > predetermined by the hardware.  In the other mode, any hardware 
> > endpoint can be assigned any endpoint number.
> 
> Sure but as I wrote, this is ep_match, which when called, always has
> usb_endpoint_num() set to 0... this function is supposed to chose the
> EP number afaik. So I don't think the above ever works, it just returns
> NULL. Or do we ever call this again with already predetermined EP nums,
> for example when doing multifunction ?

I don't know.  You might try asking the person who wrote that code.

> > > > When ep_match is called, usb_endpoint_num() hasn't been set yet so
> > > > it's always 0 and always fails... or am I missing something ?
> > > 
> > > Two problems:
> > > 
> > >  - net2280.c doesn't set a max EP size, so autoconfig fails since
> > > f_tcm specifies one. What about this ?
> > > 
> > > --- a/drivers/usb/gadget/udc/core.c
> > > +++ b/drivers/usb/gadget/udc/core.c
> > > @@ -940,12 +940,14 @@ int usb_gadget_ep_match_desc(struct usb_gadget *gadget,
> > >         if (usb_endpoint_dir_out(desc) && !ep->caps.dir_out)
> > >                 return 0;
> > >  
> > > -       if (max > ep->maxpacket_limit)
> > > +       if (ep->maxpacket_limit && max > ep->maxpacket_limit)
> > >                 return 0;
> > > 
> > > (ie assume that ep->maxpacket_limit 0 means the UDC supports any
> > > legal size)
> > 
> > That looks reasonable.
> 
> I'll send a patch.
> 
> > >  - No UDC driver other than dummy sets max_streams, and f_tcm requires 4,
> > > so f_tcm will fail with *any* superspeed UDC driver as far as I can tell.
> > > 
> > > Was it ever tested with USB 3 ?
> > 
> > Note that USB 2 does not support streams at all.
> 
> Yes, f_tcm only requires them for superspeed, but it does *require*
> them in that case.

I don't see any reason why f_tcm shouldn't fall back on Bulk-Only 
Transport when streams aren't available, even on a SuperSpeed 
connection.

> > > I'm not sure what the right fix here yet is as I yet have to learn about
> > > what those USB3 streams are :-) For now I've commented things out.
> > 
> > They are for multiplexing multiple data streams over a single USB 
> > endpoint.  As far as I know, the only use case for such a thing is USB 
> > Mass Storage.
> 
> So f_tcm could operate in a degraded mode in the absence of streams
> easily, the problem is the mechanics of EP matching in epautoconf. It
> will just fail.
> 
> I wonder since f_tcm is also the only user, whether we could change the
> matching logic to either:
> 
>   - Don't try to match, return streams is available. This could be
> problematic if the UDC supports streams on some EPs and not others
> however.
> 
>   - Do two passes: one pass trying to match the streams, and one patch
> without matching them if the first one fails.
> 
> Then f_tcm could check whether it got EPs with streams and enable
> stream usage accordingly.
> 
> Opinions ? Other option ?

I like the two-pass option better.  Maybe Felipe will weigh in when
he's back from vacation.

Alan Stern

