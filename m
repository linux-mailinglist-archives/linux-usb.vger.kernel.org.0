Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC17C0C0E
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2019 21:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbfI0TZ6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Sep 2019 15:25:58 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:53543 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725790AbfI0TZ6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Sep 2019 15:25:58 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 15145222FB;
        Fri, 27 Sep 2019 15:25:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 27 Sep 2019 15:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=sW9b5FWjUjVaIwzqkVcEY+k5xeM
        KsvV0j93q4lB7NQg=; b=k/JWxsBmyRk4KfWmnveByNo/LPu7WBn8OP+32gaOVh1
        wHK0Ae4bpx3+5YzyKZlR2/OsI7gL/jLhHml4ddMmPcQ9dDK6ax7uPbObMzJ5aB/5
        qcZFToRIvz2DO6I072E+gNwvsxFrY/kDyASINq/pQuc+d60VJctVg8ofZFOFbdO/
        YwCECC3c4j1WzSWnZ5O7TPPqSgAiX0fgjL1N3P3a8cItTY8ficku5zVgzqrN1t/M
        KcSyKJwisLqzju94uL2lzB3zLibJS1DlxBkU1IuWdI5BlIHcirlalrX0M2S481IF
        R4XMXkrFg9PxXcQ2vrX8Df/kjrCceFUI+OC8A3XQVog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=sW9b5F
        WjUjVaIwzqkVcEY+k5xeMKsvV0j93q4lB7NQg=; b=bbgP0ROULvpDFJCj32/gGQ
        PSeQMwE/VB88cj9IXv0ybdcNKU+tkQUHtyTwAggDL9CFBtF7F1MV/nnjOCoXzhuQ
        oU4+lWudQXbOZMOYyGrD1phZyqFsP+uVnBDE0qBckaPZySfErSKiOWEQs+7SqGFN
        bWOnOKFvUUT/A0JaeH0iUT9V34JuotY4GNthVIcTl8hwlRWayk4Rh52WgkmSIEI4
        /oD+7i/L9RQq7igus9QnYVbvm5w+l5ot+28L4VjVNh/RmbgLadHBPk7gKApYQmNl
        g0BHFn44C2qxxEkdh/+tULeCmGzhSHneh0cTDZBORMiiuqh2c+VeFtwQ/8OmHR5Q
        ==
X-ME-Sender: <xms:RGKOXVgsHd2WtRQUtpMCsWHhDbccG_lNWaV4lNhKxOsSOSWKtSBpXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeeigddufeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeeivddrudduledrudeiie
    drleenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmnecu
    vehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:RGKOXeTmhy2U1jdTco8jJo5_G01hWJtpa83palb1zjnpbRlIXSonMw>
    <xmx:RGKOXQEUKdCTP7Q4YLw4v06TQNnVTRDLNQptGvyof8iuliSngxOi4w>
    <xmx:RGKOXelzYefMoPYGtPa2lfOlydloT1xz-mHV0FfQ2vvvmlOI3yiA8A>
    <xmx:RWKOXdxkhWMtoOJCS-InB4aSY0tSwZVBgeZAomqnT4rMRKycn0RoFg>
Received: from localhost (unknown [62.119.166.9])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3CBFA80065;
        Fri, 27 Sep 2019 15:25:56 -0400 (EDT)
Date:   Fri, 27 Sep 2019 21:25:54 +0200
From:   Greg KH <greg@kroah.com>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        benjamin.tissoires@redhat.com
Subject: Re: Driver for something that's neither a device nor an interface
 driver?
Message-ID: <20190927192554.GB1805907@kroah.com>
References: <Pine.LNX.4.44L0.1909271351260.4732-100000@iolanthe.rowland.org>
 <7f25b01ceb1a3aa6bd213599474ceffc34a0054b.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f25b01ceb1a3aa6bd213599474ceffc34a0054b.camel@hadess.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 27, 2019 at 08:49:12PM +0200, Bastien Nocera wrote:
> On Fri, 2019-09-27 at 13:56 -0400, Alan Stern wrote:
> > 
> <snip>
> > Is there any reason this needs to be done in a kernel driver?
> 
> To offer a unified interface all the devices with similar needs.

What "other devices with similar needs?"

> >   Can it 
> > be handled from userspace instead?
> 
> It could, at a great infrastructure cost, trying to get buy-in from
> various distributions, at the very least.

For USB devices that _can_ be handled in userspace, we ask that they be
done in userspace and not with a kernel driver.  Something that only
does usb control messages with no other in-kernel api interfaces is ripe
for a tiny userspace program using libusb.  Not for an in-kernel driver.

> > You said this was for a "power supply" class driver.  It's not clear 
> > what that means -- the devices you want to communicate with are 
> > iphones, ipads, etc., not power supplies.
> 
> There's tons of "device" scope "power_supply" devices in the kernel,
> which don't power the Linux machine they're running on. Grep for
> "POWER_SUPPLY_SCOPE_DEVICE" in the kernel, most wireless mice and
> keyboards implement this already.

Yes, but those are real devices that the "Host" uses for power or
something else.  wireless mice and keyboards already have kernel drivers
so that's fine as well (but probably could be done from userspace too.)

> > Under what circumstances would these messages need to get sent?  
> 
> User-space would control it by changing the device's
> POWER_SUPPLY_PROP_CHARGE_TYPE to "Fast", if available.
> 
> eg.
> # echo "Fast" > /sys/devices/pci0000:00/0000:00:14.0/usb3/3-
> 1/power_supply/apple_mfi_fastcharge/charge_type

power_supply class is for the power supply that is charging the cpu you
type that on.  Not for the cpu of an attached device, right?

thanks,

greg k-h
