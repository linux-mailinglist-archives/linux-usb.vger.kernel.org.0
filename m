Return-Path: <linux-usb+bounces-22125-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F55EA70309
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 15:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33ED616726A
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 13:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15D72571A8;
	Tue, 25 Mar 2025 13:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RWtBZ5fp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564192566DB
	for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 13:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742910850; cv=none; b=c2YkJyVjFVIKKdTQNqrhooO1conmPcYu1k8kGQMG026+ziAKyZvYbFff2ldWUdq+mDYkLyKlmKIAC+o9ndwQXQDDOHEj/1ylr00U2ICjqu9BJc91rDo+Ps0d3SJDZaI4IdQxUOFrC3UbZ9/6ZQxqa4zwcLv2g0QVZMslnxbXIGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742910850; c=relaxed/simple;
	bh=piMudt0azqm4x04liAujtwd/WJBgQTXcbKpgXZkf+Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ryKqbxLy9H3NA/2HnPsgk+Lu4Y1+NOz0kcLtODfDQtes8NX48Is44WphmFytmyoKPSBqQ7G520gRsil10tManP07jfT3mGe3OfmbLI2dbd3CtdZqzI7o8fuAzgTovMFORVbgy0bUGPdUksqt5bq8f8vKSPP54P6ljl0cCRdPMlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RWtBZ5fp; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-391324ef4a0so638758f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 06:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742910846; x=1743515646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gwwg+GnTHbGXDmEmCUDRFdBM6BT3+2rym1XD/Z/nfe0=;
        b=RWtBZ5fp1TASFgjUqRbAlKmy0RO5oyAK94rd6gK60s32aqPMmlPaP2h8Ahme16BbNO
         cWLCWXfIigTVRwe6yb2MTN8rQbX9drFmGWNWLqbfuD205Iaej3/1e+c7F0+7hu65iprx
         qZ6fxjNjMAnIWaObip9Bkln0lfQxvt3gM+5pLZS2M7lXSdrDmTIJFbbb7pVurujx4vgj
         KQ/kkvjCK+SEHeOxthDpRVw0nDj4qe/lrGL9Sd6QHaNpZM3Ao+xxLyJ0eWg2l2+eXzVj
         qw+Pj8H9aE9QI2cbmqpcABywmZFQkiMcQS8CI5cLdI6noUjRDFcEytjEryi+9vpeQcla
         u7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742910846; x=1743515646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gwwg+GnTHbGXDmEmCUDRFdBM6BT3+2rym1XD/Z/nfe0=;
        b=eUiORESLoQ/qaDl0w7vw2LDLLPI0Bvqdcrz33gh0QvJCn6L2LITR+Zxe8aHtyAzC5I
         4oRFA43gXNzN9XeQ7XmtjlXeRrhZ1VTLJ43yYayr6AOIxHWfT5rnNyqoXUp7WJ2FgT+H
         rcwLmIF26fcSaI9W/1M0i+2zIVz3GsueX3eNUkYTVEErqUpjB2zKc65RT5iS7yU+jcZj
         ER9NAHBctXE0Yy8CFBUOAIPVvUsHA8ec+sJLB++cYs36k12VV4ReMNrnR40dvRQFIfk+
         WMNhIVzoE/CkUqP2JnJ2EYENxcuMLc3UTzGMW8b85opxKSLy/4t7VA5TyG6jH5jzOnFC
         UOxg==
X-Forwarded-Encrypted: i=1; AJvYcCVuAhCSvevk2542fjWnFaZ+wqEGgeR/jj32qX75plsOfv52qPfVJmjAJpwLLfkuSraDqVndlWXPpaA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7+BHPeazOBVGPCH/uOWARwJv7G1ZJvhnpqXDvLMX9UvdanBxL
	hh3jtC5+2G/bt5z6xqYTW35q4KlTnonp7R3lOb0dXRa5ckN0WjNIkXbmEwhR8GI=
X-Gm-Gg: ASbGncstGPJO3fPACqxlHuSoxNJ7gaZuIeDuiQEzk7c1/8cYAmUO6FJjOPxqCRgRTXG
	Rh5YGFgYtx4uVmCl/EhkPpf4O+2KNB1CTvURyRiPDUC8J6ILga/MHb+iUxMUgYJNJh5xkf7TpiA
	K9clq3WNbBR/JAQQCo+hXG1Kkwt9efu6KqWV6gxzYAvy8YeE37gWhmPOG0WAfGF6xNY39eO9oU/
	qPAT09ncFP+x95RHzSX0iVGc/NEKX6hFTHq8Mdn4xLm5cU63ZNNRmudTZrqPG/UQ6euGHvIGMPE
	XDyMJKK3w8e0WonyZVcduEs/dgLwBNN+Olan5awNM+AVpMcGShM=
X-Google-Smtp-Source: AGHT+IG3p7acf51XkkQT4qtWtsUVZ7Jau+hrvi4qbugWjJ931joBN8pZ3ZeshcCMXoKYMYVjwjjMZQ==
X-Received: by 2002:a05:6000:1f87:b0:38d:d371:e03d with SMTP id ffacd0b85a97d-39ac7fcf2f4mr1050264f8f.3.1742910846459;
        Tue, 25 Mar 2025 06:54:06 -0700 (PDT)
Received: from mordecai.tesarici.cz ([99.209.85.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4771d51fec4sm59794251cf.52.2025.03.25.06.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 06:54:06 -0700 (PDT)
Date: Tue, 25 Mar 2025 14:54:01 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: warn if a GFP zone flag is passed to
 hcd_buffer_alloc()
Message-ID: <20250325145401.0562b2f6@mordecai.tesarici.cz>
In-Reply-To: <20250325134000.575794-1-ptesarik@suse.com>
References: <20250320154733.392410-1-ptesarik@suse.com>
	<20250325134000.575794-1-ptesarik@suse.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Mar 2025 14:40:00 +0100
Petr Tesarik <ptesarik@suse.com> wrote:

> Remove a misleading comment and issue a warning if a zone modifier is
> specified when allocating a hcd buffer.
> 
> There is no valid use case for a GFP zone modifier in hcd_buffer_alloc():
> - PIO mode can use any kernel-addressable memory
> - dma_alloc_coherent() ignores memory zone bits
> 
> This function is called by usb_alloc_coherent() and indirectly by
> usb_submit_urb(). Despite the comment, no in-tree users currently pass
> GFP_DMA.

Let me provide a bit of background on this patch. My actual goal is to
remove the DMA zone; I'm now going through core code and removing
GFP_DMA references that somehow look incorrect to me.

I hope this preparation makes it easier to review the removal of
GFP_DMA later.

Petr T

> Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> ---
>  drivers/usb/core/buffer.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/core/buffer.c b/drivers/usb/core/buffer.c
> index 87230869e1fa..10844cd42e66 100644
> --- a/drivers/usb/core/buffer.c
> +++ b/drivers/usb/core/buffer.c
> @@ -108,10 +108,6 @@ void hcd_buffer_destroy(struct usb_hcd *hcd)
>  }
>  
>  
> -/* sometimes alloc/free could use kmalloc with GFP_DMA, for
> - * better sharing and to leverage mm/slab.c intelligence.
> - */
> -
>  void *hcd_buffer_alloc(
>  	struct usb_bus		*bus,
>  	size_t			size,
> @@ -128,6 +124,12 @@ void *hcd_buffer_alloc(
>  	if (hcd->localmem_pool)
>  		return gen_pool_dma_alloc(hcd->localmem_pool, size, dma);
>  
> +	/*
> +	 * Zone modifiers are ignored by DMA API, and PIO should always use
> +	 * GFP_KERNEL.
> +	 */
> +	WARN_ON_ONCE(mem_flags & GFP_ZONEMASK);
> +
>  	/* some USB hosts just use PIO */
>  	if (!hcd_uses_dma(hcd)) {
>  		*dma = ~(dma_addr_t) 0;


