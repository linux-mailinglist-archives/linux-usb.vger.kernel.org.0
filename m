Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70C4A545E54
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jun 2022 10:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347230AbiFJIPm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jun 2022 04:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347226AbiFJIPh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jun 2022 04:15:37 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA6D21E32E
        for <linux-usb@vger.kernel.org>; Fri, 10 Jun 2022 01:15:36 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-fb6b4da1dfso2401856fac.4
        for <linux-usb@vger.kernel.org>; Fri, 10 Jun 2022 01:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/jYnRVn3+kplUzt4Mn+HsYu93UCfry4z94Ij/CTfAKU=;
        b=HEA5mZ4xHr6HFd9UnX1XywlkPJ63dgx2vqklHKzvwhVay5Fiiu5qJfm9+25YwEHqvx
         QrBUzfrx4O+cTB0MeMoe+htiKlOEFMRzDb1CA8O+jk2cgXFZzoUGcHo5JF0Jxk5nXKI8
         EZREj432pWPuxsb5LWYl3dbBcPP2sUorNA12Lpa0NtNJ8pZ0WKWQcCHesVZu70gSIv8j
         NYGGwVrkfwt+3n4xGjc55FyZtYRqULIAzd3y+NtMBvVZiJf1XGSyNCoa8RLwW8jTBMz9
         8mgyaBR0/sSNypigOqTHGD7KWrRydsYrQMHGTNrRVr/x2lEcYLmzTfLl/dphIpL6IUQ/
         3e7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/jYnRVn3+kplUzt4Mn+HsYu93UCfry4z94Ij/CTfAKU=;
        b=efqiuMYnDXaa6zBraLrNwUFJhZ1c22tXux4/eLakVLzF+laD9RCNAFRSNszzn5lg7I
         kuidEvEEEwkL5us1uEC8mLVGNI9MvgP5hGdf0BHB5qcoIcHb9fIFaUx61opTlglLDhSM
         bqsCYUgA0bmgDWnKwGRPi9pdQyu4uFEtMAuZT2GL18JHHEYVLlW56g4/sNXx+Y4ciliV
         hI7qmJ82cy5/WvrVNdqTZjtwNc31u+PkJisr/xL3iv9RQi1k2QxQg3IlbIZG3asWa7bV
         35+PBBzktGfCiFQ4BiJNN9ppYkWgW9CjYHLBeMi30+XjzgZMN89I7p2Fm4R3g7b2SbM2
         czTA==
X-Gm-Message-State: AOAM531BRqDTz0w3jHIZ6Z0DFhWnUjaQC1dpdm+5bPX+3gdelBDljbxU
        SHEe9xTiuJD4XjI3HenS9JiaHknseigE5A1Ngg0=
X-Google-Smtp-Source: ABdhPJxwhOgnR0DXSHgxhD6ZQ3AdO/9PfC6vwq7dnkvvdG+tkqWwZlnljyx+vie0nk63xc5yQCR803ZBy2XpecZS0O8=
X-Received: by 2002:a05:6870:3509:b0:f3:44ea:f034 with SMTP id
 k9-20020a056870350900b000f344eaf034mr3924381oah.216.1654848935815; Fri, 10
 Jun 2022 01:15:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220531102301.13435-1-c.lobrano@gmail.com> <YqHnRmX3+uiobENy@hovoldconsulting.com>
In-Reply-To: <YqHnRmX3+uiobENy@hovoldconsulting.com>
From:   Carlo Lobrano <c.lobrano@gmail.com>
Date:   Fri, 10 Jun 2022 10:14:59 +0200
Message-ID: <CA+KuA8d8ikCxfBXhV_+U6+9=WaWbw=PLbJcvF1VY7FquTN_U1A@mail.gmail.com>
Subject: Re: [PATCH v3] USB: serial: option: Add Telit LE910Cx 0x1250 composition
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Daniele Palmas <dnlplm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

On Thu, 9 Jun 2022 at 14:27, Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, May 31, 2022 at 12:23:01PM +0200, Carlo Lobrano wrote:
> > Add support for the following Telit LE910Cx composition:
> >
> > 0x1250: rmnet, tty, tty, tty, tty
> >
> > Signed-off-by: Carlo Lobrano <c.lobrano@gmail.com>
> > ---
> > v3: - fix subject prefix and modem name (s/LN910Cx/LE910Cx)
> >     - more descriptive e-mail content
> > v2: use RSVD in place of NCTRL for interface 0 (rmnet)
>
> Thanks for the update (and thanks for reviewing, Daniele).
>
> You forgot to include the lsusb output in v2 and v3 but I found it here:
>
>         https://lore.kernel.org/r/20220528073445.50066-1-c.lobrano@gmail.com
>
> >  drivers/usb/serial/option.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> > index 152ad882657d..cd9aa61ec801 100644
> > --- a/drivers/usb/serial/option.c
> > +++ b/drivers/usb/serial/option.c
> > @@ -1275,6 +1275,8 @@ static const struct usb_device_id option_ids[] = {
> >         .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
> >       { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1231, 0xff),    /* Telit LE910Cx (RNDIS) */
> >         .driver_info = NCTRL(2) | RSVD(3) },
> > +     { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1250, 0xff),    /* Telit LE910Cx (rmnet) */
> > +       .driver_info = RSVD(0) },
>
> Looks you can match on the interface SubClass and Protocol using
> USB_DEVICE_INFO() and avoid using RSVD() here which is preferred when
> possible.

This is a good point, I just need to double check if this was true
also with older firmwares I think

>
> >       { USB_DEVICE(TELIT_VENDOR_ID, 0x1260),
> >         .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
> >       { USB_DEVICE(TELIT_VENDOR_ID, 0x1261),
>
> Care to respin a v4? You can keep Daniele's reviewed-by tag when
> resending (i.e. include it before your SoB).
>
> Johan

Carlo
