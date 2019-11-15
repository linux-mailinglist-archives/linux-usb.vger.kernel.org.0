Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE1FDFDC1C
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 12:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfKOLR3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Nov 2019 06:17:29 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:42976 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfKOLR3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Nov 2019 06:17:29 -0500
Received: by mail-qv1-f68.google.com with SMTP id n4so516984qvq.9
        for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2019 03:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PLqeYcWxj2QwEmm0XUdMsKY8UlPrQzOYV4tm5wHOI8A=;
        b=Yx/g4JC/RmQXRKckZI0le/hGkACvfZTdXEpZiNcq1fhvvpkc61z9/946fT/BO6jhdK
         PUGaQdnxPoDEHCWFtBhVRuO1h/8Ve0VIEXEDnK0NgfibLs+na47NvqM042Du9fos0uLT
         SvqJKiW6ZVowpGsy7kW1ORzuAHpvCIortZlKVYF00u/SGGCwoRe1unXr2FK74bXvkP53
         eTct9bDY4QnnXIUjgDOL3msHxnRMY5XU3A7OhVVC3yKOOcNhYmZ3A+vW2B/kMaeOK2JA
         p9kn/PiUcJnxkyLhA+3h7IwwWqQ0p18L+bYfNnAcnmN9AkVaCKzA/rm1M0iIJiUnMyV5
         1SQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PLqeYcWxj2QwEmm0XUdMsKY8UlPrQzOYV4tm5wHOI8A=;
        b=ML2DPREmzAOsMQINf/ajnLkAysmAnzTOd5INDeEHuJnpOnCbICGTceNa3et39OlQCH
         nLDAe9rY10sGarPDutveQrGets7ybPMmROlsIkRTo4XzUnMcgQNSw4QmRB7Nt6blwU0D
         2Ua10CQQR+2mpK8O9bo+3UMXkuYaz0+w9802y7SfS9lYOyfIT+sffXMu0Wtf9CRxVetX
         bC3loQ+SU3UgsGaxHldOR5hRvBn1E0x/WJ40NfqHe2H/NUsiDahkMjzY39KOzufrLALa
         lXKauaiDjVmFLIbZ35RbGVw4UAD5sHOl1Flt6kOjiO0s3I9sXI/BX6Ul/dS/yRlkf/Up
         zVJQ==
X-Gm-Message-State: APjAAAVA1hpnO1IwfBrZylPFt0W8sJsHpZLdami2/qjHLL6P7JjoLxTA
        Yyv1OCxTgQKy5yzBBSxfbWsZF7Ncax5EMEoxmIg=
X-Google-Smtp-Source: APXvYqwXmqZID71XhUetkUir4P260WjxUEClsnnd01EyJEl1PpKIlwbrYY9var2ju6GatVCss02jEVq1bVYC5U6gkBs=
X-Received: by 2002:a0c:d983:: with SMTP id y3mr12981596qvj.52.1573816647463;
 Fri, 15 Nov 2019 03:17:27 -0800 (PST)
MIME-Version: 1.0
References: <20190920102336.21043-1-dnlplm@gmail.com>
In-Reply-To: <20190920102336.21043-1-dnlplm@gmail.com>
From:   Daniele Palmas <dnlplm@gmail.com>
Date:   Fri, 15 Nov 2019 12:17:16 +0100
Message-ID: <CAGRyCJEUa7uZcHwdcF_BsOz4esZ=VSg6aYDWrZmxJSZY3SwEbA@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: serial: option: add ZLP support for 0x1bc7/0x9010
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Johan,

Il giorno ven 20 set 2019 alle ore 12:24 Daniele Palmas
<dnlplm@gmail.com> ha scritto:
>
> Telit FN980 flashing device 0x1bc7/0x9010 requires zero packet
> to be sent if out data size is equal to the endpoint max size.
>
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>

should I resend this one or is there a problem with the patch?

Thanks,
Daniele

> ---
>  drivers/usb/serial/option.c   | 8 ++++++++
>  drivers/usb/serial/usb-wwan.h | 1 +
>  drivers/usb/serial/usb_wwan.c | 9 +++++++++
>  3 files changed, 18 insertions(+)
>
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 38e920ac7f82..ce5ceafe2ccd 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -565,6 +565,9 @@ static void option_instat_callback(struct urb *urb);
>  /* Interface must have two endpoints */
>  #define NUMEP2         BIT(16)
>
> +/* Device needs ZLP */
> +#define ZLP            BIT(17)
> +
>
>  static const struct usb_device_id option_ids[] = {
>         { USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_COLT) },
> @@ -1184,6 +1187,8 @@ static const struct usb_device_id option_ids[] = {
>           .driver_info = NCTRL(0) | RSVD(1) },
>         { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1901, 0xff),    /* Telit LN940 (MBIM) */
>           .driver_info = NCTRL(0) },
> +       { USB_DEVICE(TELIT_VENDOR_ID, 0x9010),                          /* Telit SBL FN980 flashing device */
> +         .driver_info = NCTRL(0) | ZLP },
>         { USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_MF622, 0xff, 0xff, 0xff) }, /* ZTE WCDMA products */
>         { USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0002, 0xff, 0xff, 0xff),
>           .driver_info = RSVD(1) },
> @@ -2079,6 +2084,9 @@ static int option_attach(struct usb_serial *serial)
>         if (!(device_flags & NCTRL(iface_desc->bInterfaceNumber)))
>                 data->use_send_setup = 1;
>
> +       if (device_flags & ZLP)
> +               data->use_zlp = 1;
> +
>         spin_lock_init(&data->susp_lock);
>
>         usb_set_serial_data(serial, data);
> diff --git a/drivers/usb/serial/usb-wwan.h b/drivers/usb/serial/usb-wwan.h
> index 1c120eaf4091..934e9361cf6b 100644
> --- a/drivers/usb/serial/usb-wwan.h
> +++ b/drivers/usb/serial/usb-wwan.h
> @@ -38,6 +38,7 @@ struct usb_wwan_intf_private {
>         spinlock_t susp_lock;
>         unsigned int suspended:1;
>         unsigned int use_send_setup:1;
> +       unsigned int use_zlp:1;
>         int in_flight;
>         unsigned int open_ports;
>         void *private;
> diff --git a/drivers/usb/serial/usb_wwan.c b/drivers/usb/serial/usb_wwan.c
> index 7e855c87e4f7..8066b5e2d305 100644
> --- a/drivers/usb/serial/usb_wwan.c
> +++ b/drivers/usb/serial/usb_wwan.c
> @@ -228,6 +228,15 @@ int usb_wwan_write(struct tty_struct *tty, struct usb_serial_port *port,
>                 } else {
>                         intfdata->in_flight++;
>                         spin_unlock_irqrestore(&intfdata->susp_lock, flags);
> +                       if (intfdata->use_zlp) {
> +                               unsigned int ep_maxp;
> +
> +                               ep_maxp = usb_maxpacket(port->serial->dev,
> +                                                       this_urb->pipe, 1);
> +
> +                               if (ep_maxp && (todo % ep_maxp == 0))
> +                                       this_urb->transfer_flags |= URB_ZERO_PACKET;
> +                       }
>                         err = usb_submit_urb(this_urb, GFP_ATOMIC);
>                         if (err) {
>                                 dev_err(&port->dev,
> --
> 2.17.1
>
