Return-Path: <linux-usb+bounces-31862-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F6FCEC286
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 16:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ADA2300E78F
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 15:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E25725F78F;
	Wed, 31 Dec 2025 15:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ErxHoI3z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A501925BC
	for <linux-usb@vger.kernel.org>; Wed, 31 Dec 2025 15:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767194462; cv=none; b=Bldp05ihcps6zGbgfWOekAUFRAB/VLk3SQxs5CU/GAyqPepPtvISZKKbj0rUdGCxs/2zFEPOW9KtAnFxvw/MnopBPn5lwSuyF0n/BQ0eQEqXUh/15NN4DJ7fhvY0bXjl+8g2cEcH5AlRsIPa5MNH98J4z77Zk26X3X27wCdfczw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767194462; c=relaxed/simple;
	bh=LVvjiUep7QNt2yoZWLflQZsBhAhO+roBYci+opnnkpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bB6No6UA2sUaT7smdQ7AIe4PBFE5DpHGw2KfJ3pFOdJAVlpiPliEJBrA7wQWDm2QqGnQBQ5+6qdqD1rT0lE4Luidex8A+4yTMb6jeoGW0BM6diN6mBOW8rFEv5oFviB1q9n6SAxRNr/OnxrfoJv3GnquqxU50mWJAEM9xcQt1ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ErxHoI3z; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88a2ad13c24so105313526d6.1
        for <linux-usb@vger.kernel.org>; Wed, 31 Dec 2025 07:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1767194460; x=1767799260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iCsMgC1RHJ0xZHT2ayosqiToNS+TooDnH36P842rda4=;
        b=ErxHoI3z1Pg6YTVKFhgjlrAVHztknALW6Hhm/+cmCEV66kIQeiENiSpO4FJut+Xyu6
         J5h1JHRqYeKHA4mI4L0pMDtYdvIxe5NVz5M7mdpGvmMoPx1hcALYKabLi8iimin6APUR
         Mv0jt2G3TP10P3my/UUjDs5JjMiOsOHnPQqbTx1EOLvcnDQ0kKYaZWQmH3zzauMUgepm
         PbKOO5mYRnD6NLgZpWc5EnwdwYvlae1mOtGjJau7z24MEW099UqnGMhJFR26ir2/1ftf
         PMnxKQa3DW5kBub5/j6SIFiEnRuiLz3sPzO0DFiePLtjlmcsPPW2X5VnQuf4uWi+m0Ly
         SE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767194460; x=1767799260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCsMgC1RHJ0xZHT2ayosqiToNS+TooDnH36P842rda4=;
        b=qcliEvGtUxjw8DrKNKfFUAfxvqkLLj/Xale/ngOYhAM4VcRhqLGgaGDdCXDKEnW4Qc
         osrR5edgejlql7vRga4n1c4KRoLrxGKwVM7v4QZnAzC05L9OtvM+62K01cq5Y2plrf+V
         nEd6MvVje5jIHM7WJ6ITSszffiTbdEHorC3YqVr8w+sJb+HoAfPmua9Vq/GiaeC0qujN
         knVRUVNRfArTmaUrpFD+3r/FynTO7Jyk5cn6/vLfC+NQXsIc1miDKNMR9ie6pdVYNdHy
         mMCnU14pdttBt4fy0u+sQZR2j0YCbWDhDrtKaUDehGtS2x0hmt3rmA7sKnZPcT0w0G/t
         wyfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4OFRBK2bszxp3Y4LZspCVUIqASBuH00HlQy1P4ZMZXHqXiqM5DO0WiX+HIPJAP8bTW2gxybaQ+Z4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMBhOoUiH40qvPHV//gR60+y9/UrHrs9iDOQV82GRQVWg7wtkn
	uKm3o/cXC/sI1OR6FfliUNC/1bdI5wKqdM+Qssqiz5ttviqWiV9Nj//fPmKu6wAm8w==
X-Gm-Gg: AY/fxX5doBQxwIczG9gyKmuOXyelBs5z1AZ8Lrdm20A41Te8Bh2yB6e1K5R+HxpI/5Y
	bsXu+LsowNlVultinVT+nA2nrhKo7dSd2paS2aJoqSpw4eQPPkeOnNgLOkdtgNt/297db0l65r6
	BnEuO7GQZFnonl5d4QT1mO7rmeyJjw2toW2QKbgWS+bPNrfpmQ142r09h0Ci1YGS/orAiUu4jQ8
	0MH6SAOargzB9j74rbd4l5pPsNAmvw5947ET0nvOVpphtXCU/RUygWCG3orc90wpaEuWSO8h1oR
	dDvOXru47oZHbbJg7rcn9C3KEQ6OWum8GMhTDBkcrPsCyIamHyH2FzH9sYcRfnR0zTh80CD8xL5
	g3B+GEijG/mW+F1bobAcOJah1tUQ+ZxUeeglozM0Aapfy+u1Zr7j6vu6NKTt+spY8ROqR6IVgok
	Xrvgd1SBWKFA28
X-Google-Smtp-Source: AGHT+IGzcUj+q0xmvRBW/bmPF+mchNTCZWyYIyc4hZPOiB90Xz8x1i2LE/eY0oT3eC7aDYNsOokA1g==
X-Received: by 2002:a05:622a:4295:b0:4ee:bff:7fbf with SMTP id d75a77b69052e-4f4abcf6ad2mr525954221cf.4.1767194459966;
        Wed, 31 Dec 2025 07:20:59 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7e72])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac62d53dsm271058211cf.19.2025.12.31.07.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 07:20:59 -0800 (PST)
Date: Wed, 31 Dec 2025 10:20:56 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Huacai Chen <chenhuacai@loongson.cn>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Shengwen Xiao <atzlinux@sina.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] USB: OHCI/UHCI: Add soft dependencies on ehci_hcd
Message-ID: <0c85d288-405f-4aaf-944e-b1d452d0f275@rowland.harvard.edu>
References: <20251230080014.3934590-1-chenhuacai@loongson.cn>
 <2025123049-cadillac-straggler-d2fb@gregkh>
 <DFBMNYF0U5PK.24YOAUZFZ0ESB@cknow-tech.com>
 <73d472ea-e660-474c-b319-b0e8758406c0@rowland.harvard.edu>
 <CAAhV-H6drj1df3Y4_Z67t4TzJ5n6YiexsEHKTPvi1caNvw5H9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H6drj1df3Y4_Z67t4TzJ5n6YiexsEHKTPvi1caNvw5H9A@mail.gmail.com>

On Wed, Dec 31, 2025 at 05:38:05PM +0800, Huacai Chen wrote:
> From your long explanation I think the order is still important. "New
> connection" may be harmless for USB keyboard/mouse, but really
> unacceptable for USB storage.
> 
> If we revert 05c92da0c524 and 9beeee6584b9, the real problem doesn't
> disappear. Then we go back to pre-2008 to rely on distributions
> providing a correct modprobe.conf?

The warning message in 9beeee6584b9 was written a long time ago; back 
then I didn't realize that the real dependency was between the -pci 
drivers rather than the -hcd ones (and I wasn't aware of softdeps).  The 
soft dependency in 05c92da0c524 is between the -pci drivers, so it is 
correct.

To put it another way, on PCI-based systems it is not a problem if the 
modules are loaded in this order: uhci-hcd, ohci-hcd, ehci-hcd, 
ehci-pci, ohci-pci, uhci-pci.  Even though the warning message would be 
logged, the message would be wrong.

On the whole, I think the best approach is to revert 9beeee6584b9's 
warning message while keeping 05c92da0c524's softdeps.  Greg might not 
approve of soft dependencies between modules in general, but in this 
case I believe it is appropriate.

And so your patch really is not needed, as far as I can tell.  While it 
might in theory help some peculiar platform-dependent scenario, I'm 
not aware of any platforms like that.

Alan Stern

