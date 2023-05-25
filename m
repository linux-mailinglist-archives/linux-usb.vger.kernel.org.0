Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22FC57117C9
	for <lists+linux-usb@lfdr.de>; Thu, 25 May 2023 22:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbjEYUDb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 May 2023 16:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235747AbjEYUD2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 May 2023 16:03:28 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA22BC
        for <linux-usb@vger.kernel.org>; Thu, 25 May 2023 13:03:27 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f6d01d390bso134595e9.2
        for <linux-usb@vger.kernel.org>; Thu, 25 May 2023 13:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685045006; x=1687637006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4TyW3F7pnvio/+Mfhq8AWNdmZyUuT7pRHhynq/9Tkg=;
        b=JYlYJe/h15cKKSnZe/2zRg1TKqaGUd/HDX4qUYmT8hNcxtWx0/w0UYhdBu7YlqpiX3
         HrejTZsSxSNANNxYBGwT3F5c3JUkArhg62dDkE/gyrWdJSPSwFZPTVVFTXz/2+3uCGM3
         S4MpQG1T+QpwGsRRZHXTJHO/ugw6YuYLLZCNSiOC5eQ03kHGQ481WETI6z+r09We2LzL
         bro7xePty3xipRrhJ0zf8t4oafN0So0y6L952204Kg5aaul1LIBOLufh/bHFQmHvw3l4
         z93UrqPWcwBaZ77/TZB1TwZvy5oglyzwzSyDDyCHiaP3892nXtL/rRg5RCgArQvFiscl
         8C3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685045006; x=1687637006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4TyW3F7pnvio/+Mfhq8AWNdmZyUuT7pRHhynq/9Tkg=;
        b=LPJvNl8jK2Yho+AgSj2gsEOZBcs/EzsGD+/YS4iJLS0+re8apNTZicNXNaxLN/kJHE
         +YQcdk7aKsCSHsuEqPe68wXHvf3sDJCnrXNtzVoD4UZYD+Or2ebocy7S5MZP19VkE725
         bRKvirCNZrQWD8DJfPc9f2hMo0MGwjMcOJEfwtQe2EES4xSI2SDr20RYlhlvkw9LA03E
         gsIm1pNmhF6aazjAx+OesUPQuNW6+Ecud7XSqaOFxGKdh6vaeRlrPP+enS3cW0F8Lxj2
         XPsBd9YKZ7DBSDshtYWxSes7EK2idy9Y9xTBjv5dWSIhrJYnwvaGYDVesaIdOyC0s1if
         9vlA==
X-Gm-Message-State: AC+VfDws7kafgKoBfHcucCmX09Rd4zg2aFIkcwbX9QfNWhQbteikIPLy
        6oXagYsB7BZGu2GZF5/gW89VoCsdQvqoQzgj5joOqXP/eu7uGJrrAkM=
X-Google-Smtp-Source: ACHHUZ5GTqd7fBY2t/VsImNxtKg3wE/Gu9bWc5wXf9VM1FTSPsP6J5EhYxlCZpUDcOPoJNXaDlmmKkil1MiOvKm6f0g=
X-Received: by 2002:a1c:7307:0:b0:3f6:3ad:16a with SMTP id d7-20020a1c7307000000b003f603ad016amr3007271wmb.31.1685040419721;
 Thu, 25 May 2023 11:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230525173818.219633-1-royluo@google.com> <408575c0-2967-4cdb-92c7-1b2845038d20@rowland.harvard.edu>
In-Reply-To: <408575c0-2967-4cdb-92c7-1b2845038d20@rowland.harvard.edu>
From:   Roy Luo <royluo@google.com>
Date:   Thu, 25 May 2023 11:46:23 -0700
Message-ID: <CA+zupgwz8Mbd8=7ep7t0OU-34bbwsc9fMK4dHip0rgqD7FSd2A@mail.gmail.com>
Subject: Re: [RFC PATCH v1] usb: core: add sysfs entry for usb device state
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     raychi@google.com, badhri@google.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Bastien Nocera <hadess@hadess.net>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Flavio Suligoi <f.suligoi@asem.it>,
        Douglas Anderson <dianders@chromium.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 25, 2023 at 11:02=E2=80=AFAM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Thu, May 25, 2023 at 05:38:18PM +0000, Roy Luo wrote:
> > Expose usb device state to userland as the information is useful in
> > detecting non-compliant setups and diagnosing enumeration failures.
> > For example:
> > - End-to-end signal integrity issues: the device would fail port reset
> >   repeatedly and thus be stuck in POWERED state.
> > - Charge-only cables (missing D+/D- lines): the device would never ente=
r
> >   POWERED state as the HC would not see any pullup.
> >
> > What's the status quo?
> > We do have error logs such as "Cannot enable. Maybe the USB cable is ba=
d?"
> > to flag potential setup issues, but there's no good way to expose them =
to
> > userspace.
> >
> > Why add a sysfs entry in struct usb_port instead of struct usb_device?
> > The struct usb_device is not device_add() to the system until it's in
> > ADDRESS state hence we would miss the first two states. The struct
> > usb_port is a better place to keep the information because its life
> > cycle is longer than the struct usb_device that is attached to the port=
.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
>
> > diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> > index e23833562e4f..110143568c77 100644
> > --- a/drivers/usb/core/hub.h
> > +++ b/drivers/usb/core/hub.h
> > @@ -84,8 +84,10 @@ struct usb_hub {
> >   * @peer: related usb2 and usb3 ports (share the same connector)
> >   * @req: default pm qos request for hubs without port power control
> >   * @connect_type: port's connect type
> > + * @state: device state of the usb device attached to the port
>
> This member is essentially a duplicate of the .child member of the
> usb_port structure.  That is, it points to the .state member of the
> child device instead of to the child device itself, but this is pretty
> much the same thing.  You could replace *(port_dev->state) with
> port_dev->child->state.
>
Alan, thanks for the quick response!
Yes, port_dev->state is indeed the same as port_dev->child->state. However,
I still add port_dev->state because port_dev->child won't be assigned until
the corresponding usb_device is in ADDRESS state.
I wish I can assign get port_dev->child assigned earlier, but I think
the current design - assign port_dev->child and device_add() after ADDRESS
state - also makes sense because there are many ways that the enumeration
could fail in the early stage. By adding port_dev->state, I can link
usb_device->state to usb_port as soon as the usb_device is created to get
around the limitation of port_dev->child.
I would be very happy to hear other ideas.


> > diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> > index 06a8f1f84f6f..7f3430170115 100644
> > --- a/drivers/usb/core/port.c
> > +++ b/drivers/usb/core/port.c
> > @@ -160,6 +160,19 @@ static ssize_t connect_type_show(struct device *de=
v,
> >  }
> >  static DEVICE_ATTR_RO(connect_type);
> >
> > +static ssize_t state_show(struct device *dev,
> > +                       struct device_attribute *attr, char *buf)
> > +{
> > +     struct usb_port *port_dev =3D to_usb_port(dev);
> > +     enum usb_device_state state =3D USB_STATE_NOTATTACHED;
> > +
> > +     if (port_dev->state)
> > +             state =3D *port_dev->state;
> > +
> > +     return sprintf(buf, "%s\n",  usb_state_string(state));
>
> This races with device addition and removal (and with device state
> changes).  To prevent these races, you have to hold the
> device_state_lock spinlock while accessing the child device and its
> state.
>
> Unfortunately that spinlock is private to hub.c, so you will have to
> make it public before you can use it here.
>
> Alan Stern
