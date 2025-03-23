Return-Path: <linux-usb+bounces-22026-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0E4A6CDC6
	for <lists+linux-usb@lfdr.de>; Sun, 23 Mar 2025 03:52:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C4217A2A8D
	for <lists+linux-usb@lfdr.de>; Sun, 23 Mar 2025 02:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781F41FECD9;
	Sun, 23 Mar 2025 02:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="FiJu0pv+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376131F462E
	for <linux-usb@vger.kernel.org>; Sun, 23 Mar 2025 02:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742698367; cv=none; b=HLtYRxZqQsul9pF7W2Y1sSHxrNCGMiaybgUxp2k+fTJMUo7pAe9lTKiFSxRmZNAZkRNWiNFU1lDlRJcUi5tsAD6cW4Az2wpspdkyQutwkkC1INLV+wbPCbIbByfoVqKscBxCpiNK3+yvamdAky2ot2UY0UBLfPcwS38y+xVNHA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742698367; c=relaxed/simple;
	bh=kqA/Kas5tthuIPFYqjUJNe5GOHjheI0JFQgELljOjzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4zI3hc9dC01hy3Xg4V0reZEwUTXfD/JlxzqS/HUt6FnT3Un8qlJZJo9yzJQgupFs6ghI8miqjKXOOI1Zsk3iX/iUp+UiX/x1LV1Qcis9707t2bCOuq/8mxMMQ1BEjcyqS9rtJVG0f+r3ROIVcUqdqPz2ieBATvXayhkidcvVko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=FiJu0pv+; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e6c082eac0so30366376d6.0
        for <linux-usb@vger.kernel.org>; Sat, 22 Mar 2025 19:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1742698365; x=1743303165; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HeDFoZqYXSfok1wYyubujf9vBJf/P5RcWe3GpgFKVFY=;
        b=FiJu0pv+gXhprYNH376r4WdEcFoFvFwfRwdqG+AC7NhAai0Asd9c7GJop+wV1BSmgS
         fzvHog2ZcyHjjRzSNlkUY/LEg7Rqk4ePTtbSRzo2YhVDi6qMb+N97IGD3M/yFroQHkLt
         W9Q4KgWlsjeMPEBlY9dMeYFPvGrmpUqe4hy/vYj6YzBHmGH224XdYDTz2DqlWSOEzZQE
         AkaR9x1PpswspLzkVfYM5iq1k+0ujGsYA1FnbwqSoADqnbMK2mqvAHdXm/PS0bo8dUIM
         /UjAz+ucFeBmOXEI/CXNaWXl6wP8MjSoKll2fkGc4++ffJBfT/omrKHgfR0v/lSWluEs
         6lHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742698365; x=1743303165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeDFoZqYXSfok1wYyubujf9vBJf/P5RcWe3GpgFKVFY=;
        b=bibAj/cQUV2ZgQhJkCWs/3fEHLpdrAFcq7Pve+ovIgIl6tOU8el7C5DSAothA3/sZN
         m/k0hGcdz2vwDI8abTpJyKzQHoLdxuGEm7PkB9wbJodzu4eHb0/EIUz6CDsWvL9PDevp
         x48SkiXY1D8qcfwgizTzFdf0VEAqs6YDjdNTl8rQOf4pGxx/SCJnx2O62aY4TUXiajKM
         QX0tiD14D6fxS3uhR19C0CDodx6w520yqH/v0Ow+m6C8TWSYpLGtaPxe0iw9l83aNJub
         tMrZh9vGPveKJZam6mpEVv5LCQ+z3qmOJPg9kzGEXJxHyj21NK3NV7qTSS4tvW40BLHH
         rvYg==
X-Gm-Message-State: AOJu0YwsQ5MdGeVdh58zP2i0gAv1oiPPP3ApISbwQvrDQyfPcQdqlzbV
	AM8fa+E5RA/eFbE3fx62AXz9NDxuyTP3Dpc3rU48ghVINWkkLGD9U48ymJHNXHbwRSu8pNQ0wrU
	=
X-Gm-Gg: ASbGnctW+D+nm+S3v/q+KiFR7UdTTUDaSqaJ5B0KAw1vMNuUmgzdhOVx1mRyg0wYi0y
	BVcO8Tt97QXXxZAU3rZPUPRFjYVxdUsddYgkxSVLgvPexGJKkBpOqsc5lrbO0zlfxrKaTrWH4Yy
	8dVzaxHzGw6xYNuCh1bOstOZRaj9XW2tgbG6WlbdCsrLfzXOMkXDuTsn/R8Z4jJLWfcYhVT8AXT
	bPX4ZJSUZTmbJBR39SuQJWcmkD6waPueWMxyl3ruTXjavwM6eDNqCmorXwD9excwsJkldfYX30o
	J/eP4lXGx0ZcrBVfCoZiX1IOuMob5lJBQ0RiiaMmGLm4
X-Google-Smtp-Source: AGHT+IFatUqMG3Y+Bz6EJpaMS7VfVyvcyXY8Ryug/fN0QtEYLoPGq8hT5WWr2seLQJgh85NHPLkuiQ==
X-Received: by 2002:ad4:4eaf:0:b0:6e8:f0fc:d6c4 with SMTP id 6a1803df08f44-6eb3f284984mr112655666d6.6.1742698365028;
        Sat, 22 Mar 2025 19:52:45 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::df1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3efc5bc9sm27694606d6.80.2025.03.22.19.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 19:52:44 -0700 (PDT)
Date: Sat, 22 Mar 2025 22:52:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sergey Ivanov <icegood1980@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Negotiation speed on HP Victus 16-e0024ua
Message-ID: <efeef8bc-3fa2-45bd-912a-2a62f46ce33e@rowland.harvard.edu>
References: <CAJCbrz6rzDvXH10+Q3N3tQVgKSksP6qDUyx3UdW7B=YMhKZzVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJCbrz6rzDvXH10+Q3N3tQVgKSksP6qDUyx3UdW7B=YMhKZzVA@mail.gmail.com>

On Sun, Mar 23, 2025 at 12:11:32AM +0200, Sergey Ivanov wrote:
> Hello. My laptop is
> https://support.hp.com/ua-uk/product/details/victus-by-hp-16.1-inch-gaming-laptop-pc-16-e0000/model/2100371556?sku=4R8D6EA&serialnumber=5CD20495CV
> and as you can see from description all 4 external ports (1 type-C and 3
> type-A) are supposed to propose 5Gbit/s speed.
> 
> However, in latest available kernel
> vmlinuz-6.14.0-0.rc7.20250318git76b6905c11fd.57.fc43.x86_64
> 
> i see lsusb output (bu default, nothing connected to ports):
> 
> ice@fedora:/boot$ lsusb -t
> /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/4p, 480M
>     |__ Port 003: Dev 002, If 0, Class=Video, Driver=uvcvideo, 480M
>     |__ Port 003: Dev 002, If 1, Class=Video, Driver=uvcvideo, 480M
>     |__ Port 004: Dev 003, If 0, Class=Wireless, Driver=btusb, 12M
>     |__ Port 004: Dev 003, If 1, Class=Wireless, Driver=btusb, 12M
> /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/2p, 10000M
> /:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/4p, 480M
> /:  Bus 004.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/2p, 10000M
> 
> Now i wonder from where system took two (actually unreachable) hubs at
> bus002 and bus004 with 10000M
> and why all sockets are sticked to either Bus 003 or Bus001 (in both cases
> either Port 001 or Port 002) with downgraded speed 480M?

USB-3 cables actually contain two sets of wires: one carrying USB-2 
signals (480 Mb/s or lower) and one carrying USB-3 signals (10000 Mb/s 
or higher).  In Linux, each of these sets of wires is represented by its 
own root hub.

Thus, bus 1 and bus 2 on your system in fact refer to the same hardware.  
The difference is that bus 1 is used for connections running at 480 Mb/s 
or lower and bus 2 is used for connections running at 10000 Mb/s or 
higher.  Likewise for bus 3 and bus 4.

As it turns out, the laptop's camera connects at 480 Mb/s and the 
bluetooth controller connects at 12 Mb/s.  Therefore they both use bus 1 
rather than bus 2.  Presumably they were designed to operate this way; 
these transfer rates are high enough for what the devices need to send 
or receive.

If you plugged into one of the ports an actual USB-3 device (such as a 
flash drive or external hard drive) capable of communicating at 10000 
Mb/s, you'd see it appear on bus 2 or bus 4.  Probably bus 4, as it 
appears that bus 2 is attached only to connections that are internal to 
the laptop.

Alan Stern

