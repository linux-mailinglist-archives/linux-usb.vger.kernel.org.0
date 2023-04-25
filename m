Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20C106EE424
	for <lists+linux-usb@lfdr.de>; Tue, 25 Apr 2023 16:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234175AbjDYOpa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Apr 2023 10:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233983AbjDYOp3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Apr 2023 10:45:29 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D03581999
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 07:45:27 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-44aed7d3f81so243592e0c.3
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 07:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682433927; x=1685025927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipYubP6cGB89jpu1EZR9okAf9pKWc7RR6RwFUWBUM2Y=;
        b=WV21B3C+ORrZlEAci8bNysMqvgXnbzUm0UdNQbaM4836D1+3rzXZCDLLe33QJc5RIY
         za0VUIO6GDmFAJJWraeePB67ki0Pa9bljqDFZ4oauUd6PpsbkuL0bzfydxPQuuCCHTV0
         r75v2kFoQv5A/HIWWzWzt98baMt4EeXQu9rJ4wgjK5S8yrgK1OuADCWgSz/br+pOD3Wh
         plxElDc9tF58L+w09GAti+af1C2KmSSju6URxuf+u2DFN8IzhP2PTvjIzboPrEreuf2w
         9F9AoQ74pJEKbha0Z6/UOZRh2qjs7maG+70/cjm8ywFYeVt09dRRSwfTDqIFw2bw8qZj
         rEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682433927; x=1685025927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipYubP6cGB89jpu1EZR9okAf9pKWc7RR6RwFUWBUM2Y=;
        b=PVUKvT1tagQ5HNwRWYUPrk8QFEuTxthB3V6x8Yue9Eusso0B8IN2LAfMFcKDwuVMe0
         IYU187hMTCu2IX1cLeK28rYV+D6InVSaPVtMk+YpKLrGUOiF/qLc1HviC7UZKNwNtJQX
         ThC3spMMOwOUYyH52728ozlMUo3/PgjYBzlwcRa8or1p68uF+dMhwBQSbXazIWUGJX90
         Xr5s9+XPmDLVUNACu5TolZZdN5S5zFazwWFduGGfGLx0QfHD6X/JNVOknd2c83gXEcVv
         IfqQfND8sYzckfBd/48OFiLgqtM0vWVZcFm/2Z5zIhVB18kdnHWowCJXdZNBUUIbmVHd
         SBvQ==
X-Gm-Message-State: AAQBX9e4s53uuneAgM8+qzXxLy+LkLt73iqpIQoQ0RLfguueH5cc3dvq
        THGerScB5vMQjaPzbz9SqEenPPAPCl79sFf6Djo=
X-Google-Smtp-Source: AKy350YO0QPDJmX/9tdCDGKd6ycs9bLOOqf3Wm+3RS7aSoa6gMqfyixohsQ1liVjFKcXnvYP6qYGQ4gkf0BqQojDabQ=
X-Received: by 2002:a1f:bfca:0:b0:436:7dbf:6cab with SMTP id
 p193-20020a1fbfca000000b004367dbf6cabmr4681629vkf.8.1682433926846; Tue, 25
 Apr 2023 07:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230425120810.5365-1-wlodzimierz.lipert@gmail.com> <6061acbc-609f-4c31-921e-5e42b677e822@rowland.harvard.edu>
In-Reply-To: <6061acbc-609f-4c31-921e-5e42b677e822@rowland.harvard.edu>
From:   Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
Date:   Tue, 25 Apr 2023 16:44:50 +0200
Message-ID: <CABygZEr5q_Fdq24cOzi7kiFDeebOoLFmbAVPabTppto2dFQMbw@mail.gmail.com>
Subject: Re: [PATCH] usb: libcomposite: prevent duplicate bEndpointAddress by usb_ep_autoconfig_ss.
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     gregkh@linuxfoundation.org, balbi@kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

What do you think if we keep not counter but bitmap in u32 (32 is max
amount of HW endpoints anyway) ?

On Tue, Apr 25, 2023 at 4:32=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Tue, Apr 25, 2023 at 02:08:10PM +0200, Wlodzimierz Lipert wrote:
> > usb_ep_autoconfig_ss tries to use endpoint name or internal counters to=
 generate
> > bEndpointAddress - this leads to duplicate addresses. Fix is simple -
> > use only internal counter and dont rely on ep naming scheme.
>
> I don't think that's the right fix.  On some UDCs the endpoint number
> really is determined by the hardware; you can't change it.  That's why
> the number is part of the endpoint's name.
>
> The proper fix would be to check, when using the internal counter,
> whether a particular endpoint number is already reserved, and skip over
> it if it is.
>
> Alan Stern
>
> PS: usb_ep_autoconfig_ss() isn't part of libcomposite.  It's available
> for use by any gadget, whether that gadget uses the composite framework
> or not.
>
> >
> > Signed-off-by: Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
> > ---
> >  drivers/usb/gadget/epautoconf.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/epautoconf.c b/drivers/usb/gadget/epaut=
oconf.c
> > index 1eb4fa2e623f..40adf09079ed 100644
> > --- a/drivers/usb/gadget/epautoconf.c
> > +++ b/drivers/usb/gadget/epautoconf.c
> > @@ -93,10 +93,7 @@ struct usb_ep *usb_ep_autoconfig_ss(
> >
> >       /* report address */
> >       desc->bEndpointAddress &=3D USB_DIR_IN;
> > -     if (isdigit(ep->name[2])) {
> > -             u8 num =3D simple_strtoul(&ep->name[2], NULL, 10);
> > -             desc->bEndpointAddress |=3D num;
> > -     } else if (desc->bEndpointAddress & USB_DIR_IN) {
> > +     if (desc->bEndpointAddress & USB_DIR_IN) {
> >               if (++gadget->in_epnum > 15)
> >                       return NULL;
> >               desc->bEndpointAddress =3D USB_DIR_IN | gadget->in_epnum;
> > --
> > 2.39.2
> >



--=20
BR/Pozdrawiam. Wlodzimierz Lipert
