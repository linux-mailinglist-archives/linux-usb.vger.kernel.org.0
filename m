Return-Path: <linux-usb+bounces-18949-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA54BA00102
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2025 23:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78553163003
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2025 22:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5BB1B85C5;
	Thu,  2 Jan 2025 22:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZhIMga2j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852F7192D87
	for <linux-usb@vger.kernel.org>; Thu,  2 Jan 2025 22:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735855614; cv=none; b=S9RL4Tv66V1Iv7p5HyG5tc9sK4vmLq3dpWHUS9NbHxMVD3oY7YYlZilldYIY9hsUJGJu1p3YEeXNheUVt5d/RUiJAzd/gWjSPEGzqSp5qNtUM117wLx9Mz4ZrwfANOfSHMGdhJTNWhGEmvpBePlICbiw3+bv8CV2WiOTipUTDOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735855614; c=relaxed/simple;
	bh=ZETTRJwWortn7dIPcMDOHABFRqyP9QOwkgg6QV7/u7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=grfOCxXkS44sbs3GLzGZ0m1CvdDYYEjdfXkqSAhs3m8OBQMGXBLxyhBAoQqtDwWklkIsP5QcbBcpXiT2lk43iVX5NQL0q3aASF94ELud1hxDaAB99PVZzcJS/nLuxWf5z0qAq9+Dt6wnkHV/NNXFrPg31LA7qDUo/BxHgrlNj/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZhIMga2j; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-844d5444b3dso440396139f.1
        for <linux-usb@vger.kernel.org>; Thu, 02 Jan 2025 14:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735855611; x=1736460411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhrqI4fwHJQZxCWiS9FVGkBs6IaEV0Wmqj+W+ex1WNA=;
        b=ZhIMga2jJXC1OoSm8QMopR3BcuyXcYbrcUduqyO4Wa1meYhUUuh+ly2Aq6YWvqGJHZ
         E1mA1pwEP45pvt4G0EHDatncCPuahc1RFz8fgIWj5E9xgOy9gznUcx2UZ+pxWnH7Vexs
         uRsGkqYoOo9ZlqjIDSvIZNX0yyjWkz7akgi24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735855611; x=1736460411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhrqI4fwHJQZxCWiS9FVGkBs6IaEV0Wmqj+W+ex1WNA=;
        b=J/Ahu8ZelCO57zNc5KGuPUVLRnHfTHP1l2scI1v709mOe667nNnAF6c1unSogHkNbx
         vgnlTsshPK87BhSk92zqebbBO9npax9V2cSjtfieRNBGchfrKMveBQCugy9OZmUXHTV2
         LKtBia/Xk+9K1AZodaPfAjbaKYShvds05wEyq/wduUseGafkAodIpx9W0ACWU+y9oVnR
         CkXgq+stM3PhKDCF7GzTRwCitTR+gqQAP1qQx93iBOXq3YnVN8J7jkb6QVD2rU/yElGP
         u18q4lMddZwILpnwsm1AeknnDR18CDviaCx5rfaspZ75zR7JZrCx0VzpMKe2ndwgnUWO
         bUFw==
X-Gm-Message-State: AOJu0Yxdnf7Lj8MbKOeD0NCuIvv/bP2l5gwka5/UEOQwo3O2LKC4e/ZL
	aHb5UE7eh2lEuPtgY2Et4lt8yttampg/yZQTWIvDx6S2KWep1FLCHwT41z5oBjM=
X-Gm-Gg: ASbGnctlsP6QPPPmq+8QlklbbTaDdvtiTwMRqWsrfq08vMJ/Jz4T0KPQCEFnZcZY84Q
	aNYrVLSOE3AUpYIBGWfxp9+3NJkrLJcHYcfbthmXvPjP4xWZfL1lxsbWsHTRCg+JGZ0XAeR32y9
	FgENDBHEKE7zKyNt9tlyAlOu/S2hZyN5feKrjX5I+R29PJQvoWghdkeNX1H1daszGLmXhBaQptb
	VxV3m6N2ugRvn+xCNYU2ba5Su3BSxWLZaDYPsfPLjtd3OXJL1vNLgwRcFjnHOJLbUbX
X-Google-Smtp-Source: AGHT+IEacw6THuLUSoeW9Do2UARQl/AgEK5APcT21cHRcY94QxycgSp/pBgaQX2s/8U4C9TiD15VtA==
X-Received: by 2002:a5e:dc48:0:b0:83a:943d:a280 with SMTP id ca18e2360f4ac-849885adfbemr3389117939f.1.1735855611565;
        Thu, 02 Jan 2025 14:06:51 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8498d810f00sm679636439f.28.2025.01.02.14.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 14:06:51 -0800 (PST)
Message-ID: <5ad65964-dcf7-47d2-8e5f-bf82066e55f4@linuxfoundation.org>
Date: Thu, 2 Jan 2025 15:06:50 -0700
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

How did you find the problem?
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

Why does it make sense to cast it to u32?

>   	if (priv->seqnum == 0xffff)
>   		dev_info(&urb->dev->dev, "seqnum max\n");


thanks,
-- Shuah

