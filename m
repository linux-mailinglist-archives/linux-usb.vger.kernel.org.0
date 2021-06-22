Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B5D3B0DD9
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jun 2021 21:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232415AbhFVT4u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Jun 2021 15:56:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:35390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231726AbhFVT4u (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Jun 2021 15:56:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6441B6100B;
        Tue, 22 Jun 2021 19:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624391673;
        bh=9xFNgWD5WjGGr4+XziBGhw3h4fM7+KSQkWzAO37HN+k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hlq4zV3XsC9BHTG2elkpPwjuXOH31TqwXAxu0WNJd3aROxs3zZooeNn9OhhqLthXX
         gcIUSfcJoZWA9OOL932ONImcM+a0KwCLe3VsjMIjmDF1YTxNuOvzSBdkEsFtxpvDfM
         IKSa+R7Gks6PwBhuI2PJFwlMnnXYsTk1v+cCly0w=
Date:   Tue, 22 Jun 2021 21:54:31 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hannu Hartikainen <hannu@hrtk.in>
Cc:     linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH] USB: cdc-acm: blacklist Heimann USB Appset device
Message-ID: <YNI/9/gbehhaNC1t@kroah.com>
References: <20210622141454.337948-1-hannu@hrtk.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622141454.337948-1-hannu@hrtk.in>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 22, 2021 at 05:14:54PM +0300, Hannu Hartikainen wrote:
> The device (32a7:0000 Heimann Sensor GmbH USB appset demo) claims to be
> a CDC-ACM device in its descriptors but in fact is not. If it is run
> with echo disabled it returns garbled data, probably due to something
> that happens in the TTY layer. And when run with echo enabled (the
> default), it will mess up the calibration data of the sensor the first
> time any data is sent to the device.
> 
> In short, I had a bad time after connecting the sensor and trying to get
> it to work. I hope blacklisting it in the cdc-acm driver will save
> someone else a bit of trouble.
> 
> Signed-off-by: Hannu Hartikainen <hannu@hrtk.in>
> ---
> 
> This is my first time submitting a patch. I hope I'll be able to submit
> a driver for this device later. The device is a microcontroller-based
> USB implementation/converter for a thermal camera that communicates over
> SPI.
> 
>  drivers/usb/class/cdc-acm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> index ca7a61190dd9..d50b606d09aa 100644
> --- a/drivers/usb/class/cdc-acm.c
> +++ b/drivers/usb/class/cdc-acm.c
> @@ -1959,6 +1959,11 @@ static const struct usb_device_id acm_ids[] = {
>  	.driver_info = IGNORE_DEVICE,
>  	},
>  
> +	/* Exclude Heimann Sensor GmbH USB appset demo */
> +	{ USB_DEVICE(0x32a7, 0x0000),
> +	.driver_info = IGNORE_DEVICE,
> +	},
> +

If it's blacklisted here, what driver does control this device?

thanks,

greg k-h
