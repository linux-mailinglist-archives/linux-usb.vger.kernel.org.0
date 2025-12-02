Return-Path: <linux-usb+bounces-31108-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7EFC9C1C9
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 17:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB28F3AAD18
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 16:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89C8283FC5;
	Tue,  2 Dec 2025 16:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Dpn9Jq1/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6245279DC3
	for <linux-usb@vger.kernel.org>; Tue,  2 Dec 2025 16:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764691584; cv=none; b=bcM8yUf7ceJWIO4B1SkJqnW41y6lfnQ2N3rbAcjkfMiNz3/w4MtA1o4Y0BraWaNU8bxFn+46fZ3RnPtA+9JrOkLawjKhzA8Ep5f88IwDR1Jo8bci5mCmvPm2HChohlx8+Fqhw/vNvG/5n4VvvUm8BSZ3LDycjZT7yd3rkz+6gs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764691584; c=relaxed/simple;
	bh=hRVWkKKp59NmZFK8jXGmcZ8h0K5vnTklthsPUBOIqDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMQiq3iUawwRSrONwWohdP6hcILxMuvui+Fe5Gdcc2hI8XLAb+hpsPDHikJSENephc3ARt7WqilEmk6KKyfCnA/YmYNJRD1FcycwhdPsHYF6Hkq1EKEKoSA4YG7O+C6YFqyL2QnCS0cUIed41dwsHG03SECT6yiCssfTJbgfHGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Dpn9Jq1/; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-88056cab4eeso38326176d6.2
        for <linux-usb@vger.kernel.org>; Tue, 02 Dec 2025 08:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1764691581; x=1765296381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pd8R4cPblcn8x1dGw4CK5Diypq5CsDp+VkpqLG69S7M=;
        b=Dpn9Jq1/2N89iheFIsYoV/9sxx+zkEUMKHmYVsYcyOarV+nyjwe2mBb/50IM26yOoq
         xzUJANRQ1sMNcubKwythSLKqCHzzOiz62sgK1BKuOXVpCSfvmgmvO6hw2jLCOxDEXka7
         o79Mk6T3qDLzfpS/mbjiuy4F50DKU0VVRQU8GoSp2mzDOmgQ1C9/FmUiHWFPvvPNcLZt
         ISWy623x2iH45H93QXq7eaX+oOPThJpBiNbwJjfPJVh3qQhSrYYJjKjWB2UnKDdBnJ7z
         vQnAEua/Ydon1gp/RLc/CoR5l/CVGYWnTDhaVE2l9wWj+ESN7aTw5qC6nusnjBSw+Ejz
         yeqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764691581; x=1765296381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pd8R4cPblcn8x1dGw4CK5Diypq5CsDp+VkpqLG69S7M=;
        b=pFr2Zopu6FBJ7yLp7k0KUhUNQr2Dfbd5bObl0zT/2Kn87wPqJ6GjHuLPb6rqwF02kx
         FuY0s6y77FUqFmLcSfmMtBfrArHBzIdLIlLUq0tVcB5a7EaFT4h/MlZ096HNqIYAj8St
         k8DCocjtxM0bZrdmIUCIla0ETRV8NC6cslhMf+gODKGLql3Wx4CywJNGtezKFpEKdYGL
         Bhuv/QWMJ9Q7m0aXo38bMeYqNkPxcyx7ebAThL2MortY0OcT6uMc3Q+yIC0em8ty0rm1
         enhWYU7dOM6cEByi72Le4GgViPdPtI+9SWpfS9o52OGtuyXyK3zKDsqU5GxuMWNRhL4D
         H3MA==
X-Forwarded-Encrypted: i=1; AJvYcCXMKDyTANEdqwT6bgeKAxxZcCaTRZN3dIe2TDQbON2ra/qAyONxc90AIn96mVCZ7lXYkX36D+2BlSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD2VlYM4h8jGLNo7qbNaIf6DpRwwnFC55D0pHNQbQtrJIxyhh/
	7adBwIqAKadNGNAVZvHgtjo4TIv51TfsoR0BBIpFVSyJ3HtQcPEzsNXSV5S4DE6qVYMhe/r/aSq
	vgehOVA==
X-Gm-Gg: ASbGncshaCxjs9a1mh4O4euOraZflefWxrQnUJ0qnXRraMRrrIbnuPs75uKc/+uzfT/
	Qf8NkwaeRDSIttQyzFLWO2uxYek6BLlUrRy24wsufNI2j9lRg+HTPOmr9D7esWew2acD27Aen45
	3Y8bqNNgqLAv3/t+fLLj8Y9s6w3Tb02epulT9RvV5EOqW7cucrZl4NVQN6CqrEOMltlrIs+9yDu
	GKG8tMn7L54GZT6T9T/r3JHKi7lM3HnL327G5TSsxkP1otPL72Pl5K72HQy/sgXDJpGu6wZ4xrh
	Lg/RGYaKU3gq2TSdxDJZs3Ds03wqxjVB0B5vzNj19xyw02gMBvqhj14HHcVkVJnS9bn9BBoNnX0
	jkeNGxmDnuj1DLDDKA1COX0ys57so1uSKX/8nbBOvk9O/2Kwc3bQJbzRI7bs2BuBbHLc2UvlEHS
	WuRjzG2zJ0Mqbo
X-Google-Smtp-Source: AGHT+IFclB4EP/Z5lz3eKT0PSFCuE0wWtZBHnRX4fJbaXRTF0xRPyoaRR/vasJphv/0k26iCjaH4Mw==
X-Received: by 2002:a05:6214:5993:b0:880:4f55:4af5 with SMTP id 6a1803df08f44-8863aff2dcemr509596036d6.52.1764691580793;
        Tue, 02 Dec 2025 08:06:20 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::eaae])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88652b49390sm106810306d6.32.2025.12.02.08.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 08:06:20 -0800 (PST)
Date: Tue, 2 Dec 2025 11:06:18 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Yi Cong <cong.yi@linux.dev>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, yicong@kylinos.cn
Subject: Re: [PATCH v2] usb: linux/usb.h: Correct the description of the
 usb_device_driver member
Message-ID: <d0271706-28c8-4515-b3b8-6b2dfd6b09f8@rowland.harvard.edu>
References: <20251202090948.334809-1-cong.yi@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202090948.334809-1-cong.yi@linux.dev>

On Tue, Dec 02, 2025 at 05:09:48PM +0800, Yi Cong wrote:
> From: Yi Cong <yicong@kylinos.cn>
> 
> In the current kernel USB device driver code, only the name field is
> required to be provided; all other fields are optional.
> 
> Correct this part of the description.
> 
> Signed-off-by: Yi Cong <yicong@kylinos.cn>
> 
> ---
> v2: update commit message
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  include/linux/usb.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index e85105939af8e..fbfcc70b07fbe 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -1295,8 +1295,7 @@ struct usb_driver {
>   *	resume and suspend functions will be called in addition to the driver's
>   *	own, so this part of the setup does not need to be replicated.
>   *
> - * USB drivers must provide all the fields listed above except driver,
> - * match, and id_table.
> + * USB device drivers must provide a name, other driver fields are optional.
>   */
>  struct usb_device_driver {
>  	const char *name;
> -- 
> 2.25.1

