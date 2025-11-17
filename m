Return-Path: <linux-usb+bounces-30542-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3CDC62109
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 03:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 80B5A35ABB7
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 02:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A008241691;
	Mon, 17 Nov 2025 02:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="nwLFMWFJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A56A23D2AB
	for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 02:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763345571; cv=none; b=MP/0CB09qfKHLtpgygi5EnRctNqhsWXMEvxdSd31cgP9uWnqfMVAzCAFlBTThvY0Hjl0p+HRFLY+nSjvmTfvDMZ3kclTsE9qiddpA0W9JDvqPCDxha4CeQWKQZryob3gkzkJB7EDQ46spWze2hvj5UUSZDV0LlxSZg9qUGlv+bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763345571; c=relaxed/simple;
	bh=5GLZszpKtkmms3GbZx78rJHS969BKMO3S7W+AmR69Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rP2baI2LnC5VD4xCFaaNwA4pSShbcP5o4vWFTQe25vzBjKAtfnGsfFdYkHr4z7pRTLuQWH3L8ETdxXJFtXjeDpVD1vgb4CJe2CYqJpQkgFuyTj0TmO1ZAsQUKVTk0zKpBBFTUUQJvp0EXtSucELS0VB1MiUHYlBsR3ZkLJFlqMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=nwLFMWFJ; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ee13dc0c52so10183511cf.2
        for <linux-usb@vger.kernel.org>; Sun, 16 Nov 2025 18:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1763345569; x=1763950369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kiclg+ICV3isWwwDeMvQP4a8YD6UqUKW5pl+uehC4+8=;
        b=nwLFMWFJsHh8XI7WU8P/cK7ooC6NNKQ26LmFfGZvm+ihxiOaIDRSRpq8gSIT0vXGhx
         o7n9BLcNfYH0wCSxKPSErmbq00KaAY2WK+R2W47rbGXq15Z5mX7D3rIxpZ9gWcK2KGaB
         URzcZLOGSQLpXp8OvjVv60mpbqHnbS5ANHpSFWyiEiBtv4I2RLdVBJsbmsapijPFXgi/
         PBE3C8MaIRZUew7fmrbHhfukImiF+/yKgkwm7h5hKxP2bSWiIk6YBy78wnsP5GGrRKMH
         FhmD/Pnumo/7+AalbqTgE3RXsTfJ7clJyBCYsTT87VcGmpfDMzHe2eXHqg6emolWL1uz
         hOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763345569; x=1763950369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kiclg+ICV3isWwwDeMvQP4a8YD6UqUKW5pl+uehC4+8=;
        b=MFC4LMgqzkNr/bsXHwHVLl0Y94sbAiDqq9gecve6ugfy3E/uT1rlMaLeSTJ+P21r3P
         F9RfT3mdfkPbEaom+7d2LRZCgDaDEgpSpvlRg+sJABJV4TZJ59pKOReOFFihE1gWD/6T
         Jmn0rkwu6Gb+lX+XghXq8cIl1TL1pUIn+iw9SR8RGNGpNu0vBcbYdPfayTxhnAbdt2U+
         GS2ivHiqjxdoIGf+Vj5poPy1pxdxglSzD51fsC1lpqbs81E3mPQUkBU/pjoCv0jrJWC/
         LXJyd32Nqz0E+sK3u6sCT4r++gNeECerOfVyNxyWHnMRDgc/n4hJwsXVoxRVRLcEgtki
         7c+g==
X-Forwarded-Encrypted: i=1; AJvYcCVcJ/RtegllNfCcuejrbQWOJ6nM4eGWy0/R3k7GF77GOlMi6uLgUUocOOEakp14sOG15AJB+vZF4ao=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4oZqKLSxLpvu8ukjh8dqcMHggD4yEOURt6H89uuRPhYq3GBaH
	/LQyBztNnQRCPuvg5JMy0oor9A/e2MdG94zKF5l6gA3gPk84HLLkMHzhiODY3+wcTpNRkloD5gh
	ZIUW3cA==
X-Gm-Gg: ASbGncuRQ/Y/f1cCzLOtz+lfjyFEYp+Y8kA9H85+Ci0eASCkOlaYX4Hl75Cs3YKzd5v
	HFmsmuN0fnQ8gbyas78IlP/yL80zfdIQyqeIKTpmKgiw85Gmcgtjasb/fCG8F5g5GOEhe9Pfow3
	yYtJVv4EI7jW9YiK3dWtTBtYGZsLg3pyIsYjKa9IYaEXx8jc5UBhrn2zKWylePtO23j3QSbzDR4
	ThQlFrj1U7uccRXwvGVYRY9KlYxcEqXzwfKOrbwgYBzisxGBAjFFFbqpFQki3+3UgvA+YTtdUQB
	X3UuzZdF/IC7hXXCvcteS6Q3P/lyfzaA04X+dNZbTVcDUjBqYHYggtRmQqE8VvXyTI0IgyFaO/g
	XAnjgr/BmbGOMzQHaZLyeHHV3c/xWQqq8RdmNFOBsvHoJ0+IwWpsX8OfvxWA+K/sb1Jb+QZIbbh
	dmvA==
X-Google-Smtp-Source: AGHT+IF7aGO2MtqCmmlI9cMAEmYhFjVvHTERbxwvkt+rHOGTTynDRbR2K+xvEJ5DiSzvgQDHQlegoA==
X-Received: by 2002:a05:622a:18a2:b0:4ee:2510:198a with SMTP id d75a77b69052e-4ee25101ab2mr9280681cf.39.1763345568881;
        Sun, 16 Nov 2025 18:12:48 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::e258])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee16389879sm29098271cf.24.2025.11.16.18.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 18:12:48 -0800 (PST)
Date: Sun, 16 Nov 2025 21:12:45 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Ma Ke <make24@iscas.ac.cn>
Cc: vz@mleia.com, piotr.wojtaszczyk@timesys.com, gregkh@linuxfoundation.org,
	arnd@arndb.de, stigge@antcom.de, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] USB: ohci-nxp: Fix error handling in ohci-hcd-nxp
 driver
Message-ID: <288508e8-9d97-4c90-a0d4-ef6798110211@rowland.harvard.edu>
References: <20251117013428.21840-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117013428.21840-1-make24@iscas.ac.cn>

On Mon, Nov 17, 2025 at 09:34:28AM +0800, Ma Ke wrote:
> When obtaining the ISP1301 I2C client through the device tree, the
> driver does not release the device reference in the probe failure path
> or in the remove function. This could cause a reference count leak,
> which may prevent the device from being properly unbound or freed,
> leading to resource leakage.
> 
> Fix this by storing whether the client was obtained via device tree
> and only releasing the reference in that case.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 73108aa90cbf ("USB: ohci-nxp: Use isp1301 driver")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v2:
> - only released the device reference when the ISP1301 client was obtained through device tree, not in the non-DT case where the global variable is used;
> - removed unnecessary NULL checks as suggested by reviewer.
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>


>  drivers/usb/host/ohci-nxp.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
> index 24d5a1dc5056..081b8c7f21a0 100644
> --- a/drivers/usb/host/ohci-nxp.c
> +++ b/drivers/usb/host/ohci-nxp.c
> @@ -50,6 +50,7 @@ static const char hcd_name[] = "ohci-nxp";
>  static struct hc_driver __read_mostly ohci_nxp_hc_driver;
>  
>  static struct i2c_client *isp1301_i2c_client;
> +static bool isp1301_using_dt;
>  
>  static void isp1301_configure_lpc32xx(void)
>  {
> @@ -161,6 +162,7 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>  	} else {
>  		isp1301_node = NULL;
>  	}
> +	isp1301_using_dt = (isp1301_node != NULL);
>  
>  	isp1301_i2c_client = isp1301_get_client(isp1301_node);
>  	of_node_put(isp1301_node);
> @@ -223,6 +225,8 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>  fail_resource:
>  	usb_put_hcd(hcd);
>  fail_disable:
> +	if (isp1301_using_dt)
> +		put_device(&isp1301_i2c_client->dev);
>  	isp1301_i2c_client = NULL;
>  	return ret;
>  }
> @@ -234,6 +238,8 @@ static void ohci_hcd_nxp_remove(struct platform_device *pdev)
>  	usb_remove_hcd(hcd);
>  	ohci_nxp_stop_hc();
>  	usb_put_hcd(hcd);
> +	if (isp1301_using_dt)
> +		put_device(&isp1301_i2c_client->dev);
>  	isp1301_i2c_client = NULL;
>  }
>  
> -- 
> 2.17.1
> 

