Return-Path: <linux-usb+bounces-28166-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CCAB59C82
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 17:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 998AB1892BA6
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 15:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271C0345745;
	Tue, 16 Sep 2025 15:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="UgBeV/kq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04740309DB0
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 15:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758037853; cv=none; b=ns5qwABBCIKSY68bivhxZ2aWGovpCqc1LZafYnmZyfkfusI4DqwRNIyuq3RxlfJFqQIbXcag17PFGWtJy9wphi4WTAMzXXz9VJGEyCncwSUFdt4JwMxq5/+wTmIzCA0SyDIQlketjfnPOAu9XjeQZqgsHMDPR3EpcdrMLTtDkAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758037853; c=relaxed/simple;
	bh=/oQCj6AGCHXiIzQ552zCryq6vTKe7P9wZDScjAfRDts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpJFVupmtmj0ACMdy0JFO4tPuqR9Bx1x3SxJ6HtxjWLalQ8Hm9LkC1OxleYSRlWHl8Oqtu2HBr+z/YyKGVngp//lN+YDkNPHCC/YjGUEWVNsFX40O/iFcvor8ZTop1OtIVOmQl1BBO0zqK3kBs0nh5aAaIptiYy3mj07O8cWfEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=UgBeV/kq; arc=none smtp.client-ip=209.85.219.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-76e2efbd84cso44066346d6.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 08:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1758037851; x=1758642651; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zpOQuO2AzlrOCSxcAUjngawCtKZasp8FGNW77i+FdyA=;
        b=UgBeV/kqKJYKQUirg5HjRuxttTIHlY7S0nokqCZqU80y2NIuZ6AjK2gnIr0ZNlshlW
         /kEOhGBcleje7iNoiHpXxaWopwUSsw25YMhjPs9DVLcKzv548zZIw2e2fEyVZ30nFa4s
         LuH025a6tmal8FsxslTurJwV9GcKlWbOJKlYXamTSNNbA7IYSDn0EeRmxR9UIdmKuJwF
         RNaPQ87876lvfksTWX310zJkbVr8I9cGddTCOL4Y8hWs87mM93RXUc9Zlka91wZsOcYu
         5dPoL33UYQS3lxIsQh/5CpGb/nbHcPSSbMgtJYR+fSanSPOHSEqtDo7cn3q6GXRGh2aY
         i8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758037851; x=1758642651;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zpOQuO2AzlrOCSxcAUjngawCtKZasp8FGNW77i+FdyA=;
        b=eDGTLcU3kmhJryFYm1dLKk6T+SsjGaAlX1NIljXDwyVPlL2IBm6wKkIvGFGLD63Y/O
         h9pV/lb9rCWK27TqjLMFdonmO4ZgnU9WU9CEfUigSLgCzo3TX8c+Yvwh4fp2R0u8Tb+A
         7Yoi83msOuFTajVJT9tFx0fDSbEGA+g4S96DoVcLmlddzpXW56tlDUIAx+KmM3JuXcw/
         NPjS8uQy6fwYnXRczptX6L9/Z4btgFysqlaYxKrxLHuT3/+oD1DkP4LKJYVs0U0bZZxq
         7TCOw+aIsraIr7nRUVEcjj22evGGK1GeZ0F6X/eZWRnYEhNVbKCaWu+Pf5dI2OPdFbuo
         4B7g==
X-Forwarded-Encrypted: i=1; AJvYcCVKtWYrSQvCNj5Xe7o9iLDOYUvloZAWUyhiz9WaDPs+4W3pekft7XILj6jngdyo7NDVnf9pq6DFMcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSLL7bIN9u7g6RG1Ak17R6RYhv8GvXHN5ybXhzBd97ymp75NS/
	EkIKmZq2b+hrxazzsCOgG26FAjvhYd+bsfq0EFREPYOC1/CjcLF/tXHW00kulDGVJQ==
X-Gm-Gg: ASbGncukkjwGPuFMWNNXHytNNe8KbCp0h6QLSBA0EmHtFcKGFEevaYN65eaBclNnTyI
	cHHIp3Z6TbBh8UJUMpKui52tY3IGhrgZh73piaJKOozF30i5vdxSskyVjA7wCV6EAM5t5Z72wgd
	rFeuvJJLL/T35Yn6/lgVRwoZsGDyQofD0uElSJ/wvn+ywKQkzofVGeUOZed/LrKKfuruYMBYi0G
	GYp25zGV1kZrQtFlodFzqO1ZWNHNZixjNdc0ok1CAA5BVUaj7hLLovHsSZry8bHkInsQmEErrUg
	/yVdhX7iU+KjxqlstGUKX7Qqpyfw2533BYRZYCm3jyWzt6l4bXll5NSvlv45Z1yiCxbUHkS8Z8/
	xzpzX73Jn9iqXB3dxNmTW4fvw
X-Google-Smtp-Source: AGHT+IHlu6/GC+A+RiCBx7oFM1gRRrMK6+30Wjlt3XNsXbM0ezmzY2fnfdid1MXma85FjlRr9GKT3Q==
X-Received: by 2002:a05:6214:238e:b0:727:66fd:60bd with SMTP id 6a1803df08f44-767c7013d49mr181451996d6.56.1758037850719;
        Tue, 16 Sep 2025 08:50:50 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::bb27])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-77f44157463sm45876326d6.2.2025.09.16.08.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:50:49 -0700 (PDT)
Date: Tue, 16 Sep 2025 11:50:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Forest Crossman <cyrozap@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: mon: Increase BUFF_MAX to 64 MiB to support
 multi-MB URBs
Message-ID: <475764c3-ac04-4a8b-8301-8f05c781eaf8@rowland.harvard.edu>
References: <CAO3ALPxU5RzcoueC454L=WZ1qGMfAcnxm+T+p+9D8O9mcrUbCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO3ALPxU5RzcoueC454L=WZ1qGMfAcnxm+T+p+9D8O9mcrUbCQ@mail.gmail.com>

On Mon, Sep 15, 2025 at 03:55:10PM -0400, Forest Crossman wrote:
> The usbmon binary interface currently truncates captures of large
> transfers from higher-speed USB devices. Because a single event capture
> is limited to one-fifth of the total buffer size, the current maximum
> size of a captured URB is around 240 KiB. This is insufficient when
> capturing traffic from modern devices that use transfers of several
> hundred kilobytes or more, as truncated URBs can make it impossible for
> user-space USB analysis tools like Wireshark to properly defragment and
> reassemble higher-level protocol packets in the captured data.
> 
> The root cause of this issue is the 1200 KiB BUFF_MAX limit, which has
> not been changed since the binary interface was introduced in 2006.
> 
> To resolve this issue, this patch increases BUFF_MAX to 64 MiB. The
> original comment for BUFF_MAX based the limit's calculation on a
> saturated 480 Mbit/s bus. Applying the same logic to a modern USB 3.2
> Gen 2�2 20 Gbit/s bus (~2500 MB/s over a 20ms window) indicates the
> buffer should be at least 50 MB. The new limit of 64 MiB covers that,
> plus a little extra for any overhead.
> 
> With this change, both users and developers should now be able to debug
> and reverse engineer modern USB devices even when running unmodified
> distro kernels.
> 
> Please note that this change does not affect the default buffer size. A
> larger buffer is only allocated when a user explicitly requests it via
> the MON_IOCT_RING_SIZE ioctl, so the change to the maximum buffer size
> should not unduly increase memory usage for users that don't
> deliberately request a larger buffer.
> 
> Fixes: 6f23ee1fefdc ("USB: add binary API to usbmon")
> Link: https://lore.kernel.org/CAO3ALPzdUkmMr0YMrODLeDSLZqNCkWcAP8NumuPHLjNJ8wC1kQ@mail.gmail.com
> Signed-off-by: Forest Crossman <cyrozap@gmail.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/mon/mon_bin.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/mon/mon_bin.c b/drivers/usb/mon/mon_bin.c
> index c93b43f5bc46..e713fc5964b1 100644
> --- a/drivers/usb/mon/mon_bin.c
> +++ b/drivers/usb/mon/mon_bin.c
> @@ -68,18 +68,20 @@
>   * The magic limit was calculated so that it allows the monitoring
>   * application to pick data once in two ticks. This way, another application,
>   * which presumably drives the bus, gets to hog CPU, yet we collect our data.
> - * If HZ is 100, a 480 mbit/s bus drives 614 KB every jiffy. USB has an
> - * enormous overhead built into the bus protocol, so we need about 1000 KB.
> + *
> + * Originally, for a 480 Mbit/s bus this required a buffer of about 1 MB. For
> + * modern 20 Gbps buses, this value increases to over 50 MB. The maximum
> + * buffer size is set to 64 MiB to accommodate this.
>   *
>   * This is still too much for most cases, where we just snoop a few
>   * descriptor fetches for enumeration. So, the default is a "reasonable"
> - * amount for systems with HZ=250 and incomplete bus saturation.
> + * amount for typical, low-throughput use cases.
>   *
>   * XXX What about multi-megabyte URBs which take minutes to transfer?
>   */
> -#define BUFF_MAX  CHUNK_ALIGN(1200*1024)
> -#define BUFF_DFL   CHUNK_ALIGN(300*1024)
> -#define BUFF_MIN     CHUNK_ALIGN(8*1024)
> +#define BUFF_MAX  CHUNK_ALIGN(64*1024*1024)
> +#define BUFF_DFL      CHUNK_ALIGN(300*1024)
> +#define BUFF_MIN        CHUNK_ALIGN(8*1024)
> 
>  /*
>   * The per-event API header (2 per URB).
> -- 
> 2.50.1
> 

