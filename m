Return-Path: <linux-usb+bounces-31875-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DBECEFA61
	for <lists+linux-usb@lfdr.de>; Sat, 03 Jan 2026 04:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2143F300E798
	for <lists+linux-usb@lfdr.de>; Sat,  3 Jan 2026 03:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91321F4190;
	Sat,  3 Jan 2026 03:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EnO3RbgY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB8E3A1E67
	for <linux-usb@vger.kernel.org>; Sat,  3 Jan 2026 03:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767411232; cv=none; b=aZZsgA6kAwsuSiXt8wj9o2CyXwyFR7Z/aY/055Sv5qYltGykbjwuGYX9QTPCZ3uzNxrKso+1zGTXqpMUeiE6EN6JI7uAvGi6vl4X/+vE9Ja1kub2TXcUFWois/S5E2QHeGdsiG8uB77jnjORU51yGqU2Qn2PFEDvePpgps/hmKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767411232; c=relaxed/simple;
	bh=DvHqOw/97h3KFCjLx4a3ZWvMiQuFjYBj7WlTh8Zjm9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JG2CPVIMSdyh2y2j4Hsvej1UDdwHzNeJKIeUhLctu8fKB816pA3mvRbgSEPXC8Pk8pq1BGtdVhmTlkw68J7rYwYkqmlySLMcFKRoA8pEsmhRnhgkI25SGJ+kdwuzca4Hve2895GqLN6U9tS2rx3bZqD59U3EoYO0/E5DI2yppZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EnO3RbgY; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-88a37cb5afdso5432306d6.0
        for <linux-usb@vger.kernel.org>; Fri, 02 Jan 2026 19:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1767411229; x=1768016029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Rx4mxodgB1DZmHp5H8zfG7zdDZzjgVY/DGJF5Uvfuo=;
        b=EnO3RbgYgxu2m8turbvSBufg7zIHdVEHaA4e+P+h8UrOPJwNQP5x+SUG9t+kiVrlBb
         p/7O1ua2qlUQZKVS3tw7NG7SblvfGU2kFNF6bIveCS4qXpjr8FtEXXvZ2lJnaXcvTMZM
         vbgAMOQpKluGbdv68+LpPunroKLJ76pk3fYiJYXbT9zUsHsAUuK7vM1oOZ0Ba/bF+vVw
         o0yv339mCP5dniTJvI/k0g1vCt6iH+jgZMi8Pw9nxv0j9PPud8vCChkOzLWBrsw4rBU/
         vAxCw2nA25mvy+WXc3Ekcn6Ljnb1ujJ2cZlV2jVmsygbtNuJcjtGl58OHPHqYDGZU6Rb
         CZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767411229; x=1768016029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Rx4mxodgB1DZmHp5H8zfG7zdDZzjgVY/DGJF5Uvfuo=;
        b=uIThdhZzKLBQEtTTWtYNsNgcdHHVIuyp3FYJI4lNcY7EfYoYgcr+dZb1EMZ1wTPqG6
         /NeFLXa8YOgtXweDei7O4ty3H4bEXkNfci3wLJiD/G203P1m6/lnbXr3fsUNARmiNw1d
         kCbZV+AmLGBJxf58rIeWgMmVkayZkClaeI6U0QQ/13LMx18qKfqwrpq96ct9l8LCM9CJ
         JomB+JECgSQQavwYrN30w/wltO50+c8JF07LPEq0YsGyR9OwpseJD3uEo3tfYIhKoAbG
         euJYmhCzAqfk8P4jp7ND08SD6fJSxkeLNT0CmwReMk5LQsNkf5sc2RcAfjIqaaxvYjYH
         b+cg==
X-Forwarded-Encrypted: i=1; AJvYcCUVRyhRm7wrOwFa7aRtuueXEa+SEktTkEq+qrK8hT+WZrAzVjpDzI6tdEGXDq7XypchNEeeR5MtJ2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPby3evwLwWpTbCh4W8fzAF+H7kmhhgWD+jMWWPyGL35KCtgLi
	j48pNYj+bUQZqWRIPueqkEdyRhgpNUqWVnpbPHAr43O7IgGIlS2dzSS2s4x4zRL46g==
X-Gm-Gg: AY/fxX5zOPmNo0ZpgpAmssrHQ9yXutxUj+wWmtzvcn/TEaqC796Of8hgwrNLr8dM1TB
	mK19O2QfuNdWM8g54SnGNaITYIDw4AY2GnRnwAteAFwWnX4dWtWqur6c08teauhlKmJHv54j2Pv
	w01sjKlOdjyGEZWtFc2hH05j0h3cYuCDPoLpQDxY1Xxh+nBVqB8kfQXdYOXwoE2X8+XBr3gyJEV
	j/EcSEZ7rZs8BUDQRQAfX6E/uePnapUBq/H60Xyhrv8A3ynlIt4EwyoP/YLyv3wNr9TMWwP0U4g
	4ckmvwNcLemc1X8hUxyj6tcIY1+SAU/z4LFxDNTgDB5QZoRdBWqI1UpH56Vp2XPU+2269Y8C6Yj
	oDuUH4SdLgHw5uBlF14mK49pdJ7dbUJAZ72+EsIV4B0N0g82DLUAFuPfN1ssJV1DjtjKwsq8CtG
	yLcLwZXaX2nUCF
X-Google-Smtp-Source: AGHT+IHoyxqPLEaWnJ/LDGZOADLupMTl9wzEwLf9s+fKpC12/nZpuwilwnAGwaE+DlCKqsZXJWpJyQ==
X-Received: by 2002:a05:6214:1cc1:b0:88f:d4b0:10ff with SMTP id 6a1803df08f44-890594f14c6mr25041866d6.7.1767411229499;
        Fri, 02 Jan 2026 19:33:49 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::16e7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac66841bsm299275101cf.30.2026.01.02.19.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 19:33:49 -0800 (PST)
Date: Fri, 2 Jan 2026 22:33:46 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Huacai Chen <chenhuacai@loongson.cn>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Shengwen Xiao <atzlinux@sina.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] USB: OHCI/UHCI: Add soft dependencies on ehci_hcd
Message-ID: <98e36c6f-f0ee-40d2-be7f-d2ad9f36de07@rowland.harvard.edu>
References: <20251230080014.3934590-1-chenhuacai@loongson.cn>
 <2025123049-cadillac-straggler-d2fb@gregkh>
 <DFBMNYF0U5PK.24YOAUZFZ0ESB@cknow-tech.com>
 <73d472ea-e660-474c-b319-b0e8758406c0@rowland.harvard.edu>
 <CAAhV-H6drj1df3Y4_Z67t4TzJ5n6YiexsEHKTPvi1caNvw5H9A@mail.gmail.com>
 <0c85d288-405f-4aaf-944e-b1d452d0f275@rowland.harvard.edu>
 <CAAhV-H5GdkMg-uzMpDQPGLs+gWNAy6ZOH33VoLqnNyWbRenNDw@mail.gmail.com>
 <34c7edd0-3c0c-4a57-b0ea-71e4cba2ef26@rowland.harvard.edu>
 <CAAhV-H7j=cD9dkaB5bWxNdPtoVR4NUFvFs=n46TaNte1zGqoOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H7j=cD9dkaB5bWxNdPtoVR4NUFvFs=n46TaNte1zGqoOA@mail.gmail.com>

On Sat, Jan 03, 2026 at 11:16:59AM +0800, Huacai Chen wrote:
> Thank you for your explanation, so it means there are two methods: The
> old one is EHCI with a companion OHCI; the new one is EHCI with a
> USB-2.0 hub. Right?

Right.

> > > So I guess OHCI/UHCI have an EHCI dependency in order to avoid "new
> > > connection", not only in the PCI case.
> >
> > Do you know of any non-PCI systems that do this?
> Unfortunately, in 2026 there are really "EHCI with a companion OHCI"
> for non-PCI systems, please see
> arch/loongarch/boot/dts/loongson-2k0500.dtsi.

Since these systems don't use PCI, the question I raised earlier still 
needs to be answered: How do they route connections between the ports 
and the two controllers?

There may be some exceptions, but for the most part, the code in 
ehci-hcd was written assuming that only PCI-based controllers will have 
companions.  If you want to make an exception for loongson-2k0500, you 
will need to figure out how to get it to work.

Have you tested any of those systems to see how they behave if a USB-1 
device is already plugged in and running when the ehci-hcd driver gets 
loaded?

Alan Stern

