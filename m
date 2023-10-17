Return-Path: <linux-usb+bounces-1753-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECDA7CC925
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 18:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A9D8281B28
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 16:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929162D05E;
	Tue, 17 Oct 2023 16:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FG1JVZVp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D960D2D03C
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 16:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4992C433C8;
	Tue, 17 Oct 2023 16:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697561629;
	bh=RaxBlkhFIAhkajhxqmNdE/U+qglufyW+ULA5w+v6mjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FG1JVZVpP5/zwJo5CdV5HOxHvYr04WcncrOGr4hTj4kgiEST2DY1tBTadV1RxMEkk
	 xK0mOVf4AVhzgzucqPfRtfn48nwQlZGw/FafdxprnSoeYgQAmoGm7Jk19tnywMQUB/
	 x7oXDLIv6nWU6G5O2Pyjx9lmoAFTdrTt4YAunkJk=
Date: Tue, 17 Oct 2023 18:53:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu,
	yangyingliang@huawei.com, jinpu.wang@ionos.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	erosca@de.adit-jv.com
Subject: Re: [PATCH v4] usb: core: hub: Add quirks for reducing device
 address timeout
Message-ID: <2023101750-bless-humorous-45c7@gregkh>
References: <2023101155-unframed-satirical-f7ec@gregkh>
 <20231011164525.97616-1-hgajjar@de.adit-jv.com>
 <2023101620-shaky-sensitize-9708@gregkh>
 <20231017161021.GA62775@vmlxhi-118.adit-jv.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017161021.GA62775@vmlxhi-118.adit-jv.com>

On Tue, Oct 17, 2023 at 06:10:21PM +0200, Hardik Gajjar wrote:
> On Mon, Oct 16, 2023 at 07:58:36PM +0200, Greg KH wrote:
> > On Wed, Oct 11, 2023 at 06:45:25PM +0200, Hardik Gajjar wrote:
> > > Currently, the timeout for the set address command is fixed at
> > > 5 seconds in the xhci driver. This means the host waits up to 5
> > > seconds to receive a response for the set_address command from
> > > the device.
> > > 
> > > In the automotive context, most smartphone enumerations, including
> > > screen projection, should ideally complete within 3 seconds.
> > 
> > "should" according to whom?  That goes against the USB specification, so
> > why not take it up with them?
> We're implementing this change to meet Google's Android Auto certification
> requirements, even though these requirements aren't publicly available.

Then perhaps Google needs to talk about this somewhere if they are
forcing us to take such an out-of-spec requirement?

> The issue arises when we connect an Android phone to a Linux host using a special
> automotive USB hub. The host's xHCI doesn't receive a response from the hub after
> sending a 'set_address' request, resulting in a timeout. This problem is specific
> to one phone model.
> 
> It's worth noting that we can't argue that this requirement violates USB standards
> because the 3-second time limit applies only when connecting an Android mobile phone.
> I assume that Android phones also undergo Google certification, which likely includes
> a condition for successful enumeration within a specified time frame. However, I can't confirm this.

Android's CTS/VTS testing is pretty public, but huge, so you might want
to dig into that and see if they really test for this or not.

> More logs and detailed in patch V1:
> https://lore.kernel.org/linux-usb/20230818092353.124658-1-hgajjar@de.adit-jv.com/T/#m452ec9dad94e8181fdb050cd29483dd89437f7c1
> > 
> > > Achieving this is impossible in scenarios where the set_address is
> > > not successful and waits for a timeout.
> > 
> > Agreed, broken hardware is a pain, but if your device is allowed to take
> > longer, it can, and will, so you have to support that.
> > 
> The problem is not caused by the device taking an extended amount of time to
> process the 'set_address' request. Instead, the issue lies in the absence of
> any activity on the upstream bus until a timeout occurs.

So, a broken device.  Why are you then adding the hub to the quirk list
and not the broken device?  We are used to adding broken devices to
qurik lists all the time, this shouldn't be new.

> This situation arises when the host has already transmitted the 'set_address' command to the hub,
> assuming that the device operates at full speed. However, the device connected
> to the hub undergoes a state change from full speed to high-speed during this process.

During which process?  While the set-address happens?  That feels like a
hub bug then.

> > > The shortened address device timeout quirks provide the flexibility
> > > to align with a 3-second time limit in the event of errors.
> > > By swiftly triggering a failure response and swiftly initiating
> > > retry procedures, these quirks ensure efficient and rapid recovery,
> > > particularly in automotive contexts where rapid smartphone enumeration
> > > and screen projection are vital.
> > 
> > Screen projection is a requirement that you should not be relying on USB
> > for as USB has a different set of required timeouts, right?  This sounds
> > like a bad hardware design, if not an impossible one.
> > 
> 
> Screen projection for us means displaying the connected phone on the screen and
> launching Carplay and Android Auto for the user. This works perfectly in nearly all
> cases, except in scenarios like this one where a combination of a special hub and
> a specific phone model is causing the issue

So which is broken, the hub or phone?

> > So the real issue that you have here is a broken built-in USB hub that
> > does not error out quick enough, right?  Why not fix the firmware in
> > that hub as you know it's broken?  Why is it the operating system's job
> > to work around non-compliant devices?
> > 
> > Ok, that last question was redundant, of course it's our job to work
> > around broken devices, but this feels different.  You are trying to say
> > "hey, I know this device is broken, so error out quick so we can just
> > ignore it", right?  If so, why not just never allow that device to
> > enumerate at all?  You don't have to accept it as a valid device to the
> > system (just don't authorize it), and then no device will ever connect
> > to it so what is the delay issue?
> > 
> 
> We require the device (HUB) as it is a vital component of our infotainment system.

Great, then you can fix the firmware in it!

> The issue arises when the host has already issued the 'set_address' command to the hub,
> assuming the device is operating at full speed. However, in such cases, when the device
> connected to the hub changes its state from full speed to high-speed, the 'set_address'
> request becomes blocked, waiting for the full 5-second timeout. This patch reduces the
> timeout from 5 seconds to 500 milliseconds, allowing for quicker failure and re-enumeration
> of the device as high-speed

Changing speed is under hub control, not device control, right?  Are you
sure the firmware is correct in that hub?  Has the hub passed all of the
USB-IF testing requirements?

thanks,

greg k-h

