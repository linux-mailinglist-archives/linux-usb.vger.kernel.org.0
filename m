Return-Path: <linux-usb+bounces-29430-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E33F5BED2B1
	for <lists+linux-usb@lfdr.de>; Sat, 18 Oct 2025 17:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B4E4F4E3335
	for <lists+linux-usb@lfdr.de>; Sat, 18 Oct 2025 15:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E20C23958C;
	Sat, 18 Oct 2025 15:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="uKI+mMVR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6926B1F4631
	for <linux-usb@vger.kernel.org>; Sat, 18 Oct 2025 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760801778; cv=none; b=RjvOoRltRrGlpIabqsB8c2zO9shXEbouRwvKJf5EmI56aVpQDUYVL0w0ooESfLy5jIKd6Q6TSBRbgxTzcK86WLG2SRlTJ3snzmNhdDDjD3RFvO7xiu8+Hrg4/LQRFMttU2jFEPXRSGNVME7aSmhi5d88oQQofhlafw5AiEbY1mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760801778; c=relaxed/simple;
	bh=HKGMpN/OFBCHOskvCiqGCvOnHaF502mjxLZhN56t/N4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKlI60ek9ZPF2WW+0V+wR7D/l2JZyScts3D9gcFUUC5MR/v7xutD1kTnLt2XbmuYV0g9iKjzl+Yet0DY0iky9+ZOcnvM3Bg0FvC5E9rGB0iDkzKJuhIivs2VDMoMAUD5LMpDBLw/7IZDMw5pIzpMb462zMu6Kk3Q/zWLXYG+oFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=uKI+mMVR; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-88ec598fa11so428937785a.0
        for <linux-usb@vger.kernel.org>; Sat, 18 Oct 2025 08:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1760801775; x=1761406575; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PBehRj2J0Fcvnu3LPHoi98PBaamFYlDHjRLa/b4kuk4=;
        b=uKI+mMVR/sBedUVlHRn6dAEFZ32+8T87vAWRw9SxoYURMnqM+TtQBu7U/oTtDeE7cl
         sHZSeuSl7BrMbXXKnLf7CxufIfqprK6w3um6JxEZWMycwGeIEnH6DqMz5gKhgUXc9Nik
         4YL9sIe3X95EHJfjFfoJV7abQa0Eq3aAbaFMbtmG3McuZU4GpPt393sRBrL95v+1HCme
         tN8ItdFVMtlERyrtU+a1nZs2hqD2rELl/S13BLy+8HuymbQGoHrwb6mL72v0+ZEcWORW
         My0kPdg74OFa4Vf3KUry2vaJ6Cov5EXA5RMRTKDYRykix4HjmBlsPmt+WWK9xG3Wzt+9
         ID0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760801775; x=1761406575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBehRj2J0Fcvnu3LPHoi98PBaamFYlDHjRLa/b4kuk4=;
        b=QRgGFkM9gZmJT9qoI02aGh1lcY5YHG5EhZ5zCikIjkFXuzjUaW60mEq16luakTTGeN
         fMKxDYxPGVscM+3z2pVZIl/+NZ4Eu8USQrVOxSRgSeH7YMEZoJqCuQJjFmpQ/qS3LsqC
         t3fw2hLoTP9SYvYtMoWQNOufhORVKV1UbPmgVbQVyK/2ETsvRDsYvYvk8arKwajAHANj
         iXscHPnLa1x95Pcs59aQlLL8JrIT9Fwfhy2AbbGuQsZcypCyWoEIiqxQBhCFn4aK6Uig
         hKNk6UpxiZn9GmiDY6QFBD7PdLDWrNOUv+dCyXCL5pkAMdCf334aknF2RArnfsxQQADK
         HxaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLJrw0nz+7sClJE5HC7HgHAxlSnqTt5lVD8kN/R1ATu7eD8WdKEUGa8fog0NFIYhjl72WVDBY19Bw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNIxFud+NDPaAluZhpJ0ZWNux3R8G5PNvKFvpjyflfKZmL3+kA
	27mqmVETk3nnptJVNFe0elEzGnGMdy8gfeyjvhFllruke7ZDcVX9Jrsc8bunVv1CsA==
X-Gm-Gg: ASbGnct4WQT4qM2sQqJsbDL4YsUDmrFn7DpWOfzgJ++oQOdOoBPWrqtclibkXvgKypu
	X+Lpt9YrXk+MT2z0f+l5zQxmCwLE4okn2NqtmCvB8NV779xgHaVD6HL51kXEgs4HgiOOHdQkHIu
	Z9pLdLXR143JMJyzE/3w92LQ+b96od++vfVx+kh3sqKsG+UTlOj5Jpz6HOi5YJW4LKXBLuy2zrT
	J3MjsYc7Y40fpQj0FlUfxUC4BTtP9/8JXJvINyjJev3ZN6LXxaaYcXC/PkcJXi/d/Fm/Lfr29D9
	mHQGsYnDzLuS6PDTqN9HkPKCsiNyMixXvqrVxSGSbp4whgB8du1cCPLW/qn4SOzclZfCuzMRNrH
	M6xb/rxeGsb6VozFiIIAdJh5a5eYN1ueQVsDE0yQUpl5B1gj7+1UU4zal7VJm51JdlF+NJRA/eb
	HXnQ==
X-Google-Smtp-Source: AGHT+IFXbMHvjfgGSrYKRcU1sFFL+GQDsN3U1NlV4sor6nqowwjcMnCgwfLW4KImBzuFI7FutWgzXQ==
X-Received: by 2002:a05:620a:4082:b0:813:3a81:1a49 with SMTP id af79cd13be357-88f0f45255bmr1546091985a.12.1760801775278;
        Sat, 18 Oct 2025 08:36:15 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::a165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cfb57e3csm185096885a.61.2025.10.18.08.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 08:36:14 -0700 (PDT)
Date: Sat, 18 Oct 2025 11:36:11 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: yicongsrfy@163.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, oliver@neukum.org, pabeni@redhat.com
Subject: Re: [PATCH net v5 2/3] net: usb: ax88179_178a: add USB device driver
 for config selection
Message-ID: <6640b191-d25b-4c4e-ac67-144357eb5cc3@rowland.harvard.edu>
References: <20251013110753.0f640774.michal.pecio@gmail.com>
 <20251017024229.1959295-1-yicongsrfy@163.com>
 <db3db4c6-d019-49d0-92ad-96427341589c@rowland.harvard.edu>
 <20251017191511.6dd841e9.michal.pecio@gmail.com>
 <bda50568-a05d-4241-adbe-18efb2251d6e@rowland.harvard.edu>
 <20251018172156.69e93897.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018172156.69e93897.michal.pecio@gmail.com>

On Sat, Oct 18, 2025 at 05:21:56PM +0200, Michal Pecio wrote:
> Existing r8152-cfgselector and the planned ax88179-cfgselector
> implement the following logic:
> 
> IF a device has particular IDs
>    (same id_table as in the vendor interface driver)
> 
> IF the vendor interface driver is loaded
>    (ensured by loading it together with cfgselector)
> 
> IF the vendor driver supports this device
>    (calls internal vendor driver code)
> 
> THEN select the vendor configuration
> 
> 
> It was a PITA, but I have a working proof of concept for r8152.
> 
> Still missing is automatic reevaluation of configuration choice when
> the vendor driver is loaded after device connection (e.g. by udev).
> Those cfgselectors can do it because it seems that registering a new
> device (but not interface) driver forces reevaluation.

It looks like something else is missing too...

> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index d29edc7c616a..eaf21c30eac1 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -1119,6 +1119,29 @@ void usb_deregister(struct usb_driver *driver)
>  }
>  EXPORT_SYMBOL_GPL(usb_deregister);
>  
> +/**
> + * usb_driver_preferred - check if this is a preferred interface driver
> + * @drv: interface driver to check (device drivers are ignored)
> + * @udev: the device we are looking up a driver for
> + * Context: must be able to sleep
> + *
> + * TODO locking?
> + */
> +bool usb_driver_preferred(struct device_driver *drv, struct usb_device *udev)
> +{
> +	struct usb_driver *usb_drv;
> +
> +	if (is_usb_device_driver(drv))
> +		return false;
> +
> +	usb_drv = to_usb_driver(drv);
> +
> +	return usb_drv->preferred &&
> +		usb_device_match_id(udev, usb_drv->id_table) &&
> +		usb_drv->preferred(udev);
> +}
> +EXPORT_SYMBOL_GPL(usb_driver_preferred);

> diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
> index a48994e11ef3..1923e6f4923b 100644
> --- a/drivers/usb/core/generic.c
> +++ b/drivers/usb/core/generic.c
> @@ -49,11 +49,17 @@ static bool is_uac3_config(struct usb_interface_descriptor *desc)
>  	return desc->bInterfaceProtocol == UAC_VERSION_3;
>  }
>  
> +static int prefer_vendor(struct device_driver *drv, void *data)
> +{
> +	return usb_driver_preferred(drv, data);
> +}
> +
>  int usb_choose_configuration(struct usb_device *udev)
>  {
>  	int i;
>  	int num_configs;
>  	int insufficient_power = 0;
> +	bool class_found = false;
>  	struct usb_host_config *c, *best;
>  	struct usb_device_driver *udriver;
>  
> @@ -169,6 +175,12 @@ int usb_choose_configuration(struct usb_device *udev)
>  #endif
>  		}
>  
> +		/* Check if we have a preferred vendor driver for this config */
> +		else if (bus_for_each_drv(&usb_bus_type, NULL, (void *) udev, prefer_vendor)) {
> +			best = c;
> +			break;
> +		}

How are prefer_vendor() and usb_driver_preferred() supposed to know 
which configuration is being considered?

(Also, is prefer_vendor() really needed?  Can't you just pass 
usb_driver_preferred as the argument to bus_for_each_drv()?  Maybe after 
changing the type of its second argument to void * instead of struct 
usb_device *?)

Alan Stern

