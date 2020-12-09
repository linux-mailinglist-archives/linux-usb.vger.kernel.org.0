Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17B062D41A5
	for <lists+linux-usb@lfdr.de>; Wed,  9 Dec 2020 13:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730982AbgLIMDC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Dec 2020 07:03:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:58016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730926AbgLIMDC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Dec 2020 07:03:02 -0500
Date:   Wed, 9 Dec 2020 13:03:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607515341;
        bh=ZGo5w3thNNcQk47GqfzkS+XzK5FfFoSaa8dqjlfPttw=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=tJs6DMEzPyrW6JCpOV8/vN+mxtkaos5xUb507tZ8uiAg+yf0OtSw8iTNb7r73r4Q+
         kxvt+Ck5CjW2MnnpjNKoNSEG0WAX9nCUUcIol26uw4hq8tAcT6nNSnIs7KCZmXcR+3
         jFW/Q9p4jv7ELqF0GfOAbGDF/qZQEjiG7OaiPbzQ=
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org, david.partridge@perdrix.co.uk
Subject: Re: [PATCH] USB: UAS: introduce a quirk to set no_write_same
Message-ID: <X9C9Gt5chKLAE1Vq@kroah.com>
References: <20201209110734.30831-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201209110734.30831-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 09, 2020 at 12:07:34PM +0100, Oliver Neukum wrote:
> UAS does not share the pessimistic assumption storage
> is making that devices cannot deal with WRITE_SAME.
> A few devices supported by UAS, are reported to not
> deal well with WRITE_SAME. Those need a quirk.
> 
> Add it to the device that needs it.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> Reported-by: David C. Partridge <david.partridge@perdrix.co.uk>
> ---
>  drivers/usb/storage/uas.c         | 3 +++
>  drivers/usb/storage/unusual_uas.h | 7 +++++--
>  drivers/usb/storage/usb.c         | 3 +++
>  include/linux/usb_usual.h         | 2 ++
>  4 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> index 56422c4b4ff3..bef89c6bd1d7 100644
> --- a/drivers/usb/storage/uas.c
> +++ b/drivers/usb/storage/uas.c
> @@ -868,6 +868,9 @@ static int uas_slave_configure(struct scsi_device *sdev)
>  	if (devinfo->flags & US_FL_NO_READ_CAPACITY_16)
>  		sdev->no_read_capacity_16 = 1;
>  
> +	/* Some disks cannot handle WRITE_SAME */
> +	if (devinfo->flags & US_FL_NO_SAME)
> +		sdev->no_write_same = 1;
>  	/*
>  	 * Some disks return the total number of blocks in response
>  	 * to READ CAPACITY rather than the highest block number.
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index 711ab240058c..870e9cf3d5dc 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -35,12 +35,15 @@ UNUSUAL_DEV(0x054c, 0x087d, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_REPORT_OPCODES),
>  
> -/* Reported-by: Julian Groﬂ <julian.g@posteo.de> */
> +/*
> + *  Initially Reported-by: Julian Groﬂ <julian.g@posteo.de>
> + *  Further reports David C. Partridge <david.partridge@perdrix.co.uk>
> + */
>  UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,
>  		"LaCie",
>  		"2Big Quadra USB3",
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> -		US_FL_NO_REPORT_OPCODES),
> +		US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME),
>  
>  /*
>   * Apricorn USB3 dongle sometimes returns "USBSUSBSUSBS" in response to SCSI
> diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
> index 94a64729dc27..90aa9c12ffac 100644
> --- a/drivers/usb/storage/usb.c
> +++ b/drivers/usb/storage/usb.c
> @@ -541,6 +541,9 @@ void usb_stor_adjust_quirks(struct usb_device *udev, unsigned long *fflags)
>  		case 'j':
>  			f |= US_FL_NO_REPORT_LUNS;
>  			break;
> +		case 'k':
> +			f |= US_FL_NO_SAME;
> +			break;

Shouldn't this new flag be documented somewhere?

thanks,

greg k-h
