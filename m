Return-Path: <linux-usb+bounces-23250-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C942A94878
	for <lists+linux-usb@lfdr.de>; Sun, 20 Apr 2025 19:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEC181892978
	for <lists+linux-usb@lfdr.de>; Sun, 20 Apr 2025 17:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2C912B17C;
	Sun, 20 Apr 2025 17:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CI/tiEHy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C56E184F
	for <linux-usb@vger.kernel.org>; Sun, 20 Apr 2025 17:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745170240; cv=none; b=ONz8w+gMCJJiqlJ68ToRrnpS71jEWHa11zYSXoRNUjBxdxhy9TDn6M9NUaFZ+/qL1eD31rOfb9jlmn+XfFpleqcENDwB9MsdEzdivhFEG9l9U1fNJeH+1/qocuKjBBBtEO5OdISu00kzfHXFSrNG2i0Nnthy9BgPekeKk6pink8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745170240; c=relaxed/simple;
	bh=5E6XKoboLBsROxcYXBtuDXJ2UxzJYDTgijixDnUJeic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PROA5sDX2q8iAcdY06D6iEW/dJizqXr6P9RHur6kgs5dyXZaQsvVs0Wi/Epe7HmqalJjh1fge3fm0TbsLqK/lMOSyuMlObF/+Bc3LLP6n5KsNT434XnhSz8OnhkEJReOt+MXSIeBssTpN/QAPuB5iOUGIVfxWi7mxp2tv7PmN3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CI/tiEHy; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54298ec925bso4810515e87.3
        for <linux-usb@vger.kernel.org>; Sun, 20 Apr 2025 10:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745170236; x=1745775036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qCoNFIdVzok2s+VyCHLu7rvjGndpKW/O0xnXm/MtgJ4=;
        b=CI/tiEHyqiZKXeNLANEocvCnF6QxUT+phiKjjDw35/AlxnNW4GgrlW1XuCMF6yl3Ij
         fVMZgo8q+R16c/Tn0i/tkKMaNQ3L446FzOoPzbVwzOpEaf4o0zRTAG9oQMAtndXFPtYC
         Py4LlAVYLrd2U1cMEbleocvEqjsvcD9H1yQLTo3NCD5gZnFM4aa8ybaUh59tRPI2/NSm
         e/Ve5byNxdlndV3UMUkVZESzXukHSy7tXcP5M7oxYrJ0NmkkKE0i64AAy47To0OnRIc1
         BemHMO6/EX5NxF/jxNtJtLs/XsQVpShesmSIhTki8CIPzBKEql+FtqqGPKqnaleLRkW3
         fpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745170236; x=1745775036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCoNFIdVzok2s+VyCHLu7rvjGndpKW/O0xnXm/MtgJ4=;
        b=VL6PgUi+viGllfUGY51Q2Bc9FAUIX9RKxDxasY8dr9U8Rx9mhGqek3bdyfpwqZ+k/r
         dP7GVGuQLbB5eFwIXh6QTUiTGoFueYsT6pf9K59/Osda8xR48tx9Y3TbCpw3IbeKEWyi
         E7izDQFWWN7Xj/72sqfH+fAqDglclCvHc7Jb43Kcbrd1v0LAfYIcbsWJLrVonDJ0Q7nn
         d2Cdg70aAsFRkzO7jo03ID+G40X73gdqBbIA6jQ2q+gflMHttC/UhD5q/uquuxN6BFAD
         Khj6WTl+f0Xpdbl/w2VmIJfkOsS/os7teYUCuSDvWLleJk6vNOKbSwqiiFsYBcToToUL
         NV0w==
X-Gm-Message-State: AOJu0Yw3L2+daU+J1jp+f8Aax1DEIcLkviJQ5n0PwIkH2g3IWzHu9ADa
	ywTCNMVjfsu4jMTqYfu/1CUw0uZnbTQX2XtecFPhuWY0e/1A3nNmKeYeTg==
X-Gm-Gg: ASbGncubauuiciRgDqBXR8ZR8VvvEQUfZjY+CO53QQns9n/V+8svcuXHuEwcI6b03bC
	Od3XvYg0m8s0ockOJKVduMXYqq1Fzx9nHDvJtd9xrkZLZcQ5NK00RgMsHxaU0kkCQpFhhvsqVUt
	kLbj38x773DhSOM7RQdGZYn2jrtmMFybs1EMSd/0OyYYIAfNtqEx8yP9SN0vymDgYefaF5YigBG
	OJZuiwuP8hQXtoUsRu4K/yurEHWpqME1BA5BPVJ5KFD4+Y8Ew3mmg/wi62SnHwCcvrXRShWnH4u
	R/AmljlfRctT+ey4fQKUP/SpdJ4Fna647dCDfXtIK+QMHh35LoE/JJ4QWnREXEyAXdF7+MwzpfR
	SagWn9OMSqMYRTtUgAduWJg==
X-Google-Smtp-Source: AGHT+IHqTdfZ93eNa+6MoiXMMb5pN7t8xkDxmX85OtTNzsg3/MPwnO3gqoqt3agJDf7iao5JSt0SEA==
X-Received: by 2002:a05:6512:400c:b0:54a:cc73:a36 with SMTP id 2adb3069b0e04-54d6e61b90bmr2443014e87.6.1745170236146;
        Sun, 20 Apr 2025 10:30:36 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:4142:52f0:f392:abac:e837:67c5? ([2a00:1fa0:4142:52f0:f392:abac:e837:67c5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540e55sm732902e87.71.2025.04.20.10.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Apr 2025 10:30:35 -0700 (PDT)
Message-ID: <cf54c624-4fbf-4d4e-81ca-48c0b487572c@gmail.com>
Date: Sun, 20 Apr 2025 20:30:34 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] usb: xhci: move command ring pointer write
To: Niklas Neronin <niklas.neronin@linux.intel.com>,
 mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org
References: <20250416134510.2406543-1-niklas.neronin@linux.intel.com>
 <20250416134510.2406543-4-niklas.neronin@linux.intel.com>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20250416134510.2406543-4-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/16/25 4:45 PM, Niklas Neronin wrote:

> Move command ring pointer write from xhci_mem_init() to xhci_init(),
> and utilize the xhci_set_cmd_ring_deq() function.
> 
> The xhci_set_cmd_ring_deq() function is nearly identical to the Command
> Ring Control register code in xhci_mem_init(). The only notable change is
> the use of:
>   xhci_trb_virt_to_dma(xhci->cmd_ring->deq_seg, xhci->cmd_ring->dequeue)
> instead of:
>   xhci->cmd_ring->first_seg->dma
> but they are effectively the same in this context. The former represents
> the exact position of the dequeue pointer, while the latter is the first
> DMA in the first segment. Before use, the dequeue pointer is at the first
> DMA in the first segment.
> 
> The xhci_set_cmd_ring_deq() function is moved without modification, except
> for (long unsigned long) -> (unsigned long long) due to checkpatch.pl.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>  drivers/usb/host/xhci-mem.c | 10 ----------
>  drivers/usb/host/xhci.c     | 37 ++++++++++++++++++++-----------------
>  2 files changed, 20 insertions(+), 27 deletions(-)

[...]
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 4de51ba851d8..92c32a80acae 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -495,6 +495,23 @@ static void xhci_enable_max_dev_slots(struct xhci_hcd *xhci)
>  	writel(config_reg, &xhci->op_regs->config_reg);
>  }
>  
> +static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
> +{
> +	u64	val_64;
> +
> +	/* step 2: initialize command ring buffer */
> +	val_64 = xhci_read_64(xhci, &xhci->op_regs->cmd_ring);
> +	val_64 = (val_64 & (u64) CMD_RING_RSVD_BITS) |
> +		(xhci_trb_virt_to_dma(xhci->cmd_ring->deq_seg,
> +					xhci->cmd_ring->dequeue) &
> +			(u64) ~CMD_RING_RSVD_BITS) |
> +		xhci->cmd_ring->cycle_state;

   Very strange alignment scheme here...

> +	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
> +			"// Setting command ring address to 0x%llx",

   I thought you're dropping those //?

> +			(unsigned long long) val_64);
> +	xhci_write_64(xhci, val_64, &xhci->op_regs->cmd_ring);
> +}
> +
>  /*
>   * Initialize memory for HCD and xHC (one-time init).
>   *
[...]
MBR, Sergey


