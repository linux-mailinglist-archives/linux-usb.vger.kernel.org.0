Return-Path: <linux-usb+bounces-31864-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC3ACEC726
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 19:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A429230657A0
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 18:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CC22F744A;
	Wed, 31 Dec 2025 18:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="lZujc4EP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBC524DCF6
	for <linux-usb@vger.kernel.org>; Wed, 31 Dec 2025 18:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767204604; cv=none; b=Z1ByBFQ8aLwlW+uRQTAvWmnR9EgvjNcidG1wFsnhgCIx/9Wt+S2iEcf2kUExe0P0+J/9kzLUrEIVr84FMEU1A7bJXq2eSEadzINHCwE/qmMLTjffYWYiR6lgns32n1SGJbYj77Bs7hkNMQuGNJaSqk1JblOcZojcV+CjO1D9ZRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767204604; c=relaxed/simple;
	bh=1S4heQqgL6iskJZpSajboNbpOfNgZqnM5Beqt1UIIZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hY247clyQtDWCG6hSmK7z/Iaxzcq2bL409ThvH+IzE77S40nG+dACgjhpq/l8Kqjm2I4eLh3vWyzQ9ar/TK8TfLQUe2VggOD1dHFEu8Bzg9vfUAt5ksxW36ZOFiSDG1eDMoA9QbieLHTMGoxetBkZ7PDIc6htG1UOMeNJeGQqJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=lZujc4EP; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4f4cd02f915so51749261cf.1
        for <linux-usb@vger.kernel.org>; Wed, 31 Dec 2025 10:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1767204602; x=1767809402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ler8qDCPRGHJreOe8sxM5+nTcHTkypYD5vwOvTuWhHo=;
        b=lZujc4EPs23Tjrl+rtudipfoGo2T/apwQ4lcrg31ox/ho4O0VvkEJlunQsdkJVJBOy
         JLAzEjNei+nCKhpBYqeW9zPvJ3y+AHHeJ98Fg8HO+GUNSBN5SeJOQo46x/HfIIIHKJHR
         5MYqoia5YYtSRgVfJLeKzUIEYE+BICFwHdJvutHSaiESot2sc0nR08auqxIQYbKbQfWr
         eJr/yKFSeN5h1nELgHYyci1sZVdOVyOXaerq7OCLkYiNgOHAwaJC4BTEnS+HkAOcS/LG
         b6E67YYr0AUtI3z2GWt4maLN3FPYoE/2osGVRMbKnI/I05NJuYuz3acxpLjEuDAB/Mzi
         UQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767204602; x=1767809402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ler8qDCPRGHJreOe8sxM5+nTcHTkypYD5vwOvTuWhHo=;
        b=gVotknixkxzNjjmgIaesSUhuAOD274HRZZ6EgHWRCbZY579yeF5f/G6XZLl8N4gw4z
         da0PD1phKwBM4Z1F2CN4BBKglAJMT0wNoZOnOO0zvmowPd9dxQ/mIAh5tEh/4tg6RFFZ
         v1KXXxHzkeRqyONEOFRG66zfiiUwZELgPCkfZJLiiLjxy0NeqBatzZEzO5zmrUFXrBPi
         XECwi4KPfr89UjXJedfoxJ+XbL5yAy14fCXa7R415e5P5VQQbNkM3jzabjN2Yd1NluXk
         N6y8WXaf+iaKpFnkg2L6et9u/sr8xJRYWT40E7NI/RXtf5lJ2LAA88BvyZzLNAbGwDO8
         VAjw==
X-Forwarded-Encrypted: i=1; AJvYcCXoToYt/XzaKky0XLU5qUaDR1CrZpEmSd6mCHbdobcnPeBlOZ9jd8Wi7CznHa9q0WBfSoHDbRQJGMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNH10psX8ti8QVWEQwHpsJ2oDfst0lDf8gECCLkIpVynNNWoie
	b7LEMTVNAYxnAAQqTNGvvJ0bedSz9gr5sPvSZFmTMC24A8UjzJfy+QlCdkNdwMvamw==
X-Gm-Gg: AY/fxX65fnvVeOyWXPecpivy4fV0fNBrptNsYWE6FAWR5EjUdjkOtkIbT/BVxZyxdsb
	oSy0JHKVHzj3dtgTZXymArCcWWlw4vlbqnhWEkPN0orH50kuwjUvUIh4tVDbt51PIYA9Duh6Gvm
	9emIPCSyYrGfwT0+Nel8iXE22l/LDalTV1SsK2OU3s+7hL/jyi/JKzAD4eGb1WzC9JtGG7D9g1m
	URPYm3zEhHaGH779eODeAqTU1g5L7z54RgBZklTfi2kC1MqzOe6H1JCrLxcDq3HYelyiisM1ffI
	0S0CncHI/gqltqZZonSRT6u2v1QwZePq5Ud583dZ2tFBMvYvYXehoVhEsYBK6dWZRT7QMoGT0Jn
	cLkCZ7X7YjVvAj//H31Gr+gBvznZWWKuzUAYtGyX64zQzG9J/886E0u1RqGfxHMb+xVA4Jdo52H
	S1BMN0C5G4JF7D
X-Google-Smtp-Source: AGHT+IEruzdijXHePGAvKPLGhZbAiM2zIbDD/ICikBW9QEM/BXuzXL6NghqlUqJFyVh2UeSk0b8zwA==
X-Received: by 2002:ac8:5c81:0:b0:4ed:e5c1:797 with SMTP id d75a77b69052e-4f4abcc3eedmr535573051cf.23.1767204601682;
        Wed, 31 Dec 2025 10:10:01 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7e72])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac532d08sm261378751cf.6.2025.12.31.10.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 10:10:01 -0800 (PST)
Date: Wed, 31 Dec 2025 13:09:58 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Shengwen Xiao <atzlinux@sina.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] USB: OHCI/UHCI: Add soft dependencies on ehci_hcd
Message-ID: <1a2aa1e7-7201-47a1-b64c-2a60426caded@rowland.harvard.edu>
References: <20251230080014.3934590-1-chenhuacai@loongson.cn>
 <2025123049-cadillac-straggler-d2fb@gregkh>
 <DFBMNYF0U5PK.24YOAUZFZ0ESB@cknow-tech.com>
 <73d472ea-e660-474c-b319-b0e8758406c0@rowland.harvard.edu>
 <DFCKZ1I7C83G.1DUX9IT96CYZ3@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFCKZ1I7C83G.1DUX9IT96CYZ3@cknow-tech.com>

On Wed, Dec 31, 2025 at 06:33:34PM +0100, Diederik de Haas wrote:
> One of the issue is that I don't (fully) understand how this (should)
> work. F.e. I wondered about all the PCI 'references' in your explanation
> (thanks for that :-)).
> 
> I (also) wondered why the number on Quartz64-A was lower, but that
> actually has a PCIe slot ... with a USB3 controller card in it.
> 
> If I do ``lsmod | grep pci`` on my PineTab2, I get zero hits, but I do
> get hits when doing it on my Q64-A.
> 
> On my Rock 5B, I get 1 hit, "phy_rockchip_snps_pcie3", but that has a
> NVMe drive connected to it. And I have a (working) keyboard connected
> via a USB2 port. And/while I do have the warning ...

I can't say anything specific about your systems without a lot more 
information.  However, I suspect that any problems you are running into 
are not related to that warning.

Alan Stern

