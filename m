Return-Path: <linux-usb+bounces-21427-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C7BA54C2A
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 14:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE3C77A8F8B
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 13:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3162920E6E0;
	Thu,  6 Mar 2025 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="WtYsCFSV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BA420CCC8
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 13:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741267754; cv=none; b=P8H5medqa/D8GHqdPUEgGB7aTsKeP5n1+wIFd4UoJYyXQy6AyH7Y4VcwfFshqLHgMMuKBbCC2KxNcBNGsMZp78J4PyvmXOCBdEogwA6e9wawbdTcCxXtGfiOFi3fsNbGwRaLzA4tWHrWYTaMEzbY3Ve2+2D8wunYSoHBTgPgKaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741267754; c=relaxed/simple;
	bh=Zk6KznM1Mny3IifnHC66rR/yxzf5hcz/58qW1fHNFzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bry6UybnLwWk9k/kBZUjFSXRYh0weeUeONPWfNf9bq1V4AVap6W6JtFuviiE22OXjSVctajI5HiH4BaaOL/SYqAIldipmS8s6PJu2SPU996TKVYQIgw1ovTXMBasS+n88j/RDvgufG+/Ie5dCzHG0p7cm7+RjIKQzYLbrkxq+FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=WtYsCFSV; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c089b2e239so57114885a.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Mar 2025 05:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1741267752; x=1741872552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TO273gAYQ0oUb9YC0Kv4nC2xrHAVYrUP62Xzo8si0Uw=;
        b=WtYsCFSVWhhtSCYH1osSgbgSDODlO+pseYZ8PDoJ7ZtIZXCvVe1bHvtazsLLqa+4Pv
         TSmhtudLi9/tzvdvaixJJ99FLuU7vd65/AkjLdnPi/4h5/+3waaLqP1eVTgaLctMA5Ir
         UZapzOek0/n8MErWvTldVeqAxc8Gub2x/a+pyHwKSLog9sk5EVnytI0M12M6eQe3o9AN
         lcjvj+6t4bPngx3U0Bz5zFb7bh+JyluchjPfASqeXqfKVHkZBiYau+pxVgC4KZWMWVzC
         ykgc2EQnJuswMbmAOmTmtKRRKYtSBcpYTUKFhWMhTY2p8WbcMMc5scpzGTYO7YDPClpv
         A+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741267752; x=1741872552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TO273gAYQ0oUb9YC0Kv4nC2xrHAVYrUP62Xzo8si0Uw=;
        b=t+u1TjBMeMvaC2Cgd5YZ+F9Z21ek1Joc1K8AXjcLaRV6wDEzOoUH9hRSArDj6IgRkY
         vEZn0Y3RgKD6zLMa6U7+OYohmE66t561VL6iwKQQ07tqWjlPevPHM3WybElTOSdbpqNC
         zEpuFbksF3gG7joHh5fWkckSQggVv7RcXDIsYj/FkewB9lfnjVOXSjc1watuuxt4owMz
         Pw5txOFx64xMMVBKUjeXYBVa0UtvC7yBJDip8nFE+uCTvl4KNNmAD4Qwi/qq40chCX/K
         g0SDy14I6G2keXZyAkTjShAsz8PCaVOtTd4/14+n7e5rSz/Ow0K5J6at95NYOKoyOmRV
         T35A==
X-Forwarded-Encrypted: i=1; AJvYcCXy070HK31ACE5V7XebbUgO0Hq0Nm+lMpuKY+opyNFw22lyz+AoYb1oBTt0RNW8SXEMbBXE4CaRXZc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy49zWij4wPYPPlKS2jPjhFRtfaD0rCK3/EF7pgh1Ljx6qqXcwE
	dV4/VWt/scEjwdqJrG1z6XHCP20DpYIj4qHFOxY18o8PNkrqyP4gAKrWUARJvw==
X-Gm-Gg: ASbGncujfJxK7lG/q1xXnPAbZyMJ3mqGVuLCu6nbfUKCGCgDXp1h5FT4DYUajWw3sT9
	+X2i9rn050PHZXLuKNQil5LUpkn5lQZxKkiZ0XH26TXWb7Fq/gERAL1LsfvmathWZHRzVaLXuT5
	PBsEnVKaJ4bnJfTWq5CvTUbfsc2gvpEurw80TFZVVWw8qOYTiy/IlqF9hThyd4Kpnu1hVPvud//
	UP8Jp3q5ObHhqX0aLQtP+6k+kP3+IM/3IhfLQVjJR3eRSp1VrhjgZEu64MKE5dyu8Jh/Mkr9+XI
	G2bHJNBQJpgTYfdgA9CeZP1gYgvSLKJH5Ipy80CZFzDr2A==
X-Google-Smtp-Source: AGHT+IG8tT1+AXlJX2np1Pv8ZLeKeVEq894Sr4SIQ9hI43LDy8VQzN1drOvtY/uAtno3oVS/H4tnyQ==
X-Received: by 2002:a05:620a:6087:b0:7c3:ca29:c87e with SMTP id af79cd13be357-7c3e3a1c978mr415437085a.21.1741267751741;
        Thu, 06 Mar 2025 05:29:11 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::3ca7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e551d075sm90283285a.112.2025.03.06.05.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 05:29:11 -0800 (PST)
Date: Thu, 6 Mar 2025 08:29:08 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Jiayi Li <lijiayi@kylinos.cn>
Cc: gregkh@linuxfoundation.org, stefan.eichenberger@toradex.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	jiayi_dec@163.com
Subject: Re: [PATCH v1] usb: core: Add boot delay for DH34 board in restore
 mode
Message-ID: <d3b12542-4919-45e7-b2a5-28742a6c7943@rowland.harvard.edu>
References: <20250306061749.1502029-1-lijiayi@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306061749.1502029-1-lijiayi@kylinos.cn>

On Thu, Mar 06, 2025 at 02:17:49PM +0800, Jiayi Li wrote:
> On certain DH34-model motherboards, USB keyboards may fail to respond
> during the restore mode confirmation prompt due to the usbhid driver
> not being fully initialized when device registration occurs.

Why does that make any difference?  The driver core will probe the 
usbhid driver when it is fully registered (assuming the keyboard device 
hasn't been bound to a different driver in the meantime).

>  This
> results in inability to input 'y'/'n' confirmation.
> 
> Detect this scenario by:
> 1. Checking DMI_BOARD_NAME for "DH34" substring
> 2. Verifying "restore" in kernel command line
> 
> Introduce a 200ms delay before device registration when both conditions
> are met. This allows sufficient time for the usbhid driver to properly
> initialize before user interaction is required.

Why does delaying device registration help?  In theory it should make 
things worse: When user interaction is required, the keyboard device 
won't even be registered yet, let alone bound to the usbhid driver.  

Furthermore, your patch delays registration of _all_ devices, not just 
the keyboard device.  This will slow down the restore-mode boot 
procedure considerably.

It sounds like what you really need to do is delay the user interaction, 
leaving the device and driver initialization and registration unchanged.

Alan Stern

> Signed-off-by: Jiayi Li <lijiayi@kylinos.cn>
> ---
>  drivers/usb/core/hub.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index a76bb50b6202..b81b518f438b 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -36,6 +36,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/uaccess.h>
>  #include <asm/byteorder.h>
> +#include <linux/dmi.h>
>  
>  #include "hub.h"
>  #include "phy.h"
> @@ -2610,6 +2611,7 @@ static void set_usb_port_removable(struct usb_device *udev)
>  int usb_new_device(struct usb_device *udev)
>  {
>  	int err;
> +	const char *board_name;
>  
>  	if (udev->parent) {
>  		/* Initialize non-root-hub device wakeup to disabled;
> @@ -2656,6 +2658,17 @@ int usb_new_device(struct usb_device *udev)
>  	/* check whether the hub or firmware marks this port as non-removable */
>  	set_usb_port_removable(udev);
>  
> +	/* get board manufacturer information (DMI_BOARD_VENDOR) */
> +	board_name = dmi_get_system_info(DMI_BOARD_NAME);
> +
> +	/* In order to load the usbhid driver on a specific model motherboards
> +	 * before the restore mode confirmation, add 200ms of latancy.
> +	 */
> +	if (board_name && strstr(board_name, "DH34") &&
> +		(strstr(saved_command_line, "restore") != NULL))
> +		msleep(200);
> +
> +
>  	/* Register the device.  The device driver is responsible
>  	 * for configuring the device and invoking the add-device
>  	 * notifier chain (used by usbfs and possibly others).
> -- 
> 2.47.1
> 

