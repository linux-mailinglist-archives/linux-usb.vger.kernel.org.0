Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 736AD1E77F6
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 10:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgE2IMq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 04:12:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:39470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725961AbgE2IMq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 May 2020 04:12:46 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D2D14207BC;
        Fri, 29 May 2020 08:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590739965;
        bh=SzJsURuNcaJ9Osx68RHQe1zRwL8NmYI0HhXeRSDMpc8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W82weQuWsH/PMJhXWfu1U8d2xPQ7foSw3AXwdo8pKrt6LL+l19sCiDtuLAyO8XrG7
         +uoH5ocIyBeyxBQ19CHDSMTq/WLpAYfnJGOcwC5GwCJYjluLaXJieboTcjC4i4radW
         1DIhzFmGlcpbzVi8npivlsMleogkYKw4tVofKDm0=
Date:   Fri, 29 May 2020 10:12:43 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alexandru M Stan <amstan@chromium.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        Evan Green <evgreen@chromium.org>
Subject: Re: Splitting 1 USB port between 2 devices
Message-ID: <20200529081243.GA827304@kroah.com>
References: <CAHNYxRzH3F7r4A3hOJYWw8fwoSLBESyyN7XQ4HYfw1Y3qoNbJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHNYxRzH3F7r4A3hOJYWw8fwoSLBESyyN7XQ4HYfw1Y3qoNbJg@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 28, 2020 at 02:16:21PM -0700, Alexandru M Stan wrote:
> Hello,
> 
> I'm currently helping to design the hardware for yet another chromebook.
> 
> The particular SOC (and most other alternatives BTH) we're using has a
> limited amount of USB controllers available, usually just 1. Being a
> chromebook we have quite a few needs for USB though: 2 type C ports,
> pogo pins for a connected keyboard, 2 cameras, a type A port. We're
> probably going to have an internal hub no matter what, but it looks
> like even a 4 port hub might not be enough, going to yet a bigger hub
> (which might not be as power efficient) is not ideal, chaining hubs
> that are builtin is also meh.
> 
> I noticed that some of our cameras use the USB3.0 lines only. Other
> cameras, since they're lower resolution ones use only USB2.0. I
> wondered what would happen if the 2 types of cameras were to share a
> port, since none of the data lines are common between them.

And the hub has no problem with this?  That's odd, I would think that it
would not like this type of configuration.

> I've built a little contraption to test this. It seems to work as
> intended. Both usb cameras seem to enumerate, I can even stream from
> both at the same time with no problem. A macbook seems to also kind of
> work (I can't stream from both for some reason, but i can open either
> I want). I can upload detailed lsusb outputs if needed.

What host controller are you using for this?

> My question here is: is this legal as far as Linux is concerned? Can 2
> devices be enumerated under one physical port (even though we're
> talking about separate usb2.0 and 3.0 bus topologies).

Is it "legal" as far as the USB spec is concerned?  I would try to
answer that first before worrying about if Linux can handle it or not :)

> It seems to work so far with our linux 5.4 chrome os fork (which as
> far as I know is identical to 5.4 LTS for matters concerning usb). But
> the question is would this keep working?
> 
> Is there any weird port reset interaction that might be annoying here?
> I wouldn't want a reset on the usb 2.0 device to affect the 3.0
> device.

Which is why I don't think the hub would like this type of
configuration, as who controls the power connections?  What happens if
one device is suspended and the other isn't?

> Is there any other higher level port management going on in linux,
> where there might be plans to keep track of things, but it's not piped
> enough to see it affect (negatively) this use case.
> 
> If this is ok, was something like this ever done before?
> 
> Bonus, maybe unrelated, question: I've wondered in the past if it's
> legal to route 2.0 and 3.0 lines through different paths.
> 
> For example, imagine I had one of each:
>  * 2+3.0 controller
>  * 2+3.0 device (eg a 3.0 type A port)
>  * 2.0 device (older usb device)
> 
> Would it be legal to use only a 2.0 hub, with the 3.0 data lines for
> the 3.0 device bypassing the hub. This would be cheaper than having a
> fully fledged 2+3.0 hub with the second port's 3.0 data lines wasted.

I think you need to talk to some USB hardware engineers for this type of
question.

good luck!

greg k-h
