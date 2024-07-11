Return-Path: <linux-usb+bounces-12130-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DA992DE1F
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jul 2024 03:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 685221F2266D
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jul 2024 01:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F51C121;
	Thu, 11 Jul 2024 01:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="pHru8cC0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031C83D66
	for <linux-usb@vger.kernel.org>; Thu, 11 Jul 2024 01:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720662465; cv=none; b=hnYb29apPl0HJmuitNU4zkTIhln/eOqmvTN5etG7qV8dQvaBp4zbOUZ7wMcRuVmEO4UgIcyYaiX1i3242CVrdCH762rhrQTkziUaAFKqDME82lj9l5oVT6YMDR004qMLmA9JReRKaN5TILpRDWLwpxuGKc+LcZcNhY++1uuN5LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720662465; c=relaxed/simple;
	bh=tMFHkxFPolROgECg5vVgfcIDDwUKCaXiGLwl/jzzNxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lIDHAHRRf8VBLZv5n2koRMJURPpV0HI2wUWwAuDi7LT9w0rqXPExWFjp3+bjbevqKSa5eFtl8dVtOq0OmhmLqbinI1HOAYo0oGIS2fLxPvvXEYK3DoxWoMUACyHHnNh0dOX7Z6nzUu0yujay/Jm5eQVXFOXlYXIDXnY6NGSBIyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=pHru8cC0; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-79ef7ecc7d4so25012585a.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 18:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1720662462; x=1721267262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0tN5R4YnhjAUO3BS4jN/9VwPte3wOBowtI6nf3MDomk=;
        b=pHru8cC0YN6mRmgOdmfgJIWkpiUVicLikpcJ/YpZl+2g5WE5cv04ifNnrvPZg5SF1w
         u9qh01sSs+okmblCat905LupU4j2bM9nZRmDuU5PgjdZSoWBYR1OOmzek1+dfWQXA+bx
         n2jImCartjAPXCz+fC6IcQrBzeDAR4o83b3+UGPM8SScfeakR8tnZT1198ct/SWWhR91
         +CuM/nNOXF/YWAEw18sTGSIJizY3fo+mdjM07pqRoI4BlB9xMuXigqP71rW725rhvXJK
         wl26JOzrs+PosLJKlWwUmAY2GwC6mXFOELpKwiPmyoSvbZnnrZDfCIIyBlHaJeSkyEca
         F4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720662462; x=1721267262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tN5R4YnhjAUO3BS4jN/9VwPte3wOBowtI6nf3MDomk=;
        b=v/919EQuPzJPZ1y9+7wG6Tdv/xYIxUVW27QRktSvt0r/2hAsxIjWV7x2+gBZLYjOn7
         xL+mXJgUbcjuJX7L8I9n0SC3djhpM80ewHBu6XHrQIvqwdZmE4Ek4b51V1Od0SuYVNXu
         02+8tnUVi4Iz32nHubm4x+CEfqx4/M0864fb/gxJa+9/m+RTMUFH9/5psAdqU0xetBMJ
         I3obt+jPuYZVcmBwrojy02L1+Ud/WQt7erHoogN4ROrSH90J3606Zo5p+jlzKW2yIic8
         nLVrgMexisNus98dfRJaP3262N4JuMFR/jkg962bHcb7ocmGsH137MdVRZ1OwNfaMZRJ
         r8Bg==
X-Forwarded-Encrypted: i=1; AJvYcCW5eOb0kclixXrQTI81Bc2y28j6unln6geCpv6x5hUz/BUTkxfKwfZMYUFI0weH3AwHnpOEXWesENT+vOS8aR2fcmT8Tvgbg6tf
X-Gm-Message-State: AOJu0YzMYI9FgtvXMKwfD6a5z+Us+z2zjrCJW7vDXAJaI7vuReStGAGq
	O5Sj+AJYwxFaq8mEfWJgzaGvcyArGNqplhkbn8UdWzFT4c0eo6gQupba4GGp1Q==
X-Google-Smtp-Source: AGHT+IEdvBZ5AhAWw7kB3UrCG2h7ixiJqeq8PURLRH1rrR34tzFsUpVzykFcjUiDfx5fm+R2MjzjKw==
X-Received: by 2002:a05:620a:2482:b0:79f:b3c:8fcc with SMTP id af79cd13be357-79f199e43e8mr1031660585a.10.1720662461925;
        Wed, 10 Jul 2024 18:47:41 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::cad7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f18f1a32bsm246551285a.0.2024.07.10.18.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 18:47:41 -0700 (PDT)
Date: Wed, 10 Jul 2024 21:47:39 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: ryan <ryanzhou54@gmail.com>
Cc: jikos@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hid: usbhid: Enable remote wake-up based on device
 configuration
Message-ID: <f0c789d8-8ae0-4a46-a5b3-aa9a5a758915@rowland.harvard.edu>
References: <20240710231606.3029-1-ryanzhou54@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710231606.3029-1-ryanzhou54@gmail.com>

On Thu, Jul 11, 2024 at 07:16:06AM +0800, ryan wrote:
> According to the USB protocol, the host should automatically
> adapt the remote wake-up function based on the configuration
> descriptor reported by the device, rather than only the default
> keyboard support. Therefore, it's necessary to support other hid
> devices, such as digital headsets,mice,etc.

It's true that the host shouldn't try to enable remote wakeup if the 
configuration descriptor shows that the device doesn't support it.

However, it's not true that the host should try to enable remote wakeup 
for devices other than keyboards with boot-protocol support.  History 
has shown that quite a few HID devices don't handle remote wakeup 
properly; the decision about whether to enable it should be left to the 
user.

Alan Stern

> Signed-off-by: ryan <ryanzhou54@gmail.com>
> ---
>  drivers/hid/usbhid/hid-core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> index a90ed2ceae84..d2901ad9a871 100644
> --- a/drivers/hid/usbhid/hid-core.c
> +++ b/drivers/hid/usbhid/hid-core.c
> @@ -1179,16 +1179,16 @@ static int usbhid_start(struct hid_device *hid)
>  	/* Some keyboards don't work until their LEDs have been set.
>  	 * Since BIOSes do set the LEDs, it must be safe for any device
>  	 * that supports the keyboard boot protocol.
> -	 * In addition, enable remote wakeup by default for all keyboard
> -	 * devices supporting the boot protocol.
>  	 */
>  	if (interface->desc.bInterfaceSubClass == USB_INTERFACE_SUBCLASS_BOOT &&
>  			interface->desc.bInterfaceProtocol ==
>  				USB_INTERFACE_PROTOCOL_KEYBOARD) {
>  		usbhid_set_leds(hid);
> -		device_set_wakeup_enable(&dev->dev, 1);
>  	}
>  
> +	if (dev->actconfig->desc.bmAttributes & USB_CONFIG_ATT_WAKEUP)
> +		device_set_wakeup_enable(&dev->dev, 1);
> +
>  	mutex_unlock(&usbhid->mutex);
>  	return 0;
>  
> -- 
> 2.17.1
> 
> 

