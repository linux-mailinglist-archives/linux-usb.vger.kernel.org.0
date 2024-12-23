Return-Path: <linux-usb+bounces-18757-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B97F09FB722
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 23:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1973C7A1EAA
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 22:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378941D61B9;
	Mon, 23 Dec 2024 22:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KyL95g6i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A84188596
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 22:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734992697; cv=none; b=Bnt1qj41Po3PSUOmPkqNFlykmycUtUXzh0NhvpGuiMYNGOI7YzXWTyeWon45ZsB2ykPhRWHzyLkte5JnA7Mi4INV84Vi2k9XSTzEIi38tj7WhG5d84TXxi1BsYx7BctB3VRf0XxdWG/4pFed1eQw+XVFpUJ1LCjI6knSvpFkjCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734992697; c=relaxed/simple;
	bh=POu7UZ77HY1uYRvLC/GJPTZJ+KhyS5srPJcWfpvoi3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHGF7yGrlxWOwjXhMWm7+gTN9h3YvRo8yHFbvOim+2PlOUVJIuq95wtiNb6jGC7UyEp/Kq7LtDzo6oFK0EKmWyr1OL8Uiizxkk6qGkuOrK7+Bqb4m4Dlo55yOQgqa3mTp6WopNxc8Bw4gTK8sUdvo8uyC3e2xtlHtC2tDSAhHFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KyL95g6i; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-844eb33827eso184637339f.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 14:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734992694; x=1735597494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SkaGX1PrkiIvFeAcmNiJvskCXGw4dXzt7gXU2Vfhu0Y=;
        b=KyL95g6iPmcuR5x6xiCVK1xdciscnaYdQaHvmFmZ0X7s4HBeE/5T0byjRZR/Zy/+1H
         YX+ZvQl9PMsgixJfLuXVJCWZbOc3vJBYeRYvYn3/X5fhxdwxExL5RmL7HORygFlyY8WN
         7llz2ZGouDCO5JuelpfNInjfqH0Lxh256zUgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734992694; x=1735597494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SkaGX1PrkiIvFeAcmNiJvskCXGw4dXzt7gXU2Vfhu0Y=;
        b=GBA+vVM0WJiUFqau9478LXzliaQ/LVEjjPGdc4AzDX+QfVvilVcz8vrRWMApJsvY6K
         X5fjSmkoLHfDcJJxivoRF8E37ux3lDCI1Leo2mfIDdIuEfRchww4oY0Lri9sWdlaM+0j
         eWRASB5Pcq4wQgBG9k/vl4RGYL3ldxuWaK2jQ+SblZIH077Rx8qLB+rzJU99FiZixyZX
         VaXRZiLuNCzorWUiW7e98Gd0tTT0sdlXNltNRPDAf7vF3E0sS3uUrz9PgVUdlxAJKKh1
         +Dc6ni/16wR9fay27IjpDkwUmBkxAt6Qbqkd2U486+cpZygCPiEQIarm4/iaz8Qz681e
         eEWw==
X-Gm-Message-State: AOJu0YzRGYB/BOJLOLe2par24JT+S6vCl7XK3Zv31bshozOUo3pntBz1
	cRptNw3tIoWCSBIdobohGBDtexsog5T+9hEQb1JPuTTrZOKIu45wRZxtO6U+Rdo=
X-Gm-Gg: ASbGncsESmsipTNM731r6qnI7zpA0HRu6AO1OnHTQlUt7h3H2elnRLj+nM99AkUh5M5
	BSmxd7ZTwyoUTCP5NBnAbmoXpLJKjhKoWIDBcO9Bb1+JJWNfeqvLCH8MHLlFPXpTMEG+FyekCHS
	SXpbq4QZWBVXs4yVRrlDCBVOQaGzFDHBFYow2TGBjOD1jb9kEkhRHeM32p72Oeh+KiHyAvx3wKa
	SChHpuUq6TZKzhiTpVP43EzFGRSS7Q+AwIu6isN+th14e6JioCsHqboFaYuL7ciEmgv
X-Google-Smtp-Source: AGHT+IET2wTP/W886Ou15XAObLqh9H6MMnbSX3VqhkzDmOy6rz/Q98b/nT/DOATXUaU+LMb59JJyBg==
X-Received: by 2002:a05:6e02:20c1:b0:3a7:1c73:e18e with SMTP id e9e14a558f8ab-3c2d5434974mr104979605ab.21.1734992694013;
        Mon, 23 Dec 2024 14:24:54 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3c0deae6828sm26882705ab.25.2024.12.23.14.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 14:24:53 -0800 (PST)
Message-ID: <e8e09510-4c0a-4025-9057-2922cfe6e7e0@linuxfoundation.org>
Date: Mon, 23 Dec 2024 15:24:52 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: vudc: Constify 'struct bin_attribute'
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241222-sysfs-const-bin_attr-usbip-v1-1-20d611a9bfa4@weissschuh.net>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241222-sysfs-const-bin_attr-usbip-v1-1-20d611a9bfa4@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/22/24 13:13, Thomas Weißschuh wrote:
> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>   drivers/usb/usbip/vudc_sysfs.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vudc_sysfs.c b/drivers/usb/usbip/vudc_sysfs.c
> index 907a43a008964d647d19f9631faf4a443bc00019..2aae3edfc81369e3f84aadec7050356a4347c104 100644
> --- a/drivers/usb/usbip/vudc_sysfs.c
> +++ b/drivers/usb/usbip/vudc_sysfs.c
> @@ -67,7 +67,7 @@ int get_gadget_descs(struct vudc *udc)
>    * Exposes device descriptor from the gadget driver.
>    */
>   static ssize_t dev_desc_read(struct file *file, struct kobject *kobj,
> -			     struct bin_attribute *attr, char *out,
> +			     const struct bin_attribute *attr, char *out,
>   			     loff_t off, size_t count)
>   {
>   	struct device *dev = kobj_to_dev(kobj);
> @@ -88,7 +88,7 @@ static ssize_t dev_desc_read(struct file *file, struct kobject *kobj,
>   	spin_unlock_irqrestore(&udc->lock, flags);
>   	return ret;
>   }
> -static BIN_ATTR_RO(dev_desc, sizeof(struct usb_device_descriptor));
> +static const BIN_ATTR_RO(dev_desc, sizeof(struct usb_device_descriptor));
>   
>   static ssize_t usbip_sockfd_store(struct device *dev,
>   				  struct device_attribute *attr,
> @@ -252,14 +252,14 @@ static struct attribute *dev_attrs[] = {
>   	NULL,
>   };
>   
> -static struct bin_attribute *dev_bin_attrs[] = {
> +static const struct bin_attribute *const dev_bin_attrs[] = {
>   	&bin_attr_dev_desc,
>   	NULL,
>   };
>   
>   static const struct attribute_group vudc_attr_group = {
>   	.attrs = dev_attrs,
> -	.bin_attrs = dev_bin_attrs,
> +	.bin_attrs_new = dev_bin_attrs,
>   };
>   
>   const struct attribute_group *vudc_groups[] = {
> 
> ---
> base-commit: bcde95ce32b666478d6737219caa4f8005a8f201
> change-id: 20241222-sysfs-const-bin_attr-usbip-2255bb1238ad
> 
> Best regards,


Looks good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, please take this up.

thanks,
-- Shuah

