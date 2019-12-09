Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27E9A116D17
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2019 13:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbfLIM0O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Dec 2019 07:26:14 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33343 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727232AbfLIM0N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Dec 2019 07:26:13 -0500
Received: by mail-wr1-f65.google.com with SMTP id b6so16004782wrq.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Dec 2019 04:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=4MycIS0Mr7kbgLEUnrghCFKHS6Fv8sUXLmJACCyIy3g=;
        b=RbIDd3BP3mSZCNJiL2JN7r1HsM3iRFU/3Lz1pq1MEZs52YPRohzz3Q8caEklEWNHGY
         tJDCv97eoJgUUeFPUxtm6FRcFsNq+qMpBoyxQ2LD/dSXvvnTOGNrBP5seSnQ6YsSbeaU
         yU0YIrPgCPSzhWqU3J82WE+MiVVawa4eaTQiZkX82HrMOMEFxOFLnpVMtiQX5nrQ/58b
         9L1pob3q45Lczv57BP/o3jFzWS+8i7RRp7FdCyCzT/r5reVRDSDdWMxtmiVn+iiNma9+
         U4ep23fUg5cuvhDsMb9VbHDhdd9U7HsN4w7uMkl/14l/2a7qObQuWThqPIbDQExmvHFP
         r47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=4MycIS0Mr7kbgLEUnrghCFKHS6Fv8sUXLmJACCyIy3g=;
        b=RPTBDFtXdlxCy1/n8QLq9V5abY5L55xedVQIP7FxAkBD09ne1t7AxoEmpAXfcfjR+u
         67eyjsymmZMj944CvsR79pqPzS69iJ98M3SirMCCDLPg2lx7gEBkxuH9y9S7quqAqzAl
         kbbqPMAVI/5NVPj1rE9KZh5D3s1MDZVEB/IiI1lSOJ7sXPdkDOk6uI9n9JUwDlEZD0RO
         UEmaTKV1rNqIaTyLJ2dP2muZorb9gJ0fUeWSzMjJMLUqSqHaMzivLSUPHcIvNyJhvdO8
         i0/IUyZwDi+ZubXnRn7Oucc3aNHUB1Ko8uhss6RwRUQLcVHXHTs43NDuxWc/HHggeHV5
         buFA==
X-Gm-Message-State: APjAAAU5+CZb8K77m71LZvOLziqjqCGhN9C3w1W6S5d9MAJpJFXzi8/Z
        lCggaJ23n693d6zXTdCRTsU1Ew==
X-Google-Smtp-Source: APXvYqzI9xqo4zlb1PIF/bINPYtefakENyQ/uKDc2QJ3TW/ZHjCLMvWi9EoN8NNUs9+4dfMikPZtfw==
X-Received: by 2002:adf:fe43:: with SMTP id m3mr1917159wrs.213.1575894371495;
        Mon, 09 Dec 2019 04:26:11 -0800 (PST)
Received: from dell ([2.27.35.145])
        by smtp.gmail.com with ESMTPSA id h17sm28294023wrs.18.2019.12.09.04.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 04:26:10 -0800 (PST)
Date:   Mon, 9 Dec 2019 12:26:04 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     syzbot+48a2851be24583b864dc@syzkaller.appspotmail.com,
        linux-usb@vger.kernel.org
Subject: Re: WARNING in dln2_start_rx_urbs/usb_submit_urb
Message-ID: <20191209122604.GH3468@dell>
References: <1574263316.14298.36.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1574263316.14298.36.camel@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 20 Nov 2019, Oliver Neukum wrote:

> #syz test: https://github.com/google/kasan.git b1aa9d83
> 
> From 6f3de1e2c53fcee54d90a6891df9cea763eca86b Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Wed, 20 Nov 2019 16:15:13 +0100
> Subject: [PATCH] mfd: dln2: more sanity checking for endpoints
> 
> It is not enough to check for the number of endpoints.
> The types must also be correct.
> 
> Reported-by: syzbot+48a2851be24583b864dc@syzkaller.appspotmail.com
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/mfd/dln2.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

Looks okay in principle.

It would be great if one of the USB guys could take a quick look.

Is this not something that could be done at a subsystem level?

> diff --git a/drivers/mfd/dln2.c b/drivers/mfd/dln2.c
> index 381593fbe50f..7841c11411d0 100644
> --- a/drivers/mfd/dln2.c
> +++ b/drivers/mfd/dln2.c
> @@ -722,6 +722,8 @@ static int dln2_probe(struct usb_interface *interface,
>  		      const struct usb_device_id *usb_id)
>  {
>  	struct usb_host_interface *hostif = interface->cur_altsetting;
> +	struct usb_endpoint_descriptor *epin;
> +	struct usb_endpoint_descriptor *epout;
>  	struct device *dev = &interface->dev;
>  	struct dln2_dev *dln2;
>  	int ret;
> @@ -731,12 +733,19 @@ static int dln2_probe(struct usb_interface *interface,
>  	    hostif->desc.bNumEndpoints < 2)
>  		return -ENODEV;
>  
> +	epin = &hostif->endpoint[0].desc;
> +	epout = &hostif->endpoint[1].desc;
> +	if (!usb_endpoint_is_bulk_out(epout))
> +		return -ENODEV;
> +	if (!usb_endpoint_is_bulk_in(epin))
> +		return -ENODEV;
> +
>  	dln2 = kzalloc(sizeof(*dln2), GFP_KERNEL);
>  	if (!dln2)
>  		return -ENOMEM;
>  
> -	dln2->ep_out = hostif->endpoint[0].desc.bEndpointAddress;
> -	dln2->ep_in = hostif->endpoint[1].desc.bEndpointAddress;
> +	dln2->ep_out = epout->bEndpointAddress;
> +	dln2->ep_in = epin->bEndpointAddress;
>  	dln2->usb_dev = usb_get_dev(interface_to_usbdev(interface));
>  	dln2->interface = interface;
>  	usb_set_intfdata(interface, dln2);

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
