Return-Path: <linux-usb+bounces-15845-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF49E994838
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 14:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 742A91F2258B
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 12:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874F91DDA15;
	Tue,  8 Oct 2024 12:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="vZLVbSgN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XIfwWBTe"
X-Original-To: linux-usb@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB1B1D6DA3
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 12:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728389339; cv=none; b=D/UIeVJEyoF28ug8Nq+JITIrUOpcNxe+kU+O4PnQclH41+5kenh3o+cp7Ah7WxeUPaOH5iws2E1dQVyUOhM5tvcKa0/9sWbn167qjeh68wgD2YyCKLLRz2CMOL8FWhAOCrt4XKgFDrhjajrYOvT5esmTT4bPdkUXIjeDiXTM3p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728389339; c=relaxed/simple;
	bh=sp5PxRk04MkO6gEIuCu6EWgjbNpqv+VUIwgtC3RBYSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gH4tNLQaPrREmj37P8o5182XS2jRg1iob/ZpHsAhLpMMwzSlsnHr8bT5t7wt+RYjBLXaDsIuTBXk5OuFpn5u7QT8P88oIXCSnQuBfvQhGrAqFLN64hueoVQq1VsaDZ7ShVfjbQuHmRuHbnzbZwCE2n+WLOGp8nQTsbYyEhy87nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=vZLVbSgN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XIfwWBTe; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 5E38313806F2;
	Tue,  8 Oct 2024 08:08:56 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 08 Oct 2024 08:08:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1728389336; x=1728475736; bh=RekOrUn1fM
	yKlDshVb5mSAYNtALfVWRd+3Wklgn6XLg=; b=vZLVbSgNXMGTZoqrH6RVi6dCmK
	8mGA+XRgaYbywjXd0qsUFN6KNKPw/gNqv3btv4mv9hPDks0v4JLYm/G2KRHbktw8
	WFnFqAabHugTrqpiCdMbdFDW0jZYuramuaehY/zjCWCnv4dnIjLBHMCjeBo2GeRU
	f4m7IHns9NnOjTxZv14X+lPOaYGk4DA6DCi0Ory2nYP8wO3GCIMGvTUFlpznsNE+
	g5Wnj5EGepI46+uMy18N0/B320Ot6VPediSLiaxKn4GGtNQPeZmuAxc9rL+pdDt8
	8dSehNGXuAkNDeHQmkseknt18FXLS+R7o8bFt0PClgydMv3wimzeJhmpvRMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728389336; x=1728475736; bh=RekOrUn1fMyKlDshVb5mSAYNtALf
	VWRd+3Wklgn6XLg=; b=XIfwWBTe8x9XxDyqhMoY+612UAUN5245XLbhmDhCZXLe
	UED7JSF4Fwvg6lkAE1JTQGHgtHM0AptFnMJuTQjQMOCKgEU7E0H5VObqbs3Go54h
	xNV0NnDz39pqTDfFpU5MoDiQGzDCGwsLdQcUF4L2dHJYcfdxyBFWeOm1CiD7xOpn
	ZP6bWUdCHnX8yQkKGrhWCzg2mfpcFxqNoNqYVnfCr6WR6KnwnSR3SivKMBBq4KHq
	yqSVCdETcQBMSDywZr1Q76s1K7slWHuSxOYTlnYqakDDMArEBdD794ELD5pNJyX1
	7FUwvMG5cFUo8Ki35J2cDEILToM/22Ivpptd9ANcKQ==
X-ME-Sender: <xms:2CAFZ-51EXw_QpUwrBDDOd79gW22GApnGy4K0P2sMbhKjCDKglmPUw>
    <xme:2CAFZ34mwea5Hv9jPIJnEJtarlgI7nApWWDECgpfiXmVILTZNK7QWFWJlwMUhPJA6
    XIOJpus6BVBUQ>
X-ME-Received: <xmr:2CAFZ9fvWoBcnmdORURufMkVopPZGUShm_E9FPWPzPZwFHT63kxBy9xtCl84HfIaiLJPA0c_sLwoLUoUGCYc-dakaZZjOM1KsNEXHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefuddggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvve
    fukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghg
    sehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvleejuefgtdduud
    fhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspg
    hrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghughiiihhl
    lhgrqdgurggvmhhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidquh
    hssgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:2CAFZ7K0Siu0CmhqJVzbfluOjLvam_idHwZ52nPfEyVth_n8ikjFHQ>
    <xmx:2CAFZyKggrkVxfxof6j1SSSRwuVFNk509S356CRSzW0CGVZDBnFX0Q>
    <xmx:2CAFZ8xWu_Stl2MgitCYYqBdLGRx-8DRywC1P9rt9qmQCUkowlxWWA>
    <xmx:2CAFZ2LObOIDK1XMvjwZx5YH-WZpzFTZ0CTJEI97Jqx9tDM8-AdyNA>
    <xmx:2CAFZ3EHUcubfm08jIZBhOYr8sARothnZ0cI8npFEpCKIXrIpBIy5bvo>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Oct 2024 08:08:55 -0400 (EDT)
Date: Tue, 8 Oct 2024 14:08:43 +0200
From: Greg KH <greg@kroah.com>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Message-ID: <2024100823-dimness-veneering-6953@gregkh>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
 <bug-219362-208809-D7dWNIzlyu@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-219362-208809-D7dWNIzlyu@https.bugzilla.kernel.org/>

On Tue, Oct 08, 2024 at 12:00:33PM +0000, bugzilla-daemon@kernel.org wrote:
> It's an emergency shutdown in embedded scenario, we have capacitors that are
> able to sustain the system for 1 second in case of unexpected power loss. It's
> plenty of time to shutdown filesystems and drives properly. But we simply
> cannot afford to wait for userspace. Works nicely so far.

"so far" seems to mean "data loss" so I doubt that :)

> > Yes, that is because you are shutting down things in the proper order,
> like a normal shutdown will do.
> 
> Is there a reason for sysrq shutdown not to do that? I mean... c'mon...
> shutting down SSDs cleanly is the bare minimum we should do... if we fail to do
> that, we can as well just unplug the power without trying to unmount or sync
> anything...

Because the sysrq code does NOT go through the normal device shutdown
process, you are circumventing it, because it is only for emergencies.
Don't rely on it for a normal shutdown, as that is not what it is
designed for at all.

good luck!

greg k-h

