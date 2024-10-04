Return-Path: <linux-usb+bounces-15706-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F00AF990480
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 15:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B309E281C01
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 13:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7CF212EED;
	Fri,  4 Oct 2024 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="SAxiAKWJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jONetCcI"
X-Original-To: linux-usb@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE769212EF0
	for <linux-usb@vger.kernel.org>; Fri,  4 Oct 2024 13:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048803; cv=none; b=iGWHsXGpSO76+v0dWMzBgrsYHo0vvaMuF7LGGiHUfnddbc0k6FiuevkzTxbhRzoYwuwpRj2GZbxLOXYgg0eNuG4k3QwTkTN7wbaP0uWQSUwA5vpV4TYhlvT/oLNWa8B4AF4MGtI2cq9IytKeFbh2zH2t8sI8UDHb9yNTkXqrv3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048803; c=relaxed/simple;
	bh=umSw8HZi50QWfpi00GTLAaWado+sUbpLPrx+gcJgJmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ky/KvemZ+J6qapmbYhMPk3v5y2Pvyi5ElGYnFl9IN1w5LpzOLrJGJNxYaduWbY4M0CQA7bjTpmxho8Kt9Fxr9FqUjzdvVXetGiI+o10ai0fZKZWN/X/qE9stZalauC7blu+qqBFAW7xocx6eB6yQhb6ZAXS1u5Cibipq8mi5v/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=SAxiAKWJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jONetCcI; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id D1FB11380244;
	Fri,  4 Oct 2024 09:33:19 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 04 Oct 2024 09:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1728048799; x=1728135199; bh=o3p4GSjcg6
	B2O8eFeYMrnt0O9Vj1glmL9trlE6KxVKw=; b=SAxiAKWJx3ypE8ncvukS7UL3zV
	w7xmcs8q+InW64KwptqCdyJro+1mUbcr+WOcLNcNy9fK6N2BLoSATWtSujWgFXPq
	96k8DDPtZoVIwRlz9OoaRbGf5QJpU7UFPu1BMq82Zj7PqDJhVsFTGeMSbTxeamNS
	R9ncfiLANCh9dn2lEEslEoy1DQ5oqf8LR04VqW/9RlkfLgDWmPRdge2eUTAfPMu+
	pTyywZUN/lvfhQ3BiUN9lQ1DZ5pSOrERaiFjaezBlmbno7KdtSyWq2Tzqvf0MbkX
	2hw6wd7PeY5s/OuP/tpGnYl7FncamdMnkGgrwdDTIpBBuJhJrDLJu2HVxfSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728048799; x=1728135199; bh=o3p4GSjcg6B2O8eFeYMrnt0O9Vj1
	glmL9trlE6KxVKw=; b=jONetCcI8cUDRAvTy5t4i8TeTQT06RBkiyD7RR+N77j0
	zj7guaeeDdvAyZx8Xvvk1UjfAc8GI0Q1+E/Hb+7k8wRKGhSm1+gU3T1+p9j7l6CN
	LQ4314q9lbgYBKBQ4+mcYWRIoTVPgKYNtiMJkS5bQxX/RSKtl152hOOVLAAhwJhH
	4n/Wtdyd/a/qTwFTg4171tjKJS0x8zaDIbzjVMLQReVqKpXhITaBTLLmZQKkUQvk
	MB1RZ3GojFGlckd+K2oJwUblnLXtIreN6BrqBv5I6oLsyH1YDnz5QHgT56p4b0Qh
	fvxaOI/TXnY+n6mdZYPMa9OZUJU0iiCtZlx4fTiUvA==
X-ME-Sender: <xms:n-7_ZiIy8KYIYskXeE3fxARR6D94Oxc0YTweaVwxlHCM2d6WPcCavQ>
    <xme:n-7_ZqIAntyZvCWHFESNXZo8XsWY65LP97OceYK658OBBfNv3P_7xdfmb64cqXhNs
    PirOJ7NuQtZcg>
X-ME-Received: <xmr:n-7_ZispkOwFxB4bn6A5ojmaxwJH2v08QlwAiqCpXaY2Vz45PK4YixoVIXyFTFHSrco6QU_qsdBrYEyEggGtYzTogi8DT-SAAe5YGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeduvddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprh
    gtphhtthhopehmihgthhgrlhdrvhhoughitghkrgeshhhiughglhhosggrlhdrtghomhdp
    rhgtphhtthhopegsrghlsghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrghl
    rdhvrhgrshhtihhlsehhihgughhlohgsrghlrdgtohhmpdhrtghpthhtohepshhtrggslh
    gvsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:n-7_ZnaV5cDxa4jdoAnjtu6nc9eNuw9p6dYU2bEl7RUsIGPpaVq1bg>
    <xmx:n-7_ZpZrFL8JWoBbT9L8CghqBMxulLbNONjVsGg5G-8tIsv65rsnIA>
    <xmx:n-7_ZjAviXf-rZa7f8aYIPo8P7AUy0fyANIW0s0lPvoSkrDbZDp1lw>
    <xmx:n-7_ZvbIq7jiO2smBl0IuCjPNbdELwbVIZB8jF_d8LDoZ_3yIRbTCg>
    <xmx:n-7_ZtTyUzG5dqfSmOGajlMYNefJ-b_1w_2MO8Cz35wplUDhzZgOe-VF>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 09:33:18 -0400 (EDT)
Date: Fri, 4 Oct 2024 15:33:16 +0200
From: Greg KH <greg@kroah.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: "Vodicka, Michal" <michal.vodicka@hidglobal.com>,
	"balbi@kernel.org" <balbi@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"Vrastil, Michal" <michal.vrastil@hidglobal.com>,
	"stable@kernel.org" <stable@kernel.org>
Subject: Re: [PATCH] Revert "usb: gadget: composite: fix OS descriptors
 w_value
Message-ID: <2024100457-able-sake-47fd@gregkh>
References: <AS8PR05MB10129E57ED13CF18746FC4BE18A9B2@AS8PR05MB10129.eurprd05.prod.outlook.com>
 <5f8cdcac-6927-429a-8ef5-0891c90e8efd@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f8cdcac-6927-429a-8ef5-0891c90e8efd@korsgaard.com>

On Fri, Sep 13, 2024 at 05:39:21PM +0200, Peter Korsgaard wrote:
> On 9/11/24 03:32, Vodicka, Michal wrote:
> > > Hmm, very odd. How are you testing this on the host side?
> > 
> > We just attach the device and check the registry values created by OS
> > for our device. As
> > HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_XXXX&PID_YYYY&MI_NN\<device_instance>\Device Parameters.
> > When it works our extended properties are created there.
> > 
> > We check the communication using USB analyzer which clearly shows
> > wValue bytes are in opposite order than documented. This is SETUP
> > packet captured:
> > 
> > Offset  0   1   2   3   4   5   6   7
> > 0x000   C1  A1  02  00  05  00  0A  00
> > 
> > As you can see, this is interface request and out interface number was
> > 2 which is in the low byte of wValue.
> 
> OK, annoying. I am traveling for conferences this/next week so I cannot
> verify here, but presumably you are correct. Do you perhaps have a more
> complete capture you can share?
> 
> 
> > 
> > > Could it be that you are running into the WinUSB bug described here:
> > 
> > No. The mentioned bug is in wIndex and out problem is wValue. Also,
> > MSOS descriptors are read before WinUsb is even run.
> 
> Ahh yes, indeed.
> 
> 
> > What Windows version were you using and have you used USB analyzer to
> > check the communication?
> 
> It's been a while, but I believe Windows 10. In the end I ended up shuffling
> the interfaces around so the one with the MSOS descriptors was interface 0
> for better compatibility, so it is possible that something went wrong with
> my interface != 0 tests.
> 
> If so, then I am fine with reverting, but we should probably add a comment
> explaining that the documentation is wrong.

Ok, Michal, can you add some text tothe changelog and send a v2 for
this?

thanks,

greg k-h

