Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 822B9538595
	for <lists+linux-usb@lfdr.de>; Mon, 30 May 2022 17:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238995AbiE3P4x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 May 2022 11:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242100AbiE3PyQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 May 2022 11:54:16 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B699E4090D
        for <linux-usb@vger.kernel.org>; Mon, 30 May 2022 08:31:50 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id gh17so21541415ejc.6
        for <linux-usb@vger.kernel.org>; Mon, 30 May 2022 08:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PnlCxwzFUqqp/3OkFLjtqprrQRSKsno7SJcGytygPY8=;
        b=CFlYOiI42+g+/uN5XgXPdpS7Qj2JBNduLDt+84mU844/XLvptMoYuiKyNmPOSZTUYc
         Elo+ldrFS2jjD/5/IW5XIPsI49ejyGFUcaWb+F8BiAzltGLx5G4e0iwItWCkYmjEZaG5
         BoTiYC7xLWzilc9XBtJSn+rzRBS0+8AC2i9glSQpyLUoY172pgODdBLIXcq4dCqaxDkN
         wSF6XlVWMHJ44akbiObBcyECcuWRhsrP4vHdKxw2g4ODUd2O9bxlMAuK9uHPPuRh8VD0
         pxwC7AEqfBjSGfz+b2HAldLdHD/YFdAdM4uOcc9tmN7PNux2QUFd1cPMMzcqvG1raefR
         AAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PnlCxwzFUqqp/3OkFLjtqprrQRSKsno7SJcGytygPY8=;
        b=UhwsoBYME41OMzA9O4UwTMKwQW5BiHDfO7beL0tBIioaIyDClxqU3yKfIgSC4XfQ5c
         67ItqBwTi4SkoEReYqC8U+xprLs2nZjBmAbZU6/BiUfPMkk6WP3b+vul6fUX/bE7owTH
         o6BbkgatD9aYQucQYTqDCcI3MKTiGozklFyzEoZ0R+t13jvi7q4U/8H4z4QmKQGZiKRP
         NtWk4x/k9uQ4+JZPaGrNXW+BFzVX4Myf0j/T5Dn3Ao/w7J8pmW0TtIkw4by85AjHa5sm
         nzEyUJPznDKhPkXjv9LIOnT3liOIX4zVpp4caz47ecGPGcWutCFGq3cjPZ1sS+OTry2C
         1zgg==
X-Gm-Message-State: AOAM5307TwBNfGOQ2Uih4POlmJSCgyMBdymBzqvyAs6KrFITVI9x+toP
        Ep9hvud1t4BfbE+/AbjzLaJZzWeQFUwo+OLlti+xpm6XL0/I2w==
X-Google-Smtp-Source: ABdhPJzkm2ghjemYl4MUyA19YRGfascpiPRqj1SbgH5aroClC1gAsXbKCUmCbMrnbUYBxWGxFBAe16BLGO8RePaUMyc=
X-Received: by 2002:a17:907:1693:b0:6ff:be2:fe6b with SMTP id
 hc19-20020a170907169300b006ff0be2fe6bmr25109985ejc.674.1653924709040; Mon, 30
 May 2022 08:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220530090003.351702-1-c.lobrano@gmail.com>
In-Reply-To: <20220530090003.351702-1-c.lobrano@gmail.com>
From:   Daniele Palmas <dnlplm@gmail.com>
Date:   Mon, 30 May 2022 17:31:38 +0200
Message-ID: <CAGRyCJHZA2WB=qPh8-HD6VMTHs2xWApbtQTLLSngVzm=S7XqFA@mail.gmail.com>
Subject: Re: [PATCH v2] usb: serial: Add support for Telit LN910Cx 0x1250 composition
To:     Carlo Lobrano <c.lobrano@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Carlo,

Il giorno lun 30 mag 2022 alle ore 15:53 Carlo Lobrano
<c.lobrano@gmail.com> ha scritto:
>
> 0x1250: rmnet, tty, tty, tty, tty
>
> Signed-off-by: Carlo Lobrano <c.lobrano@gmail.com>
> ---
>
> v2: use RSVD in place of NCTRL for interface 0 (rmnet)
>
>  drivers/usb/serial/option.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 152ad882657d..cd9aa61ec801 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -1275,6 +1275,8 @@ static const struct usb_device_id option_ids[] = {
>           .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
>         { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1231, 0xff),    /* Telit LE910Cx (RNDIS) */
>           .driver_info = NCTRL(2) | RSVD(3) },
> +       { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1250, 0xff),    /* Telit LE910Cx (rmnet) */
> +         .driver_info = RSVD(0) },

The content of the patch looks good, but the subject needs to be
fixed, since the composition does not belong to "LN910Cx", but
"LE910Cx": sorry for not having noticed that in v1.

Since you are there, it would be also preferred to have the prefix as:

USB: serial: option: ....

and maybe it could be worth adding something more in the body than
only the single composition, e.g.

Add support for...

Thanks,
Daniele

>         { USB_DEVICE(TELIT_VENDOR_ID, 0x1260),
>           .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
>         { USB_DEVICE(TELIT_VENDOR_ID, 0x1261),
> --
> 2.25.1
>
