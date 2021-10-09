Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA674277BB
	for <lists+linux-usb@lfdr.de>; Sat,  9 Oct 2021 08:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbhJIG1i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Oct 2021 02:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbhJIG1h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Oct 2021 02:27:37 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D0F6C061570
        for <linux-usb@vger.kernel.org>; Fri,  8 Oct 2021 23:25:41 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id y12so31343179eda.4
        for <linux-usb@vger.kernel.org>; Fri, 08 Oct 2021 23:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PJDbZ62KpHKxLNsGMDh+cpZkdsDXNs99IHfLmVEgIyo=;
        b=GB0thtUKzx1tLQmM5xr4wqV54K3QlfL9+/te6fZZBvksyqyWPJVnXpYOecMP9siFcO
         GsD6rxH3qj+SO5Rj4TjKjHlh8lpaxCThqeus/yXqeAFFKRDGWnsGfpA9HtO9kcPVRn+r
         AAd0tovBdZLYKiB34DoysyGN9xKajWcyAS9+8MDBd8P2ix3FksSuC9ynfvnD7ekp7aus
         Z+BMhFS8GDsYWUC8jqUVEXcqnbLi1ctFMVfZ0SCnt9yJGRq5hsslqh03gsV5/BKZMAjG
         S8AvT6ibWDzqb8PyCz91aUKjImebg5u084+hzdxdth1yB6S56Yuqlfrh/DtbGhiL36EL
         Wk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PJDbZ62KpHKxLNsGMDh+cpZkdsDXNs99IHfLmVEgIyo=;
        b=nwZMWhft3i38GJdTy2L0R/bpX8bqzPf+kFfMTJi/lLoLtIeoFtvuPQfa5ARjHqDJkY
         W6vt5vqxbtHJxOAv+r34xZzMoxVKfGXdPPcLEbvURE3KCLf+JOmp3QDx/0e1JSxC6Cfj
         H/5IHKqM4kmsk++HDbady5guyeodme9QJH/zLgYL59+rYqSB8yZdyFIyZTnIg5WVSo3Y
         MK+Hk5ccFklzwux/jEgRIMhz8vMwtdY4yr7EuNsEtEUDijgTkP9TWC3iAIGPagwKpEvP
         ihUi8HlPXe66ylZErakLAX6adlY/q8Xr3gLgAwiDu2iHWNsTcsU55dB42os+nK0JQ2to
         8T6Q==
X-Gm-Message-State: AOAM5325RLTiNFHzusuZEH3YqCVYOFAKIonsDAlzO6Kc5Y7XoQGCYO1o
        9pXIxKxkGX8pqGr/3D/Pem/NeIhlRoXJYcZxEmRzcS0mwaazdw==
X-Google-Smtp-Source: ABdhPJyR7xxivnm80p/+qYUUdfmhZqG7oKxJNKRAVWdlvlFHCQ/M7oD85brF0auE6geNIDcKgho6/hXhWzSi2mdsEw8=
X-Received: by 2002:a05:6402:358c:: with SMTP id y12mr20932610edc.159.1633760740029;
 Fri, 08 Oct 2021 23:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211008201455.8739-1-gianni.pisetta@gmail.com> <7d81a8ef-faa1-f8a6-cccc-493cc8bff085@roeck-us.net>
In-Reply-To: <7d81a8ef-faa1-f8a6-cccc-493cc8bff085@roeck-us.net>
From:   Gianni Pisetta <gianni.pisetta@gmail.com>
Date:   Sat, 9 Oct 2021 08:25:28 +0200
Message-ID: <CAP7v90N=UDs3FSrp7Vke2ckzB5TavhCKz3xKYC8t96wajFM-NA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: ignore data role mismatch with a
 GoodCRC Message
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il ven 8 ott 2021, 22:47 Guenter Roeck <linux@roeck-us.net> ha scritto:
>
> On 10/8/21 1:14 PM, Gianni Pisetta wrote:
> > The data role check in tcpm.c cause the port manager to enter a loop with a
> > hard reset on some chargers.
> > By the spec in a GoodCRC Message the other end does not need to comply with
> > the data role, so ignore a data role mismatch in a request when the message
> > type is GoodCRC.
> >>From the USB PD spec:
> > "If a USB Type-C Port receive a Message with the Port Data Role field set
> > to the same Data Role, except for the GoodCRC Message, USB Type-C error
> > recovery..."
> >
> > Below are the log of a Pinebook Pro attached to a PinePower Desktop Supply
> > before the patch:
> >
> > [226057.970532] state change SNK_DISCOVERY -> SNK_WAIT_CAPABILITIES [rev3 NONE_AMS]
> > [226057.975891] pending state change SNK_WAIT_CAPABILITIES -> SNK_READY @ 310 ms [rev3 NONE_AMS]
> > [226058.134384] PD RX, header: 0x53a1 [1]
> > [226058.134389] Data role mismatch, initiating error recovery
> > [226058.134392] state change SNK_WAIT_CAPABILITIES -> ERROR_RECOVERY [rev3 NONE_AMS]
> > [226058.134404] state change ERROR_RECOVERY -> PORT_RESET [rev3 NONE_AMS]
> >
> > Fixes: f0690a25a140b
> > cc: <stable@vger.kernel.com>
> > Signed-off-by: Gianni Pisetta <gianni.pisetta@gmail.com>
> >
> > ---
> >   drivers/usb/typec/tcpm/tcpm.c | 7 ++++---
> >   1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index 5d05de666597..02ebf7e03c41 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -2887,11 +2887,11 @@ static void tcpm_pd_rx_handler(struct kthread_work *work)
> >
> >               /*
> >                * If both ends believe to be DFP/host, we have a data role
> > -              * mismatch.
> > +              * mismatch. Must perform error recovery actions, except for
> > +              * a GoodCRC Message(USB PD standard, 6.2.1.6).
> >                */
> > -             if (!!(le16_to_cpu(msg->header) & PD_HEADER_DATA_ROLE) ==
> > -                 (port->data_role == TYPEC_HOST)) {
> > +             if (!!((le16_to_cpu(msg->header) & PD_HEADER_DATA_ROLE) ==
> > +                    (port->data_role == TYPEC_HOST) && type != PD_CTRL_GOOD_CRC)) {
>
> Unless I am missing something, this could also be a PD_DATA_SOURCE_CAP
> or PD_EXT_SOURCE_CAP_EXT message.
>
> Guenter

Yes, you are definitely right about that. I thought I had checked.
Please discard this patch.
Would you accept a v2 with a proper check also on PD_HEADER_EXT_HDR
and pd_header_cnt?

Thanks,
Gianni
