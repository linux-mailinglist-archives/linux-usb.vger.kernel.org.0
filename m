Return-Path: <linux-usb+bounces-27342-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B74B7B39687
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 10:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8615818919E5
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 08:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8070C2EB84A;
	Thu, 28 Aug 2025 08:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZ66cyhg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032E1EEBB
	for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 08:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756368735; cv=none; b=f4iCVFGQ4TcuPD+29ZbYUzx3x7L4DqyQ2BCSAhaAZtD10/6YKZHP1hxH8JD2FqVuP7umwQ1l7aJ8oFJuCEX7PUUZrF9lom9QvDk/wygPiXlzjQCb1jrTzL9kz6kw9aE45v1tVLgc6QbWB23ApV0VyZ8jpd9so84hFML6VMjU/kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756368735; c=relaxed/simple;
	bh=VCcb8F3zKIgGbKeDLZVbYUXqoniNXT8tdk51m52ihJA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UOqRgHo3TtBTEK9cu2J930jp+xcqTgL0YeMQxaHHsLbqyBxntDUP/YRwXqp+SKnjOtCiksjWMlP9u/p3xYEI8u0uS7g0oGsBzOHYKeymPyzHG+2cNiMJqrDTO+tNThNCV04kvdENOOscpmBEv5ijbi5beKhRwUiwhZo9/QBXICw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZ66cyhg; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55f3dcb2b9fso1678731e87.1
        for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 01:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756368732; x=1756973532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeMIoSdoQfc1vhEDMnsKyVmYXKqy3au5ogTkptCCCc4=;
        b=DZ66cyhgLAKQthFPcL6OnF+fNTzZ26lpT+4DYdiAr7zz7+reRpVotHkZv5KWFa8Is+
         SPANJGmzDvToQHVHJ5DTfbGaJIZ2BAYbW0sGLOMmYcDFJvSsJ1V38PQO1yNEXztzv3JO
         DTdX+Y4le/oVpoWAcS3qYwWABqg3F3o7Q76SGA2qta7atpRIFQp8lLI92KWq9IEXznsW
         /A8NRYS2IzVKWaGNH1IckLMdZd4nVgWuNjcep7qoNjAMWGQu9L+kZknUVumaOar+7q41
         fn3qWDWMH3ZkSMDQbRrfC5c+lORwm4khv2SudHs2iwtWe/f2dlegzAaXJKHhR7Ftrag1
         xdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756368732; x=1756973532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeMIoSdoQfc1vhEDMnsKyVmYXKqy3au5ogTkptCCCc4=;
        b=FxZSEztpKCgnKUl5q5zDQz8+Nszx3VoXFvhpq8X+SQG9ZE8b2EEoKrgXkny18JAr00
         GuiM2s0NHP+XViT46fxRiSgvozus90K3wOayF+sLXcNhD9yOyFlMcEKPz8o/YuePpCQn
         xClSa+TNpga91Qookgj0frwCdowwe6HISjPZ1dq3km/fUAPSsJcMQy+GRT2eomR/1Dxv
         jJeHr7fSBaBzcHra2AItqdoEoAaTDT764Pf5AyEg+v7e2kk5jpJF/DuDUYGGp/YdsVr0
         Qglx8VMuuk6g7Hi/S2QFUR19b7T+/ArO+5BqDF1ErH43JxZHO7B5kMAoEHhUgt3gy2+v
         tnYw==
X-Forwarded-Encrypted: i=1; AJvYcCWLSrMrdv7MCtwSuXt8PgQVgd7yHha6YbgGGEAmTF7JQtvmYCoSIPIAsnS91JW1fKn9M1lz8F/vhOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrZl4+SYGwKGfGTpOHZHCf0xXvc92qMB3aa1np60Ybbp1fpOFd
	Rq55VFWfui1IHDpL9qXL8eikDycVwB7h3jwfC3aMNvuC5WmTXDf2uXWXhs+zJw==
X-Gm-Gg: ASbGncu7KdJmY/gYHnQyWOHMoeuGpwkQddEtJO/6Bo0Phk2+uhIHJBivO5rW+FfDVEL
	Aa7a86I9GeIUfEdeS1l2Yn1oqmYCExE9zvQbKaZoqLVq/cIRnRNGDzZV9+zbAY1jnwobn4XZv0e
	VX7xhaO+ChLb2DWqu5Oc06zy2l7Rv0s+flzltFiMyXY/umtXxx3DtTC8HOArqat+f+n8K+31Cys
	iQ/PeHZlT+h7z0pPqiined4fLvARVny21+9EP2S37OR1JqRnpdgB1ZJJHfv24azA6sVTTyvJfHt
	enAIMtXPvklBYbbbkpXDJBBip8MXcaW+wGeoIFH8+xkDxFFX+ZipRxFHXiVZrWRiG1Pz23M0uAu
	8eY8c2pHBbmm3mshCPQK3rRI+PdeKZhz5SVmbXoMeHvVQyw==
X-Google-Smtp-Source: AGHT+IHVcS+ZuaZSk6IAjdzD4KERU8XKniYC5zNH9BkaOqQoj13aM77+P9sZJqtKaP1xXOOjjd224w==
X-Received: by 2002:a05:6512:3f6:b0:55f:5621:3dae with SMTP id 2adb3069b0e04-55f56213fb0mr1138087e87.15.1756368731651;
        Thu, 28 Aug 2025 01:12:11 -0700 (PDT)
Received: from foxbook (bhd106.neoplus.adsl.tpnet.pl. [83.28.93.106])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c98c30sm3212233e87.105.2025.08.28.01.12.10
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 28 Aug 2025 01:12:11 -0700 (PDT)
Date: Thu, 28 Aug 2025 10:12:07 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: xhci: improve TR Dequeue Pointer mask
Message-ID: <20250828101207.49aea3b5.michal.pecio@gmail.com>
In-Reply-To: <20250826130656.277633-1-niklas.neronin@linux.intel.com>
References: <20250826130656.277633-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 26 Aug 2025 15:06:56 +0200, Niklas Neronin wrote:
> Address the naming and usage of the TR Dequeue Pointer mask in the xhci
> driver. The Endpoint Context Field at offset 0x08 is defined as follows:
>  Bit 0		Dequeue Cycle State (DCS)
>  Bits 3:1	RsvdZ (Reserved and Zero)
>  Bits 63:4	TR Dequeue Pointer
> 
> When extracting the TR Dequeue Pointer for an Endpoint without Streams,
> in xhci_handle_cmd_set_deq(), the inverted Dequeue Cycle State mask
> (~EP_CTX_CYCLE_MASK) is used, inadvertently including the Reserved bits.
> Although bits 3:1 are typically zero, using the incorrect mask could cause
> issues.
> 
> The existing mask, named "SCTX_DEQ_MASK," is misleading because "SCTX"
> implies exclusivity to Stream Contexts, whereas the TR Dequeue Pointer is
> applicable to both Stream and non-Stream Contexts.
> 
> Rename the mask to "TR_DEQ_PTR_MASK", utilize GENMASK_ULL() macro and use
> the mask when handling the TR Dequeue Pointer field.
> 
> Function xhci_get_hw_deq() returns the Endpoint Context Field 0x08, either
> directly from the Endpoint context or a Stream.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
> v2:
> * Rebased on top of 6.16.
> * Combined all 3 patches from v1 into one patch.
> 
>  drivers/usb/host/xhci-ring.c | 12 ++++++------
>  drivers/usb/host/xhci.h      |  3 ++-
>  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index ecd757d482c5..d2ccf19292aa 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -711,7 +711,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
>  		return -ENODEV;
>  	}
>  
> -	hw_dequeue = xhci_get_hw_deq(xhci, dev, ep_index, stream_id);
> +	hw_dequeue = xhci_get_hw_deq(xhci, dev, ep_index, stream_id) & TR_DEQ_PTR_MASK;
>  	new_seg = ep_ring->deq_seg;
>  	new_deq = ep_ring->dequeue;
>  	new_cycle = le32_to_cpu(td->end_trb->generic.field[3]) & TRB_CYCLE;
> @@ -723,7 +723,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
>  	 */
>  	do {
>  		if (!hw_dequeue_found && xhci_trb_virt_to_dma(new_seg, new_deq)
> -		    == (dma_addr_t)(hw_dequeue & ~0xf)) {
> +		    == (dma_addr_t)hw_dequeue) {
>  			hw_dequeue_found = true;
>  			if (td_last_trb_found)
>  				break;
> @@ -1066,7 +1066,7 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
>  		 */
>  		hw_deq = xhci_get_hw_deq(xhci, ep->vdev, ep->ep_index,
>  					 td->urb->stream_id);
> -		hw_deq &= ~0xf;
> +		hw_deq &= TR_DEQ_PTR_MASK;
>  
>  		if (td->cancel_status == TD_HALTED || trb_in_td(td, hw_deq)) {
>  			switch (td->cancel_status) {
> @@ -1156,7 +1156,7 @@ static struct xhci_td *find_halted_td(struct xhci_virt_ep *ep)
>  
>  	if (!list_empty(&ep->ring->td_list)) { /* Not streams compatible */
>  		hw_deq = xhci_get_hw_deq(ep->xhci, ep->vdev, ep->ep_index, 0);
> -		hw_deq &= ~0xf;
> +		hw_deq &= TR_DEQ_PTR_MASK;
>  		td = list_first_entry(&ep->ring->td_list, struct xhci_td, td_list);
>  		if (trb_in_td(td, hw_deq))
>  			return td;
> @@ -1481,7 +1481,7 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
>  		u64 deq;
>  		/* 4.6.10 deq ptr is written to the stream ctx for streams */
>  		if (ep->ep_state & EP_HAS_STREAMS) {
> -			deq = le64_to_cpu(stream_ctx->stream_ring) & SCTX_DEQ_MASK;
> +			deq = le64_to_cpu(stream_ctx->stream_ring) & TR_DEQ_PTR_MASK;
>  
>  			/*
>  			 * Cadence xHCI controllers store some endpoint state
> @@ -1497,7 +1497,7 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
>  				stream_ctx->reserved[1] = 0;
>  			}
>  		} else {
> -			deq = le64_to_cpu(ep_ctx->deq) & ~EP_CTX_CYCLE_MASK;
> +			deq = le64_to_cpu(ep_ctx->deq) & TR_DEQ_PTR_MASK;
>  		}
>  		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
>  			"Successful Set TR Deq Ptr cmd, deq = @%08llx", deq);

Looks good and I see no more 0xf contstants remaining in this file.

> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index a20f4e7cd43a..59ff84ba2d4a 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -500,7 +500,8 @@ struct xhci_ep_ctx {
>  
>  /* deq bitmasks */
>  #define EP_CTX_CYCLE_MASK		(1 << 0)
> -#define SCTX_DEQ_MASK			(~0xfL)
> +/* bits 63:4 - TR Dequeue Pointer */
> +#define TR_DEQ_PTR_MASK			GENMASK_ULL(63, 4)

I don't care much about this rename, but I can't help but notice that
naming is not consistent with the related EP_CTX_CYCLE_MASK above and
that it too applies to both types of contexts.

If I wanted to fix this, I would just drop the 'EP_' and 'S' prefixes.

