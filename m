Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 018FD65DDE2
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 21:53:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239685AbjADUxT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 15:53:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239967AbjADUxJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 15:53:09 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C62413D9D5
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 12:53:03 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id g2so16935424ila.4
        for <linux-usb@vger.kernel.org>; Wed, 04 Jan 2023 12:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VvPBmhnK4Q9HxzeQD/MDc8OKkrjpvJu9PsbKOMLRVCY=;
        b=apfUpUE2RvS7EjOZFtrYAW0yRTMG0bsW1XpF8htHBA0KyqAtCEuH625OtLnkI5Q2mb
         /SKBvQ49ge1I9Ynf7k4QIDPQWPQ3UJ7OIhcXi0qgkGR9q7QEe9goF11NPUFHWgCYKLYF
         U8xRmH7vmHiD9pVgtiY+W6lW6WxolyoaLsjX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvPBmhnK4Q9HxzeQD/MDc8OKkrjpvJu9PsbKOMLRVCY=;
        b=kPX5rmPOuKfBDtk7AAfaQZLzwkB9sL6Xs3aPbg5URyQRtYJ4ftPe1eN+h42Tl8wb5m
         c2rUyYMUw06UPCgDij2DDwt2vIT7aPjp2bT8+IXRc8KBsN4Q7JYbvCC6p5W/aPwKc0X3
         5nrWxgSP/uMa0KobkUL1S9wPx+m8y+Lj4eExrxHCOyxr5C63L5rfBNMDbMgG0zA/bZBO
         eInSCn+3d7rU39d3UA4Uy93uHnt9Da52fWzeoxco1NpW9MINFJmHtcW/3ZJlDRY0OLzT
         gqCjWXIq07gGoI3zsZRbreeL9n4mHfSiD5U0kPloeA5KmT0ZfYfRMUggafYfpwSSG/s6
         AyaA==
X-Gm-Message-State: AFqh2koW1XtzUeqKzmw5yKhP81xWYv0OeKcdlZmZO6b3vuJCVbCp3jJK
        sf58YcJgzZ5x88uGWrs4CGAK3d+KDMLW7YLO
X-Google-Smtp-Source: AMrXdXuiVXIyPMuGV80wVV0FEy5DR2Fndb+zQsxWmkdLzfYvfBdyxmNScdXxPiSBV7teuXTX45TGjQ==
X-Received: by 2002:a05:6e02:1ba9:b0:30b:fdb5:bd07 with SMTP id n9-20020a056e021ba900b0030bfdb5bd07mr30415134ili.1.1672865582405;
        Wed, 04 Jan 2023 12:53:02 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id c7-20020a023307000000b0038a6ae38ceasm11404660jae.26.2023.01.04.12.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 12:53:02 -0800 (PST)
Date:   Wed, 4 Jan 2023 20:53:01 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 05/11] usb: misc: onboard_usb_hub: add Genesys Logic
 GL852G-OHG hub support
Message-ID: <Y7XnLYbHxfADz7gk@google.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
 <20221228100321.15949-6-linux.amoon@gmail.com>
 <Y7XhYm0nvBsSS8MN@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y7XhYm0nvBsSS8MN@google.com>
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 04, 2023 at 08:28:18PM +0000, Matthias Kaehlcke wrote:
> On Wed, Dec 28, 2022 at 10:03:14AM +0000, Anand Moon wrote:
> > Genesys Logic GL852G-OHG is a 4-port USB 2.0 STT hub that has a reset pin to
> > toggle and a 5.0V core supply exported though an integrated LDO is
> > available for powering it.
> > 
> > Add the support for this hub, for controlling the reset pin and the core
> > power supply.
> > 
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  drivers/usb/misc/onboard_usb_hub.c | 1 +
> >  drivers/usb/misc/onboard_usb_hub.h | 1 +
> >  2 files changed, 2 insertions(+)
> > 
> > diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> > index 94e7966e199d..c0e8e6f4ec0a 100644
> > --- a/drivers/usb/misc/onboard_usb_hub.c
> > +++ b/drivers/usb/misc/onboard_usb_hub.c
> > @@ -409,6 +409,7 @@ static void onboard_hub_usbdev_disconnect(struct usb_device *udev)
> >  
> >  static const struct usb_device_id onboard_hub_id_table[] = {
> >  	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 */
> > +	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G-OHG USB 2.0 */

Do you happen to know what '-OHG' stands for? The Genesys website only
mentions a GL852G with different package types (none of them 'OHG').
Unless there is an 'OHG' variant with a different product id I'd say
let's drop the suffix.

> >  	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 */
> >  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 */
> >  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
> > diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
> > index 62129a6a1ba5..2ee1b0032d23 100644
> > --- a/drivers/usb/misc/onboard_usb_hub.h
> > +++ b/drivers/usb/misc/onboard_usb_hub.h
> > @@ -31,6 +31,7 @@ static const struct of_device_id onboard_hub_match[] = {
> >  	{ .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
> >  	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
> >  	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
> > +	{ .compatible = "genesys,usb5e3,610", .data = &genesys_gl850g_data, },
> 
> s/genesys,//
> 
> >  	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
> >  	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
> >  	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
> > -- 
> > 2.38.1
> > 
