Return-Path: <linux-usb+bounces-25172-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8261AEB9CC
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 16:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B1E77AE1BC
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 14:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610A92E3361;
	Fri, 27 Jun 2025 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ILV3+GMU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446D42E2F00
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034224; cv=none; b=PHZ1Z7LEq4eBhnGlMcLfXU3gybHmr14WJ7oNNhnCJA/7cjyEq8lk2YaxEmacEKRPb89sk+B02ys5I1gEVY8EB2U/QIwiplfbMB6BFA5vUFhDCylvae3aCLlVDzdJKCxurmH4CvZ3ZLGuWxySSLOW3DTdeSg7xFBe0ZI7JrXNDTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034224; c=relaxed/simple;
	bh=QXCsL7vS7mFvhzNXf8DjS7hrvdMO+odeJz0t39ie72o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CCPVK81N6ibs0GMYwmyEpqoqgaRDgKr2Jp4xzcs5ZqjAX7T3FcOntxjE7tEUxYDz99ORYP0Lp5SouCGwo4AVuzP2QXc4IEDfGdi9hSTAiTEp/qjKKav8ZaS1NyebXaFFACYRRlU0+dskDRWmfdLO7ewG+uJYLkZU9UedkeQiDfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ILV3+GMU; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fd0a3cd326so27600786d6.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 07:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751034221; x=1751639021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A9NXmX4vbwGCbqn6D1k17tKEXOD0obRo+KVbdSlDBXM=;
        b=ILV3+GMU/ereFfjCZMFyOF9hl7nAAjs8oNGioqUir6XNotgStel0R8eR31yyG8kUV9
         wF8JIga6vMiGsjXcFgi7/iK47QbRDZkoTABY+VVXfaai8vu4ISvW19hLjreboUe2uKe1
         Mo2klwGWXwR8TXizZSg/F5JfbAZt2IzusSGvPsfCwAeB1ymk5hujKKP5Yz+su2RnZZem
         EDcAzOBT2uYa+YgXfkWMa1q9AJ8Mx4v6336m6SdRqvSP92/VEoTwYKtwW/ifBGPLPpyn
         kHjLrv19fTlWCVFpGzl646w52VfkIWWXuGZ72Sq4TfTDzqpjm5PkuqSQQAgV3ya7vRRb
         sxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034221; x=1751639021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9NXmX4vbwGCbqn6D1k17tKEXOD0obRo+KVbdSlDBXM=;
        b=OlkukOcB6m/NGBxqMoFSIjXI3WqU84/rYsZrE4FD2mYS8JEsbueg04Bt3srvMQ2mWp
         WL+iaggGcxGX0ZrCaCx/MKeRNavETzaTL5oFLQSTlN6jKLqvFw9LqH5IsGD5hxrV+md8
         yFVWyHvcdur8WsxeqZxJiF/yJFoedFQWwNdhkgbV+iWh8HOY0EQe+nPeP0uTMawpj096
         gaZ7AXgThsr+aKmz+uRe2CYRBaQJu8SNC0KqMpEh9wK4kF9VyhvSrK5Ird/iiMRIfG2t
         Zs+m837ZomyT6jwOfV4MhvoQrp+2w41y/kO4evIzSMJgiBQTpt5Euw4VD+iJQmSnyRdr
         klWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJr40WHsuFSbS5ZIS294dFjFbMq53/PvI8YdqV6cohnQR8/XMQDdMQQUl7uzOMP3pvr+jzMJ5+5Ts=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8xJOfp4eji2Kb8LETLuSRn6761vRzT8YzaInmTy+1zmiBnhqS
	1nqNzK8o2NcCA8d5SCqYin0b/Jq8C29G04dMcHe99EDfMKgM9Z9On1bE5zWkszEPPQ==
X-Gm-Gg: ASbGncu4OToRbdn+icFGgixcuZzpwtamP5nLQLSJz7D06kowK+S9eetgXYHo5k7vUOX
	Z7SxAGlqK5kmCIc7gPEOKUChRwFi4tijqOE8Wa9oe34frebogcgd/5eAJB+CDNgQFResBfRDGLg
	psuvK/HvUCYVWTbgHSy5BAJWO9HeTYtEMucaoEnRkb5jfdaNaTkKAAoOvJ8Co1JOk34ZsPqd9q5
	Qp6UqVtvReq8kXwAeZ0xSmxAtf5zWogs6gq5Bd1AMYg/Znd5AtevxtGaL0C7EerIg+yyooChCoA
	lm1fMmLmxj6g3/jMkLdlo1HoHnTIt9HppBigAwXkUZ5hUbGUIiE4Fi3a8h88KEuiMl2bb59kRI4
	Y5Mqk
X-Google-Smtp-Source: AGHT+IGuzlQ4coveIb3aJO1JXLxRiAQiyFnfLoJRnxBPJ+E7GV+Z/ZfFSQcDG+29Z/ZESK2AT9OPdg==
X-Received: by 2002:a05:6214:2468:b0:6fa:c5be:dad6 with SMTP id 6a1803df08f44-6ffed7a55fdmr51444156d6.6.1751034219846;
        Fri, 27 Jun 2025 07:23:39 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44313926asm137703185a.22.2025.06.27.07.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:39 -0700 (PDT)
Date: Fri, 27 Jun 2025 10:23:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com>
 <20250627101939.3649295-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627101939.3649295-2-xu.yang_2@nxp.com>

On Fri, Jun 27, 2025 at 06:19:37PM +0800, Xu Yang wrote:
> This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> functions to support alloc and free buffer in a dma-noncoherent way.
> 
> To explicit manage the memory ownership for the kernel and device,
> this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> and call it at proper time.  The management requires the user save
> sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/core/hcd.c | 30 ++++++++++++++++
>  drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb.h    |  9 +++++
>  3 files changed, 119 insertions(+)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index c22de97432a0..5fa00d32afb8 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -1496,6 +1496,34 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
>  }
>  EXPORT_SYMBOL_GPL(usb_hcd_map_urb_for_dma);
>  
> +static void usb_dma_noncoherent_sync_for_cpu(struct usb_hcd *hcd,
> +					     struct urb *urb)
> +{
> +	enum dma_data_direction dir;
> +
> +	if (!urb->sgt)
> +		return;
> +
> +	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;

Are the following operations really necessary if the direction is OUT?  
There are no bidirectional URBs, and an OUT transfer never modifies the 
contents of the transfer buffer so the buffer contents will be the same 
after the URB completes as they were when the URB was submitted.

> +	invalidate_kernel_vmap_range(urb->transfer_buffer,
> +				     urb->transfer_buffer_length);
> +	dma_sync_sgtable_for_cpu(hcd->self.sysdev, urb->sgt, dir);
> +}

This entire routine should be inserted at the appropriate place in 
usb_hcd_unmap_urb_for_dma() instead of being standalone.

> +static void usb_dma_noncoherent_sync_for_device(struct usb_hcd *hcd,
> +						struct urb *urb)
> +{
> +	enum dma_data_direction dir;
> +
> +	if (!urb->sgt)
> +		return;
> +
> +	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> +	flush_kernel_vmap_range(urb->transfer_buffer,
> +				urb->transfer_buffer_length);
> +	dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
> +}

Likewise, this code belongs inside usb_hcd_map_urb_for_dma().

Also, the material that this routine replaces in the uvc and stk1160 
drivers do not call flush_kernel_vmap_range().  Why did you add that 
here?  Was this omission a bug in those drivers?

Alan Stern

