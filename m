Return-Path: <linux-usb+bounces-27784-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9767B4A940
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 12:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A38571881F07
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 10:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD442EA74C;
	Tue,  9 Sep 2025 09:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8ey8xvQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256812D7386
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 09:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757411997; cv=none; b=GBegrWnyUwbFtBbcNa34zSHx9MsOxzKTDb0mP6mp1Ws5YEiubOiHudAesiykjcq3I8oeCliOaVkNueqDHvRHbQa0LrGQAshfsi1Z+V5S7y8LMDDiAQ0JxXOfd2KTo/HlifjylZwaUvTgjzvvYuRhZErAFSZC0yTr6sJAPL2JrDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757411997; c=relaxed/simple;
	bh=4Fp6UjHynRXRx/cnEW41Tea/jANni2Q7fiHMRPfINKU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WQ7e1sajQX5cZqpnVFY3Pmzj9asklQMdeRAIEMUL5ZGuHGKtFlarfdsveBFEnRUsD6iGO0wFRegoENJ0W6wV2g8gYr+LnasrmXfpDKhNbmESWor15gL6HXZa/0usE2WEOXVZxsT/PZqZvoYlGDeGdcB47uL1mvTebViWMtQ/lzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8ey8xvQ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f72452a8eso6432902e87.3
        for <linux-usb@vger.kernel.org>; Tue, 09 Sep 2025 02:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757411994; x=1758016794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diwfDCRNV6uVKkzI1ORZVz9UNKBiNOea7Y9VqPoMEug=;
        b=f8ey8xvQnQ8XR/811qrQzifW7V00KtpIrVRJQzoDCL4hjgzhrJ+dV9Z0SkrtUhOLL1
         HZmF8ayGSesJvhRvrwhtpyCvjslNr0xGp3nrZqGPw5AZfsSy9mC5c07U3Tjs0B7vyuoG
         pMI1OZnhXt3TFtSSeL0OBIJIFQ+VC4gIhqyEupqaR5qlx6guIQBI6bRtowcWm2/JnU1N
         jqM+FvxKwujxGo1h3CqJ8EN9fSfV+PvTIE1JQtW5I9Vmxo9E4hvqwToi8PYwEOQ3bfTR
         6cua8bJ1d5IBkHkwneA7fcI9n33iO5huXUO45luSWdBZpVaqsWqrcxBhdYaTwXJqSy/q
         jGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757411994; x=1758016794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=diwfDCRNV6uVKkzI1ORZVz9UNKBiNOea7Y9VqPoMEug=;
        b=rEWOB/OAiCo8333wlkysf+Ele+wrSgN+xjJFNBJ+sH4YsrNrBIIGGCvQQrEeWbugeg
         AyoaJ3emvZxjJDx9vYrrVhTFMifZzZDMH9xrDS1+6rQss+pjZcF4mPYeYXKHcQNDr92F
         51Cts63IpZELHx4HUd0Lr17Wts8xk5wNuhbaC/VS+ARc45yzhuqe91oDjxe0fjie/Uez
         3jBtpcorXCGOpcASV1cYcwfzd4xB8of6TwggYeFzryvfYfYcI4ShoqhjkvNIUhwIYCkg
         UBkKRvnj3oXJNaVmfyI4yaQ2Ie51TjF8j6ng59GNWPjZfyJCU98ZZ8qaP1+mUqzFKisp
         6+pw==
X-Forwarded-Encrypted: i=1; AJvYcCXgTblqcuLCIbb9AEda9rF4gKBsYxBUoYmZLoBErEnAfnpNmCvqInc6DdAqfpzpcWCFkzPb5j7EwFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfpeyYRIntbUeW08cJ3ziAVI7OG5YLFLUVSJa37zME0Vm9DeFW
	VAvr8FF1m6TdFNp6R9yJKUe604Mcv8hQhyH2mV72A1SqNjHvMnhgcW2y
X-Gm-Gg: ASbGncsO/wfb9Y3nxWoY7nMbEsmAKcXV58xX88c2Lviof88fLNUmVHqalFoHtDp+X0/
	5jexmaLPKHhrQvYDFK5Ol8iF9S1HPZ18LjSBaRgKGexBAklgkh8ukbBNoFzgqP9pQZZG5GaM34F
	JBHwDzdwvTtts8tX2/U9MOEZiffwPiuqqkBZbpHAXpTsR6dNniU1FBF+0pAK4qbHmsTZYP7VqLZ
	qgarUS9VFoS3RGagWEgGauiWrSYxlSze72MnL+ruVpQKNTF9J+o5qIskOF5Rcr46mT/fN7VkLj+
	aXZZp4EoNsBRVoW4y5TVbn4UKo9+j1SXbA+KiTMH0ozYUVzaoScHe1advTfdREuBThCjVu1NL8T
	qaHngOKH6x+GAUR+7CwdrnRVehzfYvM6OQBo=
X-Google-Smtp-Source: AGHT+IFC3ZFY7BHHYinEvwAuBOnY5d4RewbrCfNJgP5lAUIyTuz8hpJ/CI7zaFIvXJhzuPX0U77Tvg==
X-Received: by 2002:a05:6512:239f:b0:568:2583:9485 with SMTP id 2adb3069b0e04-568258397f9mr769067e87.41.1757411993948;
        Tue, 09 Sep 2025 02:59:53 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680c8f9e78sm405590e87.37.2025.09.09.02.59.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 09 Sep 2025 02:59:53 -0700 (PDT)
Date: Tue, 9 Sep 2025 11:59:49 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/7] usb: xhci: use '%pad' specifier for DMA address
 printing
Message-ID: <20250909115949.610922a3.michal.pecio@gmail.com>
In-Reply-To: <20250903170127.2190730-3-niklas.neronin@linux.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
	<20250903170127.2190730-3-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  3 Sep 2025 19:01:22 +0200, Niklas Neronin wrote:
> Switch all printing of DMA addresses to '%pad' specifier. This specifier
> ensures that the address is printed correctly, regardless of whether the
> kernel is running in a 32-bit or 64-bit environment.

Old %llx with (long long) cast also prints it corretly.

I had the same idea and even implemented it in some private debugging
patches, but I found %pad just annoying in practice.


%pad isn't guaranteed to be at least 64 bit long, so some DMAs from
64 bit hardware will always need to be printed with %llx or similar.

Secondly, padding is not optional with %pad. Maybe not a big deal, but
on 64 bit systems with comparatively little RAM it adds clutter.

Thirdly, %pad can't be passed by value. Hence pollution like:

> @@ -2654,7 +2654,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>  	unsigned int slot_id;
>  	int ep_index;
>  	struct xhci_td *td = NULL;
> -	dma_addr_t ep_trb_dma;
> +	dma_addr_t ep_trb_dma, deq, td_start, td_end;
>  	struct xhci_segment *ep_seg;
>  	union xhci_trb *ep_trb;
>  	int status = -EINPROGRESS;

This function has plenty of variables already, not sure if it needs
three more. We could work around it by introducing {} scopes around
printing, or functions like print_scary_error_message(), but it ends
up being more hassle than type casting at some point.

Maybe a small helper if the verbose casts really bother people?
static inline unsigned long long dma2llx(dma_addr_t dma) {return dma;}

BTW, isn't unsigned unnecessary?

