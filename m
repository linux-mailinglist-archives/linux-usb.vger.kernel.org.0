Return-Path: <linux-usb+bounces-16608-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 343099AD45E
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 20:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9EF3284276
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 18:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1851D31AA;
	Wed, 23 Oct 2024 18:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VpLf83I4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C461D14E9
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 18:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729709946; cv=none; b=l5PsK+KLuwoyYyVEZXIK/z2MQZ4icDmbN9Jeu4oMYs9/zBrmWFM6pW4QXmRY/4PR3d+/2Y0J58EBINkSlBXvu7BMd/6GPqDtXuebpUZOPdSr5ymQF772gg6gcyXIVSAseQIK/Un7cqwIw82nHWAhplUotLdE0QBABCKluhIATnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729709946; c=relaxed/simple;
	bh=rZAAAxHBiZ3/i9XGoNQT2Hfjanjk9R4Dig2qpm8BNx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kvha60v/g4hbG3hHhdC0CZEeiSVo5mqahJY9e/IKyZMd7g2QtRvVo/2w6gdSTiVoQGY0bqZVn8H4efazL19aYeHI1zobjHS+m7am0xR1AwEIYEi4g+bmHfF7tFuLHINLsM9H6LASf/ashpa4diJMI6EoBtG2SuqoTcaKLaG0CrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VpLf83I4; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-83ab21c269eso2787939f.2
        for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 11:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729709944; x=1730314744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wEYBu3Mwivbn6DlrCAkBS1rC3Gy/tlAoIzYDbA+rGsw=;
        b=VpLf83I4LVpM+DSHagprbsr7tk05uIeg/vISE+Sd0v9Dma0w9/PvIKx3vHCw6IBG1U
         zhKfpoUHvc/WUNh4fG4Cyliq35VixGUY+d2C/zxv+5qdbp66x++/HYLf53FYxuRkstea
         ysnsikrw8YS56bgiCituYL85AZUvfIHrNxJvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729709944; x=1730314744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wEYBu3Mwivbn6DlrCAkBS1rC3Gy/tlAoIzYDbA+rGsw=;
        b=dCVsXRPNQ2hPoofQdD7fVZKcIJQimB09FAmNwIKROMLs0+9WBinYxUeq5wYogZH4j5
         0R1HaBM0kaqEYDg8PYgnwmz/d7JO12Nj5VvqApc4lkrzbBUMz5WjrA8sywP3GUwn7g5M
         rF6qcYBSvo9A02vQ7GxQIckgo34HgDQ7VpAy5qB1pKS9atNIZbQA8MjCT18f2+KWCopb
         Xihb7KdGIUR/GNX0wEGkvivCNVCutRoc6gO4vdZ2tE3bnHIS3oP1RqRmuwTD7uU665sJ
         3J8H9VW8StVeRMvIZFz8bLhrC0cgNAfY/KCpsdq6FeE5xVD5QyhdWb7C2regwW6l1e1j
         GCHg==
X-Gm-Message-State: AOJu0YxTX0XMm/QNXUXFgS/e5gKmOShWqOK1+cmiHVrgPHI9JPt+Zkqu
	7lW/Y+JEchxz6K05XOfk7Lz3HRxTq2NgV0DZuHjxvk2dEg8cjCZ6GSekCk6/By0=
X-Google-Smtp-Source: AGHT+IFLjRl86O+KR7T+RGF9JDnmSXXgMoptpjwR6GxkN+RqDLV9/vSmSXgRKtp8C+VmU9O5ZHrG6Q==
X-Received: by 2002:a05:6602:48e:b0:82c:d768:aa4d with SMTP id ca18e2360f4ac-83af61a4103mr460548139f.9.1729709944060;
        Wed, 23 Oct 2024 11:59:04 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83ad1deff10sm232033739f.46.2024.10.23.11.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 11:59:03 -0700 (PDT)
Message-ID: <8d1a298c-78e4-4dfd-a5fb-5dd96fb22e81@linuxfoundation.org>
Date: Wed, 23 Oct 2024 12:59:02 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: tools: update return status when failed
To: Zongmin Zhou <min_halo@163.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org, i@zenithal.me
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zongmin Zhou <zhouzongmin@kylinos.cn>, Shuah Khan <skhan@linuxfoundation.org>
References: <20241022064856.4098350-1-min_halo@163.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241022064856.4098350-1-min_halo@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/24 00:48, Zongmin Zhou wrote:
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>

Update the short log to clearly indicate that this
is a fix:

usbip: tools: Fix detach_port() invalid port error path

> 
> Have to set "ret" before return when found a invalid port.

Give more details that detach_port() doesn't return error
when detach is attempted on an invalid port.

This is a fix for 40ecdeb1a1875
usbip: usbip_detach: fix to check for invalid ports

Add Fixes tag

This patch can be tagged for stable.

> 
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

With these changes:

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

