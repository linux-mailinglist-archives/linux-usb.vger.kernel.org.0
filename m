Return-Path: <linux-usb+bounces-25411-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32572AF5B2A
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 16:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A65C444973
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 14:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E9F307ADA;
	Wed,  2 Jul 2025 14:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="NJbjTOqr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C203074B2
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 14:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466727; cv=none; b=aNfeZ7tYZfKsns6o3q4ZSsBLkl0sylvooRoEyuQ2WhjrrdLzIVZ+ronPM76BVL+fV8EyycJVVVyfTH4vd04C/Qdc7D7tyDkDDKJ66njSuZ5O7Zh5Es32qyPjOadvXW+E/HYh5b/FQDWZzEocInQIzpS82y1Lk2oEtFgIBioJCeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466727; c=relaxed/simple;
	bh=kNyuH7WLAtOiZ59gEXSG0VtJ7ygKLG7MtztYM37F/Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6dF3HAcTMVRI5kycIIeLcpz2b0M+CxK6tSz8u0MoHNBp8HKpCZVDAdh9BgT46gYLcFF5yJ/d6LVdBqpAvb6CqUAi9YzeabTaf0236rfb7WcMpZVKNiOEb6enKg5XbvI7FmOB9etguomi+/6tCX4/i7zt3EYJhdgUE5EJ6WLmtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=NJbjTOqr; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d3dd14a7edso701403085a.2
        for <linux-usb@vger.kernel.org>; Wed, 02 Jul 2025 07:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751466725; x=1752071525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OM0zfei5f0inErN/uNSMXzIQ9/mBfPLCdVqE3t8DrBI=;
        b=NJbjTOqrO2LBrnLz/ogPH0j2fiP+kz/+Wt2SQEMErq+noQPr5Fc1tFmksR5GOfoAWe
         UDKNk1/j2Tfqpt7nAwFHYx+miure6jI+OhPEQJ7fVzxv84TjjxpJu8ipFHAxfBTzTQrg
         OdZwtaZU1yzkFJXlA2OckslJ1BOyI7onM26uV3YzyKytdW8iIXhP9oCdiVWnEF54B813
         jtxqwIt51MmwoRicr2J2HqOWL7xTx5W/gNVHWtOCMpJQnyiizM0NQd2aB/8FEjXpFI44
         UHSMBuxP6eIN5ZZJ4ea3e71TlGyMlXO1q5veoqx5wtGDn0Qhv7HNa9i6fRaeZpa9CDef
         oxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466725; x=1752071525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OM0zfei5f0inErN/uNSMXzIQ9/mBfPLCdVqE3t8DrBI=;
        b=hKEA47lYcVV2dLAymDElRdi4juhQBTYEzg8Bv2zhYkkF9XiDIUdhcUjwlrKV3y042E
         mHuRQeGDJETetyGEhloOh4vy8zqBEUzGnl7wEcwmZW5Wg0ol0xPn+PlJveGzMI2josGL
         vgVBbzkHod48JFdW5Fir03ewr78fYwl59lIBzphxcYWNtUanjKmtWVVuzpbJKWvwnveX
         QOEX8udO4ofkf0lJMNl9/E0MPUcMwgmu9sowl8Np1u9BnrG7oHu3wsjSEqVkwOTNJokA
         y4M6AWx7AY8/xTgoM/dwErHgokBcyFfAOoFKp73BaXP7LxPOMuY0JB8SynuGDl2zq1YO
         BuSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyELQ49uARP9I1E3ByWnMoKi336gtJVZ3PCPlicwIhUcb+pUtw44m6RMjnH98/bjuYCnbV8ZJ7WdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAUJ9BpTG+cFS4zLykEFmz5u4PWFCePbzpkNPuvE7I0Xk0JPjh
	W2eN9DeMQts1Cy1i/wQoozpTHBMBl9gWFiLO8Rak5UNNy6sYCc0dTHOwyXCwgv6OZA==
X-Gm-Gg: ASbGnctkF+H2Y+dA74se3rnlSqqjnVBSjmFiLI4MvDN4wk4WVP0spPj0rHCPID1GHEC
	nnsU3sF2Ug/X18MqL3erQwvvGoRLxkgec0Ew7kI3P4lwj/Zfb3sZE+N4QpZ3jpfZBWswWmiOP/Q
	dG5VGmRXKWZRJNj7bd5bL4FSjsyFlzZ+RHXer8b3HQT2dXgETNeS5sOyPudDDTCc3+FOROiF1FK
	ZazPm2yuLHjCmfA/6C37qE4CUvzgTv/E4tqtNytTpztsV+lmqg0AOrn51qOgEUKtgJUbf7OmmyL
	uinU3Cki07vtEfGUnjCQtn/DhRmRf4cBp0fcVaKWn5OwLPdqgFVPJ5juznuG8+Eg0axFtfC5Obq
	lOVV1
X-Google-Smtp-Source: AGHT+IGUPShe/+yBmwn3/UQ4X2UjDVvrgr8iJo66Gp3M0ocSLCxEcEabV1oGRD+eHhzqQPhNVXK6Ew==
X-Received: by 2002:a05:6214:1c08:b0:6fd:75e1:16c4 with SMTP id 6a1803df08f44-702b1bb187emr42595926d6.20.1751466724441;
        Wed, 02 Jul 2025 07:32:04 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e4fddsm101024496d6.65.2025.07.02.07.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:32:04 -0700 (PDT)
Date: Wed, 2 Jul 2025 10:32:01 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, dafna.hirschfeld@collabora.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <198ddef7-8623-400f-8e2e-ffd6c4bfd2cf@rowland.harvard.edu>
References: <20250702110222.3926355-1-xu.yang_2@nxp.com>
 <20250702110222.3926355-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702110222.3926355-2-xu.yang_2@nxp.com>

On Wed, Jul 02, 2025 at 07:02:20PM +0800, Xu Yang wrote:
> This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> functions to support alloc and free buffer in a dma-noncoherent way.
> 
> To explicit manage the memory ownership for the kernel and device,
> this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> and call it at proper time.  The management requires the user save
> sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v3:
>  - put Return section at the end of description
>  - correct some abbreviations
>  - remove usb_dma_noncoherent_sync_for_cpu() and
>    usb_dma_noncoherent_sync_for_device()
>  - do DMA sync in usb_hcd_map_urb_for_dma() and
>    usb_hcd_unmap_urb_for_dma()
>  - call flush_kernel_vmap_range() for OUT transfers
>    and invalidate_kernel_vmap_range() for IN transfers
> ---
>  drivers/usb/core/hcd.c | 19 ++++++++++
>  drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb.h    | 11 ++++++
>  3 files changed, 110 insertions(+)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index c22de97432a0..e0fa6d6d273b 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -1366,6 +1366,14 @@ void usb_hcd_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
>  				urb->transfer_buffer_length,
>  				dir);
>  
> +	if ((urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP) &&
> +	    urb->sgt) {

Shouldn't this be "else if"?  There aren't any circumstances where a 
driver might want to do two DMA mappings for the same buffer, are there?

> +		dma_sync_sgtable_for_cpu(hcd->self.sysdev, urb->sgt, dir);
> +		if (dir == DMA_FROM_DEVICE)
> +			invalidate_kernel_vmap_range(urb->transfer_buffer,
> +						     urb->transfer_buffer_length);
> +	}
> +

Alan Stern

