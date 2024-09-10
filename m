Return-Path: <linux-usb+bounces-14904-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F29297372B
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 14:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6A721F25413
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 12:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C55D190492;
	Tue, 10 Sep 2024 12:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1ZCuRmU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8601318F2D5
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 12:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725971190; cv=none; b=iHAUIuvRhBVv3nMS7YPduHRoW7YhY4/IcWN9J5BU+dR5qAAPaCEjk+3CAcJt6kj8hTGlEAQwv6H1/5eIqrdTRKvdzJ2M95ciIfVwmSjnsmNE58OunU4Ty6f2yvQJOErNStG7iXCvCjlQAA3Q1XUhAdUcbZ7GQbljjQp641sKsUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725971190; c=relaxed/simple;
	bh=i5W7ej9czhxprPg7VKO34vaXzXcqKct+hfuRtVKvjBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GvpTw4rrbvDu55+bC0qdehDVRNn2LvnCQdNOMyTbQbrlj12IeFjg0JOsaM4Ozg8tpTD445PgNN8WJXTg66u6afkRhQ7OPueXjE+FShOlWYFLvNry5VDsBlxyXKmbZvhluUefLdbDCQmlcopDaQh4nt7gyLfQMugEUqLnSdPBzx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1ZCuRmU; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-718ebb01fd2so545984b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 05:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725971189; x=1726575989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lvaqbLejZoQ+oZna2KowQG5yxOkmCKLrGbW3RFBdl4k=;
        b=k1ZCuRmUJZE66Oil/PBaz5FMiRH95XXC6EHuNVa3cqd8a5hb6B4O7RFU7cHyCJ/nZE
         zffVQKSh9PwL51Z7iF5kIDnLUr2Sg6MHgORB/qs97xm1Zf6+q83b6GPdb1q12MpK27iq
         7HbUocfE/+QH0IE2/JMCzjBAqlREyY35d+iuOKg3/W3FNM3wnT1y96qWxLfxDyEeAqdq
         lkWVZGtOXeuA1py+0MGUzmt5A/WvVLay4NRoCJUoGX3JBY1hgmbEexkrnYoO3vKB4SWz
         GFWP+AhnqEJKZmswsmNrUXMii0DC6HxBxEXogfTM6/xvvp/F76cDYAEIRH/6vZa/6I/u
         o79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725971189; x=1726575989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvaqbLejZoQ+oZna2KowQG5yxOkmCKLrGbW3RFBdl4k=;
        b=LLQ2CpQsQcI69rOfL9nfRgwQvpsmRN13UM/8BpbwfMTzO9dXqeFDfH7qWAeEBbC7Rt
         5f+sX5g6blat48h4oQjAqG62qXvDF75HQdu4t81odIIG7EfTgYwbsKffwIY/vyUyKlKW
         HfpQiy2RPssMMZ23I8gcqCyfp4q2mo7ji6WFbSkk0pvpf/WCnzAYm5GtFJNqhJXqCIvV
         B3Rl4VCRuKOUhx3GasDX4sSsmMgJEmAmzVH69RRlBlLHvo5MCJUDTqbw8OYPbXJjz6O0
         kePlrCVQYvtZeWt+elTqAa2sbQYIiTakTiIBzKmJx9fYpSLYOCi04Efp0PUMhoQHbyb7
         vbKg==
X-Forwarded-Encrypted: i=1; AJvYcCWVpaV+by0YMjbhx02qQTrtY9/RwEcaCIFmp5J/34oTC2jgRT0UxNEN3DDetNLMhjbNwTMxNt8NUuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiRoTw/Hn4SAkn+g7bFykKBheaBQ8FhsINpDSU8mDrXYUtzuzd
	bvDaC8AAibvqLmDY+N0vjyI5/v0i400CAoVXVGB5eBqo4TI7Lw54v0nMB14R
X-Google-Smtp-Source: AGHT+IHmRqqyHLiYi2cSPBsglXQzqsu83zCaGDlbNfRqdCXX7eulXfutkIVTarlk5ZRSKga6bETr+A==
X-Received: by 2002:a05:6a20:7345:b0:1cf:3f39:c46a with SMTP id adf61e73a8af0-1cf5e0f0dd8mr396038637.6.1725971188647;
        Tue, 10 Sep 2024 05:26:28 -0700 (PDT)
Received: from [192.168.1.7] ([119.42.110.5])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-719090be13dsm1264484b3a.184.2024.09.10.05.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 05:26:28 -0700 (PDT)
Message-ID: <d4b02fcb-6476-4a67-bc07-e6a224891b20@gmail.com>
Date: Tue, 10 Sep 2024 19:26:24 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: serial: option: support for Quectel EG916Q-GL
To: "Benjamin B. Frost" <benjamin@geanix.com>, linux-usb@vger.kernel.org
Cc: sean@geanix.com, martin@geanix.com, johan@kernel.org
References: <20240910073050.2619669-1-benjamin@geanix.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <20240910073050.2619669-1-benjamin@geanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-09-10 14:30, Benjamin B. Frost wrote:
> Add Quectel EM916Q-GL with product ID 0x6007
> 
> T:  Bus=01 Lev=02 Prnt=02 Port=01 Cnt=01 Dev#=  3 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=2c7c ProdID=6007 Rev= 2.00
> S:  Manufacturer=Quectel
> S:  Product=EG916Q-GL
> C:* #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=200mA
> A:  FirstIf#= 4 IfCount= 2 Cls=02(comm.) Sub=06 Prot=00
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=82(I) Atr=03(Int.) MxPS=  16 Ivl=32ms
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=84(I) Atr=03(Int.) MxPS=  16 Ivl=32ms
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=86(I) Atr=03(Int.) MxPS=  16 Ivl=32ms
> E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=06 Prot=00 Driver=option
> E:  Ad=88(I) Atr=03(Int.) MxPS=  32 Ivl=32ms
> I:* If#= 5 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=00 Driver=option
> I:  If#= 5 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=option
> E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: Benjamin B. Frost <benjamin@geanix.com>
> ---
>   drivers/usb/serial/option.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 176f38750ad5..8ff9f1435c2f 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -279,6 +279,7 @@ static void option_instat_callback(struct urb *urb);
>   #define QUECTEL_PRODUCT_EG912Y			0x6001
>   #define QUECTEL_PRODUCT_EC200S_CN		0x6002
>   #define QUECTEL_PRODUCT_EC200A			0x6005
> +#define QUECTEL_PRODUCT_EG916Q			0x6007
>   #define QUECTEL_PRODUCT_EM061K_LWW		0x6008
>   #define QUECTEL_PRODUCT_EM061K_LCN		0x6009
>   #define QUECTEL_PRODUCT_EC200T			0x6026
> @@ -1271,6 +1272,7 @@ static const struct usb_device_id option_ids[] = {
>   	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC200T, 0xff, 0, 0) },
>   	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG912Y, 0xff, 0, 0) },
>   	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500K, 0xff, 0x00, 0x00) },
> +	{ USB_DEVICE(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG916Q) },
>   
>   	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_6001) },
>   	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CMU_300) },

Hi,
sorry but that is not correct. Interface 4 and 5 should be handled by 
the cdc_ether driver, not by the option driver. You need to use the 
USB_DEVICE_AND_INTERFACE_INFO macro exactly as in the 3 Quectel devices 
above your entry.

thanks
Lars

