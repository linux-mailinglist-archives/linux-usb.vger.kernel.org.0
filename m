Return-Path: <linux-usb+bounces-2030-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 260E17D1C6A
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 12:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56BF61C20BF5
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 10:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C03AD537;
	Sat, 21 Oct 2023 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZNrC8WRT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57ECD532
	for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 10:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2484C433C8;
	Sat, 21 Oct 2023 10:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697883338;
	bh=xE0tYUlCrfmA5ifWfxBsHGThFtSt5cm5A10aM2uArNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZNrC8WRT6OA/H2vcGgO2NLbvKH7IiXL6J9wRT+BNNZ2qyFCDI+Fa6vk4Pe8BaCt/6
	 jiCDihCdWQq2LENnubfRV+HuqBI0jQel8x65j1Fq79hogoQ7yeqwLU6PFWc8vyk4f3
	 yCITKQ0u4J/rBeG2jDSOSS966GtmGy6nixvMIMo4=
Date: Sat, 21 Oct 2023 12:15:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Hardik Gajjar <hgajjar@de.adit-jv.com>, mathias.nyman@intel.com,
	yangyingliang@huawei.com, jinpu.wang@ionos.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	erosca@de.adit-jv.com
Subject: Re: [PATCH v4] usb: core: hub: Add quirks for reducing device
 address timeout
Message-ID: <2023102105-attribute-pajamas-a0dc@gregkh>
References: <2023101155-unframed-satirical-f7ec@gregkh>
 <20231011164525.97616-1-hgajjar@de.adit-jv.com>
 <2023101620-shaky-sensitize-9708@gregkh>
 <20231017161021.GA62775@vmlxhi-118.adit-jv.com>
 <2023101750-bless-humorous-45c7@gregkh>
 <6c25beed-06fe-4be0-b51a-18e159d25072@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c25beed-06fe-4be0-b51a-18e159d25072@rowland.harvard.edu>

On Tue, Oct 17, 2023 at 02:59:54PM -0400, Alan Stern wrote:
> On Tue, Oct 17, 2023 at 06:53:44PM +0200, Greg KH wrote:
> > On Tue, Oct 17, 2023 at 06:10:21PM +0200, Hardik Gajjar wrote:
> > > More logs and detailed in patch V1:
> > > https://lore.kernel.org/linux-usb/20230818092353.124658-1-hgajjar@de.adit-jv.com/T/#m452ec9dad94e8181fdb050cd29483dd89437f7c1
> > > > 
> > > > > Achieving this is impossible in scenarios where the set_address is
> > > > > not successful and waits for a timeout.
> > > > 
> > > > Agreed, broken hardware is a pain, but if your device is allowed to take
> > > > longer, it can, and will, so you have to support that.
> > > > 
> > > The problem is not caused by the device taking an extended amount of time to
> > > process the 'set_address' request. Instead, the issue lies in the absence of
> > > any activity on the upstream bus until a timeout occurs.
> > 
> > So, a broken device.  Why are you then adding the hub to the quirk list
> > and not the broken device?  We are used to adding broken devices to
> > qurik lists all the time, this shouldn't be new.
> 
> Adding a quirk for the device isn't feasible, because the problem occurs 
> before the device has been initialized and enumerated.  The kernel 
> doesn't know anything about the device at this point; only that it has 
> just connected.

Ah, ick, you are right, but we do know the "broken hub" id, so that
makes a bit more sense.  Should this be a hub-only type quirk?

> > > This situation arises when the host has already transmitted the 'set_address' command to the hub,
> > > assuming that the device operates at full speed. However, the device connected
> > > to the hub undergoes a state change from full speed to high-speed during this process.
> > 
> > During which process?  While the set-address happens?  That feels like a
> > hub bug then.
> > 
> > > > > The shortened address device timeout quirks provide the flexibility
> > > > > to align with a 3-second time limit in the event of errors.
> > > > > By swiftly triggering a failure response and swiftly initiating
> > > > > retry procedures, these quirks ensure efficient and rapid recovery,
> > > > > particularly in automotive contexts where rapid smartphone enumeration
> > > > > and screen projection are vital.
> > > > 
> > > > Screen projection is a requirement that you should not be relying on USB
> > > > for as USB has a different set of required timeouts, right?  This sounds
> > > > like a bad hardware design, if not an impossible one.
> > > > 
> > > 
> > > Screen projection for us means displaying the connected phone on the screen and
> > > launching Carplay and Android Auto for the user. This works perfectly in nearly all
> > > cases, except in scenarios like this one where a combination of a special hub and
> > > a specific phone model is causing the issue
> > 
> > So which is broken, the hub or phone?
> 
> It sounds like both of them are broken to some extent, although we can't 
> tell for sure without seeing what's actually happening on the USB bus 
> (i.e., bus analyzer output):
> 
> 	The phone seems to take too long to activate its high-speed
> 	terminations and deactivate the full-speed terminations.
> 
> 	The hub doesn't seem to realize that the phone has disconnected 
> 	its full-speed connection and switched to high-speed.
> 
> But without real data, these are just best guesses.

Agreed, Hardik, can you look at some bus traces to figure out where the
root problem here is?

thanks,

greg k-h

