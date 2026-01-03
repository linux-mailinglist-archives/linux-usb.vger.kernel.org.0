Return-Path: <linux-usb+bounces-31885-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ED8CF02DC
	for <lists+linux-usb@lfdr.de>; Sat, 03 Jan 2026 17:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD92B301918E
	for <lists+linux-usb@lfdr.de>; Sat,  3 Jan 2026 16:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5B030DD1F;
	Sat,  3 Jan 2026 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="iPkij/DA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515F917A2E6
	for <linux-usb@vger.kernel.org>; Sat,  3 Jan 2026 16:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767458498; cv=none; b=YcOLVLlQhWwr4Ym3XEXqN4BCnbdxqU363PmleHgG38YnE/zf+mkTFRn7uQsIRPWf/uudzMVsh1rV8m/Z3Cwzkbxj7Up6Csu3MqqRmKmgaSiWRHNuvoRWN/ZRCEPRe8P1mjnZ1T6IclbpKGhaFpIzjlOUQR41M6QOiv7mWtLM0+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767458498; c=relaxed/simple;
	bh=MNDpUbbrDc9i5przFZIHdq/ew9ELSlPejImCcCxQxKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntUXkW2wWGlDINHXN1Pt5EVeS5R3oBLhuxtyAasXN2yJ3v4La3wj1DGLw8gIT9uhGJBhJqmdUjJ5lZmyBR9GFCYJ0/tltY/YLVg8fERunW16xogcwu7cARW4S//jWu+Nec23qlwUQe37hisfPnxUcbmKLSYBCHvk5liYBlX6xTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=iPkij/DA; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-88fca7bce90so139888926d6.3
        for <linux-usb@vger.kernel.org>; Sat, 03 Jan 2026 08:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1767458496; x=1768063296; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mlKFI5VRK7mDczHswg21LQqMhaeoNo0R7gM8QnlAtPU=;
        b=iPkij/DAkjunBx3KKjmAfc9SQzZuE9kR5IAXdnXmoQoSMhXaBCCWBqUHFv3qRrk08M
         JjPII1/rXS+MvelGmf5016OkV4r+Whw6WvhO03w9su4XekOwJYLGsD5l0zI1CMroN3qI
         Szu9ZgR3KSG9Uko2o56vKLbjvByYU6/88H6knMdxkiAPsP7awyCRp0ORrnbHcoi6EQJ/
         nHqkKkJHx0C3aR65gR25O4QGucvW+pMHJmI6o+2Wv2wLdyAyoOlrwS1SbDoElIa60BeF
         oeVZntHFlaJ/dAxTL7iaQ9uMmzY1WDACOFShcLrnzqYG5HlSk0RSyUdEPUVgZ8pbBfbq
         rG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767458496; x=1768063296;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mlKFI5VRK7mDczHswg21LQqMhaeoNo0R7gM8QnlAtPU=;
        b=sqJXm9xo+RN7Nk+XlPzjaubr2QZU312MJ1/WkBWbNlGQ5mh3zb3hPEr3wk9LwTXt6W
         jdVeY93ZoCAbV7niOryvFYhITc7qfIYTEelWKoI8PF5Q8QSRM1YBvBtSg2PtktsiA5cQ
         hawJgiHBRR1Og+djjNONCiQxYlehAsaErVGMp6F6nyytwGOHtFGpDvUEgyWhO/kUflJw
         LHvlFf3nhWRknp8O1Kuy+IqGPUsybRTxda27ubsXXOEEtfUQ7RrFCUSXdZHct6FdkeF+
         EUVMwJEo/EWnOJ4f1ccgF4medDsZRad6z4dcsa37QFAskLnEqXYw9iv2IojflojTW+6j
         78VA==
X-Forwarded-Encrypted: i=1; AJvYcCUXnmGbL0xIyRxL3nT2pTjzFeMOSWUdf38LKhybB72BY3/cvQqqYoPCN76nHxLk38trCgVp4jOXSAM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyui8uvU9gbENTI27/QsYI14gg+vRlHhb6Hl2BF/jlaYLjGsIlM
	76YyNBubp/PrpXHa6oT8lmA5oaV6T4nN40ZJryjOxUEi5LqzlfmcDuIx+V/458CBuA==
X-Gm-Gg: AY/fxX6hfP5ZGFdgN0dFcwcltECgfPl4fV0QPt5xHSCIRBACiDDSQ+tqXfcgpANhAZe
	9fnbGam0NTIkFLjQslVISUCkhMKNI1KvmMMEKuSBSjvbNQOAf4qIgdBl8xnn1P2BW4HTDCUTN18
	D1/RV3eJiMaVtqAszaT7mAfIQe3ox5DGRpkjgiOYknnwp+cWG5Q9IRm8pC6EirnoeTSBhK1VKCh
	wQMtrCCoeSOEggAvFF/sQP7M+XrV1/Eiba3lrcWMI6CuDC5ZIY0hHrVlwxnQLNTsOGeYn1CN7zO
	T1IepjbX6n6mCAqIgDjTTIFW2D5MJ1U00vXznHZSBbkpLBGY4a2YUF/YC4gNMxM9LYfefvKQ6Tm
	5UjKmuyoy36ClizkJDk/fo9QqwHMqpSbnAkB9FL/pPkIpXa2zfhWkkAFVYOakcaP1/eNeqhjtTN
	R9+bj5dbTsH/0c
X-Google-Smtp-Source: AGHT+IFEZA7vyZ0ao1b1ph7zvhvjOx5pO8dLWGenWSlCMl0fhScK2fp2NqonAO6GMTVcN0krOHmCfA==
X-Received: by 2002:a0c:fbc4:0:b0:797:1a0d:cdd3 with SMTP id 6a1803df08f44-88d82526111mr480719386d6.19.1767458496232;
        Sat, 03 Jan 2026 08:41:36 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::16e7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9aa363e3sm318143286d6.57.2026.01.03.08.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 08:41:35 -0800 (PST)
Date: Sat, 3 Jan 2026 11:41:32 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Huacai Chen <chenhuacai@loongson.cn>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Shengwen Xiao <atzlinux@sina.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] USB: OHCI/UHCI: Add soft dependencies on ehci_hcd
Message-ID: <561129d8-67ff-406c-afe8-73430484bd96@rowland.harvard.edu>
References: <2025123049-cadillac-straggler-d2fb@gregkh>
 <DFBMNYF0U5PK.24YOAUZFZ0ESB@cknow-tech.com>
 <73d472ea-e660-474c-b319-b0e8758406c0@rowland.harvard.edu>
 <CAAhV-H6drj1df3Y4_Z67t4TzJ5n6YiexsEHKTPvi1caNvw5H9A@mail.gmail.com>
 <0c85d288-405f-4aaf-944e-b1d452d0f275@rowland.harvard.edu>
 <CAAhV-H5GdkMg-uzMpDQPGLs+gWNAy6ZOH33VoLqnNyWbRenNDw@mail.gmail.com>
 <34c7edd0-3c0c-4a57-b0ea-71e4cba2ef26@rowland.harvard.edu>
 <CAAhV-H7j=cD9dkaB5bWxNdPtoVR4NUFvFs=n46TaNte1zGqoOA@mail.gmail.com>
 <98e36c6f-f0ee-40d2-be7f-d2ad9f36de07@rowland.harvard.edu>
 <CAAhV-H601B96D9rFrnARho4Lr9A+ah7Cx7eKiPr=epbG17ODHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H601B96D9rFrnARho4Lr9A+ah7Cx7eKiPr=epbG17ODHQ@mail.gmail.com>

On Sat, Jan 03, 2026 at 11:57:47AM +0800, Huacai Chen wrote:
> On Sat, Jan 3, 2026 at 11:33 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> > Since these systems don't use PCI, the question I raised earlier still
> > needs to be answered: How do they route connections between the ports
> > and the two controllers?
> >
> > There may be some exceptions, but for the most part, the code in
> > ehci-hcd was written assuming that only PCI-based controllers will have
> > companions.  If you want to make an exception for loongson-2k0500, you
> > will need to figure out how to get it to work.
> Loongson-2K0500 use EHCI/OHCI with platform bus, while
> Loongson-2K1000/2000 use EHCI/OHCI with PCI bus. They use the same USB
> IP cores, so the route connections are probably the same.

With PCI we know exactly which companion controller each port is 
connected to.  Is that true in your situation?

Or do you have only one companion controller?

For that matter, how many USB ports do these systems have?  Are some of 
them USB-1 only or USB-2 only?

> > Have you tested any of those systems to see how they behave if a USB-1
> > device is already plugged in and running when the ehci-hcd driver gets
> > loaded?

You did not answer this question.

There are other issues involving companion controllers, connected with 
hibernation.  You should take a look at commit 6d19c009cc78 ("USB: 
implement non-tree resume ordering constraints for PCI host 
controllers"), which was later modified by commit 05768918b9a1 ("USB: 
improve port transitions when EHCI starts up") and a few others.

Also, read through the current code in hcd-pci.c (for_each_companion(), 
ehci_pre_add(), ehci_post_add(), non_ehci_add(), ehci_remove(), and 
ehci_wait_for_companions()).  Your non-PCI system will need to implement 
some sort of equivalent to all these things.

Alan Stern

