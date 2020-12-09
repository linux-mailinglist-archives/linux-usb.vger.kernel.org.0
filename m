Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 894A32D43ED
	for <lists+linux-usb@lfdr.de>; Wed,  9 Dec 2020 15:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732904AbgLIOHf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 9 Dec 2020 09:07:35 -0500
Received: from avasout06.plus.net ([212.159.14.18]:44009 "EHLO
        avasout06.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729209AbgLIOHf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Dec 2020 09:07:35 -0500
Received: from APOLLO ([212.159.61.44])
        by smtp with ESMTPA
        id n07CksBNphO4Hn07Ek2Ueg; Wed, 09 Dec 2020 14:06:48 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=SPPZqNnH c=1 sm=1 tr=0
 a=AGp1duJPimIJhwGXxSk9fg==:117 a=AGp1duJPimIJhwGXxSk9fg==:17
 a=8nJEP1OIZ-IA:10 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=iox4zFpeAAAA:8
 a=P1kZ4gAsAAAA:8 a=6Pge2DsIUmITVJ1RMUcA:9 a=wPNLvfGTeEIA:10 a=t0JhtFfqLmsA:10
 a=Di55dXSHrtwA:10 a=AjGcO6oz07-iQ99wixmX:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=WzC6qhA0u3u7Ye7llzcV:22 a=fn9vMg-Z9CMH7MoVPInU:22
X-AUTH: perdrix52@:2500
From:   "David C. Partridge" <david.partridge@perdrix.co.uk>
To:     "'Greg KH'" <gregkh@linuxfoundation.org>,
        "'Oliver Neukum'" <oneukum@suse.com>
Cc:     <linux-usb@vger.kernel.org>
References: <20201209110734.30831-1-oneukum@suse.com> <X9C9Gt5chKLAE1Vq@kroah.com>
In-Reply-To: <X9C9Gt5chKLAE1Vq@kroah.com>
Subject: RE: [PATCH] USB: UAS: introduce a quirk to set no_write_same
Date:   Wed, 9 Dec 2020 14:06:46 -0000
Message-ID: <000001d6ce34$88ed1b70$9ac75250$@perdrix.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQInQW/Y1j0tXt4dZIf2n6CjZ8TbSAFPvPetqUNnq8A=
Content-Language: en-gb
X-CMAE-Envelope: MS4wfLp3ccGC509Tf19M1t7l8nbOEYTNQrOdjI7qZQQV0wOhY26lNNBHw9B90GUe4xSWwAd43bD/qtJNhAkDjjxPnZZJuXndcAMvxdCT+tqx05UNdn4KOdpn
 yG3D8ZWljMvipYQkKAFykAq4l/9RKBoySajbF2UwFaWRiv14vDHuw49FheNU/lOXjl2APCsem4s3BA==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Probably here:

https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html

in the usb-storage.quirks section?

I assume there's also a header file that defines all this stuff?

David

-----Original Message-----
From: Greg KH <gregkh@linuxfoundation.org> 
Sent: 09 December 2020 12:04
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org; david.partridge@perdrix.co.uk
Subject: Re: [PATCH] USB: UAS: introduce a quirk to set no_write_same

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
> @@ -868,6 +868,9 @@ static int uas_slave_configure(struct scsi_device
*sdev)
>  	if (devinfo->flags & US_FL_NO_READ_CAPACITY_16)
>  		sdev->no_read_capacity_16 = 1;
>  
> +	/* Some disks cannot handle WRITE_SAME */
> +	if (devinfo->flags & US_FL_NO_SAME)
> +		sdev->no_write_same = 1;
>  	/*
>  	 * Some disks return the total number of blocks in response
>  	 * to READ CAPACITY rather than the highest block number.
> diff --git a/drivers/usb/storage/unusual_uas.h
b/drivers/usb/storage/unusual_uas.h
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
>   * Apricorn USB3 dongle sometimes returns "USBSUSBSUSBS" in response to
SCSI
> diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
> index 94a64729dc27..90aa9c12ffac 100644
> --- a/drivers/usb/storage/usb.c
> +++ b/drivers/usb/storage/usb.c
> @@ -541,6 +541,9 @@ void usb_stor_adjust_quirks(struct usb_device *udev,
unsigned long *fflags)
>  		case 'j':
>  			f |= US_FL_NO_REPORT_LUNS;
>  			break;
> +		case 'k':
> +			f |= US_FL_NO_SAME;
> +			break;

Shouldn't this new flag be documented somewhere?

thanks,

greg k-h

