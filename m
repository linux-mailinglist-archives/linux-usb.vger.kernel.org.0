Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB0B36A131
	for <lists+linux-usb@lfdr.de>; Sat, 24 Apr 2021 14:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233128AbhDXMle (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Apr 2021 08:41:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:57968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232148AbhDXMlb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 24 Apr 2021 08:41:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C49C961481;
        Sat, 24 Apr 2021 12:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1619268052;
        bh=itSxnj6faGL+aa067xUr3c6Ye0dPueyUd13nyom0cCI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xXk5hxiN158/JBMiYRPM1R0+1f4vveyHMYEAt6Ca4pNkaW6XVOTLJs6y4eYztvUsc
         UAOHPl7TanUkOR68FkVUvSAXYYpIR8LsjAiKnQ9s1II/1AUGY5DBrxITddV5qQqj+Z
         8XEP4rAc7CIRJzbANG+N6YoftFb3K9JuDaI7Ocrc=
Date:   Sat, 24 Apr 2021 14:40:49 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Felicitas Hetzelt <file@sect.tu-berlin.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Null ptr deref in core/hub.c
Message-ID: <YIQR0ZgpKIm9a/4P@kroah.com>
References: <b0ba1c36-6ebd-49a9-38da-aa42d98271c0@sect.tu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0ba1c36-6ebd-49a9-38da-aa42d98271c0@sect.tu-berlin.de>
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

How can that be possible in a real system?

> 
> https://elixir.bootlin.com/linux/v4.9/source/drivers/usb/core/hub.c#L124
> 
> https://elixir.bootlin.com/linux/v4.9/source/include/linux/usb.h#L194

Note, 4.9 is VERY old :)

> This is the case when usb_probe_interface fails to probe the device
> driver (called via usb_set_configuration -> device_add -> ...)
> 
> https://elixir.bootlin.com/linux/v4.9/source/drivers/usb/core/driver.c#L372

And how can that happen in a real system?

> Then e.g. on a new invocation of hub_port_connect, the function tries to
> un-attach the previously attached devices (listed as port_dev->child)
> and calls recursively_mark_NOTATTACHED (via usb_set_device_state(udev,
> USB_STATE_NOTATTACHED), which in turn tries to get a pointer to the hub
> via usb_hub_to_struct_hub, which is NULL which leads to the crash.
> 
> https://elixir.bootlin.com/linux/v4.9/source/drivers/usb/core/hub.c#L4742
> 
> I feel like this should be caught in hub_port_connect (which would set
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

Patches are great to send, that's the best way to discuss issues that
you find.

thanks,

greg k-h
