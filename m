Return-Path: <linux-usb+bounces-22769-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35011A8190E
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 00:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5852C3AFB82
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 22:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124C02561B6;
	Tue,  8 Apr 2025 22:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Lu7MxIAK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9142D245024
	for <linux-usb@vger.kernel.org>; Tue,  8 Apr 2025 22:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744152869; cv=none; b=r1v6yohfiADxoyoucvYmXa9BjVKeIpRYtSfOR9jrdX/7Fb7A8pxsHeGFjYU0K3WZcQ3U4v0lVLBIa7Xb/TrT2l//UIfLgfO1Y2SK8bk4PDEdkjpXTEOfWCM+fQwm0mcEl23OTsMLXcs6B9ANN5m6LBRwkWiJWQPXKaw2Sd7wbfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744152869; c=relaxed/simple;
	bh=J2CDvDN+jqzXzi1yPusxXrH3ULFQeb2EMfoZSTLHzLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bapIVVbADpwXWTl6VSpp0v7JMSMtuExlAK5/rgXv4VDJQRUJGv6WEMlO2rLcvhXynXPX2xtGyLxcVObMlmkTsi+NEMhwNIvt331VSR86av3ClzSG6PjGOS/hlWGD5ZOW1t+krYAqg01ZSJIZzNaw1Ed5LpX6Lvffzi8fnoWJm1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Lu7MxIAK; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-85e46f5c50fso155667239f.3
        for <linux-usb@vger.kernel.org>; Tue, 08 Apr 2025 15:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744152865; x=1744757665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O4u+uHbYpd56jQ75uyWCLwOdDC6xzBcEAv4IFYv/TvA=;
        b=Lu7MxIAKfG/tcadb65sUGl+vyidWbyyBVKwqXipfVN+ZrpiLldxk0OdrW+4MLOEA7J
         /BjWUpUKNm12ddtj6JlOgWeBE6IBomyZt0X+q3SmgI0llMTYLzgO8vh+t3CyEA5YR7dT
         3j/QFpklNUtvOG3dbMSryfcxPakA3ryvNRH28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744152865; x=1744757665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O4u+uHbYpd56jQ75uyWCLwOdDC6xzBcEAv4IFYv/TvA=;
        b=uL39t3jQ7xk8VAiI3N1Q6+w5B6HAdu28aUQ7ZiRksjBi7snVA3gkikjaliwgiF9Hdz
         asavFztD+oyIyiAN7xh6ByIOkWdX2VOFCVieyZt4Ra7kDPntFdWpY+FkePOMGOzVnuyG
         I4QkvKFSfhYrUhZm8Zyvdkcvk13FmH0uFEtYriyc/u/Du8lPt7Z9FcWBr1P48vEKq3iG
         Iecf8rNKUiFCzbWOxb0bVBUz8wzyWb7qhpkKsvbnyi+9eJv8CtQOnmk2UmwiQ8CqzJ15
         8Lt1NDjeRQlEZazujb6NByNcNlTdKmQDByruRbLOOvYj8IxWVZFNYnP70uHbRt3/Anfk
         UTqg==
X-Forwarded-Encrypted: i=1; AJvYcCUwhTalUYnVI2PrBpyjKC4Mk/9ht1VzcQjJcSFKp+BgGpwa6laQvahEIld5yH/FHqVqHpS9Cot42EI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR5XOik2Aw3clfRDzL1rAEPSr5oq4X6KtbZ5dnm+6XZf6Ntk4S
	KlJCvXlP2nJimP8E/5QjB7XJ52rW4KAT7PnKWcgf4WM7AOapeqsg6DuNKHJ3ccI=
X-Gm-Gg: ASbGncvRYR1XnEXuehNPqYvi1vcehEG2+tIZWe7gSFPbysqFTMJ+mHt8akT2toUnMJK
	dWOZNiRAOjCbm6MbY7cTqVeW/DFOEswWpi6wffBMdjN38EFT9JZD3QUEotwKvYQjwpI+ixHzqYu
	bcqwCxe+CCn+TmJYVEDQ3EepAx6hgd/7F/wR7U4+fA9PU54YlTYkGGuxSevHSEGMxbhK/Ns0FGw
	Xn5W00HUjgH/VTU81KdUntirqqO15ryk49B9g305Rchau/sfaRgsgvPlvM8KhpMaWapllVFGqnY
	XWO1qjsgqEi5LyuF+MJvzD88EUpVBLCb8A7kk8dWM68EU8whW401Duk=
X-Google-Smtp-Source: AGHT+IFfPoJb4vdcOemp+ouDZhEEwgxl3/HoTYOaWV1UhL5oZ8jHQZhPCV559v9JzkSlUJ58yn1X9A==
X-Received: by 2002:a05:6602:720e:b0:85d:a02a:f13e with SMTP id ca18e2360f4ac-861611bb5demr144005039f.6.1744152865637;
        Tue, 08 Apr 2025 15:54:25 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f43bcce7sm710192173.6.2025.04.08.15.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 15:54:25 -0700 (PDT)
Message-ID: <3e1f8fab-0155-4ff9-800d-5fa9df88c48c@linuxfoundation.org>
Date: Tue, 8 Apr 2025 16:54:24 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: Fix the error limitation on max_hw_sectors for
 usbip device
To: Zongmin Zhou <min_halo@163.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Zongmin Zhou <zhouzongmin@kylinos.cn>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250219092555.112631-1-min_halo@163.com>
 <88b2fb4b-96a4-4d29-bf92-4064d3572fa4@linuxfoundation.org>
 <5a41d6c3.8c78.195371996e0.Coremail.min_halo@163.com>
 <247c7e15-bbff-427f-8315-ca463f8b933b@linuxfoundation.org>
 <4d4035bf.26b9.19556dcc23d.Coremail.min_halo@163.com>
 <c49917d2-5157-4878-9866-be6053b5124d@linuxfoundation.org>
 <6d47fef6.9eef.19565c308e5.Coremail.min_halo@163.com>
 <803b43c6-9aab-4380-9753-fd2efa8061fa@linuxfoundation.org>
 <7e9db4d9-0a22-44b4-a981-0de25d6a2aa4@163.com>
 <99a8b726-726a-4e26-bafc-9ff2b1e4d7be@linuxfoundation.org>
 <6b970291-c9f7-4a5f-9b82-210a3c4d2739@163.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <6b970291-c9f7-4a5f-9b82-210a3c4d2739@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/2/25 02:34, Zongmin Zhou wrote:
> 
> On 2025/3/29 05:14, Shuah Khan wrote:
>> On 3/13/25 04:02, Zongmin Zhou wrote:
>>>
>>> On 2025/3/11 00:49, Shuah Khan wrote:
>>>> On 3/5/25 03:03, Zongmin Zhou wrote:
>>>>> At 2025-03-05 03:45:28, "Shuah Khan" <skhan@linuxfoundation.org> wrote:
>>>>>
>>>>>> On 3/2/25 05:37, Zongmin Zhou wrote:
>>>>>>> Dear shuah,
>>>>>>>
>>>>>>>
>>>>>>> Yes, I agree with you.It would be better if there have a more simpler fixes than This patch.
>>>>>>>
>>>>>>> I can just think of the two possible solutions that mentioned before.
>>>>>>
>>>>>  >What are the two possible solutions?
>>>>> 1. The patch we are discussing now,have to change the API between the kernel and user-space.
>>>>
>>>> 2. Simply set vhci-hcd dma mask to 64 by default,just modify the vhci-hcd driver. Then dma_max_mapping_size() will always return SIZE_MAX.
>>>>
>>>> I prefer option #2 - What are the downsides if any with this option?
>>>>
>>> If set vhci-hcd dma mask to 64 by default,I can't predict what will happen when the real USB controller support less than 64bit?
>>>
>>> After all, the data flows from vhci-hcd to usbip-host and finally to the USB controller to which the device is actually connected.
>>>
>>> the data is ultimately processed through the real USB controller?
>>
>> Sorry for the delay.
>>
>> That is the case. I have to check the code to see what the host
>> would do if it receives larger buffers from the client (vhci)
>>>
>>> However, the default setting to 64-bit is equivalent to eliminating the impact of
>>>
>>> the patch(commit d74ffae8b8dd) on usbip protocol devices, sounds feasible?
>>>
>>> I am not very professional in this field, waiting for your evaluation.
>>
>> We can give this a try. Send me the patch with default testing the
>> following cases:
>>
>> Host - swiotlb enabled and disabled in your environment to see what
>> happens when there is a mismatch swiotlb enabled case and client
>> side doesn't limit the size.
> 
> If you want to test swiotlb disabled mode, you can modify the kernel cmd to force disable swiotlb:
> 
> modify the grub.cfg, add the swiotlb=noforce parameter to kernel command line,and reboot.
> 
> cat /proc/cmdline to check whether modified successfully.
> 
> 
> The patch set vhci-hcd dma mask to 64 by default like below:
> 
> ---
>   drivers/usb/usbip/vhci_hcd.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index e70fba9f55d6..fca3a4a6e94d 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -1345,6 +1345,9 @@ static int vhci_hcd_probe(struct platform_device *pdev)
> 
>       usbip_dbg_vhci_hc("name %s id %d\n", pdev->name, pdev->id);
> 
> +    /* Set the dma mask to support 64bit for vhci-hcd driver. */
> +    dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
> +
>       /*
>        * Allocate and initialize hcd.
>        * Our private data is also allocated automatically.


Please send me a patch I can apply.

thanks,
-- Shuah

