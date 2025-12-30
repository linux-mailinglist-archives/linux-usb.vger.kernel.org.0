Return-Path: <linux-usb+bounces-31847-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B82CEA34B
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 17:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E86C30222D3
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 16:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71BA286D4B;
	Tue, 30 Dec 2025 16:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ovRK+fkp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FC92AEE4
	for <linux-usb@vger.kernel.org>; Tue, 30 Dec 2025 16:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767112962; cv=none; b=NdsdBrdZs4MjxhhjaQwdLMPpvt5kBzaVDinoIKL9tYuLt985u/iG6Se557x+FT8kmpbr4Jj5DOHC5WbHLNThTiGWSrRmcZLvEaz6twuu/l4dy2nes8vXd5NanXJnY+eBqasXdqatpT1jgpmpXyXFSNh4c1KKZ3UOfwnOwfWqILw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767112962; c=relaxed/simple;
	bh=tcI5f57F7ym6jvYHz/Bcc/Mx2rq2d515wCZhg9iPIy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6S4D1bfZ5bkrDr2E3QRU3DLiY7eZo47U8PoNQ/UW/e744g+fULV24RXuZkhTSPh58s/rCIIZOvVS5PDTULhLIyj+K9hmH4R+/Z0X8xRl/tuWWPwe81M+ZSWlWtwfzmADjBkTMGnQVT5jQGcC21wkAuOn33e/g3WsLg2X6vkBcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ovRK+fkp; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ed9c19248bso86418411cf.1
        for <linux-usb@vger.kernel.org>; Tue, 30 Dec 2025 08:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1767112959; x=1767717759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ANHVR9coAMge+WLBsY5cko52eRTlCq0nuigwEeNBZ6Y=;
        b=ovRK+fkpo4CQUQ/lpQa9B6K+13qEatIkq6NFGvkNGeeOqUD2omORY4AVq0k2uKeReD
         7gk66mZC8YweKMfi7GwrSRggz0O5/6toGYXlwbos5ZN0XDGS5KPhJSBfik/xjFY3W0Ba
         fwLBav0w/9PlRLEidu/AqiDxwMIs5ip9bL74O7IQCEyPZ7EMOOuK9fF63UlHgQ163FQx
         JMxvm6F9TO1gAVq2KrSYk/Oq9zwdNjv0U695NR8aip6qvL4I+S0su7qvw0ABCA8afuGz
         /0142ZhIOeKL2sZKMhd6UqYGlIu7KKvxbHvpdqbGA01wpqKGOVvI7lLz+4RueleTVu7x
         7KxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767112959; x=1767717759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANHVR9coAMge+WLBsY5cko52eRTlCq0nuigwEeNBZ6Y=;
        b=F7pG1edzHc8+SzuCNk8e3w6jmp8VnIeIscq6Rcr3TrDsDft4hT8BTe8YIpXCFq0X4h
         37WsQloZ/icmTIi6O2Ks1IQwoCurNCscRGb6sxJTgzOEqiP0bt+cwE1PF8kEpgewuycb
         PohlGa/G4CiRHVcWg6iJ49F6OepK72kO78a0onBhWsvsapZU1tcXtAc7ta1OOg3jcszb
         1KHPDNbsUJcjizZmB7mirk5nbUKo1Xutuz+Wqo2BZgNVdlWX0CA8DSmT2Q5ULFLgPLin
         dd3livXz7ZjMQKICzYmz4zOhk9vq5KX20gvZqtGDJTbXF+Y87DtuwVeyS5a2YMiBg0Q0
         VrLg==
X-Forwarded-Encrypted: i=1; AJvYcCUthstHJv8RE5ArQZ8cX3j94hS4iGSp0u6xDuRsZmbrcCVjkIb2DMk3Y3UFM79LiqPIHvJ96H/OgnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzP/djEdoFdqYITvphKN8OomGMhDU0NDm/l48DPe/TnDcztMsW
	wknx3AJW3WHsBPRopwZYuBXGYFfZ45Ix0kv6pEL+HAmbbuc8r2nx0OG6qGN1ags33A==
X-Gm-Gg: AY/fxX6oNFM7OEGAatEJkJIs28TrEzYZQhlcrb5foiWnp5sAc3idxnk8lsNqR8XbhR6
	eyHceCdjmmeqZDzOALXFfeIRvSFbOQnydemV1WGx4Hncr/LtN5dv+GZC48OzEfAryGAYcTBvata
	6RU0cFBwrtPu7ZVu+naWxGjB0yHVoGKhpR3FDmDI73+wFAYDamP3Mvi0lEFgIrJKxtr3fSGCSl8
	P34wos/SLaSJsfHLnJjaV0vKAAiA0yuAkqVqTGY7F+9UTtBCQqhUe8LTXgIGXdaKyJE309ZilP5
	g2Uo36nPipQBdvI/iOUE+d5w7td6mdqZ/T22CLKSPJLFLPFPYNyZSnjUY+pqehVnU404OsLyb20
	gO92mONuBRnHK+6jUKkifk5g+ZjjnqVHlumynMxeXYiYNmKFItDMcRLhXggaSNsGPgaehJYorJN
	0qAseZL4DliySk
X-Google-Smtp-Source: AGHT+IGZ10x43nQ+FLvBRMXbLZtKA3EXPyhDzZklnkmuT26qzuiftxIwaVESBYneQ9nQxbWfNF/N/w==
X-Received: by 2002:ac8:5746:0:b0:4ed:dab1:8109 with SMTP id d75a77b69052e-4f4abcf6a35mr445396981cf.17.1767112959383;
        Tue, 30 Dec 2025 08:42:39 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7e72])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4c46e4aabsm198873001cf.16.2025.12.30.08.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 08:42:38 -0800 (PST)
Date: Tue, 30 Dec 2025 11:42:35 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Shengwen Xiao <atzlinux@sina.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] USB: OHCI/UHCI: Add soft dependencies on ehci_hcd
Message-ID: <73d472ea-e660-474c-b319-b0e8758406c0@rowland.harvard.edu>
References: <20251230080014.3934590-1-chenhuacai@loongson.cn>
 <2025123049-cadillac-straggler-d2fb@gregkh>
 <DFBMNYF0U5PK.24YOAUZFZ0ESB@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFBMNYF0U5PK.24YOAUZFZ0ESB@cknow-tech.com>

On Tue, Dec 30, 2025 at 03:40:27PM +0100, Diederik de Haas wrote:
> On Tue Dec 30, 2025 at 9:15 AM CET, Greg Kroah-Hartman wrote:
> > On Tue, Dec 30, 2025 at 04:00:14PM +0800, Huacai Chen wrote:
> >> Commit 9beeee6584b9aa4f ("USB: EHCI: log a warning if ehci-hcd is not
> >> loaded first") said that ehci-hcd should be loaded before ohci-hcd and
> >> uhci-hcd. However, commit 05c92da0c52494ca ("usb: ohci/uhci - add soft
> >> dependencies on ehci_pci") only makes ohci-pci/uhci-pci depend on ehci-
> >> pci, which is not enough and we may still see the warnings in boot log.
> >> So fix it by also making ohci-hcd/uhci-hcd depend on ehci-hcd.
> >> 
> >> Cc: stable@vger.kernel.org
> >> Reported-by: Shengwen Xiao <atzlinux@sina.com>
> >> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> >> ---
> >>  drivers/usb/host/ohci-hcd.c | 1 +
> >>  drivers/usb/host/uhci-hcd.c | 1 +
> >>  2 files changed, 2 insertions(+)
> >> 
> >> diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
> >> index 9c7f3008646e..549c965b7fbe 100644
> >> --- a/drivers/usb/host/ohci-hcd.c
> >> +++ b/drivers/usb/host/ohci-hcd.c
> >> @@ -1355,4 +1355,5 @@ static void __exit ohci_hcd_mod_exit(void)
> >>  	clear_bit(USB_OHCI_LOADED, &usb_hcds_loaded);
> >>  }
> >>  module_exit(ohci_hcd_mod_exit);
> >> +MODULE_SOFTDEP("pre: ehci_hcd");
> >
> > Ick, no, this way lies madness.  I hate the "softdep" stuff, it's
> > usually a sign that something is wrong elsewhere.
> >
> > And don't add this _just_ to fix a warning message in a boot log, if you
> > don't like that message, then build the module into your kernel, right?
> >
> > And I really should just go revert 05c92da0c524 ("usb: ohci/uhci - add
> > soft dependencies on ehci_pci") as well, that feels wrong too.
> 
> FWIW, I've been seeing this warning on several of my Rockchip based
> devices as well. I thought I had already mentioned that on some ML, but
> couldn't find it on lore.k.o ... turns out I reported it on my 'own' ML:
> https://lists.sr.ht/~diederik/pine64-discuss/%3CDD65LB64HB7K.15ZYRTB98X8G2@cknow.org%3E
> (and likely on #linux-rockchip IRC channel)
> 
> Most of it is just my research notes, but the last post also had this:
> 
> ```
> I checked the last 20 boots on my devices to see that warning (or not).
> Device				Number of times that warning showed up
> Rock64 (rk3328)			16x
> RockPro64 (rk3399)		11x
> Quartz64 Model A (rk3566)	 7x
> Quartz64 Model B (rk3566)	14x
> PineTab2 (rk3566)		17x
> NanoPi R5S (rk3568)		13x
> Rock 5B (rk3588)		12x
> ```
> 
> While I generally don't like seeing warning messages, it often also
> resulted in USB2 ports not working. Maybe even every time, but I only
> notice it when I actually tried to use one of the USB2 ports.
> 
> The first post mentioned what I 'assume' to be the problem:
> ```
> CONFIG_USB_XHCI_HCD=m
> CONFIG_USB_EHCI_HCD=m
> CONFIG_USB_OHCI_HCD=m
> ```
> 
> So I guess USB_EHCI_HCD doesn't work with '=m'.

Not true, it really does work with "=m".

And in fact, your systems should work even if the modules are loaded in 
the wrong order.  The issue is that doing so can cause a brief 
interruption in the existing USB connections when the ehci-pci module is 
loaded.

If your systems don't use PCI for these host controllers then I don't 
know how they would behave.  The issue is: How does the hardware route 
low-speed and full-speed USB connections to the different types of 
controller?

On PCI systems, when ehci-pci isn't loaded, the hardware routes all 
connections directly to the companion UHCI or OHCI controller.  When 
ehci-pci is loaded, the hardware routes connections to the EHCI 
controller, and when the driver sees that a connection isn't running at 
high speed (480 Mb/s), it tells the hardware to switch the connection 
over to the companion.

So if a low-speed (1.5 Mb/s) or full-speed (12 Mb/s) device is connected 
before ehci-pci loads, its connection will get routed to the companion 
controller.  Then when ehci-pci loads, the connection will be switched 
over to the EHCI controller, which will cause the existing connection to 
be dropped.  Then the connection will be routed back to the companion 
controller, but it will be perceived as a new connection, resulting in a 
brief interruption in service.  For many devices this won't matter, but 
for some it might.  The only way to avoid the problem is to load 
ehci-pci before uhci-pci and ohci-pci.

(A similar problem can occur with high-speed-capable devices.  When 
initially attached to the companion controller, they are forced to 
connect at full speed.  But when the connection is changed to the EHCI 
controller, they are able to run at high speed -- and again, the result 
is a new connection, causing service to be interrupted and then start up 
fresh but running much faster.)

Alan Stern

