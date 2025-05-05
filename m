Return-Path: <linux-usb+bounces-23724-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D428AA952C
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 16:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC182189AE45
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 14:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826AB25A349;
	Mon,  5 May 2025 14:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="t84ibPae"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB56189B8B
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454430; cv=none; b=lVlywb7xubATF9UEeaIxOAN1S0emixg+pwh4zOw3UZzR4TUBoPy1Zj0fjlj6iuPCeJqbNYjQHq3gIoqoLwRCqgpPZ2lTZtFk5imlNTzsEknTq+9j4848w4O7tShzTNmhxT6bsczpNBSNCnvWG5Zyxhj3yUCNUEePNAA6Kwbn6H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454430; c=relaxed/simple;
	bh=A2zxAUOPLV3bNvLbAu3RCEqZwUjdKzQAa87eBOyOC90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhwA4P2GoAtAq8WUyBOLvLdvvClncaezlGU7wHPj0imctT6oBltosy5b7o0t8mrDjH9FRVjzGglTkn7gbULft60rizxj8x6ixRlUxeR8LWXif456uff8phJxwjppUHzLszZt/OSGbv7QNlKqtZJgoSMA43ocgQ6PFh3CnEKcjoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=t84ibPae; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7cad57f88eeso186442185a.2
        for <linux-usb@vger.kernel.org>; Mon, 05 May 2025 07:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1746454427; x=1747059227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Km2nNwCy9nfUMi5n8/eIW1Pg+DKWEU9DbSVEm6yXt90=;
        b=t84ibPaeSevucUprToXcROsr1kvuYloz3/zxUnXayigNnhV1eyxIzbAzfDlAJuFnsB
         2N3tvzHeJ72xyIyuUBswMUx+wmXClT6EkXdw8Y5ZSq63rjJJEFl7T7N/Q613b13qt/cJ
         6sIM8f2KYWipH1zMaWVgL8J0tR9lkRKEr/swnRX0Uf+waeyhLrSrbVxsP3WhG30frRhU
         Hvl3PAN3wb6TVDtMn9Wl2UmzA6itsFnszfHsujz8QzmEdc9flwBNNeahDT64272rbxMa
         GmQTdNzZRHcoB9haCoqzKRzRguRxq5Pfc6lVCBNLz7Hgd/oXtkI7CWAjUYTujKJ8tiHC
         jRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746454427; x=1747059227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Km2nNwCy9nfUMi5n8/eIW1Pg+DKWEU9DbSVEm6yXt90=;
        b=gtNe2gMuJtiOvbh/g4kt69Ycvxn0qDOQ6ZWdOLVhbfDgTiLEGxZgfVwoHYkSnIUKt3
         rlh1T3VoIur8uoQPEv2qULm6tFcp1t0QzZVjk6de1htFMOpIweMQ/vyogOzD7thHkWF6
         OpiiEYgS1fN0laAKAs14sDp8tGc3nw9vUfNw1NRvDtgzRv1wKIz0d26aKcstUt4kKZ2A
         J0Av/SFoaxlB3FUbVJPC5aikA2m7kJB/rXhAh6QX3tjEjqSoTaR8k9DY7a84kRZApuFR
         Jf6ldKeUJhMAr/TtpPOzd6hB0t2TJzH4x09CO2ZORxFRiPrShbsD3SVtamJwWuDsmb7w
         FhvA==
X-Forwarded-Encrypted: i=1; AJvYcCWERV2Y9DykFKbkcmjBHKAlkrkmxmCVcUBuJuA6DKxN6Po3BSrJNGryXKSzxOaWFU1F97Vlbb/dCNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoJ6hD+U42K45ftwemFpNFGu/TpLE8vh4jb32D+pVM1L0+3Wbl
	uvK7KJJRTInW6CEKsLaZJ6cwoIWxCPFbMJUM+CRHnAWgNHmv5K7ShHMZaEcrCA==
X-Gm-Gg: ASbGncu9yDg0sKir2BhTm4FcxGxMkD4bKsKL2N7Y0Q1RGREeFQBpdwLbFqX8iiBcnG/
	MKETUXjoQ3nPAgJr2zxyEQpVJdMopaAkNi5zgbLHDwtePT1q8EUBs2TXQACM+GNpDN2MaiL+Tl1
	Lnf702Y8xy0mATRcf7mo55c6C+FvlVemr8pdiGXqMuJJ0ZFE/OxoBRNGP7hqogqYVoUTCCZ7OSD
	8RyWA9N9cFxnpiSRrISj06k68SJq12SNXOjVxr5d0PJ3rb4/WigwJyVlXJuEwEFAp8Qc2gN7aY0
	RTmWbA3FZ0486CUG3egq638TdKNUCdhEyvk8vQhsVmi2dM4IaXUB/5xUR7s=
X-Google-Smtp-Source: AGHT+IE0jGXZkHeqo5VP6fuLU3UosiL4RXVAh+fS3HVNKXlvLlMRZFj24Qgw4HiEH1QgtxUBKzrCRQ==
X-Received: by 2002:a05:620a:4884:b0:7ca:ca21:23d9 with SMTP id af79cd13be357-7cae3a88445mr1253233785a.7.1746454427156;
        Mon, 05 May 2025 07:13:47 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad2146a3fsm574523185a.0.2025.05.05.07.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 07:13:46 -0700 (PDT)
Date: Mon, 5 May 2025 10:13:44 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	"Juergen E. Fischer" <fischer@norbit.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH 4/7] usb-storage: reject probe of device one non-DMA HCDs
 when using highmem
Message-ID: <f75fe6a2-b751-4839-b811-6eed2eecb177@rowland.harvard.edu>
References: <20250505081138.3435992-1-hch@lst.de>
 <20250505081138.3435992-5-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505081138.3435992-5-hch@lst.de>

On Mon, May 05, 2025 at 10:11:23AM +0200, Christoph Hellwig wrote:
> usb-storage is the last user of the block layer bounce buffering now,
> and only uses it for HCDs that do not support DMA on highmem configs.
> 
> Remove this support and fail the probe so that the block layer bounce
> buffering can go away.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Hannes Reinecke <hare@suse.de>

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

> ---
>  drivers/usb/storage/usb.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
> index d36f3b6992bb..152ee3376550 100644
> --- a/drivers/usb/storage/usb.c
> +++ b/drivers/usb/storage/usb.c
> @@ -1056,13 +1056,20 @@ int usb_stor_probe1(struct us_data **pus,
>  		goto BadDevice;
>  
>  	/*
> -	 * Some USB host controllers can't do DMA; they have to use PIO.
> -	 * For such controllers we need to make sure the block layer sets
> -	 * up bounce buffers in addressable memory.
> +	 * Some USB host controllers can't do DMA: They have to use PIO, or they
> +	 * have to use a small dedicated local memory area, or they have other
> +	 * restrictions on addressable memory.
> +	 *
> +	 * We can't support these controllers on highmem systems as we don't
> +	 * kmap or bounce buffer.
>  	 */
> -	if (!hcd_uses_dma(bus_to_hcd(us->pusb_dev->bus)) ||
> -	    bus_to_hcd(us->pusb_dev->bus)->localmem_pool)
> -		host->no_highmem = true;
> +	if (IS_ENABLED(CONFIG_HIGHMEM) &&
> +	    (!hcd_uses_dma(bus_to_hcd(us->pusb_dev->bus)) ||
> +	     bus_to_hcd(us->pusb_dev->bus)->localmem_pool)) {
> +		dev_warn(&intf->dev, "USB Mass Storage not supported on this host controller\n");
> +		result = -EINVAL;
> +		goto release;
> +	}
>  
>  	/* Get the unusual_devs entries and the descriptors */
>  	result = get_device_info(us, id, unusual_dev);
> @@ -1081,6 +1088,7 @@ int usb_stor_probe1(struct us_data **pus,
>  
>  BadDevice:
>  	usb_stor_dbg(us, "storage_probe() failed\n");
> +release:
>  	release_everything(us);
>  	return result;
>  }

