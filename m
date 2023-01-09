Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C08C662B13
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 17:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjAIQWa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 11:22:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233336AbjAIQWY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 11:22:24 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE27D10E
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 08:22:22 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id u8so5049614ilq.13
        for <linux-usb@vger.kernel.org>; Mon, 09 Jan 2023 08:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QndtQI2o6re4w2RYBTL5OxpJzOImlGMaOEhW7Zae+9M=;
        b=WzIC8fjcuKllwFvHeuf6Di+xuXmcnowMUee2CyNGyq0I/0wOGnCTTRvF5sSSvke2Cs
         4qRkRkwjl3GBA4HOmgvJeKtRjDXkA3JzOz/OEDoLac79cmbXHbwG/+UBN5F5al78wP/3
         r/DXvZ9glcboYLdmKO3AaU/yoJhdPQV031X9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QndtQI2o6re4w2RYBTL5OxpJzOImlGMaOEhW7Zae+9M=;
        b=IeudXtqtuoVrJIRneM5o0AXgpwKfMvYdqJ77VgLtjFD8Vu0nPTUCsfOuPsQaqqruGD
         GBcJY31J7nTmpP9no2ZeQ9wi9gk7wylQ8qpMBTH0ifbNLbQ/g20aM4HeQOeKM+NWA0WG
         63+YWNzOZPOp0i/jRfIwQFUGw78O00lvejv+uPS0VmvniaX0bzsq3Bn077ciyS2yN9CS
         vt3WlqiLux6CdjRXsN/0ZtSNYiWh3nxz5OZNuo/7NoJJqF9gNeTezv56NMTwphPYswV1
         PsstkrnT4A4bx4dKWwko7nLKGIFJJVjbl1K8is+GNhvJ40sjTBDkd4cbrhBlLEBhwtwd
         N7aQ==
X-Gm-Message-State: AFqh2kqX161KEV2kZ/OCiG705EpPOcAEL9C2zTUE8KARKp95uy5mOz+8
        ZC+FdB5TGbE7w6L38AAvQlsvvQ==
X-Google-Smtp-Source: AMrXdXvHvRaI4beu0Y1w/VI0e+6oiYx7N6DNui5fQPfvHVuMFL1KdHzU42J6VSGBQscfH3Iqbeibfg==
X-Received: by 2002:a05:6e02:1d89:b0:30d:7cf4:5d5a with SMTP id h9-20020a056e021d8900b0030d7cf45d5amr15522385ila.23.1673281341493;
        Mon, 09 Jan 2023 08:22:21 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id y1-20020a92c981000000b0030392271239sm2828271iln.8.2023.01.09.08.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 08:22:21 -0800 (PST)
Date:   Mon, 9 Jan 2023 16:22:20 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 06/11] usb: misc: onboard_usb_hub: add Genesys Logic
 GL3523-QFN76 hub support
Message-ID: <Y7w/PGMrjHFAjHNH@google.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
 <20221228100321.15949-7-linux.amoon@gmail.com>
 <Y7Xk/lPUshC+U8OQ@google.com>
 <CANAwSgTySFm3o-9JcTTiKMHN-8w510DKNFKKxwz3PjA6DDQwHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANAwSgTySFm3o-9JcTTiKMHN-8w510DKNFKKxwz3PjA6DDQwHQ@mail.gmail.com>
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jan 07, 2023 at 08:28:11PM +0530, Anand Moon wrote:
> Hi Matthias,
> 
> Thanks for your review comments,
> 
> On Thu, 5 Jan 2023 at 02:13, Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > Hi Anand,
> >
> > On Wed, Dec 28, 2022 at 10:03:15AM +0000, Anand Moon wrote:
> > > Genesys Logic GL3523-QFN76 is a 4-port USB 3.1 hub that has a reset pin to
> > > toggle and a 5.0V core supply exported though an integrated LDO is
> > > available for powering it.
> > >
> > > Add the support for this hub, for controlling the reset pin and the core
> > > power supply.
> > >
> > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > ---
> > >  drivers/usb/misc/onboard_usb_hub.c | 1 +
> > >  drivers/usb/misc/onboard_usb_hub.h | 1 +
> > >  2 files changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> > > index c0e8e6f4ec0a..699050eb3f17 100644
> > > --- a/drivers/usb/misc/onboard_usb_hub.c
> > > +++ b/drivers/usb/misc/onboard_usb_hub.c
> > > @@ -410,6 +410,7 @@ static void onboard_hub_usbdev_disconnect(struct usb_device *udev)
> > >  static const struct usb_device_id onboard_hub_id_table[] = {
> > >       { USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 */
> > >       { USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G-OHG USB 2.0 */
> > > +     { USB_DEVICE(VENDOR_ID_GENESYS, 0x0620) }, /* Genesys Logic GL3523-QFN76 USB 3.1 */
> >
> > Please drop the '-QFN76' suffix. The GL3523 comes in different packages, 'QFN76'
> > is one of them, I'd expect the other packages to use the same product id.
> >
> > The GL3523 is a single IC, however like the TI USB8041 or the RTS5414 it
> > provides both a USB 3.1 and a USB 2.0 hub. You should also add an entry for
> > the USB 2.0 hub here.
> >
> 
> Ok,
> 
> > >       { USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 */
> > >       { USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 */
> > >       { USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
> > > diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
> > > index 2ee1b0032d23..b32fad3a70f9 100644
> > > --- a/drivers/usb/misc/onboard_usb_hub.h
> > > +++ b/drivers/usb/misc/onboard_usb_hub.h
> > > @@ -32,6 +32,7 @@ static const struct of_device_id onboard_hub_match[] = {
> > >       { .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
> > >       { .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
> > >       { .compatible = "genesys,usb5e3,610", .data = &genesys_gl850g_data, },
> > > +     { .compatible = "genesys,usb5e3,620", .data = &genesys_gl850g_data, },
> >
> > s/genesys,//
> >
> > This reuses the settings of the GL850G hub, which doesn't seem correct in
> > this case. For the GL850G a (minimum) reset time of 3us is configured. The
> > data sheet of the GL3523 says:
> >
> >   "The (internal) reset will be released after approximately 40 μS after
> >    power good.
> >
> >    To fully control the reset process of GL3523, we suggest the reset time
> >    applied in the external reset circuit should longer than that of the
> >    internal reset circuit."
> >
> > Since it is 'approximately 40 μS' I'd say make the external reset 50 μS
> > to be on the safe side, it's a very short time in any case.
> >
> 
> Thanks for this input will update this in the next version.
> 
> > Please also add an entry for the USB 2.0 part of the IC.
> 
> alarm@odroid-n2:~$ lsusb -tv
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
>     ID 1d6b:0003 Linux Foundation 3.0 root hub
>     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
>         ID 05e3:0620 Genesys Logic, Inc. GL3523 Hub
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 480M
>     ID 1d6b:0002 Linux Foundation 2.0 root hub
>     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>         ID 05e3:0610 Genesys Logic, Inc. Hub
> 
> So earlier patch adds support for this device ID.

Do I understand correctly that 0x0610 is the product id of both the
GL852G [1] and the USB 2 part of the GL3523 (the above 'lsusb'
output)?

[1] https://patchwork.kernel.org/project/linux-usb/patch/20221228100321.15949-2-linux.amoon@gmail.com/
