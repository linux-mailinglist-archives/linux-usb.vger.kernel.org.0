Return-Path: <linux-usb+bounces-18711-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A759F98CC
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 18:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C32CB196236E
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 17:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CD421CA16;
	Fri, 20 Dec 2024 17:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MbtlogV/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1FE2EAE4
	for <linux-usb@vger.kernel.org>; Fri, 20 Dec 2024 17:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715491; cv=none; b=ocbcD024rQNxDYgNjNB6eL0GKHXTTgd+t+lXfZsElh1f6cny01nhNq3IPH8BZ+S2b0E0Cn6F4dZdF/Y5saOhfD6LQjC+qWWAm8adZtuVDxU9w0C6UjYvpMp0gbVXrbCbTW96pHHzFmtKRdggE7iKQdzDvWfidwqt1sMYKd+zxus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715491; c=relaxed/simple;
	bh=+LH2M0hABw/XbSzmqPU0B/RHxal9Zy4v6k1dwUIK3eQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pQvhf+DOOWnLeDLD48vT9XWRDrVI6Gb/tKt8v6Q6FjvpRLPfeiEgtnRLIO6AnGjhW4nJ/JWyKX+SuiloJS+SoeYeYtDDSTuTzpXFykhA/I3x/UHlPEUEeuFwbHJ89kKGXpoP7KgLmSBjxcbvogc5lbyR7SZtVBksJ7pJ6FfXT7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MbtlogV/; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-844e9b7e50dso184979739f.3
        for <linux-usb@vger.kernel.org>; Fri, 20 Dec 2024 09:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734715488; x=1735320288; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j38vt/XpcVWdcl2QmAo3tOorrADSnE5QVTrSNDpi6j4=;
        b=MbtlogV/JSLgN1wOovJEZ9bNWr7W/dUujZkqCCa/PVxuFk00KM3YEXM6+m67mXQFMl
         jjTXx1UGBjzB81sx553rc3wsj5VWSTK1GRSO3X26ViFh4Xgyy1Pt7A7ACzQ2pup94uGz
         wa3oOR4aE98lwk+jy7amn8YDtqWRwmEr2f+es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715488; x=1735320288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j38vt/XpcVWdcl2QmAo3tOorrADSnE5QVTrSNDpi6j4=;
        b=Y+on0MJPHLOxYnfsJbIasv08C20n0SXGywYV2LMfN7/p5zct3AEVteCsz6VJqh1p7n
         nNj4FT0tJGyTD0mFAqsy+3OSkIz026nk6TgikUtwjW5Mekl19r+DUb5w/DZzf5CFM8nV
         dkfJtahhpYWA3o0F8WNaivwjUQ/K+gjLnA094+GxEzx1mv9NQgQwuAb56d7+VA8luaiB
         88IrEa7rh2eg1/JkS9BrXkgq0lkiBeTdPw3nXwdoB4yElMlxrFIsCtcXFtygFFlRNd7Z
         mmcvLASILEvtG57/w2fjA3zT0TFli5v4FdKGKUUoK02JJ8PWKoybdYqvzpN2REYnjftC
         bd4g==
X-Forwarded-Encrypted: i=1; AJvYcCVfyOguIbamlKjFRtSjJsIDTT0XCAOjmfhYir5QA+3iWa+lO2KS68Dr4fD8IoRFuSRdool5NsYGajU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqhT2+p+JYJSF5Z/3r3Ftc8aEgOy+pMzD1mehf7nLA+yQCcO5j
	TO0N86BvssIN4Dl0A3VzidQQyBMHtOeCCyW5KzpOiKO/sgtuG0HRMrLX1PueLTM=
X-Gm-Gg: ASbGncukVgy+oMG0oFzTqIsUHJN+5XoHwvklyls5jtbptm7usmpnFD8Igx8AMr69lwO
	U74gjWTqpMrah77d7JQGAkXe2vRMM71F69U/EmMV/Ip5w6qfiRcE/P1RjzG5+Lu0SlDoaVQkw2b
	yK9pRky61LW/upRC4/i6Wqmol3ioljS33rmQVL5L3dZlKLbQ1M2udGopKKByXjUqf2lPhghkabU
	0NsfBq3Sl8O3xG1wckpK/Z7fqOPWtbto5gwRXQ24xwwws+Xys0gjJysDNqYb/IU35HL
X-Google-Smtp-Source: AGHT+IG35FpRjFcwGiGjtl8goLQhyJQACZ1XK4NCi1phrVJe+3EPlXjzft7epXBfOGmiMrVfoDzrxQ==
X-Received: by 2002:a05:6602:15cf:b0:835:4402:e2eb with SMTP id ca18e2360f4ac-8499e62b35bmr399083439f.7.1734715486974;
        Fri, 20 Dec 2024 09:24:46 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68bf4f36bsm871543173.32.2024.12.20.09.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 09:24:46 -0800 (PST)
Message-ID: <dd3bcf19-140a-411f-8251-38bf0c7e21de@linuxfoundation.org>
Date: Fri, 20 Dec 2024 10:24:45 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: Accept arbitrarily long scatter-gather list
To: Jason Long <jasonlongball@gmail.com>, gregkh@linuxfoundation.org
Cc: valentina.manea.m@gmail.com, i@zenithal.me, linux-usb@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, shuah@kernel.org
References: <20241218161344.202637-1-jasonlongball@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241218161344.202637-1-jasonlongball@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/24 09:13, Jason Long wrote:
> Fixes issue where memory will fail to be allocated for larger bulk
> transfers, ~1 MB or more. This occurs because userland libraries, such
> as libusb, send the entire USB data buffer when SG support is detected.
> The assumption is that the driver knows how to properly split the data
> up before sending it out.
> 
> By hardcoding a limit, bigger transfers that exceed the SG tablesize
> limit of 32 will be unable to use SG. This results in an attempt to
> allocate contiguous pages which, unsurprisingly, will fail too and
> returns an ENOMEM. It looks like other drivers that support SG allow for
> any length of SG lists. Accepting any SG size allows the driver to
> properly handle large bulk transfer situations.
> 
> Tested bulk read and write operations using the following devices:
> 
>   - Logitech Webcam Pro 9000 - USB 2.0
>   - SanDisk Ultra - USB 3.0
>   - Logitech M500s Mouse
> 
> Signed-off-by: Jason Long <jasonlongball@gmail.com>
> ---
>   drivers/usb/usbip/vhci_hcd.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index b03e5021c..2f722849d 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -1161,12 +1161,8 @@ static int vhci_setup(struct usb_hcd *hcd)
>   		hcd->self.root_hub->speed = USB_SPEED_SUPER_PLUS;
>   	}
>   
> -	/*
> -	 * Support SG.
> -	 * sg_tablesize is an arbitrary value to alleviate memory pressure
> -	 * on the host.
> -	 */
> -	hcd->self.sg_tablesize = 32;
> +	/* accept arbitrarily long scatter-gather lists */
> +	hcd->self.sg_tablesize = ~0;
>   	hcd->self.no_sg_constraint = 1;
>   
>   	return 0;

Looks good to me. We have other drivers that do the same.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, please pick this up.

thanks,
-- Shuah

