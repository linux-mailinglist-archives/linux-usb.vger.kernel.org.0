Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5021D519F7E
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 14:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349599AbiEDMgK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 08:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349600AbiEDMgG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 08:36:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7F66A26ADC
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 05:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651667549;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0TA03I6+fjh95apG9GQ2eQROhR2NdgWq4cgRsTdsDGU=;
        b=TmmykCQHwi3U59y27c7nfwXkwECY1QWAnNKmXd3+AMIc0Mt6MIAle6K977lCv5WxLY6/cf
        0tlDmIhUdCUSnAy2SAih2gFbh/NnI8aX+EJftrvZaNkWUnosjhSeGg3M9jBA5wr1CPp6jy
        u2IpKVTOizmPdeKvsmk+7OlZOAC/ODw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-OGii6NX6M8G0ECz36OLtaA-1; Wed, 04 May 2022 08:32:28 -0400
X-MC-Unique: OGii6NX6M8G0ECz36OLtaA-1
Received: by mail-qk1-f197.google.com with SMTP id d67-20020a379b46000000b006a00045c8c9so765760qke.22
        for <linux-usb@vger.kernel.org>; Wed, 04 May 2022 05:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0TA03I6+fjh95apG9GQ2eQROhR2NdgWq4cgRsTdsDGU=;
        b=0GBzVXXCriXVViCd9YFADEAVyE4E7/Hdg4OOPGgfEryGY4ARnjo72DR9ctOsEkFXFc
         0NOYSAQevUK+HjQYC0nTs3mBh3lgxHVddRsmnYtwwZJAv2a5OZZaoU4FkOHmlPrLUIWh
         gGOjYxpSm6pbdZM0rX+JRGBxTkU3yobj4IYs5Q4IxhEtM5HCh3kyS9+Z2PjSz2KWFrtW
         LNPwXF7rwL+RV4Tj3jnFY9LGZF2WyDKWA8V+PRlWKWfmEoc1h7J5P+kzBeF8qDgdg5NY
         qfdnGUD2Li3d9wDdX0tC57cq/S96CicOP+ydD1QTY/as6tjxcrVWNvt5IhhJVI2vfW/3
         KSKw==
X-Gm-Message-State: AOAM530L5VnbrbEpUTkqY5L/5py5JoxKytnVlEXosPkGr6iNy2Ppj9HA
        ty0Yit586fpkraOCiTTQr4oNLw3SuMwoO6aJ01WXlHESIIl/BrUkzXvgmMMQ++FbUh7Mw4h+VlR
        9xra1ObegRi5oRbTtlC8Rm835l9L4LC7GdcKZ
X-Received: by 2002:a05:6214:1c47:b0:45a:8cdf:a1fe with SMTP id if7-20020a0562141c4700b0045a8cdfa1femr11294417qvb.85.1651667547945;
        Wed, 04 May 2022 05:32:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyItkClXcMGTY6CiMbiVczkK6HWgGN7opZwGpzy2s1fI7oQk+7cXCrNXK0KQ9Oho1xTggBfwxsXMgMTfzy/5gM=
X-Received: by 2002:a05:6214:1c47:b0:45a:8cdf:a1fe with SMTP id
 if7-20020a0562141c4700b0045a8cdfa1femr11294398qvb.85.1651667547713; Wed, 04
 May 2022 05:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220504083612.143463-1-jtornosm@redhat.com> <6A6E8A20-1994-44AD-981A-C8CF472541AC@holtmann.org>
In-Reply-To: <6A6E8A20-1994-44AD-981A-C8CF472541AC@holtmann.org>
From:   Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Date:   Wed, 4 May 2022 14:32:16 +0200
Message-ID: <CABk-BGsXtWmjH=BjZ30FG=52UTVbMXD27ac_=CCyQidCoa74YQ@mail.gmail.com>
Subject: Re: [PATCH v4] USB: core: skip unconfiguration if device doesn't
 support it
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Marcel,

Ok, I am not sure if it is working in other related products ...
Would it be ok if we keep the possibility to use the quirk if necessary?
That is, by default CSR devices are not marked with the quirk but they
can be marked by the users if necessary.

Thanks

Best regards
Jos=C3=A9 Ignacio

On Wed, May 4, 2022 at 2:23 PM Marcel Holtmann <marcel@holtmann.org> wrote:
>
> Hi Jose,
>
> > Bluetooth Dongles with CSR chip (i.e. USB Bluetooth V4.0 Dongle by
> > Trust) hang when they are unbound from 'unbind' sysfs entry and
> > can not be bound again.
> >
> > The reason is CSR chip hangs when usb configuration command with
> > index 0 (used to unconfigure) is sent during disconnection.
> >
> > To avoid this unwanted result, it is necessary not to send this
> > command for CSR chip, so a new quirk has been created.
> >
> > Athough device is not unconfigured, it is better to avoid device
> > hanging to be able to operate. Even bluetooth can be previously
> > turned off.
> > On the other hand, this is not important if usb device is going to
> > be bound again (normal behavior), i.e. with usbip.
> >
> > Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> > ---
> > V3 -> V4:
> > - Reorder quirk entries to be in numerical order according to the vendo=
r
> > ID and product ID.
> > - Add patch version information.
> > V2 -> V3:
> > - Change subject (Bluetooth: btusb: CSR chip hangs when unbound ->
> > USB: core: skip unconfiguration if device doesn't support it).
> > - Improve quirk checking.
> > - Allow to test quirk interactively.
> > V1 -> V2:
> > - Use quirk feature for the exception.
> >
> > Documentation/admin-guide/kernel-parameters.txt |  2 ++
> > drivers/usb/core/message.c                      | 12 +++++++++---
> > drivers/usb/core/quirks.c                       |  6 ++++++
> > include/linux/usb/quirks.h                      |  3 +++
> > 4 files changed, 20 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Document=
ation/admin-guide/kernel-parameters.txt
> > index 3f1cc5e317ed..71651b888d14 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -6183,6 +6183,8 @@
> >                                       pause after every control message=
);
> >                               o =3D USB_QUIRK_HUB_SLOW_RESET (Hub needs=
 extra
> >                                       delay after resetting its port);
> > +                             p =3D USB_QUIRK_SKIP_UNCONFIGURE (device =
doesn't
> > +                                     support unconfigure);
> >                       Example: quirks=3D0781:5580:bk,0a5c:5834:gij
> >
> >       usbhid.mousepoll=3D
> > diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> > index 4d59d927ae3e..9c6cd0c75f4f 100644
> > --- a/drivers/usb/core/message.c
> > +++ b/drivers/usb/core/message.c
> > @@ -2108,9 +2108,15 @@ int usb_set_configuration(struct usb_device *dev=
, int configuration)
> >       }
> >       kfree(new_interfaces);
> >
> > -     ret =3D usb_control_msg_send(dev, 0, USB_REQ_SET_CONFIGURATION, 0=
,
> > -                                configuration, 0, NULL, 0,
> > -                                USB_CTRL_SET_TIMEOUT, GFP_NOIO);
> > +     if (configuration =3D=3D 0 && !cp
> > +                     && (dev->quirks & USB_QUIRK_SKIP_UNCONFIGURE)) {
> > +             dev_warn(&dev->dev, "device is not unconfigured!\n");
> > +             ret =3D 0;
> > +     } else
> > +             ret =3D usb_control_msg_send(dev, 0, USB_REQ_SET_CONFIGUR=
ATION, 0,
> > +                                        configuration, 0, NULL, 0,
> > +                                        USB_CTRL_SET_TIMEOUT, GFP_NOIO=
);
> > +
> >       if (ret && cp) {
> >               /*
> >                * All the old state is gone, so what else can we do?
> > diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> > index d3c14b5ed4a1..7c86c8d61570 100644
> > --- a/drivers/usb/core/quirks.c
> > +++ b/drivers/usb/core/quirks.c
> > @@ -138,6 +138,9 @@ static int quirks_param_set(const char *value, cons=
t struct kernel_param *kp)
> >                       case 'o':
> >                               flags |=3D USB_QUIRK_HUB_SLOW_RESET;
> >                               break;
> > +                     case 'p':
> > +                             flags |=3D USB_QUIRK_SKIP_UNCONFIGURE;
> > +                             break;
> >                       /* Ignore unrecognized flag characters */
> >                       }
> >               }
> > @@ -394,6 +397,9 @@ static const struct usb_device_id usb_quirk_list[] =
=3D {
> >       /* ELMO L-12F document camera */
> >       { USB_DEVICE(0x09a1, 0x0028), .driver_info =3D USB_QUIRK_DELAY_CT=
RL_MSG },
> >
> > +     /* CSR Bluetooth */
> > +     { USB_DEVICE(0x0a12, 0x0001), .driver_info =3D USB_QUIRK_SKIP_UNC=
ONFIGURE },
> > +
>
> NAK. I said this before.
>
> The VID:PID 0a12:0001 is used in millions of products that work
> correctly. Only because some counterfeit products get things wrong
> doesn=E2=80=99t mean all get marked as broken.
>
> Regards
>
> Marcel
>

