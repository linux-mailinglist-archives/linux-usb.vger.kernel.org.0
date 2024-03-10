Return-Path: <linux-usb+bounces-7789-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E674877671
	for <lists+linux-usb@lfdr.de>; Sun, 10 Mar 2024 12:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA5211F2147D
	for <lists+linux-usb@lfdr.de>; Sun, 10 Mar 2024 11:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1EB320326;
	Sun, 10 Mar 2024 11:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dbeuut79"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975CC200D6
	for <linux-usb@vger.kernel.org>; Sun, 10 Mar 2024 11:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710071190; cv=none; b=cYs56tuIkvsOD2pAmXYC9G4VtNbZqMLi1BrEMZWmPxA45Rx4e4Rqgsh8CcjRG/9x/sVFdvrzJpWb8yiBfpoSa4JMbH3a0+uD6nj1khRQvKb6nli3Wp6PCW13P1bQ1YaAw1wC5LO2kU5kQpyO8qSLSB5Css4Dk+WTEwhn7rkgGfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710071190; c=relaxed/simple;
	bh=uizi5IRvd5NvjgqfhI2wCMBimt43g2ByEAhc/niz0pY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYYeEhR1TJZOBk8srnDkvTsKcJg1xYk2BvqSnEsgHlqWod+9zPWR+qzIhWIGTdvAEmeS1J9/5MM0aWTtolvBX0QhmYrA/0+LTS/SDMQkmlL33Xz9Q0WpTyvZbtrIi7qSO+mBzcBdoVsoCJM5DEOEnXLZON5U1mFnXQ4n8RScq5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dbeuut79; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710071187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KET7QTLCZ3S+u1REsJgRib9mJHyqhY3qVaHdaO5OW3w=;
	b=dbeuut791euHkd1F/MPPIMuwkaZJasdGrfgvS03c91AvWhrMXDj3vDJCOLO2W8UQiwopgO
	pwIXUjwrUXU60BscBCEKihPo3mTRJkC7B90O6A/zgmuDOlEi4horjvuyjHy4rCwV2MnhXW
	l63+KTSVbb3zM6Hozmh9VAib+tJSs/k=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-Kt2nyrq-OgWg7IoX1GOszw-1; Sun, 10 Mar 2024 07:46:25 -0400
X-MC-Unique: Kt2nyrq-OgWg7IoX1GOszw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a449be9db59so179407066b.1
        for <linux-usb@vger.kernel.org>; Sun, 10 Mar 2024 04:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710071184; x=1710675984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KET7QTLCZ3S+u1REsJgRib9mJHyqhY3qVaHdaO5OW3w=;
        b=bF9hvzRGElKjHGlPmU/pW7d2rTyS6m+CMuTJ18OjZ3chPTaRfrttEVgO40hP4YaJQG
         jWJXh/kIVojqv6B3MlLiKE9pPTiRhOfZnqx95r3JSjym5PHkqw1F+2TXckJQUWA158fc
         0b70j3vc9XBnc2njeVqNzbDjQQaIrTwTyZIeqdHCxFolO9m/x3A1X/9AjBbuSWlNHdDe
         D5+rzDNQ/l3cB4EMH24vWPU0st7tjNsueUMvrHfgr/Sey+rSu3XFk2MMHoNhruzcMLBf
         +p1rL7w080/z5ZwqMMJ7R4mK9PeG6sHwz7Gvj1Rc3+n/cLhaCo0b6O/2k+hwovLF5+wR
         X/fw==
X-Gm-Message-State: AOJu0Yzh/wZNLo8CGUD4kepdDfRvvN82oWOayMAbLr/l0Uj1rmS9IuV1
	izh9BknSfvyGABZiea+z6cb+3kKGQLhp3E3CErVmvbKCWUioAPqJWb9e4KiIJKC+wQduBegBC4U
	UAaIyrwLY9QGQOmn2Gq33Gx3z4CzSe240U9S/CoS6smPy2yezBwP/Um8Z9w==
X-Received: by 2002:a17:907:a705:b0:a3e:68a2:3d4e with SMTP id vw5-20020a170907a70500b00a3e68a23d4emr2483241ejc.54.1710071184186;
        Sun, 10 Mar 2024 04:46:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeCEv47Gv2F/UtTX5L4hoIfKNN7um5zd3GdBdlzWig0mpU0KOQoa9GqJnzwVjAlTfVVq0Niw==
X-Received: by 2002:a17:907:a705:b0:a3e:68a2:3d4e with SMTP id vw5-20020a170907a70500b00a3e68a23d4emr2483229ejc.54.1710071183848;
        Sun, 10 Mar 2024 04:46:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id me24-20020a170906aed800b00a450164cec6sm1846571ejb.194.2024.03.10.04.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Mar 2024 04:46:23 -0700 (PDT)
Message-ID: <36e56422-d027-4edd-af6e-8ebcebc1dfe3@redhat.com>
Date: Sun, 10 Mar 2024 12:46:22 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] usb: misc: ljca: Fix double free in error handling
 path
Content-Language: en-US, nl
To: Yongzhi Liu <hyperlyzcs@gmail.com>, wentong.wu@intel.com,
 gregkh@linuxfoundation.org, andi.shyti@linux.intel.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 jitxie@tencent.com, huntazhang@tencent.com
References: <2c77e58a-fe07-464f-9032-3933080be349@redhat.com>
 <20240307115743.13104-1-hyperlyzcs@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240307115743.13104-1-hyperlyzcs@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yongzhi Liu,

On 3/7/24 12:57, Yongzhi Liu wrote:
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
> ---
>  drivers/usb/misc/usb-ljca.c | 26 +++++++++-----------------
>  1 file changed, 9 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> index 35770e608c64..bd9ccbea6e72 100644
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
> @@ -626,13 +626,9 @@ static int ljca_enumerate_i2c(struct ljca_adapter *adap)
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

This is in a for loop, by using:

		return ljca_new_client_device(...);

you are now only creating the first ljca-i2c controller, while
there may be more instead just drop the kfree() from the if (ret) {}
block:

		ret = ljca_new_client_device(...);
		if (ret)
			return ret;

Sorry for not noticing this with the v1 posting.

>  	}
>  
>  	return 0;
> @@ -666,13 +662,9 @@ static int ljca_enumerate_spi(struct ljca_adapter *adap)
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

Same remark as with the creation of the i2c controllers, please use:

		ret = ljca_new_client_device(...);
		if (ret)
			return ret;

Regards,

Hans




