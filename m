Return-Path: <linux-usb+bounces-7819-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9542B878034
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 13:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13530B21E7C
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 12:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18CA53BB55;
	Mon, 11 Mar 2024 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fX7x2jRk"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF103D993
	for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 12:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710161943; cv=none; b=I03PQQF6xhrZjoSKHtnIKLS6ffM1UrlhY5qCMFfvSSWKJlahltlrW70iWl0KKTosP+JLe36b4OB4f9I0E9XO9uyNH6YjtcqRLg+Ge5Mf7FYro558X6OWTSWcYDcQqqZa4NM3xiRGEZsIVru+IvtXm8QfNSGnckl0oUaR67nKHGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710161943; c=relaxed/simple;
	bh=wY+21H7yk30KiVA+C0K/9x04hO53yI+LTDhlKXKUFJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H33el/ihqoOR035AqyuV1modePuqDY2uT6cp4jaKvz+ZaAh1gdiPx7YbGbKiUz1AOVPAt/jqAMkCFfpnBCF1fyUN65AR5OFod52RpsfiKZq3PVaSpF9DOyOyH/s5EtwZgdWBu39r1vFClHPb+/Z2grJ/HP3VRkuorg1vzlMqy0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fX7x2jRk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710161940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nTvXvj6VIx0AlQ3sRPTF6IRT4idYlsEcsTECL2ozhhU=;
	b=fX7x2jRkACpy+msSCOViBls6qNaiQL9VW7H2I3zKzxHKxXe+PEhdxV5xDth+WFOUUZvN08
	psbUIK0unobw4mWiVTr0t6dXCw+WBjWOKBvoTJI/ceT3z0vn7qjEH17MYGnJ0is75ybc3x
	/odSNbZgR7bLRdhTUXZB3rXTa8PiUk4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-d1AT_8AHMmOQiGwFfrzc4A-1; Mon, 11 Mar 2024 08:58:49 -0400
X-MC-Unique: d1AT_8AHMmOQiGwFfrzc4A-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5686b900b82so14055a12.0
        for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 05:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710161928; x=1710766728;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTvXvj6VIx0AlQ3sRPTF6IRT4idYlsEcsTECL2ozhhU=;
        b=JACVoLuM9FdU9xhG5M2CmC71v+GwLHEsx36PcaB4htD1yzpwsEtfy+Zvxtt+oZ4K4Z
         xrrOwnZRMMPinZ191Dl8PYdSYAWmGXDVCoGp/p2euk8SSG3B6OnnQ+CapBN55su7P+Vc
         i+Eb/f9hMKaw54RYSXsGJQq2DhmI9fize+G5WiqTzRuwSHZMA1ODT7dtXy0YQjofuBcT
         fgxA+SCidjIih6aa8G3bJAKwnBNUyt4WayMsKUvCoeC/fRBDWPu16RPpjBNnE0N9DhBT
         zroSU/bVqheVn0VJR0vCAIHrEO7GoE/HquS/ZscUL4rayjzAk4Sfy6YJfFJSDlPa/KLh
         2eAQ==
X-Gm-Message-State: AOJu0Yxca5qvuYlcudsDCMtTYq8aZJCA4kMvPrFddGzI38qNXVUihYnz
	kuD/QmvZ8SS6Cet4EBtmEqrgXx65pJTehydU44MOSPdRi86Q4/REuxll1ofc+MRQtPuun7twZZU
	u9xycsNPLfPxd78cI6wVXD7Hqjzchp/14oK+zAugxf155nCRql903ygwtpg==
X-Received: by 2002:a17:906:e0d7:b0:a3f:20b9:2b68 with SMTP id gl23-20020a170906e0d700b00a3f20b92b68mr3694817ejb.10.1710161928139;
        Mon, 11 Mar 2024 05:58:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHmkljBC80qZv7D9NAK7d8wzJaF47P4X/oxEVp7V4ZBIwdyaAJrxnFuKaeUnEfJ/AOs4jXJg==
X-Received: by 2002:a17:906:e0d7:b0:a3f:20b9:2b68 with SMTP id gl23-20020a170906e0d700b00a3f20b92b68mr3694800ejb.10.1710161927817;
        Mon, 11 Mar 2024 05:58:47 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id jx24-20020a170907761800b00a45fefe57d5sm2778576ejc.96.2024.03.11.05.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 05:58:47 -0700 (PDT)
Message-ID: <27db3737-166d-4a8b-83fe-62c16590aec6@redhat.com>
Date: Mon, 11 Mar 2024 13:58:46 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] usb: misc: ljca: Fix double free in error handling
 path
Content-Language: en-US
To: Yongzhi Liu <hyperlyzcs@gmail.com>, wentong.wu@intel.com,
 gregkh@linuxfoundation.org, andi.shyti@linux.intel.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 jitxie@tencent.com, huntazhang@tencent.com
References: <36e56422-d027-4edd-af6e-8ebcebc1dfe3@redhat.com>
 <20240311125748.28198-1-hyperlyzcs@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240311125748.28198-1-hyperlyzcs@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/11/24 1:57 PM, Yongzhi Liu wrote:
> When auxiliary_device_add() returns error and then calls
> auxiliary_device_uninit(), callback function ljca_auxdev_release
> calls kfree(auxdev->dev.platform_data) to free the parameter data
> of the function ljca_new_client_device. The callers of
> ljca_new_client_device shouldn't call kfree() again
> in the error handling path to free the platform data.
> 
> Fix this by cleaning up the redundant kfree() in all callers and
> adding kfree() the passed in platform_data on errors which happen
> before auxiliary_device_init() succeeds .
> 
> Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
> Signed-off-by: Yongzhi Liu <hyperlyzcs@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/usb/misc/usb-ljca.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> index 35770e608c64..2d30fc1be306 100644
> --- a/drivers/usb/misc/usb-ljca.c
> +++ b/drivers/usb/misc/usb-ljca.c
> @@ -518,8 +518,10 @@ static int ljca_new_client_device(struct ljca_adapter *adap, u8 type, u8 id,
>  	int ret;
>  
>  	client = kzalloc(sizeof *client, GFP_KERNEL);
> -	if (!client)
> +	if (!client) {
> +		kfree(data);
>  		return -ENOMEM;
> +	}
>  
>  	client->type = type;
>  	client->id = id;
> @@ -535,8 +537,10 @@ static int ljca_new_client_device(struct ljca_adapter *adap, u8 type, u8 id,
>  	auxdev->dev.release = ljca_auxdev_release;
>  
>  	ret = auxiliary_device_init(auxdev);
> -	if (ret)
> +	if (ret) {
> +		kfree(data);
>  		goto err_free;
> +	}
>  
>  	ljca_auxdev_acpi_bind(adap, auxdev, adr, id);
>  
> @@ -590,12 +594,8 @@ static int ljca_enumerate_gpio(struct ljca_adapter *adap)
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
> @@ -629,10 +629,8 @@ static int ljca_enumerate_i2c(struct ljca_adapter *adap)
>  		ret = ljca_new_client_device(adap, LJCA_CLIENT_I2C, i,
>  					     "ljca-i2c", i2c_info,
>  					     LJCA_I2C1_ACPI_ADR + i);
> -		if (ret) {
> -			kfree(i2c_info);
> +		if (ret)
>  			return ret;
> -		}
>  	}
>  
>  	return 0;
> @@ -669,10 +667,8 @@ static int ljca_enumerate_spi(struct ljca_adapter *adap)
>  		ret = ljca_new_client_device(adap, LJCA_CLIENT_SPI, i,
>  					     "ljca-spi", spi_info,
>  					     LJCA_SPI1_ACPI_ADR + i);
> -		if (ret) {
> -			kfree(spi_info);
> +		if (ret)
>  			return ret;
> -		}
>  	}
>  
>  	return 0;


