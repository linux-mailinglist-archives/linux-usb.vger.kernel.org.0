Return-Path: <linux-usb+bounces-29120-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB8CBCD4F6
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 15:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6FF054F14EB
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 13:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBAF2F25FC;
	Fri, 10 Oct 2025 13:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UuWG/zav"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04AB34BA2D
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 13:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760103742; cv=none; b=XtzG24IT1WI//gkyKFjgSLFNgTjM9TsFA9HonD042dh5WUOJSyJc+wwsV3+BpWZ/Jqo7n7WBSfEApZh9+2b40a6N0EuYXYsxgALXbwO6pAY7x/ktKlPrIRQc9YxaQdK5KWYjXAdsxhUCI3353Bcr+kqf/Dbo7v45DGLBxP2BkSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760103742; c=relaxed/simple;
	bh=/R7x066f19INhVF4XLHZ47x2h1FXsIvTRGC6IeLQND4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQGAYy6xJiDdT42/Nf6Iv47SswjbayIWUpyJA/wSu/OGnJa8zhyDx7/cRLCSxhdKNhmS7q4gj2TGcWsOfTnU3Ktx04aOBMGHFvvzww2h9irH9dkmEiE2YJU2xk/gGYKdUCBDKq7UfRcDESwGEsSp96NYuETgREz+TV5aKRTfEQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UuWG/zav; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532DDC4CEF1;
	Fri, 10 Oct 2025 13:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760103742;
	bh=/R7x066f19INhVF4XLHZ47x2h1FXsIvTRGC6IeLQND4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UuWG/zavN3aokjdxJWoC/i920iZJrgITRwpx/nRCMmfc89oqXP0y/D7UKHMy+D1Zx
	 yOiIHxGNy3BXAhBdsKZdyM1YOX6DkAF1A/uSO3GF4BwUiv7KxeAfuuBrD33OuhOjHz
	 xM0xVcfj77Szu8vZ4tpVM5BSx/0IirkPeQ7ulNwVNT+Jjs3T8e2EztM5oVOFBH1i4t
	 oQQwEW0Nee1kyNJ8KC0KTylquOXbZtCrH/4G2/pJMTTW6gHPABUMFJmuwK51kPcymE
	 DoGIhiSQ8RZhZEaAS4LGl2mfZtkvOK33IqJWXgXZ0AhojUOgkZZSBj00NUDUqsY8Sx
	 rPGF16nICnXdg==
Message-ID: <c5813aef-a09c-401d-96fd-41da92beb9ec@kernel.org>
Date: Fri, 10 Oct 2025 15:42:19 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: ljca: Order ACPI hardware IDs alphabetically
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-usb@vger.kernel.org
Cc: Lixu Zhang <lixu.zhang@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20251010055625.4147844-1-sakari.ailus@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251010055625.4147844-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10-Oct-25 7:56 AM, Sakari Ailus wrote:
> The driver has three lists of ACPI hardware IDs, for GPIO, I²C and SPI.
> Order them alphabetically.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Note 1 remark to maybe be addressed in a separate patch
below.



> ---
>  drivers/usb/misc/usb-ljca.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> index c562630d862c..cf01cc727685 100644
> --- a/drivers/usb/misc/usb-ljca.c
> +++ b/drivers/usb/misc/usb-ljca.c
> @@ -165,26 +165,26 @@ struct ljca_match_ids_walk_data {
>  };
>  
>  static const struct acpi_device_id ljca_gpio_hids[] = {
> +	{ "INTC100B" },
>  	{ "INTC1074" },
>  	{ "INTC1096" },
> -	{ "INTC100B" },
> -	{ "INTC10D1" },
>  	{ "INTC10B5" },

This "INTC10B5" looks weird here, I don't think this actually
is in use. As can be seen by the matching "INTC10B6" HID
missing from ljca_i2c_hids[]. if we really needed "INTC10B5"
then I would expect "INTC10B6" to also be in the i2c list.

Regards,

Hans




> +	{ "INTC10D1" },
>  	{},
>  };
>  
>  static const struct acpi_device_id ljca_i2c_hids[] = {
> +	{ "INTC100C" },
>  	{ "INTC1075" },
>  	{ "INTC1097" },
> -	{ "INTC100C" },
>  	{ "INTC10D2" },
>  	{},
>  };
>  
>  static const struct acpi_device_id ljca_spi_hids[] = {
> +	{ "INTC100D" },
>  	{ "INTC1091" },
>  	{ "INTC1098" },
> -	{ "INTC100D" },
>  	{ "INTC10D3" },
>  	{},
>  };


