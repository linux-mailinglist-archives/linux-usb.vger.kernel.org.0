Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2C540F42C
	for <lists+linux-usb@lfdr.de>; Fri, 17 Sep 2021 10:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245387AbhIQIdN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Sep 2021 04:33:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:49332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232295AbhIQIdJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Sep 2021 04:33:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0489D60F12;
        Fri, 17 Sep 2021 08:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631867507;
        bh=v7AAhcWyFzIcdoERYQ7SmQhe/o9BWbmlRiefbLKUoSU=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=FdIYKmiR5L4+deDDexqFF+PVr0/zLXWZ+nwIDWshdIisNe0Jpdp9r2zPPicR7X0N7
         eej9s6/CEUd7h/uiSa4OAQWSEn9eiWYeJ17RkkZQukff0IKQdfAQK0UF8kGNJ6wnQQ
         Uuas8jCLDdsNKAvn/avM1XvaW8FUeOrwAqeFMXE6idWuib0JBH4vwiWA/ZlwPb8tO8
         /gGtD4YHGnhgHIBQUdFuuqms0VQkn1WfnqIZIFVbhV3fA0cmfMp5POMXkb86QmUTuc
         9tMQZDKaYA3VuUp8Ad+tPZn4yGAizl1J99It318OcRytA3AaYm+KtpPP2ZsJFmP6jm
         /IVrhwv4dNFWg==
References: <YUNbDyoTPa+5J9Od@ws2> <87pmt7ahtj.fsf@kernel.org>
 <YURAlSpAWT0s9dVr@ws2>
User-agent: mu4e 1.6.5; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Andreas Bauer <andreas.bauer.nexus@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget/legacy/ether: assume saner default power mode
Date:   Fri, 17 Sep 2021 11:29:02 +0300
In-reply-to: <YURAlSpAWT0s9dVr@ws2>
Message-ID: <87lf3va9hr.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Andreas Bauer <andreas.bauer.nexus@gmail.com> writes:
> Am Fri, Sep 17, 2021 at 08:28:16AM +0300 schrieb Felipe Balbi:
>
>> Have a look at other commits to get examples of how to write commits for
>> upstream. You're missing your Signed-off-by, adding extra unnecessary
>> spaces and making your signature show up in the commit log. All of
>> these are described in kernel documentation this
>> (https://www.kernel.org/doc/html/latest/process/submitting-patches.html)
>> is a good starting point.
>
> I apologize, this was my first try at contributing based on what I 
> observed on this list. Will fix all mentioned points and consult the
> documentation before trying again.

No worries :)

>> > -	.bmAttributes		= USB_CONFIG_ATT_SELFPOWER,
>> > +	.bmAttributes		= 0,	/* bus powered implied */
>> > +	.bMaxPower		= 250,	/* 500mA in 2mA units */
>> 
>> right, your "sane" default now prevents this gadget driver from working
>> behind bus powered hubs. Considering that a linux-based device is likely
>> to have its own battery, this is not really a sane default.
>
> The linux-based battery-powered device I have here (Android) charges its
> battery and is thus bus-powered while in gadget mode.

that's okay. It's because of this sort of thing that we've switched to a
configfs-based approach where we don't need to make assumptions about
the application. That's also why the pre-composed gadgets have been
moved to the "legacy" directory and we don't take changes to those
anymore, unless it's a bugfix, which $subject doesn't appear to be :)

> Are there really a lot of devices that use gadget mode and do NOT draw 
> power from the USB bus? Honest question, I don't know the answer.

Finding that out is going to be pretty hard, I'm afraid.

>> The default value of "self powered", seems much saner ;-)
>
> It violates USB specification as is for most cases I reckon.  It also 
> maximize functionality when the host does not enforce USB spec which
> mostly seems to be the case.
>
> Would a CONFIG option here make sense to differentiate between 
> bus-powered devices and self-powered ones? This would probably affect
> most OTG drivers...

We have configfs to cope with all of the possible variations, might want
to give that a shot?

https://www.kernel.org/doc/html/latest/usb/gadget_configfs.html

-- 
balbi
