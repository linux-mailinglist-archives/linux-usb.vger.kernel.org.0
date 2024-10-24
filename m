Return-Path: <linux-usb+bounces-16641-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E13809AE868
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 16:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5A0428FC29
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 14:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEFB41FBF4E;
	Thu, 24 Oct 2024 14:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VBbRUG4B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4431EB9EA
	for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2024 14:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729779427; cv=none; b=JDoMqqYrKbwSQodnZOxvknl+AAUCiJSBraVwV1hm5xG4V4OqMySOmL49hHqo6R9OTq6G0GSmDxbdgsTlFPH+8vGaNExRmWsEL+XQTdPe6JXEk9ECs7L3XGWqUrSNf1sdI9ZE7n8e6CAA8xiwbLqbsh3vhNj8ZQd5O0OWmn6S5NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729779427; c=relaxed/simple;
	bh=ZHLpxCaABJIHGEakW/HkEnnmvVY3qa2023G4Rw5DXYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sq7SBm7uaUVI8Wt7YVMcRV+ag+jO/WkkYj9REc+4xtTbOzqJnP66363+RzawbVUROAEv9qd0mK/cAH9/ZsTBmOMxZvkNgx1XwcriIFnbSmPP57z6ey/ML4WG5gy0frwYe0aLcsPWvSJK+xY28u47rNCrcooH15YHkO/RzX50iiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VBbRUG4B; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-83aac75fcceso36979939f.0
        for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2024 07:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729779423; x=1730384223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b64qypICVOVPLQ4AT6WFJut9ohzO7ijv8p58Gwp22hw=;
        b=VBbRUG4Bvo1DmnzjypQFjM2b01McsUrTxuz3qJ23To/DYh2X+2426I+gaKTnh0lSTK
         oMoxXAjdohz0qro0tqFwyMd8XJWA8szSBJ21KNvT6FI97/Cbw+9KiE1O7QWT6bh1yYal
         uPKbYxVoOasNuohZSOqFxbyCv8fo5pwZHUdlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779423; x=1730384223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b64qypICVOVPLQ4AT6WFJut9ohzO7ijv8p58Gwp22hw=;
        b=pvpM4644uPYYw3avm1100agiLuQvJQw3pWyQ5czeYbMMH5M1t4sVPaJAqto4a0pK2O
         gyE+m2/pblp/vFi1WdF9pM6/84FMvUulI1RJ1VSKsCP2YkPWawlhyKgYddG1iYUqlKjn
         zDIk0FFxK877YoKDhs1skJdS8VEY2FHpJUy9bfsCzYwLCKzhoYX/vn/eXhrK/fZZiGDt
         83HOWSjpAbJrkwUZVQDH2X8DhbM2QOD0lnSKBg3kSt2YZknDk6oE6IAagSFAeqsEAt//
         I0cvdJtwRmF9QYiTgpQ6OpFw8tqA/fg0RrJ396I1Jj0aSuD8s50gQk/HXB7hhFgba+dr
         hkHg==
X-Forwarded-Encrypted: i=1; AJvYcCWGkdl+0+Mo5dHjHRIxm+bgWYFhEoCdb17Iojv4IAdcHJ98aRcerMqNVP15M57dbZPIOHDQ6OdQAaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGTSIvOM78Kuq4R+AU4H8UR6lmoLc/ROiE2v/GzH6e8iETvEpl
	JTR6lSOIuhrCe+u7fPAjATs5Habu24Jw43VkehNWjSzyTsagscWzB/mABaxWVQ4=
X-Google-Smtp-Source: AGHT+IG3V+qH2hGCoVjFpiCSG8OO5Klo/NaqFQGsT0YDjdqVv5Wth0Ol89M3HnkpPrHKa/QvmQmlpg==
X-Received: by 2002:a05:6602:2cc4:b0:82d:18d:bab with SMTP id ca18e2360f4ac-83af63f9e29mr745899339f.15.1729779423028;
        Thu, 24 Oct 2024 07:17:03 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83ad1dfb919sm271119439f.53.2024.10.24.07.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 07:17:02 -0700 (PDT)
Message-ID: <6b3bc049-4cc3-4d7d-a9b2-17d4132ebc50@linuxfoundation.org>
Date: Thu, 24 Oct 2024 08:17:01 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: tools: Fix detach_port() invalid port error
 path
To: Zongmin Zhou <min_halo@163.com>
Cc: i@zenithal.me, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 shuah@kernel.org, valentina.manea.m@gmail.com,
 Zongmin Zhou <zhouzongmin@kylinos.cn>, stable@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <8d1a298c-78e4-4dfd-a5fb-5dd96fb22e81@linuxfoundation.org>
 <20241024022700.1236660-1-min_halo@163.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241024022700.1236660-1-min_halo@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/24 20:27, Zongmin Zhou wrote:
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> The detach_port() doesn't return error
> when detach is attempted on an invalid port.
> 
> Fixes: 40ecdeb1a187 ("usbip: usbip_detach: fix to check for invalid ports")
> Cc: stable@vger.kernel.org
> Reviewed-by: Hongren Zheng <i@zenithal.me>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
> ---
>   tools/usb/usbip/src/usbip_detach.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/usb/usbip/src/usbip_detach.c b/tools/usb/usbip/src/usbip_detach.c
> index b29101986b5a..6b78d4a81e95 100644
> --- a/tools/usb/usbip/src/usbip_detach.c
> +++ b/tools/usb/usbip/src/usbip_detach.c
> @@ -68,6 +68,7 @@ static int detach_port(char *port)
>   	}
>   
>   	if (!found) {
> +		ret = -1;
>   		err("Invalid port %s > maxports %d",
>   			port, vhci_driver->nports);
>   		goto call_driver_close;

Thank you.

Greg, Please pick this up.

thanks,
-- Shuah

