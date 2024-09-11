Return-Path: <linux-usb+bounces-14940-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14080975109
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 13:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91A061F2246A
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 11:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91201185B6F;
	Wed, 11 Sep 2024 11:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ST7C2ivW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF5B42AB4
	for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2024 11:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055192; cv=none; b=XKyq0BI0qtUmpVqiBa78gicCqyxBhDOPTvkB/wEsw+Vrp0sLpDu9jQ5DRiVbKnXuiuRNuECA584Rso/10tkHYc+FnFAr6XKMCe6tBMb0G5qVAIiSoGYuLH/hpBuNRZLXh79h76LnSwWXq/nh3SSsptJz4B7aRDUQQnGPZBkuufc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055192; c=relaxed/simple;
	bh=zDfl0nb33oSvpO6ZIhy4kmbYxyVq3wInYR16i9dv7ms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bXbFUDjdiCpzJ0GXhLNw3I4hVMBTCkZLgzj3lp+4TNhMrNk+Mh+gKXwwPgLG6fLf6kGGFrMadWnuYa5ts2dv7T/4ZjomaolThfz6pS3klefs5IEkY+p7uqKjMsG40vZNWyl9SCFz9UIwHBOAU7aroeY0KOHB8JzEXmxmjQhgXFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ST7C2ivW; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2055a524017so5524385ad.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2024 04:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726055190; x=1726659990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=saISybT+04xXE6sJeq1RhjUz46ExY/XiFSgt9+eqjgM=;
        b=ST7C2ivW0RdsYgLbU7Ze4JnP6PgXemnMD5z+XFTLo6yyPZ9PYAWuoSFsmK+OuQfGXA
         HJwRK9FShlf9JVSLz7jSeoITaf7PHOJGZ/gWAvNHOQEtYSJy2DLPMY2fGkO29/Xdl6PS
         sWfrJqVUx4xIaykKO7IqeORElbMSn9mNXT7KmUGffKfyahOEbEoT9/gYMs+YmNc+4qxS
         NNyS+4C506sqlusmyuu9OYkP+Yw6iZ3joyKqlXMJ4FLp+vpaTZ68zgVQ+drnwvONI+cJ
         x5jmjEdS9+wsR6nokSQhR9B71o3LeeWnaW/4ZUsvrS1j4PnQSk94HXMLsKo5Cjza8zzT
         oDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726055190; x=1726659990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=saISybT+04xXE6sJeq1RhjUz46ExY/XiFSgt9+eqjgM=;
        b=RP8uZ0iWipdRXGkW8AESPnIyFyXeJMGmL5wEqtt9bQ0izf8GV86zV8GbyZBvwZiEZ5
         LMvO6Rx5aNPYOtK0zYXmHqKZ3MvK1BupAK+frcE5wIHhhiKZXYfjRstadgqAMoC/GkQw
         9U1ZUie1bwO4xTNQjR+0tVmnFR4RV9/KzHBYDwCJ+FTDRkATKwSimDcNMxkrfZ4Ul1Xr
         8GZ93IDYYAVWWpUTjM7tKRHTK0LBSaOEqIuq8YdnA2CQJM5i4uC6YcEqqWRfkTpObTMN
         eMFPBe7sklk73x48Ir+Cq6iNvjouUQzsIOXPpjpuU00q6XJ+b47ZRKv9ABp7UjyEElHd
         jJaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgLiPQiRAXbqL9hSfuAlvp4Qq854P0DWuYfle04hNhHdCnOeGAZ02LhuudjLw3Pk3q4ncYmw06MiM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxd/u+lyPavA+IZf6garfWsPu8EOBcMkwIChRE/xWFCoaAjDaw
	4C4rJq1LemxWarAXJLWC1TCOR26h8u9VxPhLOtldCAPt2fWauHka
X-Google-Smtp-Source: AGHT+IEOsKA0AwP6UousCot1fVSwVPDln/m8LqC9+Hw0ucmOj80BPW3Kx45g9E0TPGvEbKXlM7H9Pw==
X-Received: by 2002:a17:902:db06:b0:205:9112:6c38 with SMTP id d9443c01a7336-2074c6e2101mr23020805ad.10.1726055189658;
        Wed, 11 Sep 2024 04:46:29 -0700 (PDT)
Received: from [192.168.1.7] ([119.42.110.5])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20710e324bbsm62004415ad.87.2024.09.11.04.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 04:46:29 -0700 (PDT)
Message-ID: <8b356c79-3300-4fa8-a6e5-1556e2f6579e@gmail.com>
Date: Wed, 11 Sep 2024 18:46:24 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] USB: serial: option: support for Quectel EG916Q-GL
To: "Benjamin B. Frost" <benjamin@geanix.com>
Cc: sean@geanix.com, martin@geanix.com, johan@kernel.org,
 linux-usb@vger.kernel.org
References: <d4b02fcb-6476-4a67-bc07-e6a224891b20@gmail.com>
 <20240911085405.319899-1-benjamin@geanix.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <20240911085405.319899-1-benjamin@geanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-09-11 15:54, Benjamin B. Frost wrote:
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
> I:* If#= 4 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=06 Prot=00 Driver=cdc_ether
> E:  Ad=88(I) Atr=03(Int.) MxPS=  32 Ivl=32ms
> I:  If#= 5 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
> I:* If#= 5 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
> E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> 
> Signed-off-by: Benjamin B. Frost <benjamin@geanix.com>
> ---
> 
> V1 -> V2: Change as suggested by Lars has been implemented.
> Using USB_DEVICE_AND_INTERFACE_INFO instead of USB_DEVICE.
> Thank you for letting me know.
> 
>   drivers/usb/serial/option.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 176f38750ad5..e47a12c81a2f 100644
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
> +	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG916Q, 0xff, 0x00, 0x00) },
>   
>   	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_6001) },
>   	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CMU_300) },

That was much better, now it is correct.
Reviewed-by: Lars Melin <larsm17@gmail.com>

additional info
MI_00 Quectel USB Diag Port
MI_01 Quectel USB NMEA Port
MI_02 Quectel USB AT Port
MI_03 Quectel USB Modem Port
MI_04 Quectel USB Net Port

