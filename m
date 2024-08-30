Return-Path: <linux-usb+bounces-14394-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3258966478
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 16:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B8432812EE
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 14:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCAF1B2534;
	Fri, 30 Aug 2024 14:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="PN2hE7Yp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RWBjkzF+"
X-Original-To: linux-usb@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F02314EC41
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 14:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725029377; cv=none; b=itxVjhrbR7YCCUJ8vI6yWUMYYnKTdPRr1Ri4LktzbYgrquEQqw8oGmSTDoM8kKSrxETCjho7qtAp01Spz4hFMd32wswAEQEFZWYsRQ1VgEEWQjqtC9z+oLDCTUnaCRqqrfowW7Db9cj6tSiP48ClHX5hqbOrZraVi7jomaR47q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725029377; c=relaxed/simple;
	bh=exwOLV+I2EuNMMZdyPd6ZnueDw/QjHBzc0tMAeD1Uvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxssdgny3qBAY/TVqCsn02LDUPoNenKkucg+Ux423F6QiHydpPTvGoVd2OqmeRgyZhGL1b2TPy/iiT1e75y0aRr9fEhmpvUOH+omjXuBWxCnsg7liJPvGvWbZASaUcw7txy2Jbav5l6AtR6bp7fys051G6umzxU1HCu1/AVeeGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=PN2hE7Yp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RWBjkzF+; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-01.internal (phl-compute-01.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id B4DA81380241;
	Fri, 30 Aug 2024 10:49:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 30 Aug 2024 10:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1725029374; x=1725115774; bh=O/2GEQFYE9
	w/7TW64E/X4iWy/ebEYEbg0S/D3Ghi4Xc=; b=PN2hE7Yp9SIJaMeakzPJKbCndk
	DIzuIfcrIv0pJq99Vl40LUe4gGvsrpU1ryRvCKuAsDrOWg32JqPmz2G6I8lu1SNr
	DF2x3Pmoh2N51OqoZ/GeBnLRWmm8jW6TwbUjlPfc1d5lKUkA4ikC3IMGe7Kh/rKk
	5RPoiEGm9UKZmihjBwr85r9nZWY9uoz/7n63bYh0xeoyji+K3Ds0QfQqQVXUmB9Z
	T8UlYq9vP9p7ya4BA8cQ0Fxthsz5jXnYcESn7PrfvLW/z8mDVS1GnS8fon2jjDbC
	rmML2stRCBuF0iVkzpyPkDuiPA7hLZXWzyOf9qSRVm605k/aBQojmklxbgig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725029374; x=1725115774; bh=O/2GEQFYE9w/7TW64E/X4iWy/ebE
	YEbg0S/D3Ghi4Xc=; b=RWBjkzF+WXieRE7wqM81Lrr7nx3lXiucB3BKZ7FfD4uW
	bkDFQtchUqADB8P0wI9KIhJyv6fpeXxQO8Ksou0/nOWwHVHNb2BK2NNPeIemFDgr
	QfB3oAYYZQynwO+TNRhofgeOBsnU1lJg6x4RI9Dz7unxfkg1MXAqk98xTFygG7pG
	hnSbmBkgbDxKZzVoZ0jIkrV0C/RaHWtaxsOwpzQaHJLu+rj5LRyjG6NPWn7kx5BJ
	eS0z97ddf0rofugDTx8EbXJfatuFDTqN81qQArwvNKdyywOtF1pe6Umc8Iw43RqA
	E5qrZODtWRMGplLvLn4dJJZyBlb+ZWDJMMf+ptQB5A==
X-ME-Sender: <xms:_tvRZnip5m9LRGpeEJ5K-Z-B81kPLUAjyatgs5GRrCxfmY8R3UsocQ>
    <xme:_tvRZkAUDnQq70wazl7crbe3lA6JNYpAdeOGACYMeaw5y2UVrfB2RIJxFV_dT-iFr
    x_cIpzU7zwy7A>
X-ME-Received: <xmr:_tvRZnF3kDK7vnA1cppAlxv5Lz-JdEEq-MMqrGX-PWQRcmcC43nMZn3sB8DyytOEoD9bKcKq-XGzukvNynIUUpO8CO89KluBEsq_vg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefiedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeeipdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehsthgvrhhnsehrohiflhgrnhgurdhhrghrvhgrrhgurd
    gvughupdhrtghpthhtohepvgihrghlsegvhigrlhdrvghmuhdrihgurdgruhdprhgtphht
    thhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:_tvRZkTN4bEV17Fq0CrfnOBrBPR0Jdh3hwxjGcNOKjACUkwUaLkStA>
    <xmx:_tvRZkxCgwpWz-eoyHqdaVunVgFO1BQozMZ78_WZCTdAF8VkedRANA>
    <xmx:_tvRZq4eau5zl9yI8R9c7YMrhCD0iOXbAGLRC68BI40zTq66WVZ93w>
    <xmx:_tvRZpz1xHkylrdK8nwft7OgE0wQJt0CzJJjzy1p9oQUcqE12Fl7PQ>
    <xmx:_tvRZrlcsawGsKRdXRwFGvtslFpdCAHAIcVmhFxCnnDwyqDco17GdQ2Z>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Aug 2024 10:49:33 -0400 (EDT)
Date: Fri, 30 Aug 2024 16:49:26 +0200
From: Greg KH <greg@kroah.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Eyal Lebedinsky <eyal@eyal.emu.id.au>, linux-usb@vger.kernel.org
Subject: Re: Understanding 'lsusb -t'
Message-ID: <2024083036-mooing-sharply-6acb@gregkh>
References: <63d4782a-1d83-4252-a0ca-a9b50e6074f0@eyal.emu.id.au>
 <92687a8a-4dbf-4a16-8b6d-a2f78f7b3ddc@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92687a8a-4dbf-4a16-8b6d-a2f78f7b3ddc@rowland.harvard.edu>

On Fri, Aug 30, 2024 at 10:25:19AM -0400, Alan Stern wrote:
> On Fri, Aug 30, 2024 at 10:14:20PM +1000, Eyal Lebedinsky wrote:
> > I assume that the generated list is a tree, so each leaf (Device/If) is on only one point.
> > 
> > I note this output:
> > 
> > $ lsusb -tv
> > /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/16p, 480M
> >     ID 1d6b:0002 Linux Foundation 2.0 root hub
> > [trimmed]
> >     |__ Port 004: Dev 004, If 0, Class=Hub, Driver=hub/4p, 480M
> > [trimmed]
> >     |__ Port 005: Dev 006, If 0, Class=Hub, Driver=hub/4p, 480M
> > [trimmed]
> >     |__ Port 006: Dev 019, If 0, Class=Hub, Driver=hub/4p, 480M
> >         ID 2109:2817 VIA Labs, Inc.
> > /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 10000M
> > [trimmed]
> >     |__ Port 006: Dev 006, If 0, Class=Hub, Driver=hub/4p, 5000M
> >         ID 2109:0817 VIA Labs, Inc.
> > 
> > I removed some content that is not relevant to my question.
> > 
> > Note the Bus 001.Port 006 and Bus 002.Port 006 entries.
> > 
> > I verified that both are for the same (one) device. They do not show when I disconnect it.
> > The device is an external 4-port USB3.0 hub. It is listed once as 480M and once as 5000M.
> > Nothing is plugged into any of the four ports.
> > 
> > Is this correct? Why does this device show twice in the list?
> 
> USB 3 actually uses _two_ physical buses.  Each cable has two twisted 
> pairs of wires carrying the SuperSpeed (5000 Mb/s or more) USB-3 data in 
> and out, and also has two wires carrying the legacy USB-2 data (480 Mb/s 
> or less) in and out.
> 
> These physical buses are represented separately in the kernel.  In your 
> example, Bus 001 and Bus 002 use the same cable and the same xHCI host 
> controller; Bus 001 is the legacy USB-2 bus (you can tell by the speed) 
> and Bus 002 is the SuperSpeed bus.

{sigh} I totally missed the 2 different speeds, I was just looking at
the host controller driver type.

I'll blame the jet-lag, but I really should have caught that...

thanks for clearing this up.

greg k-h

