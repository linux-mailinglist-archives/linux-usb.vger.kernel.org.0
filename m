Return-Path: <linux-usb+bounces-28103-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE34B57634
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 12:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF6DB3B0581
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 10:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8443E2FABEB;
	Mon, 15 Sep 2025 10:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="botmyi0N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D37A27FD7C
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 10:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757931805; cv=none; b=nlb1BiK0IPEzhIw/qtgq3XoybZD20SaPfda+WtZIyYtVSztwZQxtHH/Y3+kI2oZjfg8BqYyk9pYJTEunONWuMLVYkW6Vmr9R1e1tarD90nbyZae+zCP9ZOoknS2kLrKNZWAVkCpj3mBpO7AiyFCsX3evU8CVj3I+4bqISgt9u3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757931805; c=relaxed/simple;
	bh=ur/K9TtfffwrR7sHCiTVJoJ7+z39IyxUWekyIY/UPFs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cNjHANM0NH1yMw3GgtY8hkfPDBq6DqGlMCT6KA0/i5QRvCTaaLX/lZoKcvbWG7pZCWc2MZ7Qj0twU3rmLAek00o9Df5Z2w9qQ6kYWP+1uRkktwZ+Rq8e1V+ExEEKzkAC3XZHUk3UEiDFWu6542OsbyTVWgwY21cGrJNe+N9q400=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=botmyi0N; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55f7b6e4145so4298226e87.1
        for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 03:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757931801; x=1758536601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmM2hVkikpNkBRcotg2//831+pqHu7WSLB1HO5t/M9M=;
        b=botmyi0NcR5/Qs7BKPOQ01bKZ2Ya0IwOuBklzRwY45RcKG0z6GuaS+Yh60SMUwupQ1
         tIge1MZbtl96AR7q69rSG9LjHmJOX8AvWherxXRpV9mQlXbLPPo9OVCNfsOhguWb61z5
         STZmKPGqyoQGS4E9xzNXMVlBGzVc/orlatB8rvzvqeQBgqpHw+BVtB4s4JI0z1y/+XbZ
         /88e0dA+qoKhnSUqlNybmMEckpWD4mXcPYehmx2X9Z0us0fAbVxfRFq2fk1F4MHBE+66
         iMsyG1s64G3ZU95jgA9oegw1KQKKFX2O9V3gfNp/4KFBssDXhMbcQvwcYzuKvuY4R2KX
         ukzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757931801; x=1758536601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmM2hVkikpNkBRcotg2//831+pqHu7WSLB1HO5t/M9M=;
        b=MG5gj8vAlqVTt5ysf4NjuSlFWwgCXnIy16lQ63QKpbr875PlYcMehvOs6khT5q2+qg
         uVSGyUiSPU+m2UtV3YzZNbHMekVKlMKmUX5K91iyllVG66HRhU+BC8UiHHXmLFBf5GvP
         mC8yTzTnbMEgewqwy6OdiiJSR1hhOR4hYWn5lJMb8dB1+VkhqCkURI9RdGj4wG8cVlTT
         2UmPA9gk1Py2vFVVaxVCandL/NB9ogdErJzMesMELuVIFJ0z5vNVdQjz+aPXSH3cnNQa
         AF6MvCmYDN1JBwUBtm3whI5JEK+OgEEEXrDS/wL6+Qu910LdZnfDskmGoIDrFynbZHGj
         o7mg==
X-Forwarded-Encrypted: i=1; AJvYcCUzRrbnoMzxse76LXzKBr7Oh7ioIgDH4Fbnf0F06VXoawj0l5h4sGHJRb0k+V5Cve/Q0+Zlxg6mPRo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx72HRjmPgwMAVDvjoh/wg6w4pndmie4A0JZs7wtBPL2/srb0i9
	7nDS9ivWiaYs4YrE7jFpX4Pa+bgh6DVxr/fKgYjthRY6hqdwGqx8r2Zn
X-Gm-Gg: ASbGncvv5BAHcVLNlL9sgYyaDnXozesQo6x2gOU/LaHDA4TawWGywevhF7dF8NqD+zy
	bJFH5/6RZZ97Yz0UboWGSvyGZa2geCR47SENvqzSEJgb0dz0qQTjeoH6qIUnFf3ltCTRYotL+jC
	zaVXQrAupgDn1gMGpgPmMmtwYpNY13wpvqHeGscKvKzeFOuuUs7DAM5Rjg8mM/2OLW49pFiJbV3
	F2D39jCnzd8jte+cgKn/H0IBrUy0NRAmDfVim9wEn6p3gU7ADhqka5VPOxvwQgFVIvUvo+43dk7
	WQ1o5aulTlVmYQYiNPlLSOeoGFAiQBCh9MfTxL5fj2l6PgsZAEy72Lgl2MjtLkJ+xKAc0kjQRNS
	zJXnNgKVBEWw8f9o6Jo3R/gz+RC44krRbhz81c3J3OqCu4X7TIA==
X-Google-Smtp-Source: AGHT+IGDxKN2inSLVZgWg0IKGOGe28+xUzS1nWUgf3sreZyV7ieJD9bN/87uVQRJEgBm6L1z69BHOg==
X-Received: by 2002:a05:6512:2513:b0:563:2efc:dea7 with SMTP id 2adb3069b0e04-5704d006ed9mr3804093e87.34.1757931800971;
        Mon, 15 Sep 2025 03:23:20 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63daesm3422597e87.77.2025.09.15.03.23.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 15 Sep 2025 03:23:20 -0700 (PDT)
Date: Mon, 15 Sep 2025 12:22:51 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/7] usb: xhci: use '%pad' specifier for DMA address
 printing
Message-ID: <20250915122251.333b4db4.michal.pecio@gmail.com>
In-Reply-To: <aMe-QcrnE5hMHC5E@smile.fi.intel.com>
References: <20250909115949.610922a3.michal.pecio@gmail.com>
	<aMAPkH5-4rLdmx_9@smile.fi.intel.com>
	<20250909224416.691e47c9.michal.pecio@gmail.com>
	<20250910075630.0389536f.michal.pecio@gmail.com>
	<aMJ9PbOxn3CCuaYJ@smile.fi.intel.com>
	<20250911113451.1f5e5ca4.michal.pecio@gmail.com>
	<aMMtgsAa-dovMqdG@smile.fi.intel.com>
	<20250912114644.7b9bfe37.michal.pecio@gmail.com>
	<aMRgL4fus--v4QjP@smile.fi.intel.com>
	<20250913101246.515abfc4.michal.pecio@gmail.com>
	<aMe-QcrnE5hMHC5E@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 15 Sep 2025 10:20:33 +0300, Andy Shevchenko wrote:
> > > No, it's other way around, we should not put explicit casts in
> > > printf() in C as there are plenty of the format specifiers that
> > > allows us to be sure that the printed value is correct
> > > independently on architecture, endianess, etc.  
> > 
> > At least if you do it, the compiler will also do the right thing:
> > - if the cast doesn't match the format, warn (xhci needs a patch)
> 
> Of course this doesn't work properly on the types that are less than
> int. So, this is fragile argument to support explicit castings.

The issue is how to print u64 and dma_addr_t, and the suggestion is
to stay with ("%08llx", (u64)addr) for both. What should go wrong?

1. 'addr' is transparently widened if necessary
2. if 'addr' type changes later, nothing happens
3. missing cast is a build error on common platforms (needs patch)
4. wrong format (%lx, %d, %pad, %p) is a build error

With %pad used for dma_addr_t:

1. different formats must be written manually
2a. u64 to dma_addr_t: manual edit
2b. dma_addr_t to u64: manual edit or it's a silent bug, invisible
    to compilers, invisible on 64 bit platforms used by developers

That's for type safety. And further:

5. rvalues work without proliferation of temp variables
6. same number looks same, whether stored as u64 or dma_addr_t
7. consistency with the rest of the kernel

Seriously, *lots* of drivers and even the PCI subsystem itself print
addresses unpadded, using %llx or similar formats. The numbers have
8 digits on a PC (even 64 bit) and grow to 12 or more elsewhere.

It's first time I see somebody who appears really bothered by this.

> > Reminder: this drivers handles DMAs as u64 too, so it will *never*
> > print all DMAs as %pad. And if it tries, it will be a silent bug.  
> 
> Yes, and the problem here is not in the printf() specifiers, the
> problem is in the (used) data types.

And what else can be done? The driver uses dma_addr_t where applicable
for efficiency on 32 bits, the HW uses 64 bits like 'buffer' below:

struct xhci_transfer_event {
        /* 64-bit buffer address, or immediate data */
        __le64  buffer;
        __le32  transfer_len;
        /* This field is interpreted differently based on the type of TRB */
        __le32  flags;     
};

Same address may be logged at various stages of the flow where it
exists in variabes of different type. The number matters, not type.

Regards,
Michal

