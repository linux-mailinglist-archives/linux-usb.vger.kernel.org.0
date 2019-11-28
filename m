Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CECB110CE65
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2019 19:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbfK1SMq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Nov 2019 13:12:46 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:37916 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbfK1SMq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Nov 2019 13:12:46 -0500
Received: by mail-qk1-f195.google.com with SMTP id b8so8517927qkk.5
        for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2019 10:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XrKLzO8jHaS9QGQypbxFSokUeG8GVj2b/i46Z4Q8IpY=;
        b=C3wuMSzJ+rvn3mtJOYVRHYL0Z7Tygea1qxP3qoY3FRiB24qqRjYuqkSg1ZBqAhWLbj
         AFhJvDdm8L7paW8oFZ5T7J/qghAW18Mk6l7Ml4E0ezRtbtJf0C9T9HZkI1ZyQ7UYL54e
         7odD2jAaNZPj8OZgmziiO+6EG/LFXh0tsdVGluOsDaRc9KJ38/IqH1KH5GavxRgvUa7e
         FnrIAQYy6PQzTQ0/eOD4jvcdjOEhqGKvV4jIuyTzU9FdUs9f5coq5OKN/uCo5+Ovot51
         cn7VgPr3jwIwW0vHKwYg8oCEkqbWgU8hHKmTn7YirMEBrA71F/TsiewdSpJpXzMJA8No
         c5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XrKLzO8jHaS9QGQypbxFSokUeG8GVj2b/i46Z4Q8IpY=;
        b=BRCe8d2l/0sW/K6IP8ptg91MbM9eDUTdBbW6V1/ieIaAkr2GhvLMb/8lusW524FzCJ
         eV8YMCzBmFKQAaQpGi9qKt9PCKMDoP//9sktoV6m9na5Ib0uNtJs1NS6o+yonsYY9/W0
         qHQ7DYKjZ+k32UNZqZdS4BBcL293vQfh/BOCFUaqtbO7o1mQ/qvi9RdVGOC8ReaHw0D7
         GxAmZgw/bYPoMaY/a0ySUTmpAJdmi1xvF9D6vERoVk3P93lTI9bxGcXlHJllNQWyDAHv
         v/YvtzeraDt+9cpbAOkKxFNOJICcruYSufbSalPc6V3yi6n1iXXvc+824nnCAZBKbKVh
         /YkA==
X-Gm-Message-State: APjAAAXyFZUoiHSfD9BmMv0+IFPNr9L2JvqXVPf3mgdtK450WS+at41t
        ily5C7Q98Je7ga1GMH6kWGD35zxOzC8iUKYsXjVTEvxl
X-Google-Smtp-Source: APXvYqySlVMxm1Yx6XlBbGOdE+n6H3u1EMKZuzntuF03D5Xkl/fqxGw9vTmt4Z+hsWog2rGFuLrwRnduowzRC8GjNa0=
X-Received: by 2002:a37:7f44:: with SMTP id a65mr6506841qkd.442.1574964763223;
 Thu, 28 Nov 2019 10:12:43 -0800 (PST)
MIME-Version: 1.0
References: <20191118133251.21401-1-dnlplm@gmail.com>
In-Reply-To: <20191118133251.21401-1-dnlplm@gmail.com>
From:   Daniele Palmas <dnlplm@gmail.com>
Date:   Thu, 28 Nov 2019 19:12:31 +0100
Message-ID: <CAGRyCJFXL=ZOUpt6bi=g0tmN=A7bsnemPx-sMczu8bQCYK7pdg@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/1] usb: serial: option: add ZLP support for 0x1bc7/0x9010
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

Il giorno lun 18 nov 2019 alle ore 14:32 Daniele Palmas
<dnlplm@gmail.com> ha scritto:
>
> Telit FN980 flashing device 0x1bc7/0x9010 requires zero packet
> to be sent if out data size is equal to the endpoint max size.
>
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> ---

Just to make sure that this time the patch arrived properly.

Thanks,
Daniele

>  drivers/usb/serial/option.c   | 8 ++++++++
>  drivers/usb/serial/usb-wwan.h | 1 +
>  drivers/usb/serial/usb_wwan.c | 9 +++++++++
>  3 files changed, 18 insertions(+)
>
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index e9491d400a24..c13e063cb399 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -567,6 +567,9 @@ static void option_instat_callback(struct urb *urb);
>  /* Interface must have two endpoints */
>  #define NUMEP2         BIT(16)
>
> +/* Device needs ZLP */
> +#define ZLP            BIT(17)
> +
>
>  static const struct usb_device_id option_ids[] = {
>         { USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_COLT) },
> @@ -1196,6 +1199,8 @@ static const struct usb_device_id option_ids[] = {
>           .driver_info = NCTRL(0) | RSVD(1) },
>         { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1901, 0xff),    /* Telit LN940 (MBIM) */
>           .driver_info = NCTRL(0) },
> +       { USB_DEVICE(TELIT_VENDOR_ID, 0x9010),                          /* Telit SBL FN980 flashing device */
> +         .driver_info = NCTRL(0) | ZLP },
>         { USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_MF622, 0xff, 0xff, 0xff) }, /* ZTE WCDMA products */
>         { USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0002, 0xff, 0xff, 0xff),
>           .driver_info = RSVD(1) },
> @@ -2097,6 +2102,9 @@ static int option_attach(struct usb_serial *serial)
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
