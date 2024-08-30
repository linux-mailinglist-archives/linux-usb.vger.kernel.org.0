Return-Path: <linux-usb+bounces-14391-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E44966430
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 16:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39A1D1F2305E
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 14:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40771B252B;
	Fri, 30 Aug 2024 14:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="zZehr3x5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YzD8KwPO"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889AC1531EF
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 14:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725028116; cv=none; b=hiG1CsOc8eVgLrVfDPqeTDI3QH7pjqQQCRzTzOI66TjwmdTfxo+G2gBldG28zg6TDtt/XQ5mpNcewfUjjJTpCenyboyeJVAhp8Lf/yzYOeX6z2WDM0hINrnbvvLzd2R4x1+qcgo15+OkXk5b5PNujJ/w4S6HoWX/iPClrajwhqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725028116; c=relaxed/simple;
	bh=4BJcSl0qWLFIJtl15rgblGmyUtz/Uo+GsrqQzxF1ycg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtWY/drJhR9XYrbO8UpOVQeJEG2l+PqshMyGtY13EXOdf+7MQ6dDadydOxZY2MCqmkclBxLb6ckXeW1PLgY0Bu1S5TP3XJfYYoicB3kjPIBiRyzINMyUvkfQ9Zkc68SrBDqDtlukgpIkbQHtuwr55rThCZ93p8hejA6m6Q3XL0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=zZehr3x5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YzD8KwPO; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-02.internal (phl-compute-02.nyi.internal [10.202.2.42])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 9EA351140135;
	Fri, 30 Aug 2024 10:28:33 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 30 Aug 2024 10:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1725028113; x=1725114513; bh=rYXkToleyG
	UJzCq4UBw0l2NOJBpaLwpYOp6gewAh/hY=; b=zZehr3x56iXe5Mzgm+nITLfaOU
	/8pJCv1CT6/cfXtR4qWuXY1yjss99sTHYgDxfP4kOFuSbVigjnERKcX/J6C1WU35
	TBrniKnTUIgYyIjwm0veT74e1QFaGUt2sMeFfjhsxMUI1T8BE631GApKMsMWfIZQ
	/YDq/Czpv5T2fdNTVZPOXJPAOfClvLLVhmZ+lPZIkCLR/+AVNrv/qzf2eaqjc8Ma
	nvdvNrI0HT58P/zzp5qX9F/Lanmk+3zDsbeO/r+WCWJvi/69QUxJFm35uwhsX46C
	Wzi+ktIkJUykpbgCEP7UxLmNkvhA1m9+92zsFEJtZsvw1zfsDZ0GbYLi/O6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725028113; x=1725114513; bh=rYXkToleyGUJzCq4UBw0l2NOJBpa
	LwpYOp6gewAh/hY=; b=YzD8KwPOPxJFkDkPZr/HInwXHpmi0B9gexEP88jgk6qN
	Wu0sb4SP8/hUD9/zVoxqTLuAVtKZ1VCPNWYE1koCMn8OVQU41qmUmy8j16kHQ1PT
	N2yiNU+ke+dDqDMvAL9brEPepSqQIjnZ6h0H2FV7/V17+2RUW9K8bJZRyJHzA+2t
	/bYr2upfrM9JV3bB+ItzvpYaSRgHY/v+wxU4Ghh0q8YjcV/Vz/GgQKr4EgSjvqU6
	H1hJrWnP860GL8XI8nDDu2pjgoAaaulaL/M8mLuiXWUlXSuB/BwAKIvRC8HWGgpT
	NsSy/4Pdv6IgOncowk9u2c4fve5A9Gxmb1MtvtiYog==
X-ME-Sender: <xms:EdfRZkxRQ5IcgXbXrmVHPy_izU7d0MiWw2ARYSEIVNW9cDLc74yHkA>
    <xme:EdfRZoQBuuPHP4AjFJUvYQWTN2orbaWd9iuuOwswrOZGoXUT3FHM4XwM846EBUN70
    HioyM4xU2w8bw>
X-ME-Received: <xmr:EdfRZmWVn-gUl7svpQJ13zVTfyj4uCN5VwLfmOoXyKf4sW_e4yD08dKCJXZIrfzq6ucQAW42axGR0aigBdaKllJa2D0ASQcNRR6FDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefiedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepkeejteehuefftdevleejkeetueevvddtudejtedvgfdvhfetkeefgfeg
    jedvffdtnecuffhomhgrihhnpegvmhhurdhiugdrrghunecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmpdhn
    sggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegvhigrlh
    esvgihrghlrdgvmhhurdhiugdrrghupdhrtghpthhtoheplhhinhhugidquhhssgesvhhg
    vghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:EdfRZijGKgAA10cnxWV3x1ndzD_iv6tLHeuGk7flFOoA_TPWxoKs-w>
    <xmx:EdfRZmATYhmBMV2IU0SbsK8bpPoyBHJA83vysYrjEXbkZdSPWf1F3A>
    <xmx:EdfRZjIckYkvgJiZmsgKr7bjQSSTv-gBTy195zOvsCgdxtD0NXvGsg>
    <xmx:EdfRZtB-077pb2OF7ru3o8tVnTew_a9q904dqZV_GfzT__Nzqiaf4Q>
    <xmx:EdfRZp8XCM6bshWT6ZoDoE3hpfF824Kram3GF0lmTvw1dPWDxbgpAkzr>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Aug 2024 10:28:33 -0400 (EDT)
Date: Fri, 30 Aug 2024 16:28:31 +0200
From: Greg KH <greg@kroah.com>
To: Eyal Lebedinsky <eyal@eyal.emu.id.au>
Cc: linux-usb@vger.kernel.org
Subject: Re: Understanding 'lsusb -t'
Message-ID: <2024083025-sheath-joining-2aa4@gregkh>
References: <63d4782a-1d83-4252-a0ca-a9b50e6074f0@eyal.emu.id.au>
 <2024083057-charger-lustrous-d434@gregkh>
 <d46a455c-a17d-4775-81be-57a5224bc41a@eyal.emu.id.au>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d46a455c-a17d-4775-81be-57a5224bc41a@eyal.emu.id.au>

On Sat, Aug 31, 2024 at 12:07:32AM +1000, Eyal Lebedinsky wrote:
> On 30/8/24 10:32 pm, Greg KH wrote:
> > On Fri, Aug 30, 2024 at 10:14:20PM +1000, Eyal Lebedinsky wrote:
> > > I assume that the generated list is a tree, so each leaf (Device/If) is on only one point.
> > > 
> > > I note this output:
> > > 
> > > $ lsusb -tv
> > > /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/16p, 480M
> > >      ID 1d6b:0002 Linux Foundation 2.0 root hub
> > > [trimmed]
> > >      |__ Port 004: Dev 004, If 0, Class=Hub, Driver=hub/4p, 480M
> > > [trimmed]
> > >      |__ Port 005: Dev 006, If 0, Class=Hub, Driver=hub/4p, 480M
> > > [trimmed]
> > >      |__ Port 006: Dev 019, If 0, Class=Hub, Driver=hub/4p, 480M
> > >          ID 2109:2817 VIA Labs, Inc.
> > > /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 10000M
> > > [trimmed]
> > >      |__ Port 006: Dev 006, If 0, Class=Hub, Driver=hub/4p, 5000M
> > >          ID 2109:0817 VIA Labs, Inc.
> > > 
> > > I removed some content that is not relevant to my question.
> > > 
> > > Note the Bus 001.Port 006 and Bus 002.Port 006 entries.
> > > 
> > > I verified that both are for the same (one) device. They do not show when I disconnect it.
> > > The device is an external 4-port USB3.0 hub. It is listed once as 480M and once as 5000M.
> > > Nothing is plugged into any of the four ports.
> > > 
> > > Is this correct? Why does this device show twice in the list?
> > 
> > That's odd, as the same device shouldn't be on multiple busses.  Busses
> > are a "root port" on the system (i.e. a new PCI controller device), so
> > are you sure you just don't have multiple devices with the same
> > device/vendor id?
> > 
> > What is the diff between running the command before and after removing a
> > single device?
> > 
> > thanks,
> > 
> > greg k-h
> 
> BTW, I run a nightly log of system commands which includes lsusb.
> The first time the device is listed twice is:
> 
> $ uname -a
> Linux e7.eyal.emu.id.au 6.9.11-200.fc40.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Jul 25 18:17:34 UTC 2024 x86_64 GNU/Linux

Ah, something has changed, that's more interesting.

Any way you can use 'git bisect' to see where it changed?

> $ lsusb --version
> lsusb (usbutils) 017

Did this get upgraded from an older version?

Do you see the same thing if you run 'usb-devices' before and after
(i.e. 2 devices being added)?  How about just a normal 'lsusb'?

thanks,

greg k-h

