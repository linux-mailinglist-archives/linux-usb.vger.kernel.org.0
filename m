Return-Path: <linux-usb+bounces-26831-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE77FB25B7C
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 08:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EA165C4876
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 06:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD2C22AE65;
	Thu, 14 Aug 2025 06:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="d8UrASlb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dpkrBCdp"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D67F21FF5C
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 06:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755151309; cv=none; b=bbOAxxHJX5c7Yo96ljqfMhEbdD1/FZFlcIzUuoWXbVNfzqfnyEMMhhE8IXBcIrh/n0Oh7eA0GBO52AvFoS0vB+47At/Oln+0l9r7pabd0V0WdNJj0DOTXbkNS2orq2JYglnCHfFBwQ9W+w9xlyN2UXszc1a5BdEABypEsmovjD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755151309; c=relaxed/simple;
	bh=mfWdbbecNcADrYmnw7fcLHs/u+bn2umseKsKhE9Gvf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCwhOqTzcJiPiaSv47WGuSNA0VqXf+Zo892ym0s4PQRpSvjuagT0UYf2q1LSFmIJ1NRJKSRD3Np5utcGlLABnfGFSMc2inNe/k0KPK+NxmexxPpEb7o0qr5hEL3hmH0YCMJ4DfdXTBtuZ+5vdhCl5DRuneLVvRRGGbRmPUNW2vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=d8UrASlb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dpkrBCdp; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3AFB17A0096;
	Thu, 14 Aug 2025 02:01:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 14 Aug 2025 02:01:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1755151305; x=1755237705; bh=je+hLdQyHq
	7KCNd+LRrHYZHEZbaOo/HAhuEWuxgrgqo=; b=d8UrASlbKd991w1Ta9A53Bk0A/
	pjZWwBRCg83HaBe3FSs1m6ReoGOQwsK/oNkwIvGVssOzdmGSHciJtZNCmsAi4o8f
	zzKraOdmZuN/O6qM/3ERkJNrQdJ6zqL56AnWJMV4kKk2OgN7SkjZklNz94zCc0Iw
	Xy0dejP4s8P62e9yez6AR/m7TQ6TQ5OdtQDdsfzUeSvliPNKLuOlK46CNY8FZP8v
	E5bLOlWjuiisHh/MOP2prBNNht+y9q54bblGBpxRABIqBMd9izWTzZKTrP2TBprf
	9sNlc0XhP5pzKKLjfQsU0MmAr1NpmlehRg0YOPqytwuIQEgbBeYwnkuwoSIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755151305; x=1755237705; bh=je+hLdQyHq7KCNd+LRrHYZHEZbaOo/HAhuE
	Wuxgrgqo=; b=dpkrBCdp1PJuyVFdW4OtuoQ4gJgeTUoCzFBRb8kGmcD7hTpqxKo
	oos6wJ1KsannzbFOrhmGDSeovYXCv//QRFaEEfhy3Bc42uJ381NhOm4aRJ7MvUFn
	Pf5CSaB64PCFjDZ4nfLHloC9ut1AbOgAQkxdc1MmDA7B/eNh9qLM+kaW5AwfVwPm
	Sh9nyGAvMCdEoVsSrz/2D14TbfGHstitzu5NgEyXprtRQNvz1wJoQzwRV5UxRD8r
	bdRKuxOExS9UeArGv0r2RSaLCr3oX2bUrLVssD3OFNwszFf4RNiQqEmWmHDc7Kax
	NrTALdvlph06pcHPm4RiJp1/5eH5fvKkN9g==
X-ME-Sender: <xms:yHudaIqpT3_vm30EnGWsE6TesYZD4K1tngme9TqG6vPGw_VDv9C50A>
    <xme:yHudaKK-h2FZP3GARVWlLUvKw2LU7cqVfddZGTvtSCcMe4GEj7asGfudWEHjXoge-
    1xmMzIOSE767Q>
X-ME-Received: <xmr:yHudaDrhCjvfC3sPghzKkO3AsmWSRHaSSRuO-ldW5EC5CQ-MVzW0UTasultVtON1NnVhFrxNdmxnXWf3rBTQWnB3KqOK9WPErKzh2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtfeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeen
    ucggtffrrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhf
    dtueefhffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepgedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepihgrmhesvhgrlhguihhkshhsrdhorhhgrdhr
    uhdprhgtphhtthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:yHudaKy-iQxkP_Xk2lQzdw3YfpzGhGC5o-5z4NQzKOH_HTIirYOdxg>
    <xmx:yHudaPMQgQr3dL0ca_NVbH6jjHYwUb5IAu8DRiwwNbmzLNwBN5HVVQ>
    <xmx:yHudaH7Rax6xMNrAd19VuiggWkrL4v7S34dIcXg-bxWZ-8f454hhcg>
    <xmx:yHudaAmouC1y_fUUi-BJFCM8BSk3MBqo0aSthDBHB_RYKDdT7t-5-A>
    <xmx:yXudaNi_XIEHiaOC_2e-tH4NLXqBfor5oMAXMAFrH0qbiUb4Jt7LUJRh>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Aug 2025 02:01:44 -0400 (EDT)
Date: Thu, 14 Aug 2025 08:01:42 +0200
From: Greg KH <greg@kroah.com>
To: ValdikSS <iam@valdikss.org.ru>
Cc: linux-usb@vger.kernel.org
Subject: Re: USB 1.1 Full Speed OHCI slow/high latency
Message-ID: <2025081405-lily-useable-75c1@gregkh>
References: <3fe845b9-1328-4b40-8b02-61a879bea6df@valdikss.org.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fe845b9-1328-4b40-8b02-61a879bea6df@valdikss.org.ru>

On Thu, Aug 14, 2025 at 04:56:40AM +0300, ValdikSS wrote:
> I have an old USB 1.1 Full Speed printer (Canon LBP1120) which can't print
> large documents due to insufficient USB 1.1 transfer speed/high latency on
> Linux.
> I believe this may be Linux OHCI bug or deficiency.
> 
> If I connect the printer to USB 2.0 port (uses "companion" OHCI controller),
> the printing engine reports data underflow using its proprietary command
> protocol, and the full-page picture fails to print (only 1/3 is printed).
> However if I connect it over USB 2.0 Hub (EHCI, hub does internal Full Speed
> conversion) the printer works fine.
> Same applies to USB 3.0 XHCI ports, via which the printer also works fine.
> 
> The issue is seen on Orange Pi Zero3 (Allwinner H618) and Radxa Rock S
> (Rockchip 3308) boards, with different USB controllers.
> 
> There's no USB-level errors (captured with tcpdump -i usbmon0), all URBs are
> success, but they are much slower in OHCI than with EHCI Full Speed via hub.
> 
> Here's a speed comparison using simple Python script with asks the printer
> status 10000 times.
> 
> Direct connection, OHCI:
> 
> # python3 speedtest.py
> Opening printer at /dev/usb/lp0...
> Testing 10000/10000...
> Avg delta: 1.916 ms
> Min: 1.443 ms
> Max: 2.891 ms
> 
> Connection via the USB 2.0 hub, EHCI:
> 
> # python3 speedtest.py
> Opening printer at /dev/usb/lp0...
> Testing 10000/10000...
> Avg delta: 0.696 ms
> Min: 0.590 ms
> Max: 1.072 ms
> 
> The printer is from year 2002, with USB 1.1 full speed, and was designed to
> work via USB 1.1 controllers.
> Any ideas what could be wrong?

Yes, the USB controllers on these devices just can't handle it, odds are
they were never really designed for this type of workload.

Stick with the hub solution, scheduling low speed transactions is a pain
for many host controllers and it seems that it's better done by the USB
3 controller than the older ones.

If you really want to dig into this, perhaps the output of usbmon when
the device is failing might provide some information as to what is going
on.

thanks,

greg k-h

