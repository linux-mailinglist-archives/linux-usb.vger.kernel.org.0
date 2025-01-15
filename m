Return-Path: <linux-usb+bounces-19384-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDCCA12D70
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 22:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 010FE165EA3
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 21:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347011DB137;
	Wed, 15 Jan 2025 21:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VRYOmMLc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B701547C5
	for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 21:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736975671; cv=none; b=p17jjDiVs/nmJ+vXnCO2Nb94NVQ6EnxfHJK80ZL1/1kEr2fRbbAIA7bTzRoRw6HJDD0xmWpJ0K4XC94z5D32cRIsBtTScD11iZePEw3Qsr55TKIm2zlc4Uusg+Y7MT+VHvQ14AU+07U8V1wVGim7oBDDMGmByxKautdIBav5pWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736975671; c=relaxed/simple;
	bh=vrrxo8HiiPKY/ALbdGOG+3UGWwNQlyN3pm2x2fkSNmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kzicHpyi2a7kSZ893BnBy1wAnRwrhp6oR65wf7iPn0WcPG80zrGwh4LVmpI568HE0l1cw4NHAz2CJ9Nfg0EkBfT65lQdi6smL96p5Mh1KvnNP7HVXWbWn2jsGInL5cNIbp0WdKoqSzK7Eb2zXEAmwWkzFpvX54Y7L2WeMC0QLek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VRYOmMLc; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3a7dd54af4bso692365ab.2
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 13:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736975668; x=1737580468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FzfMgKLvrqiiputvynaSoARnyM5qxWu52sQacdJxD4k=;
        b=VRYOmMLcNUa0ymhWEbYMre+TONH/gWFQEb2nfuVThSeD2Bybjsz7ffT3AGoqxDP5WF
         7qJBgUmfCGbHG/d3csHAB7YfqOYD5GxA+QAQQbXDIUvVdY97qsmAggHBzHInpLDMRb5v
         3JRtbIm0XqzQ+CUJ/mOv6SKT+18ZqNK2v6pmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736975668; x=1737580468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FzfMgKLvrqiiputvynaSoARnyM5qxWu52sQacdJxD4k=;
        b=ESVZOS8Nz8Xv54TPeT4vw2Grp256kvRe7DBcKP0audkuJvCr36BtLhQkCXBBz/jDRb
         knZQXRdfhayjkSu4sbiSxv26AAT430AWqwNC5YHhx7HFj+9tMyAnSnDDI7hVxRiW466k
         uy/eFJU7qkOrDg4z5pyz2FUf3A1GAto8TACjADWg3l2V74hdNZYKwHsW2vnmG/yrYKv4
         XlIdYK32jETmzCKM3HRQC7zGpOh2y3lmAqkD/j8UVD92JcvOdr1mq25C9ZgM+nmnFkxB
         LRDaXGdNu8gyx6fDA22gabV8xA5Ki6+fQ7Hg6qA9hilCP3hnjy3RpusIWUYL0iGZ9mLL
         cPcg==
X-Gm-Message-State: AOJu0YyR1cPmVOE2mchHEBMjeFryyXllxYSc1CWFZAmJqiXbXTZ3ntlo
	6Y/SVkyMl/QgPOa7n+IFxZP0BUjXTU/c5OLZXwUL/bISCBD5WM2VMLBa7wIlgWM=
X-Gm-Gg: ASbGncuSVgYmCfxow/DE62EkmMctyMhPt1oTOuvAHxt8l64w/Cj09J73bA5wavqBMup
	4v1qZa33NRC2aso7IoxS18Aio/LNrg9Zl8H/5s5FULaRpiXz4Enu9qSeFg17Llo1fOqSgrgmOjm
	ODjK/3clSZV/P5Adn5aNi3/TFMVZ6bEeDxjdn94MspyRmvlFmM3oG3YSCWKXDgigy1miu9lfasu
	DD/cMiranpzUTN+dPlNitaWWYBl35QHtgnvhcePkyaVBN8OLGlSBdMu1H1t96IYtkc=
X-Google-Smtp-Source: AGHT+IHaU3+g2ZDtBaHUU2KctM8WKXekirKK/9gJhB2Y/OuE7O3nHoFPshcXSrfr48VJ8r1RlYtBqA==
X-Received: by 2002:a05:6e02:1388:b0:3ce:7b61:588 with SMTP id e9e14a558f8ab-3ce7b6105admr65488075ab.14.1736975668288;
        Wed, 15 Jan 2025 13:14:28 -0800 (PST)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b7459e9sm4344948173.118.2025.01.15.13.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 13:14:27 -0800 (PST)
Message-ID: <507650bd-f1c5-47b2-8d61-31d50e4a85e2@linuxfoundation.org>
Date: Wed, 15 Jan 2025 14:14:27 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usbip: Fix seqnum sign extension issue in vhci_tx_urb
To: Xiong Nandi <xndchn@gmail.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "open list:USB OVER IP DRIVER" <linux-usb@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241231161539.20192-1-xndchn@gmail.com>
 <20241231161539.20192-2-xndchn@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241231161539.20192-2-xndchn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/31/24 09:15, Xiong Nandi wrote:
> The atomic_inc_return function returns an int, while priv->seqnum is an
> unsigned long. So we must cast the result to u32 to prevent potential
> sign extension and size mismatch issues.
> 
> Signed-off-by: Xiong Nandi <xndchn@gmail.com>
> ---
>   drivers/usb/usbip/vhci_hcd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index b03e5021c25b..f3f260e01791 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -675,7 +675,7 @@ static void vhci_tx_urb(struct urb *urb, struct vhci_device *vdev)
>   
>   	spin_lock_irqsave(&vdev->priv_lock, flags);
>   
> -	priv->seqnum = atomic_inc_return(&vhci_hcd->seqnum);
> +	priv->seqnum = (u32)atomic_inc_return(&vhci_hcd->seqnum);
>   	if (priv->seqnum == 0xffff)
>   		dev_info(&urb->dev->dev, "seqnum max\n");
>   

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

