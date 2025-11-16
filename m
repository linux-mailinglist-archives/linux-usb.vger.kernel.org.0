Return-Path: <linux-usb+bounces-30533-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 026AAC60EE8
	for <lists+linux-usb@lfdr.de>; Sun, 16 Nov 2025 03:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 891544E2594
	for <lists+linux-usb@lfdr.de>; Sun, 16 Nov 2025 02:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE10221DB6;
	Sun, 16 Nov 2025 02:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="dVR64hPW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4581E4AB
	for <linux-usb@vger.kernel.org>; Sun, 16 Nov 2025 02:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763258568; cv=none; b=rRo+jTPv6w46eREfHnwqywY/ty6Wp+M8iNb3QD4JKy8PsDvYwZZUcvv3cquhBAVU/7UvEdltZeXs/eb8Q7arFC0HwKHoWWlgWKBHjVdxUBWGpwlbV5SeF0aMfOFT1FWx+QtjZ55u83NyV3My1ZEPK10/VLZZmH4onZLr4QqSsQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763258568; c=relaxed/simple;
	bh=ix3L74YT5V67SxQcvcSjcHCLWXPN7DwdUDzu7JUwpac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H54b5DFuKNCCZOBNH2RoY3XJwLbCG/iiDizH7isqPsy1LgEi5HhLx2Xq/HzbmRSM3kmHUh0e3N2+TMb+uvt3D9bpM7qoMXIqvsUqSTv87cxPoWnkODSTFpXY0NNfvtK394YkCretrd2q3qjHjv8X7Qw+0LBWq8OEZw/4rDZVqCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=dVR64hPW; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b21fa7b91bso307514285a.1
        for <linux-usb@vger.kernel.org>; Sat, 15 Nov 2025 18:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1763258565; x=1763863365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pkXB0RiOx00wRtlBivyr40k1pXaqD5wN/4yTU+LCQbk=;
        b=dVR64hPWX38dH/Hbc+t3ataLS/k+ldyJ+MI9ha15l6pP3qxcVgApW4nfx7tKqUMKZ+
         g7xEkQO+yyZzc/nNISsG948Iy2oWBSaniDnDO+T1j6s0FBQwP88r/xAAR1Bf0AR3YzUw
         WCOGMBkJUd7BakVQItkRFx2cSTZb+FqkcfqEEI1clsgCAeZYK/3YcO+t0Y96mFxtUCo+
         yh0ePFBLnehTKv6EbKfL82PuLXNIaeV5ps5zY+OLQbXIvg9UT7hLcSl9nSfpzAE0W6l9
         fsbu2mRBLwJO75W1w1a48fGTTALubjV5iZ4aa9xcJWYs2mP0+7mbCOuWTCBaoKqxvKV5
         ZznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763258565; x=1763863365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkXB0RiOx00wRtlBivyr40k1pXaqD5wN/4yTU+LCQbk=;
        b=L2LowbUq6eAyb6aXaK5H2d1MMSdJZ6hoQk1o7fGvJM5ho4EOfOFz5ZcxixOrKAh5jA
         IFHCX+XUBGdxDIA6Gz01StdVV8NxOlCT6Eg3NPaIzmXHPRwveXvuRMn4/bfbjjB8Lmf8
         AxHRSTbhLhYJE7xgHS3mex02I04Pm5D13Qcrb4EVJaEOvMFZZ03Cjt8mNsLrkZI2tjFi
         QWakMCDM9RXX+v+x1Q0mym9Hnls0pQj/iampjbBJc3bhjqGGA5+Gd8/Yb4i32nz76Hdn
         q0Mh9TuxPfTHXgkIlNQS+7ZlKipCWXqFdyNYzr8MrtWX+E8KREhODILXufvnWG6u4Dr2
         ZX7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVu0gQz0M0mCjPLtyDxCvTUeoCwmfBfSq2EnVltOYPRVoEEg6cfkBN2mAoDZYD7gSjnaw8gCZXIZjc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfe3zfIDijSi92btbAwXoPZ0rRNKJe7aKf2ea77kTtq5IU2ThY
	rEXZKYgFVGj4qb9Mi65jGZleeY9neEI7cMze8hUx5gqsDMtnQ5JH15VTa5fuig8DFg==
X-Gm-Gg: ASbGncsyDsdIfq6H/tHFtEk763hvEPzLZ1Gy9EAe7Xcjei2yZKluZG4j/r6WnYTWtIE
	20Dw/vwrTp+YpprKzr7k6CKMGUndzgDToRDTGrRkhxYtx5ku4rVfa5qWLl8NgDuLq44HcIO4gtf
	WodKHuLSOka4pEUGXh4zHr3/dJZhI3/JzAQjj+aL0vk1xQ8FjlTOWvLxzaeVFfBfNYHzajoHv+t
	AqXXo3EcEfoNCv+bBhcyeTqZvchRJUK6p4QPFCxs0m8RVvSb7BS7Yqhk1fb760kZEdHHmpkeEpA
	HONdYv8vmbH3Grx/UMc6OJRLGPIVBz1LAuwe67/LFT6AQMk0K1Pg0X3fC3JFVxNk1DIxAtoIfxQ
	WiHtNYB89CTZg1nQK0oOFGgm40EfD3UMeOi/ZHyV2L5eAwIDi+Z2M4BLglegNU8cxGRw7OgRisw
	Ddgg==
X-Google-Smtp-Source: AGHT+IGadHCqqKWDl62JvuYVsXnkpYDC3mZv4xvz6u4dz1J6qc7Ey4fFE9duNHKyg1jQsybJWUGC9Q==
X-Received: by 2002:a05:620a:1aa5:b0:8b2:5649:25ef with SMTP id af79cd13be357-8b2c31585a3mr1026069885a.21.1763258564892;
        Sat, 15 Nov 2025 18:02:44 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::db9a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aeeb4afbsm659488785a.14.2025.11.15.18.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 18:02:44 -0800 (PST)
Date: Sat, 15 Nov 2025 21:02:40 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Ma Ke <make24@iscas.ac.cn>
Cc: vz@mleia.com, piotr.wojtaszczyk@timesys.com, gregkh@linuxfoundation.org,
	stigge@antcom.de, arnd@arndb.de, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, stable@vger.kernel.org
Subject: Re: [PATCH] USB: ohci-nxp: Fix error handling in ohci-hcd-nxp driver
Message-ID: <69b9818e-7db3-4c2b-80f2-29b8170a95eb@rowland.harvard.edu>
References: <20251116010613.7966-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251116010613.7966-1-make24@iscas.ac.cn>

On Sun, Nov 16, 2025 at 09:06:13AM +0800, Ma Ke wrote:
> When obtaining the ISP1301 I2C client through the device tree, the

What if the client is obtained not through the device tree but through 
normal I2C probing?  See the isp1301_get_client() routine in 
drivers/usb/phy/phy-isp1301.c.

> driver does not release the device reference in the probe failure path
> or in the remove function. This could cause a reference count leak,
> which may prevent the device from being properly unbound or freed,
> leading to resource leakage. Add put_device() to release the reference
> in the probe failure path and in the remove function.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 73108aa90cbf ("USB: ohci-nxp: Use isp1301 driver")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/usb/host/ohci-nxp.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
> index 24d5a1dc5056..f79558ef0b45 100644
> --- a/drivers/usb/host/ohci-nxp.c
> +++ b/drivers/usb/host/ohci-nxp.c
> @@ -223,6 +223,8 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>  fail_resource:
>  	usb_put_hcd(hcd);
>  fail_disable:
> +	if (isp1301_i2c_client)

This test is not needed; there is no way to get here if 
isp1301_i2c_client is NULL.

> +		put_device(&isp1301_i2c_client->dev);
>  	isp1301_i2c_client = NULL;
>  	return ret;
>  }
> @@ -234,6 +236,8 @@ static void ohci_hcd_nxp_remove(struct platform_device *pdev)
>  	usb_remove_hcd(hcd);
>  	ohci_nxp_stop_hc();
>  	usb_put_hcd(hcd);
> +	if (isp1301_i2c_client)

The same is true for this test.

Alan Stern

> +		put_device(&isp1301_i2c_client->dev);
>  	isp1301_i2c_client = NULL;
>  }
>  
> -- 
> 2.17.1
> 

