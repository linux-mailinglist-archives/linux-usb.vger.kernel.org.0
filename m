Return-Path: <linux-usb+bounces-5191-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 391A9830CCE
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 19:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE7D4B21608
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 18:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A155923748;
	Wed, 17 Jan 2024 18:39:37 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id B718313FFF
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 18:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705516777; cv=none; b=uglf1ORm6D94IkehX4S7ifghywV8d1Fn+BxpHWbENrSwDsHJk0C/qxdjJatP1Fe+MqJRTaxxg0MhxZ/40ucwGPNe92W0wosjLSTOjE8dInqFeivyPdFts76ATmXAefbiaZOhYq60ekWMp/1ZeY8EpTuo1sFrioKTiSDcD5dIPjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705516777; c=relaxed/simple;
	bh=xZ+W9LWzDPW98k9qaOERTFcUUrCfwQ3DptWzAgwlkrM=;
	h=Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To; b=cMDAc5InZcL4wUm142CnXs/DTKEQ516Xlv9RHwKRgoirwDhUQeaFTHHQp6iOu5r/lvnvooUNuSCxjeoMYjZaTm/1hmxd86JLTR3d1aaFjfFfkP3llvPlYFEI1lnVuHWZkegj4teKiRMxz7UEyy/6yh5JieFvznlRz43Bv3Vc9yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 784276 invoked by uid 1000); 17 Jan 2024 13:39:32 -0500
Date: Wed, 17 Jan 2024 13:39:32 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Bruno Haible <bruno@clisp.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Lars Melin <larsm17@gmail.com>,
  Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: "SilverStone TS16" external SSD enclosing needs an UAS quirk
Message-ID: <88ce425b-4642-4d1c-b8ac-9d1c1a63f1b2@rowland.harvard.edu>
References: <3750407.VQhiAETyHQ@nimes>
 <2270283.o7ts2hSHzF@nimes>
 <21712025-0b46-4afb-9161-5d1f1afb502a@rowland.harvard.edu>
 <3172447.D8ZAKjAxdT@nimes>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3172447.D8ZAKjAxdT@nimes>

On Wed, Jan 17, 2024 at 04:56:46PM +0100, Bruno Haible wrote:
> Alan Stern wrote:
> > > > Slowing down all RTL9120 already in the market with this quirk is in my 
> > > > humble opinion not a realistic solutio.
> > > 
> > > What else do you propose, for those of us who buy this hardware (€ 50,
> > > it wasn't a cheap one), connect it directly to a computer (through the
> > > vendor-provided cable, to an USB-C 3.2 Gen.2 connector, as in my case),
> > > and then experience 1-2 crashes per day under Linux?
> > 
> > The proposal is that you keep on doing what you've been doing: Set the 
> > UAS quirk.  Then your system will work, and others who don't have the 
> > same problem will get to keep the advantage of quicker transfers with 
> > the uas driver.
> 
> There's obviously a speed vs. reliability tradeoff here.
> 
> On the speed side: Do you know the speed difference between an external
> SSD with uas driver vs. an external SSD with usb-storage driver?

I don't know, offhand.  People have posted on the mailing list numbers 
they got through testing.  uas was considerably faster than usb-storage 
(IIRC, more than a factor of two).

> On the reliability side: It makes the difference between a usable and
> an unusable computer. I don't understand why you seem to prefer that
> I have, by default, a fast but unusable computer rather than a reliable,
> even if speed-limited, computer. Isn't it the opposite throughout the
> industry? (For example, the CPU clock is not overclocked _by_default_.
> An admin can overclock it, but the default is to be reliable.)

I suspect the two situations aren't truly comparable.

> You say "Set the UAS quirk", as if it was something completely immediate
> to do.
> 
>   - As a tech-savvy person (and former Linux kernel developer), it took
>     me 3 days of investigations, web searches, and reading of kernel
>     command-line documentation, in order to get at the solution.
> 
>   - For a non-tech-savvy person, it's basically impossible to arrive
>     at the solution you propose. They would have summarized their experience
>     as "Linux is not made for the desktop, let me choose another OS".

It works both ways.  Consider a non-tech-savvy person who buys one of 
these expensive adapters, expecting that it will improve performance 
considerably, and then is disappointed to find out that it doesn't 
(because of the new quirk).  They would summarize their experience in 
the same way.

Also, consider the problem that would be faced by people who are already 
using their USB-SSD bridge devices at high speed with no trouble.  They 
would suddenly experience a decrease in speed after performing a kernel 
update, and that would be considered a regression.  Regressions are not 
allowed in Linux kernel development.

> Isn't there a more intelligent solution to this problem? For example, the
> uas_eh_abort_handler could, instead of just logging the problem, tell a
> system daemon that the configuration of the particular device is problematic,
> and that system daemon would change the grub.cfg (or some other file that
> stores kernel command-line parameters), so that the quirk gets activated
> automatically at the next reboot.

I'm not aware of anyone who has ever set up a system that uses runtime 
feedback from the kernel to automatically make adjustments to critical 
configuration files like grub.cfg (other than installation managers such 
as anaconda).  However, please feel free to create such a system on your 
own and popularize it.

Part of the difficulty is that the kernel generally does not have enough 
information to tell what the cause of a particular problem is.  For 
instance, even though it might know that a USB transfer is getting 
errors and the device is not plugged into a powered hub, it's not at all 
clear that switching drivers might fix the problem.

Alan Stern

