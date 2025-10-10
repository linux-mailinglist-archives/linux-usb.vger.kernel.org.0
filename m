Return-Path: <linux-usb+bounces-29121-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 362DBBCD4FC
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 15:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51C4819E0BD9
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 13:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C919A2F39B3;
	Fri, 10 Oct 2025 13:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CymbGA4E"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEA52F3631
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 13:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760103776; cv=none; b=nMqOmLm0wHJlxKb4eCG/VFIlMLl7VoE1+opIN6FVh9wjp7c3tQZSERN7Yc6zEd+SjamgNQcHhett2EHbp6L7Sn3vM8WQx+ajFRGRs816Ivr58FpCRPNugb1pVnC2D9sQ7QSUpM0NAI7cPB6cy/qWxVzCGtHAsMJ9MdduDckPIU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760103776; c=relaxed/simple;
	bh=7XLQ8S+YhXAtZSlNkDxw72LTem5c2jAAvW3oPj00LHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H1lRvZiG9VTLdKvyEHpXIXtRXCsQIePo6uh0kn5j0NslQ0UkS+koilIsNM0jOa4CxqH64UDol8D0NQu4B/m2sv7e2gVJ0EGlaqctBD4kkUOmc/KXSxKj7gkcqDq26XdcsFDkDvFR4l6wXEs9mP8t0iudUy+ZHXQCB9uDuIQXMfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CymbGA4E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095ACC4CEF8;
	Fri, 10 Oct 2025 13:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760103775;
	bh=7XLQ8S+YhXAtZSlNkDxw72LTem5c2jAAvW3oPj00LHE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CymbGA4E5pyLmmMgGugjlKLwbhAv3UIJdaXWjjMJHiwr1v4mRx+Lg3h8RFUsV6lKZ
	 AcTTVKA+E6mSMZrh9SELZa63T4FJA4DlMD01KdC6QxpF5BJwzc14xtYHd5sih8eEpd
	 gyiDTRveJeXVk2HD0X1n7zJZdptuMvG6E6SZFDS+b0WwxEtfB7IdNmwVhX1N79aeg1
	 pfKDGGFNSIKzXV2y0pBzZEk8EC+dHHrFTPaLhnuwEmmlMtygaevmO6xIr5Bm9/chBG
	 n2JQc4IzR0ZTylGHPG7U4xk2JG5yWFRZexQP2N3RTpPbI1rh0K6UkByfMlWDtRnpzd
	 PuoRtfxw69S9g==
Message-ID: <9bff88b4-9b17-46fb-97d9-58a007faafb6@kernel.org>
Date: Fri, 10 Oct 2025 15:42:53 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: ljca: Improve ACPI hardware ID documentation
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-usb@vger.kernel.org
Cc: Lixu Zhang <lixu.zhang@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20251010055625.4147844-1-sakari.ailus@linux.intel.com>
 <20251010055625.4147844-2-sakari.ailus@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251010055625.4147844-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10-Oct-25 7:56 AM, Sakari Ailus wrote:
> Document the differences between the LJCA client device ACPI hardware IDs,
> including the USBIO IDs used for LJCA devices.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
>  drivers/usb/misc/usb-ljca.c | 37 ++++++++++++++++++++++++-------------
>  1 file changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> index cf01cc727685..ebc18fae76e8 100644
> --- a/drivers/usb/misc/usb-ljca.c
> +++ b/drivers/usb/misc/usb-ljca.c
> @@ -164,28 +164,39 @@ struct ljca_match_ids_walk_data {
>  	struct acpi_device *adev;
>  };
>  
> +/*
> + * ACPI hardware IDs for LJCA client devices.
> + *
> + * [1] Some BIOS implementations use these IDs for denoting LJCA client devices
> + *     even though the IDs have been allocated for USBIO. This isn't a problem
> + *     as the usb-ljca driver is probed based on the USB device's vendor and
> + *     product IDs and its client drivers are probed based on auxiliary device
> + *     names, not these ACPI _HIDs. List of such systems:
> + *
> + *     Dell Precision 5490
> + */
>  static const struct acpi_device_id ljca_gpio_hids[] = {
> -	{ "INTC100B" },
> -	{ "INTC1074" },
> -	{ "INTC1096" },
> -	{ "INTC10B5" },
> -	{ "INTC10D1" },
> +	{ "INTC100B" }, /* RPL LJCA GPIO */
> +	{ "INTC1074" }, /* CVF LJCA GPIO */
> +	{ "INTC1096" }, /* ADL LJCA GPIO */
> +	{ "INTC10B5" }, /* LNL LJCA GPIO */
> +	{ "INTC10D1" }, /* MTL (CVF VSC) USBIO GPIO [1] */
>  	{},
>  };
>  
>  static const struct acpi_device_id ljca_i2c_hids[] = {
> -	{ "INTC100C" },
> -	{ "INTC1075" },
> -	{ "INTC1097" },
> -	{ "INTC10D2" },
> +	{ "INTC100C" }, /* RPL LJCA I2C */
> +	{ "INTC1075" }, /* CVF LJCA I2C */
> +	{ "INTC1097" }, /* ADL LJCA I2C */
> +	{ "INTC10D2" }, /* MTL (CVF VSC) USBIO I2C [1] */
>  	{},
>  };
>  
>  static const struct acpi_device_id ljca_spi_hids[] = {
> -	{ "INTC100D" },
> -	{ "INTC1091" },
> -	{ "INTC1098" },
> -	{ "INTC10D3" },
> +	{ "INTC100D" }, /* RPL LJCA SPI */
> +	{ "INTC1091" }, /* TGL/ADL LJCA SPI */
> +	{ "INTC1098" }, /* ADL LJCA SPI */
> +	{ "INTC10D3" }, /* MTL (CVF VSC) USBIO SPI [1] */
>  	{},
>  };
>  


