Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08C791594A8
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 17:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730811AbgBKQRC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 11:17:02 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42766 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727561AbgBKQRB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Feb 2020 11:17:01 -0500
Received: by mail-oi1-f195.google.com with SMTP id j132so13282151oih.9
        for <linux-usb@vger.kernel.org>; Tue, 11 Feb 2020 08:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5vX5KEtSAb/E9jI9DIzn+r6uvjfgeB+Qq46fmnidRUs=;
        b=ekESdn+zLH+1HfPlINbNnKxS9b/uCQUUwUggPEBIwUP7BeZXf0yMUM3E1ULqKGaFxD
         oAHmr3cdLUX6N8rm8Jh+CsYJolTGFF5jbYJtnOhwNYbLqffgNOLWfO9UDZY3U8FPTHEe
         asK747gzBPwwvfEjNLy8JH/oi8IPIdAS5SAq7Zgateho5Y41XvYrNx/MYmi4wZwU39eX
         n9RIQ5MOCCKIM1X/C0xrxv/wv11TekjgDxWsOHpJOBc8nRinafQLsbDq23Ez8RYySobR
         Kr/WdkJ0Lw+LWC1lyf6x31WFuYdRIRWBJjCQPOK5kOPn0ogJfAKjc/IgZA+/m2vZ5E6q
         A9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5vX5KEtSAb/E9jI9DIzn+r6uvjfgeB+Qq46fmnidRUs=;
        b=Z1CSBWzXdTWM2mritk0QbGOive37RYdDH72EInfxOchiVQlbU+IXRcLFfpL/pj9RTS
         Z2bwEhanlVUO9AHh3gY/H4oAeTNeh4ywgO6gcDdOz9wngPmGCF1Ye7TsvfApoaksp5Ki
         LY50gmvq3ogJ0tICMbyEI2RVPMwmnkFl9hC9ZjAzinKXWK1U9FDGdtIjPViw+ltV9Sl+
         47958IMXzG7i3RXlyKcRKKHfUd9oKKxYx1CgUbW8B+Y01g8D9WNcSfmxrQz5z8TXT6Dy
         nu0y7Cva7P87cWqULY6W2Dr2LhB8u6w9efmTaHDsOWrKSJgFV7gutSVWC8RL0bwvVDlL
         VT8g==
X-Gm-Message-State: APjAAAUhpXoOMs6+V/L5hV0UKsSfwmP1c7e9lIyD4VYRe3uHzkQZ0v5W
        Fw1jdpsxCctJ6hlLcwWsPB2YrME2zeP83QsWQjO93E/9S8o=
X-Google-Smtp-Source: APXvYqxtjbbcLRjn97VxCpvxarlJEh+YsSlCzExnbYdpfR2AxuoAL7IZnf7Aemzs75BVVmVTKPeTdFCwOKakROVWm8w=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr3213840oia.148.1581437820855;
 Tue, 11 Feb 2020 08:17:00 -0800 (PST)
MIME-Version: 1.0
References: <2bd4ac94-f7c3-41d6-27a7-352f3319bda7@ivitera.com>
In-Reply-To: <2bd4ac94-f7c3-41d6-27a7-352f3319bda7@ivitera.com>
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date:   Tue, 11 Feb 2020 18:16:49 +0200
Message-ID: <CAB=otbTiTLDPv8TbjFkoXLj=i3pb0rueoADbRMZVMETX_UsqZA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_uac2: EP OUT adaptive instead of async
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Linux USB <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 7, 2020 at 6:55 PM Pavel Hofman <pavel.hofman@ivitera.com> wrote:
>
> The existing UAC2 implementation presents its EP OUT as
> USB_ENDPOINT_SYNC_ASYNC.
>
> However:
> 1) f_uac2 does not define any feedback endpoint
>
> 2) IMO in reality it is adaptive - the USB host is the one which sets
> the pace of data.
>
> Changing USB_ENDPOINT_SYNC_ASYNC to USB_ENDPOINT_SYNC_ADAPTIVE for the FS
> and HS output endpoints corrects the config to reflect real functionality.

That's a good idea but ADAPTIVE endpoint still requires feedback endpoint for
source (USB IN) case so the host can synchronize with such endpoint
(see 3.16.2.2 of
UAC2 spec "For adaptive audio source endpoints and asynchronous audio sink
endpoints, an explicit synchronization mechanism is needed to maintain
synchronization
during transfers").

>
> Also, the change makes the UAC2 gadget recognized and working
> in MS Windows.

Does it recognizes well with both IN and OUT (e.g. capture+playback enabled)
adaptive endpoints?

Thanks,
Ruslan

>
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> ---
>  drivers/usb/gadget/function/f_uac2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_uac2.c
> b/drivers/usb/gadget/function/f_uac2.c
> index db2d498..e8c9dd1 100644
> --- a/drivers/usb/gadget/function/f_uac2.c
> +++ b/drivers/usb/gadget/function/f_uac2.c
> @@ -273,7 +273,7 @@ enum {
>         .bDescriptorType = USB_DT_ENDPOINT,
>
>         .bEndpointAddress = USB_DIR_OUT,
> -       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
> +       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ADAPTIVE,
>         .wMaxPacketSize = cpu_to_le16(1023),
>         .bInterval = 1,
>  };
> @@ -282,7 +282,7 @@ enum {
>         .bLength = USB_DT_ENDPOINT_SIZE,
>         .bDescriptorType = USB_DT_ENDPOINT,
>
> -       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
> +       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ADAPTIVE,
>         .wMaxPacketSize = cpu_to_le16(1024),
>         .bInterval = 4,
>  };
> --
> 1.9.1
