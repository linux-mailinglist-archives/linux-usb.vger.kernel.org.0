Return-Path: <linux-usb+bounces-23647-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCF9AA734B
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 15:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE39C1765A8
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 13:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2FA32550B8;
	Fri,  2 May 2025 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="YHHffOzT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F132522AB
	for <linux-usb@vger.kernel.org>; Fri,  2 May 2025 13:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191972; cv=none; b=D8cv8yLkcJ3bnku32mnjSrtcqDm1+uoaQdaplgYF/O6P0RDTf3GBAhwpRzAstUQqygW3IajlSkdA643NciblmKMtk79yhzjWkfnufOWecbSsYsxFtfE0WSd2xBvcpJi2xzxKdKdBgoPjP2ruxopwxTQPImORuXPzmnilBFCV6ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191972; c=relaxed/simple;
	bh=B3fyPnhI2njvnb2C0+Q102nUnhtSLVYjyw03PdITYiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgyoKoc2fzoxIKdR4v/WEvWUpgfi5qH82SRSEBVT8YuByo7M8+LPXYcHrYK6FjZ8GBFoIl09OpjNiuvYsSRJYxUu/AOGImX+0/M3BCuT5G/h0BeA4TvS46fgBQNeNiAIVOqj9SJ40olwWi6lI8lMmwSjD6XHEAH+Cn7Maws1Kb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=YHHffOzT; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f4e3618437so24971216d6.1
        for <linux-usb@vger.kernel.org>; Fri, 02 May 2025 06:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1746191969; x=1746796769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5WUJiFwz9tA1axHBomA0f5a1PzA/tnvyABxskYnOa/4=;
        b=YHHffOzTjQpB1Q8qdCLh7tWYwypA2BBz8FKRGQubFnKHh7isHq6L2zqmeDK1C2cX/O
         ZgpvrKgvigGPUT42J7ukeu1ZKMw0ZNxNN4wG6/vw9cpwU5IMFMw/bICJYzLIduJyaS39
         HjIdwVdlVq9u5iR25a0GTyBVeibaTCANQpvxboewT59/jbxfhFzJdfg3YZkBJaoU1oq3
         lSJI1F+F+kB72YnopGqF+OD3/lqHZJepOGuJv3Lnx2koaZtj8CBH7Lv84tsiPLf7oXwR
         W2Kblk4TNbUrwpcN7k7q9bZ6gQj6Yezd9Rr53xpvmlBuiFpZmRCRppKLo0P1N3l35t1x
         SkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191969; x=1746796769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WUJiFwz9tA1axHBomA0f5a1PzA/tnvyABxskYnOa/4=;
        b=J+5tPgNiggpvSZMC8mHJrJ5KsF5Xyv9K6L3k6rU/dVd+7WGvYWzo1RjvKZEu4modSb
         fyQRNq+0XfdM1Z7dkz7W9ig1IKcSca39FF/En/sg3Vwpe+7nG0M7XupgUwk7yv3CcJ4K
         x4HQebLwh+jLTR1yOZIXOq65Vu+j33tlYJDHhx/1is6JWWSIUioYMmw/rEpTgFhSvSXY
         OvPHW/56f1NyJBZpNlvrVLwq62HQbCLRbFZnsRWQ6mRACicwER5dxhsc24E5agykEaAo
         Z9svF5Z1L99TNWfYUvlXm0ztitgSLnv1ERwiXCxPHYWhAwBbDpmr4x2AEChoy2CBCisj
         2/4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVD581MxL6+o0ag1PkuhhR+lVtJ4crsA9k+HjwTU4tVJtetScW2+K4C8PfjZIQ5JEZ/HUbstnCHXKU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw5nBVNCESmtxvw5KhfR7721ISql4fwMXCPInqOq7+1tgsM++V
	zXDLKLhVKBdzzEH0rkxGYweoAC30aip/6qjSpqhVHKo6z+TMd/AG5AZXk3IsqkYC4paEpuDdXeb
	S6A==
X-Gm-Gg: ASbGncsAqZp7pUUvdacbwGxuf84PP8TDwcsN1gHFIYJ9NJfakKHCIRgh+71Kv4W6dWZ
	pd/XKEXClmDdQ3dLgn4eKrqQRgsh2ATZU+sR+gGfjE26pa9fs/eQxqBMFHkdBZGbSse3hRA/fPT
	NwMXXehy57LLU5S+L7Ge53PQxv3vG/cDQ6zLw7zAAKZR+uJvOHkIZE4QyYpyGCR74pwdg0cMisO
	TRrrIzt6u12+7vIB6uOPuwyWDCneS6akFRuNaMFFCNIWgtzT2x+SSgkiKZTDn1uPdJFeDEKSiEE
	rKo9RU24TkHhqO7UKzjY9q3PnYqqo+9DWG3/vmlOCQ==
X-Google-Smtp-Source: AGHT+IGlcBwB16tahLVxdSB0Wot3Tj6EDv1iYyh3TXaKw2DqKck7oKxQGfqXc0Is+sHoX1UBlXJWxA==
X-Received: by 2002:a05:6214:21eb:b0:6ec:f51f:30e9 with SMTP id 6a1803df08f44-6f515255abamr46140116d6.4.1746191969163;
        Fri, 02 May 2025 06:19:29 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::283f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3b0556sm18196596d6.17.2025.05.02.06.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:19:28 -0700 (PDT)
Date: Fri, 2 May 2025 09:19:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	"Juergen E. Fischer" <fischer@norbit.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-mm@kvack.org
Subject: Re: [usb-storage] [PATCH 4/7] usb-storage: reject probe of device
 one non-DMA HCDs when using highmem
Message-ID: <34cb4621-5275-4c46-b652-01a4a708b4de@rowland.harvard.edu>
References: <20250502064930.2981820-1-hch@lst.de>
 <20250502064930.2981820-5-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502064930.2981820-5-hch@lst.de>

On Fri, May 02, 2025 at 07:49:21AM +0100, Christoph Hellwig wrote:
> usb-storage is the last user of the block layer bounce buffering now,
> and only uses it for HCDs that do not support DMA on highmem configs.
> 
> Remove this support and fail the probe so that the block layer bounce
> buffering can go away.

I'm not certain this reasoning is correct.  The code being changed is 
pretty old; it may be that the relevant HCDs now implement bounce 
buffering on their own.

However, the combination of USB mass storage with these restricted host 
controllers is probably pretty rare.

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/usb/storage/usb.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
> index d36f3b6992bb..49bbfe4610d5 100644
> --- a/drivers/usb/storage/usb.c
> +++ b/drivers/usb/storage/usb.c
> @@ -1057,12 +1057,15 @@ int usb_stor_probe1(struct us_data **pus,
>  
>  	/*
>  	 * Some USB host controllers can't do DMA; they have to use PIO.

I'd like to see this part of the comment updated:

	 * Some USB host controllers can't do DMA: They have to use PIO,
	 * or they have to use a small dedicated local memory area, or 
	 * they have other restrictions on addressable memory.

That explains the reason for the check of hcd->localmem_pool.

> -	 * For such controllers we need to make sure the block layer sets
> -	 * up bounce buffers in addressable memory.
> +	 * We can't support these controllers on highmem systems as the
> +	 * usb-storage code lacks the code to kmap or bounce buffer.

This looks a little stange.  How about instead:

	... as we don't kmap or bounce buffers.

>  	 */
> -	if (!hcd_uses_dma(bus_to_hcd(us->pusb_dev->bus)) ||
> -	    bus_to_hcd(us->pusb_dev->bus)->localmem_pool)
> -		host->no_highmem = true;
> +	if (IS_ENABLED(CONFIG_HIGHMEM) &&
> +	    (!hcd_uses_dma(bus_to_hcd(us->pusb_dev->bus)) ||
> +	     bus_to_hcd(us->pusb_dev->bus)->localmem_pool)) {
> +		dev_warn(&intf->dev, "USB Mass Storage device not support on this HCD\n");

Please say "host controller" instead of "HCD", and delete "device"
(and say "supported" instead of "support").

More importantly, set result to a negative error value before returning 
so that it won't look like the probe succeeded.

> +		goto release;
> +	}
>  
>  	/* Get the unusual_devs entries and the descriptors */
>  	result = get_device_info(us, id, unusual_dev);
> @@ -1081,6 +1084,7 @@ int usb_stor_probe1(struct us_data **pus,
>  
>  BadDevice:
>  	usb_stor_dbg(us, "storage_probe() failed\n");
> +release:
>  	release_everything(us);
>  	return result;
>  }

Alan Stern

