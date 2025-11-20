Return-Path: <linux-usb+bounces-30768-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F0DC71E8F
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 03:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 4A53229A1A
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 02:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF062F7446;
	Thu, 20 Nov 2025 02:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Jh0WprxP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493CC2D8DC3
	for <linux-usb@vger.kernel.org>; Thu, 20 Nov 2025 02:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763607589; cv=none; b=K+fawpJeKnWeo6nS5MwVuG+5eus/4l1NjjRMudAysTB5RuCiNz5StFEJ/eSxLS+V27kB+o3wdOzVOSqIkMYaM37JYspVs6WM9u3bTExVO2OaO0L0bamDNEypx8LKLPi29KnfP7y9wBVcB9V2N13SI+Mhg0dUiHXJXSEGROjj3X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763607589; c=relaxed/simple;
	bh=mJ6rSLRJjyPFehPPpN0MOSV2xZt4Vj1w9DGc50/dr4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEbQDBMOGAiAdJjvyr4z81/jrrRQshkrgs+SONiR1jYjDhBXuKZxgxTk5T1V3oBguotM9dArtQIyspbYa2IVGpGkhpQXiBmY8wuyQBVzX4SxiuoKj9RQE5HokljUpGkWxiuoH8k/N/e0QKJac6Ese+H41kmNKdgk4FNa9GYSfmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Jh0WprxP; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ee1a3ef624so2820471cf.0
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 18:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1763607587; x=1764212387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hg5aoV0EVn/WBTa/GLeR89EBuuTKQBaW9rd0EBCvO1c=;
        b=Jh0WprxPSZY/M7TMX2Zd0l4dUSwKubKad2BrGmAdn/YqS2v5HDlzqdDKtTYiB+s3Ux
         Li8TtvpkNDfFVLSWm92Zlqor92K3AJjYRk5UBF3EcisRMEG/VaPEJs4ojMI2QqWNJ2Pc
         tEI2WA1qkxwJhoqJg2pfz/HWVsG7gypU7ypcPAVlyEeQ0u8XZ3s1dZo20jR9MwM/lqV3
         WcpYiAtrboKfnc+Z4Wv4H0P6c5gYdsyOr/1/4wF15CAiGqFFUlTdbqVrcMRyBu91VITT
         YvTiKXwHNKwO2mpPms2oboGO5EhUM5aV6nMt1tlgeyyXtiqHS/nk1xrQjEuMiJI67wBN
         bh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763607587; x=1764212387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hg5aoV0EVn/WBTa/GLeR89EBuuTKQBaW9rd0EBCvO1c=;
        b=LDvto+H3RZeHroLnGC/9ZG2SBfdHy7kZdOzyvwAevuMMjcxoaR7ZJBAowHxrvGvx7W
         K5+GtT1b3mFV3QL1qndoxVs/VV8sLpx5YJNYhLOvGYIIr2CU2gmffhjAsY3++M7DWZe7
         H1LSuDRDuJwqhr3TMQ1L+9Myq4A6balpwrk4ZvjmV2+guMGpdVAUUEuLMRqA2K/LxBBm
         +JC5XHgeKhnIBQW1jawRI091Tt9H4+IWE2ksGG0O4L+q4Tee4wax44a/5+eVyXzkklm/
         WNOKFuDXZsg6fh3PZHGPT4kv7+M/5o5L1AG0D9eZ0TXAkW+Cz/VpKO/aPm3wMNMOQH0R
         NPxA==
X-Forwarded-Encrypted: i=1; AJvYcCUwkDbDa6TpIvyllzvWqMVkazozg4Obowz81m7ZMa9dqGx68RemtUYnWnt10gwC08VEWLGmxcQksjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZxDAStgqeViu6mIK3/wovXio9mY2T9HygaT7BWvlS/lEnFZUf
	ViCzFUARb2xvBrZhSI3ENxmsKFJxOUm6C7KklN0tFppw37Q4HkrCXhT4w0cFoZBYQw==
X-Gm-Gg: ASbGncupk2/yGRdRwI1K53RYQZvHLQN3JFahe/iF0jpXyfpwAu2Y2bkr9h0Z1Mz1JI2
	6eYLaF6wq2eJ9QcZXf291OTP2OF0MKqdApyhFuqT3JZ35oPUozM6IKKg6z4i9Br0ryih47mMyQm
	3BPh/2NnH0YAvtsv29U7O+sjbk858hM8gMkn40b8kumiUBtfB0yeVOUjEI0CZSxW2ARqVcGDR7F
	IYq4r+Kt8vK/q2/ua/3+ZuZ2WOzqNypwnuM9UA8SIFT9JvwYIxF6RmeUdsu1r+nLqgRzY3w0Haq
	4vCBtCTZwBKJcTL9lcecFnx3KxuSz4nSaJMEav1H8ckZ4NUwWlrWb8zWjTCqyasf7hcqms416mD
	FLn3B8kLOMv64GW9dK3BlRmq6hDXbvWXRBUIPsQ7W7sg60VfdN7MGn8r2L1Z4jtVpkTkmFnp+hP
	p1y1gpdv6j5eA8
X-Google-Smtp-Source: AGHT+IGA+dwSSxsq02AcHqmBlz3CVN3Av8o92KGu6tfzv0Cno0N6MuymXHzWKF5QrlQn2ae2vPgchg==
X-Received: by 2002:ac8:7d53:0:b0:4ee:4512:4a24 with SMTP id d75a77b69052e-4ee4970ab4bmr25490311cf.72.1763607587087;
        Wed, 19 Nov 2025 18:59:47 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7632])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e599ac9sm8674486d6.49.2025.11.19.18.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 18:59:46 -0800 (PST)
Date: Wed, 19 Nov 2025 21:59:42 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: david.laight.linux@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 28/44] drivers/usb/storage: use min() instead of min_t()
Message-ID: <4208129f-a768-44e2-843f-309c50ea362f@rowland.harvard.edu>
References: <20251119224140.8616-1-david.laight.linux@gmail.com>
 <20251119224140.8616-29-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119224140.8616-29-david.laight.linux@gmail.com>

On Wed, Nov 19, 2025 at 10:41:24PM +0000, david.laight.linux@gmail.com wrote:
> From: David Laight <david.laight.linux@gmail.com>
> 
> min_t(unsigned int, a, b) casts an 'unsigned long' to 'unsigned int'.
> Use min(a, b) instead as it promotes any 'unsigned int' to 'unsigned long'
> and so cannot discard significant bits.
> 
> In this case the 'unsigned long' value is small enough that the result
> is ok.
> 
> Detected by an extra check added to min_t().

In fact, min_t(T, a, b) cannot go wrong as long as all the types are 
unsigned and at least one of a, b has type T or smaller.  Of course, in 
this situation there's no reason not to simply use min().  (And if both 
a and b have types larger than T, why would someone use min_t() like 
this in the first place?)

Regardless, the patch is fine with me.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> ---
>  drivers/usb/storage/protocol.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/storage/protocol.c b/drivers/usb/storage/protocol.c
> index 9033e505db7f..0cff54ad90fa 100644
> --- a/drivers/usb/storage/protocol.c
> +++ b/drivers/usb/storage/protocol.c
> @@ -139,8 +139,7 @@ unsigned int usb_stor_access_xfer_buf(unsigned char *buffer,
>  		return cnt;
>  
>  	while (sg_miter_next(&miter) && cnt < buflen) {
> -		unsigned int len = min_t(unsigned int, miter.length,
> -				buflen - cnt);
> +		unsigned int len = min(miter.length, buflen - cnt);
>  
>  		if (dir == FROM_XFER_BUF)
>  			memcpy(buffer + cnt, miter.addr, len);
> -- 
> 2.39.5
> 

