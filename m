Return-Path: <linux-usb+bounces-27776-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 510D6B4A7CB
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 11:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C41FC7B7651
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 09:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FDD29B233;
	Tue,  9 Sep 2025 09:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5mmeRzq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8DF296BA2
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409483; cv=none; b=OgcEo0bcxrVJmBX+eX/hJmXaP52mbRFq2lkBA+JIdFv858TpZOQwL3PNdTy0wsaXJABkPYTwaIzH4/RWFiu9nLj0lSxSEguV5IVeZpnxCLOXEZpA4GXQ/luJEipG7eMEC7bKd7pUZIueUIZcZw1rl2uHxQS0G9i1H4Rjg2PTdXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409483; c=relaxed/simple;
	bh=eeLSB9sGkexWQjHrvt8i743wi/cLb+ul0VuJIO8Ka1A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qpEWMHeF0r9M5at9e36i/KvLbQ5eKR5sasEod9bHwXloCCJtt31KtWl2BH9lQY28A5ZxnaNpgQJhyqgfGWyrc6nO0aSG/Gfxdt7nH2yBzjqWrohKW+hRTN+7wDJWk0SAZxu197m0LtQPP+kORqAHLKhU37K2yZsZoTp+pKsEKJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5mmeRzq; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f6f434c96so5085074e87.2
        for <linux-usb@vger.kernel.org>; Tue, 09 Sep 2025 02:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757409480; x=1758014280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6gfZkbGS9Ifz1QrNhQQePvpYYSdvHOrGZPtJoQ5J5E=;
        b=P5mmeRzqXIF7PwTa880cJO1VjWuKubHR0vbT2nNRrt8nqqEJpkcaoNOE4/4AhDqB00
         N/2bKYcf+s843QQ8938PdfFMki4kgHX2JyIrcCBEH7ztfMY/s5+onOIocR9SU4b2Lhum
         g9gHKuQU4PxQzGwDuRHbk7+35aflohCuGPdhL6selj1ooD8oAKROd5aMBo12J16C1JHN
         C5hxOml9sfHQ6rymWSR/Bq43inoAJszV6mjGwYnX3nm7tWcF2A4IEVxphh6rdT8CqlhV
         GjaEmtop6oHQyRQm8wYwHB5SkkgqzKXnEkKIwLbT/XbYJMdwiK6zm18/YYF6/WXXlI6H
         SKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409480; x=1758014280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6gfZkbGS9Ifz1QrNhQQePvpYYSdvHOrGZPtJoQ5J5E=;
        b=CihTKERnl8vGye/JX1RpVjn+jc1Core22IUvjFC7hb3RABHskWSX9qe+kISq92Q3zY
         pvIuIwyGe4bCYVrP/1RbOdNIHyJhxZU/iekZy5L0Jfy0YbCO857JZtjFGp5ZbwogFN2M
         WQOYkqlj4yCmh2oi4jONGN7Z+mOWDvVLOw+ICQgFlO0GSVyD6TuJOk1yIFsBQbm76Nc1
         CgK6TrV7TmPvyPMzkixVPXOJGSumnDBkoxmJs2XF+EnT41nqWsoAwX2HDSJUoQpF5/Yi
         imifaQw32gtLL6zZQ9wHGDgTBLvksUHKebRqbro3IUd9CYs8iI7T1Ra7ul+43aTiuQNF
         k8CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLj6AXnvg31G6mFF6ySvnOeKctipTTFMHPzNRmaDmm7BKI09TxHJxf2fYE3+a4bzrZK3kVyoFTajE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlASF1mtUlteQ3Sgyi+DziTzNb+7Xjh/sDeI4vyyYi9MMQHcTt
	gLw9Hm7jDtrzoKXyunvKwgq1NpOcTv8V0kYJ7/28GiNJPAHMzASEVFm2HepZcg==
X-Gm-Gg: ASbGnctoDP1je0sivCNIzjMbJ75ccjUR4nKHyrRhw8j30Gm5RWU7Db4xP2T8i3lt3Fs
	fivMNvLHatau4cTSFdmFqcEMrdse1vEwmevq1Njda9foaYZXGgt04xjpPP4nAfTuVj4y7BrNZ+I
	SiUJoCjVudlaScIROXgjhDDq3DILW0yjM3XGerXUkO/blyL2zaywc6/wY0qVsXV2C90rSVALYhw
	ejJ94jzrn9T8ff2VW/Ht01bl9nDmoLD/DnibrQJ0/kTm8o/Mu7at5EyIswgjMV20q54Q+62J36C
	6uHGzPoDNIng0r+/42hECROwNG4nDvZisDlMjTzqRQaAkQPYI3vN1RcDMEa0I9Cd5f1YCMbvGBI
	yE+Vxa56KTZu3OM5lEp/es2xSo7ocy/2QXOI=
X-Google-Smtp-Source: AGHT+IFtVe4RChWvyyMSuihOFWonYLAcORz6OUxj07T29BKN/wSs88mmzCJ/WPcK/kytQxrK6PUnpA==
X-Received: by 2002:a05:6512:258a:b0:55f:47a9:af43 with SMTP id 2adb3069b0e04-56263c98eb5mr2397956e87.57.1757409479913;
        Tue, 09 Sep 2025 02:17:59 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680cce9f3csm389682e87.52.2025.09.09.02.17.58
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 09 Sep 2025 02:17:58 -0700 (PDT)
Date: Tue, 9 Sep 2025 11:17:53 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 5/7] usb: xhci: improve Command Ring Control register
 debugging
Message-ID: <20250909111753.2fcd686b.michal.pecio@gmail.com>
In-Reply-To: <20250903170127.2190730-6-niklas.neronin@linux.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
	<20250903170127.2190730-6-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  3 Sep 2025 19:01:25 +0200, Niklas Neronin wrote:
> Improve the debugging output for Command Ring Control registers in the xHCI
> driver. The CRCR consist of the following fields:
>  bit 0 - Ring Cycle State
>  bit 1 - Command Stop
>  bit 2 - Command Abort
>  bit 3 - Command Ring Running
>  bits 5:4 - RsvdP.
>  bits 63:4 - TR Dequeue Pointer, is 16-byte aligned.
> 
> Instead of printing the entire 64-bit register as a single block, each
> field is now printed separately using the appropriate printk() specifiers.
> This approach enhances user interpretation and ensures the DMA address
> format is displayed accurately.
> 
> Except for bit 3, reading the other bits will consistently return '0'.
> Therefore, only modified bits and bit 3 are printed.
> 
> xHCI specification, section 5.4.5.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>  drivers/usb/host/xhci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 5e5681c1eb4e..4526989169a3 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -499,7 +499,8 @@ static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
>  	crcr &= ~CMD_RING_CYCLE;
>  	crcr |= xhci->cmd_ring->cycle_state;
>  
> -	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Setting command ring address to 0x%llx", crcr);
> +	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Command ring deq %pad running %u cycle %u",
> +		       &deq_dma, crcr & CMD_RING_RUNNING, xhci->cmd_ring->cycle_state);

I think the word "Setting" was useful here.

This function should probably not be called on a running ring (the
spec says: writes to most field are ignored in this state). If there
is concern that it may happen, but not enough concern to justify some
xhci_err(), then maybe

    "... (ring%s running)", ..., RUNNING ? "" : " not");

>  	xhci_write_64(xhci, crcr, &xhci->op_regs->cmd_ring);
>  }
>  
> -- 
> 2.50.1
> 

