Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89E6D36A1DF
	for <lists+linux-usb@lfdr.de>; Sat, 24 Apr 2021 17:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbhDXP60 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Apr 2021 11:58:26 -0400
Received: from netrider.rowland.org ([192.131.102.5]:42519 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230010AbhDXP60 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Apr 2021 11:58:26 -0400
Received: (qmail 313794 invoked by uid 1000); 24 Apr 2021 11:57:47 -0400
Date:   Sat, 24 Apr 2021 11:57:47 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felicitas Hetzelt <file@sect.tu-berlin.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Null ptr deref in core/hub.c
Message-ID: <20210424155747.GC312740@rowland.harvard.edu>
References: <b0ba1c36-6ebd-49a9-38da-aa42d98271c0@sect.tu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0ba1c36-6ebd-49a9-38da-aa42d98271c0@sect.tu-berlin.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Apr 24, 2021 at 02:08:45PM +0200, Felicitas Hetzelt wrote:
> Hello,
> 
> I triggered a few potential npds in core/hub.c. The bugs trigger
> reliably. Unfortunately I don't have a reproducer, though i tried my
> best to root-cause the bugs. I'm using my own emulated xhci host
> controller device and a slightly exotic kernel environment based on
> kernel version 5.10.0-rc6, so it might be that the bug is not
> trigger-able under normal conditions.
> 
> I was hoping you could maybe quickly determine whether this is a valid
> issue.
> 
> usb_hub_to_struct can return zero if hdev->actconfig->interface[0]->dev
> is NULL.

I'm not sure what you mean here.  dev is a member of the structure that 
hdev->actconfig->interface[0] points to; it isn't a pointer itself.  As 
such, to say that it is NULL is meaningless.

Are you saying that sometimes hdev->actconfig->interface[0] is NULL when 
usb_hub_to_struct runs?  How can that be?  usb_hub_to_struct doesn't 
even refer to that field unless hdev->maxchild is nonzero, and that 
field doesn't get set unless the hub driver is bound to the interface -- 
which doesn't happen if there is no interface.

> https://elixir.bootlin.com/linux/v4.9/source/drivers/usb/core/hub.c#L124
> 
> https://elixir.bootlin.com/linux/v4.9/source/include/linux/usb.h#L194
> 
> This is the case when usb_probe_interface fails to probe the device
> driver (called via usb_set_configuration -> device_add -> ...)
> 
> https://elixir.bootlin.com/linux/v4.9/source/drivers/usb/core/driver.c#L372

That line sets the interface's driver data, not interface[0]->dev.  
What's wrong with having the driver data be NULL?  That just means the 
device isn't a hub.  In this situation hdev->maxchild will be 0.

Also, you say you're using a modified version of the 5.10.0-rc6 kernel 
(kind of strange to be doing development on an -rc kernel instead of a 
normal release, but never mind).  So why are you posting links to the 
4.9 kernel source?  There have been a lot of changes between 4.9 and 
5.10.

> Then e.g. on a new invocation of hub_port_connect, the function tries to
> un-attach the previously attached devices (listed as port_dev->child)
> and calls recursively_mark_NOTATTACHED (via usb_set_device_state(udev,
> USB_STATE_NOTATTACHED), which in turn tries to get a pointer to the hub
> via usb_hub_to_struct_hub, which is NULL which leads to the crash.
> 
> https://elixir.bootlin.com/linux/v4.9/source/drivers/usb/core/hub.c#L4742

That's the call to usb_disconnect, which isn't really important to what 
you're saying.  You seem to be complaining about a crash in 
recursively_mark_NOTATTACHED.  Why didn't you insert a URL for that 
function instead?

> I feel like this should be caught in hub_port_connect (which would set

You're not making yourself clear.  What should be caught in 
hub_port_connect?

Are you saying that sometimes we can have udev->maxchild > 0 in 
recursively_mark_NOTATTACHED even though udev isn't bound to the hub 
driver?  If that's not it, then what _are_ you saying?

> port_dev->child = NULL, avoiding the later invocation of
> recursively_mark_NOTATTACHED), but the return value of usb_new_device is
> always valid (in fact usb_set_configuration can only return 0 once it
> gets to the calling add_device and probe).
> 
> https://elixir.bootlin.com/linux/v4.9/source/drivers/usb/core/hub.c#L4891
> 
> https://elixir.bootlin.com/linux/v4.9/source/drivers/usb/core/message.c#L1931
> 
> To fix this one could check whether the interface is actually properly
> setup instead of just checking status, or alternatively always check the
> return value of usb_hub_to_struct_hub on later invocations.
> 
> I attached the kernel log, it is a bit messy though i marked the
> relevant parts with 'XXNOTE'.

TL;DR.  You should trim logs so that only the important parts get 
posted.

> Let me know if you need any further information.

Please try to give a more explicit description of what's actually going 
wrong.  If you need to refer to lines of code in your email, just copy 
them into the message -- don't put a URL to somewhere else, forcing the 
reader to do extra work and lose the mental thread of the discussion.

Alan Stern
