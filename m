Return-Path: <linux-usb+bounces-25452-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7C4AF77A8
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 16:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BF49188B35E
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 14:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A882ED86C;
	Thu,  3 Jul 2025 14:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="pclih5rz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACBD2ED143
	for <linux-usb@vger.kernel.org>; Thu,  3 Jul 2025 14:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751553330; cv=none; b=J1Oxcd62aOnCVgwiOHL+EAf4mJ7Gv7pcHyayPQE4XdVjA5EHW+Y9+3noPoohiLRFUVZI7PR8D3AOktaFX9MdeEfsEWjeBaNONq46stTv4TBfOvWwiqN7m5rQ9jggFTMjD0W7qSLOqxmkQGZww7eEyxqJAKOfbvsXUd805mO0Lc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751553330; c=relaxed/simple;
	bh=Y+evtO57jDRO4cx5S0JrB8XOjRXeEqoQzMPAkDgXmEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIWwBjj0CMAnkcsYk5enedxQztw3Wr4NP/0v4q/Eg2Ak1KOhGhVKPI+wfDqrUIHeXu/o47zsEwUa++e4hnHn7/0jjyXfkLkK1KlfmBgzM/HiqmVLJkXzHVrkCqDk0Zx5lSG8gG1tTfwTzeAivumMEmvqkyGxRbZRypR1rbBZWQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=pclih5rz; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a76ea97cefso55616761cf.2
        for <linux-usb@vger.kernel.org>; Thu, 03 Jul 2025 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751553327; x=1752158127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kgzlPHtDsUP2XFZstpiCKw99h73zAxNOOZoeiHHd4NQ=;
        b=pclih5rzHDdfqMD/KrXoFwPkIBGUj9xUYM5F8R7j4cC3phkLt2ukipGvuyAHeUpsG8
         c+uaWfNpsCrtWPF2gSuo9waMbS0NVPAjWp6Z1Mv+FtJi/lgfR0kZsWer3nPwgTGxNvUR
         RUl2jc/E6W4lrtQ0JnT6FQyDI7frX2fcvtSJA9Z9AxeBnyeXx7M9LPszNL913yNURMVw
         ZM69rZn4zOxX6cDDtSFlMMAq+1U89HB7UrSs0nQ7qSIQfxsa2au/vcZJva7Gb+7lEugM
         Eg8Uug3rPhe87BQ2BUH8O0lYMn6dsQ/C9Bgh5/r+dQfDg4aww+wxgOgGrwzJMVqD1Kan
         Lhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751553327; x=1752158127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgzlPHtDsUP2XFZstpiCKw99h73zAxNOOZoeiHHd4NQ=;
        b=txJ/s/eggF39XfPle5cvEp1GWx82wc4ekaYrBH0nl5NoUzFQrOdEkh3AbwrmVwXjmD
         6j7g1CotGF/RjVF7DDXDsXkdBDcteuK5fCXTTo35ENKQXS/aAFkuTXQExbVzvDDPVhn4
         1jhN1Qsx/dMoILKkeiuBlIZU7UqNh1NghRQIuZgwxRfDmT7q3WhtXrmX2fsAQTqF52T9
         V4QrLCBDwnD2VEmkGatH1Z1KPtKUaIovBkOmeqDZiqwBzhqPc18TSbhPg6thOdbXbdFb
         QQ6rAGX85OgxVlQIJZVsGuYD7vFIXAioK6nwnZkRAeoL7eGRnDRbbwuu0M+B9EENbzZZ
         pCKA==
X-Forwarded-Encrypted: i=1; AJvYcCVvpeLB2bCZpj0jWcFy+27Z/WsORnIlgyuYV/ONjyrYAWUp0NSzgnZ0zyNtlwOXLeztCDRwVQNMk7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMXV6xA8Oe2lB1xEprgx3HILV1Kn0IDZDxLEbedvmSMXxrOLbp
	AYmUapDWcZxn5N6GJPY2RJ/ZrkXQJvloyypWLYNzyT7UeLTnoOZomUmhHuJ5UHROMQ==
X-Gm-Gg: ASbGncvx2OD3lN4lzMwUJq0lKJSPmohDulfQL1n0ch5fRLW/uhzQFYZgvCIluVYrY+g
	2yFO5bz1DX9H/cpP6ozTBJjN4hgaTrHh0T9hbm4INS5oIpe8Vn96NX+QOHHhMv5cYO+11eblC7P
	GHBCy1rmRDBYBRETib48DVNFyrzv3irU5JCiRiaIq63yMuawjAIU88CLA5j3buwjGrsY0F71FPP
	8xmTbHhvwlkMr46gJ+RpvdtohmhCytjOI3Af54QtXZGE7n/rDk76nuHgAtaJNgRforWXOs3IN2U
	6oHd34/12VWkN6BBb/O0kan28IT5x8JLXJRGUl+RXMImUfYjSZ1sU9ou40O2BEq0URZ9XjoBT4K
	Anu+q
X-Google-Smtp-Source: AGHT+IGK8KAo4mpA+JVTB3ZTXwVBkpsgEauagc0TG5bpf3JShjIVuuf8H4Nd2foOv6ZumStKh0znCw==
X-Received: by 2002:a05:622a:5143:b0:4a4:2f42:a668 with SMTP id d75a77b69052e-4a9769765b0mr144026911cf.31.1751553326431;
        Thu, 03 Jul 2025 07:35:26 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc55d92esm109947251cf.49.2025.07.03.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:35:25 -0700 (PDT)
Date: Thu, 3 Jul 2025 10:35:23 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v4 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <30f04c8e-5074-4262-bf5a-da022b89c276@rowland.harvard.edu>
References: <20250703103811.4048542-1-xu.yang_2@nxp.com>
 <20250703103811.4048542-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703103811.4048542-2-xu.yang_2@nxp.com>

On Thu, Jul 03, 2025 at 06:38:09PM +0800, Xu Yang wrote:
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
> Changes in v4:
>  - improve if-else logic
> 
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
>  drivers/usb/core/hcd.c | 33 ++++++++++++-----
>  drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb.h    | 11 ++++++
>  3 files changed, 116 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index c22de97432a0..42d9d8db0968 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c

> @@ -1425,8 +1431,10 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
>  	}
>  
>  	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> -	if (urb->transfer_buffer_length != 0
> -	    && !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
> +	if (!(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
> +		if (!urb->transfer_buffer_length)
> +			return ret;
> +
>  		if (hcd->localmem_pool) {
>  			ret = hcd_alloc_coherent(
>  					urb->dev->bus, mem_flags,
> @@ -1491,7 +1499,16 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
>  		if (ret && (urb->transfer_flags & (URB_SETUP_MAP_SINGLE |
>  				URB_SETUP_MAP_LOCAL)))
>  			usb_hcd_unmap_urb_for_dma(hcd, urb);
> +	} else {
> +		if (!urb->sgt)
> +			return ret;
> +
> +		if (dir == DMA_TO_DEVICE)
> +			flush_kernel_vmap_range(urb->transfer_buffer,
> +						urb->transfer_buffer_length);
> +		dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
>  	}

This could be done a little more cleanly.  It's always awkward to read
an "else" clause for a negated test.

Instead, change the "else" to:

	if (urb->transfer_flags & URB_NO_TRANFER_DMA_MAP) {

and move this whole section to the top of the big "if".  Then you can 
change the test that's already there to:

	} else if (urb->transfer_buffer_length != 0) {

Alan Stern

