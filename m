Return-Path: <linux-usb+bounces-27777-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C50B4A7D6
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 11:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50AE216196A
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 09:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1302C274FF1;
	Tue,  9 Sep 2025 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXFjGtbE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0D1482F2
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 09:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409624; cv=none; b=KNumQE8m9IafSn6+6mRTqza18Yv/enJ/IWjlTVLzY2LZq804IgOOwWPWTU03liwRui9t65iFz7OGDyetxIS4FoBZxGMGkr+uokeDzC2n5gKf2P8Jex27QDhhbusuXB2DsIMvMYIY8sdGhPlvwnIJ77/z+2RVY6YziOwPr37F+rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409624; c=relaxed/simple;
	bh=tp60gXc9m9eu1iJ3pJtllWplojRY7IN/qrkgc4bHANc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GU6gQ5xKX/N6vT/Q/4ZFGG58h7xI2Oiul5Twaq6XyH/W4TfDQTUVvjJ9FKrzdSjlxIO163wbXrqDq9vn7CMMKYH0jmT9GQWPSzJttVk+qLYy32hH5dIXBaRpO0B2gIBShuK6PFKSO+18OI3sl24zj2gPB8VkNlZomborS7Gd22o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXFjGtbE; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f68d7a98aso6327222e87.3
        for <linux-usb@vger.kernel.org>; Tue, 09 Sep 2025 02:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757409621; x=1758014421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrW15FcOlgNiib7f2UXyxJpOQrj3X1VtbkQrgBXnC1Y=;
        b=LXFjGtbEBxNYo8Jdc39K5qZv5y5mKVpV2NjoXsOwzUZSqLvqhfgvJ+1Jj6mub6SCGf
         00t2OVBeakcPgXJhtbuCGCMtG44AUEcKaHN/FGsgMCPNlgrXfwDYD2OppPPFSFRlam5E
         O13RPHJCjSFyu7eRkQydVt1qAA6XWQIm08TTzVFLF3cSWSUD/U/0z300jrxAo6DLc/9q
         TrDb9KKTBpFhmfGWXZrjkKNPUWV1Osvxz13eLdcNwjdYyUrrZSOqXvMtewWwMo41xJID
         pA8b1ZZkPbD194hAwVjVi7UeUvZV0pEDZMktKmqEhgVW9HmC+D8OdGnQKs9D7VRSk1Nn
         cRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409621; x=1758014421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrW15FcOlgNiib7f2UXyxJpOQrj3X1VtbkQrgBXnC1Y=;
        b=S05a3d7lOwCuEl37S6hdlfFyGElA1xYRmhtzi8xuQhuVHV+GCXZSJv6YaTo3zcorS3
         85No7H8sytXGb5W6bcoZ+5+3wGprG37D3tvdC2Y9/sY22JESTHNcrwAd0Y+O8bfwgF4T
         S4xQ/JwKoL7GPLEsxyHsyW87Wih8aTiIk1+obZkpwSKMnWroC0qb0VYooA7NLzED5bH5
         sEINXHzWwn5KUKRSC/J3HY4z0JLptxFWBLovsdOYPPlk3JwVKp4k/b945qkThfj/Q8Oz
         ho54D4T0HTxOno0cjLPnP8gwcRX4TXrBRKvIhq4Mgh/9RTmbLJ58CMwtglWHeaJujZd5
         5XoA==
X-Forwarded-Encrypted: i=1; AJvYcCWdabEFqLyLW9brtHzJv6Y9mLIlR7KWn5W0U5nnISz+2zO9SoejA9hRUAB7spLKS3k26Q7+elGc/kk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUZ58PNqdk0LXjMHmxrl0duFJefAbtx0nwEseZqHKgUgc4Cdlo
	FEgo0LPnZ9vgvcdqhiq8NQXJgA66J5sS7YGG2+oS8o1iH1nKAtG1L/Ej
X-Gm-Gg: ASbGncshH571QNfEvMuShNJsAYcf90Wjw4FWhc6jISz9BuEata8WQT/AgrO4fnquFLF
	llGTZ50titZC5are0p85VsMTuWFyV+gtgYOV74NCP0dAljYGbYfiEgwybgGHd3dYfUwRDHqIKhK
	pKCbImwYiP4ioQMQxIG5GGyK1tftjGdxhnuEFnLS6EYY5+GxdcCgcB0uXurEeC3EYES5dp+tQ1W
	lJvehohDKGwc1qIr6TCpEkX7h7da/6p9xTJyUP4V+c74D06riwGm9UfViHQGHog4MxBQDnnQW2T
	HlIMaut7s/U2sC65AgFdzqx3an3yEXFiXTNJuxhXu/FsMVv/Va+3+ilH7HeChD2/4gtj/ye6mw8
	sYdNhT7YdAuWCIOGIzPaTHFqGd4t96/XZeGA=
X-Google-Smtp-Source: AGHT+IEDBLDzP/v6cR8Dh2ZkoS7fGx+cnReKqo2AjT+LAqMKObu2dbMcf8pbW2IahRsarGnhiS7OWg==
X-Received: by 2002:a05:6512:b26:b0:569:766:9438 with SMTP id 2adb3069b0e04-5690766994bmr423782e87.10.1757409620846;
        Tue, 09 Sep 2025 02:20:20 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680c424ed5sm396292e87.4.2025.09.09.02.20.20
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 09 Sep 2025 02:20:20 -0700 (PDT)
Date: Tue, 9 Sep 2025 11:20:17 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/7] usb: xhci: improve Endpoint Context register
 debugging
Message-ID: <20250909112017.707158a9.michal.pecio@gmail.com>
In-Reply-To: <20250903170127.2190730-5-niklas.neronin@linux.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
	<20250903170127.2190730-5-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  3 Sep 2025 19:01:24 +0200, Niklas Neronin wrote:
> Improve the debugging output for Endpoint Context registers in the xHCI
> driver. The Endpoint Context registers consist of the following fields:
>  bit 0 - Dequeue Cycle State.
>  bits 3:1 - RsvdZ.
>  bits 63:4 - TR Dequeue Pointer, is 16-byte aligned.
> 
> Instead of printing the entire 64-bit register as a single block, each
> field is now printed separately. This approach enhances the readability.
> 
> xHCI specification, section 6.2.3.
> 
> Why not use 'dma_addr_t' for the address?
> The 'dma_addr_t' type can vary between 32 and 64 bits depending on the
> system architecture or xHCI driver flags, whereas the 64-bit address field
> size remains constant. Since hardware cannot be fully trusted, it's better
> to print the entire 64-bit address to detect any non-zero values in the
> upper 32 bits. This approach ensures that potential issues are easily
> detected.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>  drivers/usb/host/xhci.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 59ff84ba2d4a..2662356d048e 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -2580,9 +2580,9 @@ static inline const char *xhci_decode_ep_context(char *str, u32 info,
>  	ret += sprintf(str + ret, "interval %d us max ESIT payload %d CErr %d ",
>  			(1 << interval) * 125, esit, cerr);
>  
> -	ret += sprintf(str + ret, "Type %s %sburst %d maxp %d deq %016llx ",
> +	ret += sprintf(str + ret, "Type %s %sburst %d maxp %d deq %016llx cycle %llu",
>  			xhci_ep_type_string(ep_type), hid ? "HID" : "",
> -			burst, maxp, deq);
> +			burst, maxp, deq & TR_DEQ_PTR_MASK, deq & EP_CTX_CYCLE_MASK);

Does it really bother people who use debugfs that deq includes the
cycle bit, which is exactly what anyone who know xHCI will expect?

This line is quite damn long already.

Also, I am highly confident that you haven't even tested this patch.
Try it and see what happens ;)

>  
>  	ret += sprintf(str + ret, "avg trb len %d", avg);
>  
> -- 
> 2.50.1
> 

