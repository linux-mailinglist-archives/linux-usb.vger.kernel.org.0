Return-Path: <linux-usb+bounces-7601-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F6F8737B8
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 14:28:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F3E7281CE6
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 13:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA22F130E45;
	Wed,  6 Mar 2024 13:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HrDmfvBV"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9459D12F5B8
	for <linux-usb@vger.kernel.org>; Wed,  6 Mar 2024 13:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709731716; cv=none; b=D6OSl3ej6iiRx5TQINtTHcWkUyEsy8NY2faqd2DGxipky7ktu1Nom/4kNExY7FHqFcCaMH3GuhQl9iyP6bHSrxnqYEsikoqWfWo0P/K/kDmVcQc4BACUu6gBdyd7r/YYTZGo5Q0GAo9R9/ZfJE44n0hfPRifdjgG2+hTI7DjFgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709731716; c=relaxed/simple;
	bh=fcIgWOfzIjITg/Pk6c+DophWQJue2iTjEylD+UfmmIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ScbUEebx8Wk4NWWPhOjZM9zWY83C0kzbZnSHrkHZJi6Vk3+786HimP08wBj/VI55ABRCkIXVKJOPx8EdSgRqcBwPlgbU2l4DoJwLvq31EIrVsEsUW6+UHT+vS9+akDusimR308DCRpVg1bU0m5c/xNjIwfeqU+F7C/C6r7Et9lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HrDmfvBV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709731713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VLXzxsRK3Iu8e3gbLkJL8uGRbsakoyMKf/7Xwj8EiO0=;
	b=HrDmfvBV2sCFt6OWE8cdGt804EjGw6Ke2Aqbbn/W1lS0PMD5f1T+XZarshjJJIY5sistaZ
	8ssVmk4yliP0GvRpkq1hg6PpLKGtE0pz1a1OCb9D0D5A+CygAqjBcmxqDdbJf3xKl/ESQz
	bC3cuY2omcbRL6jkkwpehpDtCs/+bRE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-2eu5fVbUOxCRKT2ZTsWNrQ-1; Wed, 06 Mar 2024 08:28:32 -0500
X-MC-Unique: 2eu5fVbUOxCRKT2ZTsWNrQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a45190fd2fcso47653266b.0
        for <linux-usb@vger.kernel.org>; Wed, 06 Mar 2024 05:28:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709731711; x=1710336511;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLXzxsRK3Iu8e3gbLkJL8uGRbsakoyMKf/7Xwj8EiO0=;
        b=XYOl5/feoT2H7NFoB33mdemvHwejVl1OscbHgltNs7Qg2k1sIWpuDAR20rr2xb6QkV
         rvLwDqYy8uacykLcKX9RzPxu6qWmq6jIRdfGs8GgYR+ToPHA7QSNeux1jJdsTPY13Mm1
         gMv1gm/pk/0183j7rEGdc7vcuwGhgpqyKnUmKM14Ybr9vLSTILX5gtqUML/WxcTnfd//
         mQ/8l7syZiLMq6f2yYzxZSGJ9+eEe5JuszudlLB7YtRMBCLRtS4yz70fdjyAdI7coHwI
         lyyKK5e4qKybPEHfJmJrFu+018KXwzNVzKhKCZ5B/HdLjs/hyWcLuQKDLopeqEPTtY+l
         kLyg==
X-Gm-Message-State: AOJu0YwnIe8l2FlK3kIV+1sTykl1PH/8azUt+HMm/K6tJ8YDTi9rfCKM
	3c+OmQda0QI9IXbyvlC9OC7XXOu5vrCNJvJSs9RmqOkbfe3pc+cpyBOxnvRlHT9ER4MrJcFTIfu
	X3NHicgdyWmJY7Q/8cHn5NDXbCuNsAulDU3IshhwMVYrcMGeY5seY7ZnzDg==
X-Received: by 2002:a17:906:19cf:b0:a43:f588:de2a with SMTP id h15-20020a17090619cf00b00a43f588de2amr10951598ejd.66.1709731710901;
        Wed, 06 Mar 2024 05:28:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdHv/qmn4Oz92+aUXiB8ZaTGt8Xcm+1UB6IQimCJgT3yXflXJanq+soZIR4Ye4Z4Q67O6HGA==
X-Received: by 2002:a17:906:19cf:b0:a43:f588:de2a with SMTP id h15-20020a17090619cf00b00a43f588de2amr10951582ejd.66.1709731710603;
        Wed, 06 Mar 2024 05:28:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t12-20020a17090616cc00b00a45122b564asm1192094ejd.26.2024.03.06.05.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 05:28:30 -0800 (PST)
Message-ID: <2c77e58a-fe07-464f-9032-3933080be349@redhat.com>
Date: Wed, 6 Mar 2024 14:28:29 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: misc: ljca: Fix double free in error handling path
Content-Language: en-US, nl
To: Yongzhi Liu <hyperlyzcs@gmail.com>, wentong.wu@intel.com,
 gregkh@linuxfoundation.org, andi.shyti@linux.intel.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 jitxie@tencent.com, huntazhang@tencent.com
References: <20240306130042.26811-1-hyperlyzcs@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240306130042.26811-1-hyperlyzcs@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/6/24 14:00, Yongzhi Liu wrote:
> When auxiliary_device_add() returns error and then calls
> auxiliary_device_uninit(), callback function ljca_auxdev_release
> calls kfree(auxdev->dev.platform_data) to free the parameter data
> of the function ljca_new_client_device. The callers of
> ljca_new_client_device shouldn't call kfree() again
> in the error handling path to free the platform data.
> 
> Fix this by cleaning up the redundant kfree().

If things fail in ljca_new_client_device() before 
auxiliary_device_init() gets called (or if that call fails)
then auxiliary_device_uninit() will NOT be called leading to
a memory-leak.

So this patch is no good as is.

To properly fix this you must make ljca_new_client_device() 
always take ownership of the passed in platform_data and
make it also kfree() the passed in platform_data on errors
which happen before auxiliary_device_init() succeeds.

Regards,

Hans





> 
> Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
> Signed-off-by: Yongzhi Liu <hyperlyzcs@gmail.com>
> ---
>  drivers/usb/misc/usb-ljca.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> index 35770e608c64..be702364be08 100644
> --- a/drivers/usb/misc/usb-ljca.c
> +++ b/drivers/usb/misc/usb-ljca.c
> @@ -590,12 +590,8 @@ static int ljca_enumerate_gpio(struct ljca_adapter *adap)
>  		valid_pin[i] = get_unaligned_le32(&desc->bank_desc[i].valid_pins);
>  	bitmap_from_arr32(gpio_info->valid_pin_map, valid_pin, gpio_num);
>  
> -	ret = ljca_new_client_device(adap, LJCA_CLIENT_GPIO, 0, "ljca-gpio",
> +	return ljca_new_client_device(adap, LJCA_CLIENT_GPIO, 0, "ljca-gpio",
>  				     gpio_info, LJCA_GPIO_ACPI_ADR);
> -	if (ret)
> -		kfree(gpio_info);
> -
> -	return ret;
>  }
>  
>  static int ljca_enumerate_i2c(struct ljca_adapter *adap)
> @@ -626,13 +622,9 @@ static int ljca_enumerate_i2c(struct ljca_adapter *adap)
>  		i2c_info->capacity = desc->info[i].capacity;
>  		i2c_info->intr_pin = desc->info[i].intr_pin;
>  
> -		ret = ljca_new_client_device(adap, LJCA_CLIENT_I2C, i,
> +		return ljca_new_client_device(adap, LJCA_CLIENT_I2C, i,
>  					     "ljca-i2c", i2c_info,
>  					     LJCA_I2C1_ACPI_ADR + i);
> -		if (ret) {
> -			kfree(i2c_info);
> -			return ret;
> -		}
>  	}
>  
>  	return 0;
> @@ -666,13 +658,9 @@ static int ljca_enumerate_spi(struct ljca_adapter *adap)
>  		spi_info->id = desc->info[i].id;
>  		spi_info->capacity = desc->info[i].capacity;
>  
> -		ret = ljca_new_client_device(adap, LJCA_CLIENT_SPI, i,
> +		return ljca_new_client_device(adap, LJCA_CLIENT_SPI, i,
>  					     "ljca-spi", spi_info,
>  					     LJCA_SPI1_ACPI_ADR + i);
> -		if (ret) {
> -			kfree(spi_info);
> -			return ret;
> -		}
>  	}
>  
>  	return 0;


