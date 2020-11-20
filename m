Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68BCA2BA5AA
	for <lists+linux-usb@lfdr.de>; Fri, 20 Nov 2020 10:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgKTJOr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Nov 2020 04:14:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbgKTJOq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Nov 2020 04:14:46 -0500
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9DECC0613CF
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2020 01:14:45 -0800 (PST)
Received: by mail-ua1-x944.google.com with SMTP id t15so2903993ual.6
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2020 01:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fcNvMotCM1exp3r5B/p5/L6Jzulju5L2C7j0PonYvws=;
        b=Bt0OxNh7ImKNFNyLTLlhXgiQtJjb1avpqJVw/sQfCWf13hC9zEnABwcA3bIXNBuP6e
         99mr1qOMejQQMLuHkm1ITiiv/1cM3vHwapHH3srjgmsRaIjOjXA1mAXAkuCDilBgoAmU
         1PTZzr7+dv1mE/gAmQo5FidVG81H2idoks9fQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fcNvMotCM1exp3r5B/p5/L6Jzulju5L2C7j0PonYvws=;
        b=hEBYuQm23gKL3nARi+bjM/1X+ysWB6T5ApeKT93qUL560QxO2ThzCvwyBMBdxmOMs2
         kO3Euj5/nP2rwevVUK4NkfTaNTg++Z7Pgn/4o0GnUJQscl+x5o8updxLKQ72nYQ6MvJ3
         un/WdtLn31zXcmn1MnVQ4uWu30J97U1iu62YsduAQbgUmyYhXM7Biim6N5Z9zpcJtzXq
         6eJr8fXGbs/B337by4jHiH+Y+EGIgA9Q7H5/HI2iEzmmDbwCqVixNr1j7yolSHOuCX4X
         AedJ89FG8EPWzjGM0wUp2937UcdjIWQxs7273z44uA96s4Qrd6MfkEnoSz42xLt77Lgd
         RkkA==
X-Gm-Message-State: AOAM530IfAsKsXl3c+uj5PgpVDES+Lh17AFcf904vY9Napt90L3nWN59
        oMxJDBtMtb9kSe9uK1fhQ37yTetRQOvkiDs1nCM0+A==
X-Google-Smtp-Source: ABdhPJx6aF6fhonX7ytEsmCkuM7JrqflkdBOn4vGz/9I7tzyAtIeeoB3i0Eyu8RjphrivZcjizZxXtJ8E24yOx8Ptjo=
X-Received: by 2002:ab0:2091:: with SMTP id r17mr1087575uak.102.1605863684678;
 Fri, 20 Nov 2020 01:14:44 -0800 (PST)
MIME-Version: 1.0
References: <20201120090107.502832-1-vpalatin@chromium.org>
In-Reply-To: <20201120090107.502832-1-vpalatin@chromium.org>
From:   Vincent Palatin <vpalatin@chromium.org>
Date:   Fri, 20 Nov 2020 10:14:33 +0100
Message-ID: <CAP_ceTxrp6cKrh0p02Y49owc9+xe-o2Wt03923=tbdE9E24khw@mail.gmail.com>
Subject: Re: [PATCH] usb: serial: option: add Fibocom NL668 variants
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 20, 2020 at 10:01 AM <vpalatin@chromium.org> wrote:
>
> From: Vincent Palatin <vpalatin@chromium.org>
>
> Update the USB serial option driver support for the Fibocom NL668 Cat.4
> LTE modules as there are actually several different variants.
> Got clarifications from Fibocom, there are distinct products:
> - VID:PID 1508:1001, NL668 for IOT (no MBIM interface)
> - VID:PID 2cb7:01a0, NL668-AM and NL652-EU are laptop M.2 cards (with
>   MBIM interfaces for Windows/Linux/Chrome OS), respectively for Americas
>   and Europe.
>
> usb-devices output for the laptop M.2 cards:
> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  4 Spd=480 MxCh= 0
> D:  Ver= 2.00 Cls=ef(misc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=2cb7 ProdID=01a0 Rev=03.18
> S:  Manufacturer=Fibocom Wireless Inc.
> S:  Product=Fibocom NL652-EU Modem
> S:  SerialNumber=0123456789ABCDEF
> C:  #Ifs= 5 Cfg#= 1 Atr=a0 MxPwr=500mA
> I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
> I:  If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
> I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
> I:  If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
>
> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
> ---
>  drivers/usb/serial/option.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 54ca85cc920d..2a6d59bc0201 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -2046,12 +2046,13 @@ static const struct usb_device_id option_ids[] = {
>           .driver_info = RSVD(0) | RSVD(1) | RSVD(6) },
>         { USB_DEVICE(0x0489, 0xe0b5),                                           /* Foxconn T77W968 ESIM */
>           .driver_info = RSVD(0) | RSVD(1) | RSVD(6) },
> -       { USB_DEVICE(0x1508, 0x1001),                                           /* Fibocom NL668 */
> +       { USB_DEVICE(0x1508, 0x1001),                                           /* Fibocom NL668 (IOT version) */
>           .driver_info = RSVD(4) | RSVD(5) | RSVD(6) },
>         { USB_DEVICE(0x2cb7, 0x0104),                                           /* Fibocom NL678 series */
>           .driver_info = RSVD(4) | RSVD(5) },
>         { USB_DEVICE_INTERFACE_CLASS(0x2cb7, 0x0105, 0xff),                     /* Fibocom NL678 series */
>           .driver_info = RSVD(6) },
> +       { USB_DEVICE(0x2cb7, 0x01a0, 0xff) },                                   /* Fibocom NL668-AM/NL652-EU (laptop MBIM) */


I obviously screw up here. Wrong version of the patch with the wrong macro name
I will send the updated one.

>
>         { USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1404, 0xff) },                   /* GosunCn GM500 RNDIS */
>         { USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1405, 0xff) },                   /* GosunCn GM500 MBIM */
>         { USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1406, 0xff) },                   /* GosunCn GM500 ECM/NCM */
> --
> 2.26.2
>
