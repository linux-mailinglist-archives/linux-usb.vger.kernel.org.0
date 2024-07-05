Return-Path: <linux-usb+bounces-12017-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD1092854F
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2024 11:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A59DE2820B8
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2024 09:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73CA1474A4;
	Fri,  5 Jul 2024 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="S/olv0i2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6F0146A8E
	for <linux-usb@vger.kernel.org>; Fri,  5 Jul 2024 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720172449; cv=none; b=ESNPansmuUp7CsW588pBezdkur78k1eahidZbgYVdZETXIURUAt+tqrF0NFxj68XvQzssAx707wOcZ5xyjWt18GwLE7T3wNMBFfc2DCWH/J6h+Okz73klqhAqVJJPAIhzdv6cKLK54PlVmst4VWM8I53omD/bn01HDog0l2gOjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720172449; c=relaxed/simple;
	bh=XOQ/B+RfN+wmeN2gSORjxfuuGaDB9023FQeate3hdzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kK+ERKwza/+ps1m004yt+c45IGz2JvCiSdeLXW2J3XKroXxmfMonQHsaWztdMZ6caFUauwiQeyx2LSoYRekFdpTsDBHLvBMOqhHhlvZWIBMGuUQbnotqERQauFygY0gOsVM8J1LsW+3ttVRpEaQF5fZCmSQMNCBrBlpUmKDhInk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=S/olv0i2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8908CC116B1;
	Fri,  5 Jul 2024 09:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720172448;
	bh=XOQ/B+RfN+wmeN2gSORjxfuuGaDB9023FQeate3hdzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S/olv0i2whrsE7Gq92ecTaxUdC5nPsdrlYKgqFodNq7JEYYRUOzjAmaGIdfTUotwW
	 iB3rtZGYrzxAKKCZQ+UeErA6ljH99xFfq0Uhxgx16GOaVqIIGNEmJ/xZRQUMz1SeDX
	 1PuHywWU/9Jwmy/Ar85hHUVof+9rQC3+VJWlw7V4=
Date: Fri, 5 Jul 2024 11:40:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v1] usbip: Add USB_SPEED_SUPER_PLUS as valid arg
Message-ID: <2024070534-sculpture-spooky-daa6@gregkh>
References: <20240705091902.789643-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240705091902.789643-1-ukaszb@chromium.org>

On Fri, Jul 05, 2024 at 09:19:02AM +0000, Łukasz Bartosik wrote:
> Add USB_SPEED_SUPER_PLUS as valid argument to allow
> to attach USB SuperSpeed+ devices.
> 
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
>  drivers/usb/usbip/vhci_sysfs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
> index e2847cd3e6e3..d5865460e82d 100644
> --- a/drivers/usb/usbip/vhci_sysfs.c
> +++ b/drivers/usb/usbip/vhci_sysfs.c
> @@ -283,6 +283,7 @@ static int valid_args(__u32 *pdev_nr, __u32 *rhport,
>  	case USB_SPEED_HIGH:
>  	case USB_SPEED_WIRELESS:
>  	case USB_SPEED_SUPER:
> +	case USB_SPEED_SUPER_PLUS:
>  		break;
>  	default:
>  		pr_err("Failed attach request for unsupported USB speed: %s\n",
> @@ -349,7 +350,7 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
>  	vhci_hcd = hcd_to_vhci_hcd(hcd);
>  	vhci = vhci_hcd->vhci;
>  
> -	if (speed == USB_SPEED_SUPER)
> +	if (speed >= USB_SPEED_SUPER)

It's an enum, are you sure this will work?

thanks,

greg k-h

