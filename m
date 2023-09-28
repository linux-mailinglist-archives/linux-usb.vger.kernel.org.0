Return-Path: <linux-usb+bounces-710-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF3D7B1FE1
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 16:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 03780B20987
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 14:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A09D3FB05;
	Thu, 28 Sep 2023 14:40:12 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C84236B19
	for <linux-usb@vger.kernel.org>; Thu, 28 Sep 2023 14:40:10 +0000 (UTC)
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31ADAF9
	for <linux-usb@vger.kernel.org>; Thu, 28 Sep 2023 07:40:08 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-79fc3d32a2fso305323839f.1
        for <linux-usb@vger.kernel.org>; Thu, 28 Sep 2023 07:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695912007; x=1696516807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POXmPRm857N2+2VeLufNNudgcbk/RMbMaFDskeXbqvs=;
        b=OTiuZQ8FROA0qr0tDeTf/XoXYeFO6RXLrpMd2ZRSea6BlSDFfGwp+ajLgES+pZwnwV
         maamDRt5fbl+jmzxpufZp06EXJYBuiEqIk/ZCH1izMGzrQEZ6+QrnH7mOk4cKaisgDx/
         /8YV08n0iwt+5HgrT3nyMrNR7pr8Bu9ZAgCavAUe937iloNTB7xjJijRG0mi3bIilXot
         BxrrR/MKlOWKIGNTcZUvmB6dG3OooSB7Nx16bO4rzEbkbT7FJ3DRnGIF/aH3TMhwPWfs
         lU4GTwjCNJMYMBALmkPcFJBAUA803pEWCnV7pSjTYqTmpbOxpezMeUCSQgdr9X89einn
         6KYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695912007; x=1696516807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POXmPRm857N2+2VeLufNNudgcbk/RMbMaFDskeXbqvs=;
        b=MxxWIvcCFtkjsof1T4JHb08gcVFKvWvH9oP1WnkdZfsgpvWFciefwmi6hC8iB/1LlD
         wA5pumrrQ9b2opewi50M1cK1vL5JsJE3Bad1AstO4Yal6fxsh7fZGe2sls3laHL0Wp3h
         I6wkOuIOEonXbj5qL4yeXgA5uqN8YsJw23XXesPT0GfJkb7KtiDZTL8M1Icp3xKghF3R
         YiZgLU/Ayv+AgTZxexJOl67YZWqVgCTHOGhI8QEB1mZPFx2QNzD049Lszw/5m5L5OhCX
         1OBXm6Y2cDbZraXO9VKUbjpqCOjtXcByiUcfn/y2Jug0f+ktI75cBUbULUBKdakPH1pd
         VQwg==
X-Gm-Message-State: AOJu0YxIOJ0/rs/BkV50FZOVd9HLaNZt7GsFi9d3CKGcyrEnF0BBH3Ah
	L3r9SE+BYns3ZgiTHAgSkw9eO6RInUA=
X-Google-Smtp-Source: AGHT+IHPgId1160VSLb5zMPhEihYk5HlJlPgmTWWRIOKz6ebSTqO7E93C9+fYhmtEIqV4M+MYNv2yw==
X-Received: by 2002:a05:6602:2211:b0:798:3cb5:ad30 with SMTP id n17-20020a056602221100b007983cb5ad30mr1633338ion.7.1695912007385;
        Thu, 28 Sep 2023 07:40:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a17-20020a056638005100b0042bb1c9b59csm4700134jap.126.2023.09.28.07.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 07:40:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 28 Sep 2023 07:40:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, Douglas Gilbert <dgilbert@interlog.com>
Subject: Re: [PATCH v2] usb: pd: Exposing the Peak Current value of Fixed
 Supplies to user space
Message-ID: <9769a31a-5fc5-4912-b7dc-cc70a8fd12bb@roeck-us.net>
References: <20230928105944.1718897-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928105944.1718897-1-heikki.krogerus@linux.intel.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Sep 28, 2023 at 01:59:44PM +0300, Heikki Krogerus wrote:
> Exposing the value of the field as is.
> 
> The Peak Current value has to be interpreted as described
> in Table 6-10 (Fixed Power Source Peak Current Capability)
> of the USB Power Delivery Specification, but that
> interpretation will be done in user space, not in kernel.
> 
> Suggested-by: Douglas Gilbert <dgilbert@interlog.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v2: Include ABI documentation.
> 
> ---
>  .../testing/sysfs-class-usb_power_delivery    | 31 +++++++++++++++++++
>  drivers/usb/typec/pd.c                        | 10 +++---
>  include/linux/usb/pd.h                        |  1 +
>  3 files changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-usb_power_delivery b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
> index 1bf9d1d7902c..4b0708af4a41 100644
> --- a/Documentation/ABI/testing/sysfs-class-usb_power_delivery
> +++ b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
> @@ -124,6 +124,37 @@ Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
>  Description:
>  		The voltage the supply supports in millivolts.
>  
> +What:		/sys/class/usb_power_delivery/.../source-capabilities/<position>:fixed_supply/peak_current
> +Date:		October 2023
> +Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> +Description:
> +		Fixed Power Source Peak Current Capability
> +		(IOC: Negotiated current as defined in IEC 63002):
> +		==  ===========================================================
> +		0   Peak current equals IOC (default)
> +		1   Overload Capabilities:
> +		    1. Peak current equals 150% IOC for 1ms @ 5% duty cycle
> +		       (low current equals 97% IOC for 19ms)
> +		    2. Peak current equals 125% IOC for 2ms @ 10% duty cycle
> +		       (low current equals 97% IOC for 18ms)
> +		    3. Peak current equals 110% IOC for 10ms @ 50% duty cycle
> +		       (low current equals 90% IOC for 10ms)
> +		2   Overload Capabilities:
> +		    1. Peak current equals 200% IOC for 1ms @ 5% duty cycle
> +		       (low current equals 95% IOC for 19ms)
> +		    2. Peak current equals 150% IOC for 2ms @ 10% duty cycle
> +		       (low current equals 94% IOC for 18ms)
> +		    3. Peak current equals 125% IOC for 10ms @ 50% duty cycle
> +		       (low current equals 75% IOC for 10ms)
> +		3   Overload Capabilities:
> +		    1. Peak current equals 200% IOC for 1ms @ 5% duty cycle
> +		       (low current equals 95% IOC for 19ms)
> +		    2. Peak current equals 175% IOC for 2ms @ 10% duty cycle
> +		       (low current equals 92% IOC for 18ms)
> +		    3. Peak current equals 150% IOC for 10ms @ 50% duty cycle
> +		       (low current equals 50% IOC for 10ms)
> +		==  ===========================================================
> +
>  What:		/sys/class/usb_power_delivery/.../source-capabilities/<position>:fixed_supply/maximum_current
>  Date:		May 2022
>  Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
> index 8cc66e4467c4..85d015cdbe1f 100644
> --- a/drivers/usb/typec/pd.c
> +++ b/drivers/usb/typec/pd.c
> @@ -83,14 +83,12 @@ unchunked_extended_messages_supported_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(unchunked_extended_messages_supported);
>  
> -/*
> - * REVISIT: Peak Current requires access also to the RDO.
>  static ssize_t
>  peak_current_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
> -	...
> +	return sysfs_emit(buf, "%u\n", (to_pdo(dev)->pdo >> PDO_FIXED_PEAK_CURR_SHIFT) & 3);
>  }
> -*/
> +static DEVICE_ATTR_RO(peak_current);
>  
>  static ssize_t
>  fast_role_swap_current_show(struct device *dev, struct device_attribute *attr, char *buf)
> @@ -135,7 +133,7 @@ static struct attribute *source_fixed_supply_attrs[] = {
>  	&dev_attr_usb_communication_capable.attr,
>  	&dev_attr_dual_role_data.attr,
>  	&dev_attr_unchunked_extended_messages_supported.attr,
> -	/*&dev_attr_peak_current.attr,*/
> +	&dev_attr_peak_current.attr,
>  	&dev_attr_voltage.attr,
>  	&maximum_current_attr.attr,
>  	NULL
> @@ -144,7 +142,7 @@ static struct attribute *source_fixed_supply_attrs[] = {
>  static umode_t fixed_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
>  {
>  	if (to_pdo(kobj_to_dev(kobj))->object_position &&
> -	    /*attr != &dev_attr_peak_current.attr &&*/
> +	    attr != &dev_attr_peak_current.attr &&
>  	    attr != &dev_attr_voltage.attr &&
>  	    attr != &maximum_current_attr.attr &&
>  	    attr != &operational_current_attr.attr)
> diff --git a/include/linux/usb/pd.h b/include/linux/usb/pd.h
> index c59fb79a42e8..eb626af0e4e7 100644
> --- a/include/linux/usb/pd.h
> +++ b/include/linux/usb/pd.h
> @@ -228,6 +228,7 @@ enum pd_pdo_type {
>  #define PDO_FIXED_UNCHUNK_EXT		BIT(24) /* Unchunked Extended Message supported (Source) */
>  #define PDO_FIXED_FRS_CURR_MASK		(BIT(24) | BIT(23)) /* FR_Swap Current (Sink) */
>  #define PDO_FIXED_FRS_CURR_SHIFT	23
> +#define PDO_FIXED_PEAK_CURR_SHIFT	20
>  #define PDO_FIXED_VOLT_SHIFT		10	/* 50mV units */
>  #define PDO_FIXED_CURR_SHIFT		0	/* 10mA units */
>  
> -- 
> 2.40.1
> 

