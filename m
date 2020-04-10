Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 741571A4800
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2020 17:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgDJPxU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Apr 2020 11:53:20 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46435 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726181AbgDJPxU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Apr 2020 11:53:20 -0400
Received: (qmail 22317 invoked by uid 500); 10 Apr 2020 11:53:20 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 10 Apr 2020 11:53:20 -0400
Date:   Fri, 10 Apr 2020 11:53:20 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: Testing endpoint halt support for raw-gadget
In-Reply-To: <CAAeHK+x5-z85v97ySvX+5=sJTn=hVbpkbCiQBZCD-6BKvKPSpQ@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2004101136490.15021-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 10 Apr 2020, Andrey Konovalov wrote:

> On Fri, Apr 10, 2020 at 2:29 AM Alan Stern <stern@rowland.harvard.edu> wrote:

> > Have you implemented wedge as well as halt?  Wedge is needed for the
> > mass-storage protocol; as far as I know it isn't used anywhere else.
> 
> No, I didn't know about "wedge" at all :) Looks like the API for it is
> really simple, just usb_ep_set_wedge(). I'll need to figure out what
> it is and how it works, and I'll send a patch that adds halt/wedge
> support then.

usb_ep_set_wedge(ep) does almost the same thing as 
usb_ep_set_halt(ep).  The difference is that a Clear-Feature(halt) 
request from the host will un-halt an endpoint if it is merely halted, 
but it won't un-halt a wedged endpoint.  (I don't think this is 
documented anywhere, unfortunately.)

> > And have you given any thought to suspend/resume support?  It's a bit
> > tricky because you have to consider both gadget suspend and USB bus
> > suspend.
> 
> Hm, no. Is there something specific I need to consider to support it?
> I guess I'll need to read about how it works as well, before I can
> understand what it would require and ask meaningful questions.

The really tricky part involves a gadget that is in system suspend.  If 
the USB bus isn't also suspended, the gadget won't work properly -- it 
won't be able to respond to requests from the host.  Basically, when a 
UDC driver sees that the system is going into suspend, it has no choice 
but to disconnect from the USB bus.  This probably isn't implemented 
very well in a lot of UDC drivers.

USB bus suspend, on the other hand, _should_ be implemented.

> > Nothing else springs to mind.
> 
> Something else: I've been testing raw-gadget with various UDCs that I
> have [1] and everything seems to work, except for emulating SuperSpeed
> devices with net2280. I've just found it out yesterday night, and
> haven't had a chance to debug that yet, but if you know about some
> potential issues I could encounter with SuperSpeed/USB3+, please let
> me know.

Well, USB-3 has streams, unlike USB-2.  You may want to think about
supporting them.

Also, bear in mind that dummy-hcd doesn't support isochronous transfers 
(although all real UDCs do support them).  So perhaps you haven't given 
them as much testing.  usbtest can help a little with that.

Alan Stern

