Return-Path: <linux-usb+bounces-31673-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB2ACD64FB
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 15:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D249330848AE
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 14:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118ED26F291;
	Mon, 22 Dec 2025 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="01ZSSEA1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598FA264617;
	Mon, 22 Dec 2025 14:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766412019; cv=none; b=RFM9I/TDHgooOh0v+cDcpzF5D69WotSDOlh3l1CLS5LJbuWTM4yXwZWdgvFiKevXkbvVzhwNJHsJ2V3IrI2NZOSjfn+asogB30N5Y6RlOOx5pL7OzD84Yngk99yZi1AFYK6YKM2CUbZwCJoyJZV1GD3qtVDM2ZIO06RD1D6cK1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766412019; c=relaxed/simple;
	bh=GTUzA14xHl39+BNggpbMdm7wJOX5NaMJ/TDbGuOkuO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TU0J3QtXYTRQa8wCJkd7udvluZrF99GwiaZvr3BpQvphqUlaDpwGYNcDKH644lg9RK5P3oi+pqm/5WSZ6SLFmpiQxXqeWbYY54EnPgnoS3EyPE99Rd1bRe90fykkbsKtzz9yiPExpgjXW3IUHEdg3Se6ltTfV80BhulqZg+4+UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=01ZSSEA1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429F4C4CEF1;
	Mon, 22 Dec 2025 14:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766412018;
	bh=GTUzA14xHl39+BNggpbMdm7wJOX5NaMJ/TDbGuOkuO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=01ZSSEA1hMGEmezSnvC5g5NDUuMl8OzQ4PNu9ZBEQLhbpVPRUgH4Id1VOd66BtSyv
	 DrB5SdZ+wTbl191T9xKPdWr6Og9ugQEFJbDh10P0QvnBFsyAufP3J+P8hahMtaO7Jo
	 1sHMYLy8vF/wznPoRfBXzXrwyKgAtxAE+ZDsBSLQ=
Date: Mon, 22 Dec 2025 15:00:15 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, Lee Jones <lee@kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Sarah Sharp <sarah.a.sharp@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?562U5aSN?= =?utf-8?Q?=3A?= [PATCH] usb: xhci: check
 Null pointer in segment alloc
Message-ID: <2025122250-commend-bondless-c7e1@gregkh>
References: <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <4935bdf5-4d36-45c3-9bcd-9d14606dd54e@linux.intel.com>
 <TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20251220141510.1bc1ef19.michal.pecio@gmail.com>
 <20251222064252.GA1196800@google.com>
 <2025122253-stopper-tweed-6e68@gregkh>
 <20251222085543.4d7430d5.michal.pecio@gmail.com>
 <TYUPR06MB6217CB438F21763401A93E6ED2B4A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYUPR06MB6217CB438F21763401A93E6ED2B4A@TYUPR06MB6217.apcprd06.prod.outlook.com>

On Mon, Dec 22, 2025 at 12:21:09PM +0000, 胡连勤 wrote:
> Hi Michal:
> 
> > On Mon, 22 Dec 2025 08:13:21 +0100, Greg Kroah-Hartman wrote:
> > > > An API that insists on its users exercising care, knowledge and
> > > > cognisance sounds fragile and vulnerable.
> > >
> > > Fragile yes, vulnerable no.  Let's fix the fragility then, but as has
> > > been pointed out in this thread, we don't know the root cause, and I
> > > don't even think this "fix" would do the right thing anyway.
> > 
> > The patch looks wrong. I suspect this happens when add_endpoint() is called
> > concurrently with resume(), which makes little sense. And it means the same
> > code can probably call add_endpoint() before resume(), which makes no
> > sense either. We can't do that with suspended HW.
> > 
> > Chances are that this crash isn't even the only thing that could go wrong
> > when such calls are attempted. For one, xhci_resume() drops the spinlock
> > after reporting usb_root_hub_lost_power(), so your guess elsewhere was
> > correct - this code isn't even locked properly.
> > 
> > It seems no operations on USB devices during resume() are expected.
> 
> Currently, after checking the logic of our KO section, 
> we found that there might be two places simultaneously calling snd_usb_autoresume to wake up the headset device.

Can you provide a link to the source for your kernel code so that we can
review it as well?

thanks,

greg k-h

