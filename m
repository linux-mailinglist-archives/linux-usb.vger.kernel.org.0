Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71ECE519739
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 08:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238246AbiEDGKt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 02:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232965AbiEDGKs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 02:10:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9F83A14006
        for <linux-usb@vger.kernel.org>; Tue,  3 May 2022 23:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651644431;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oRGhmg2aMfbkHCiA7thR3kzGbcbMmfJadqOzJikcDNY=;
        b=GdXg7quhGpj1l9LvB4sG8t32b3jhZFxAhuVng7ayky+G7x00GGXwahsC2S6Iagd1eWFyzH
        8VBcyOY9mDtekcBxVuqCjY/PTaA8mcijZXfdejdeGyhxp0K5bEsyQmiObH+5JDVeyCfwBn
        vWf3mF431CEFJj0XmRTKn3ZG2jOswSw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-4M_Vf20gNWOf0hgpVYKZBg-1; Wed, 04 May 2022 02:07:10 -0400
X-MC-Unique: 4M_Vf20gNWOf0hgpVYKZBg-1
Received: by mail-qv1-f69.google.com with SMTP id kd30-20020a056214401e00b0045a96ed0d4aso273536qvb.17
        for <linux-usb@vger.kernel.org>; Tue, 03 May 2022 23:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oRGhmg2aMfbkHCiA7thR3kzGbcbMmfJadqOzJikcDNY=;
        b=S3dUj2naf0pmpm2SZJK/V4SrT0EnG4uXxY45ZkRYYHZeij8oj4Avgh2/Vj2GIy5cdf
         pa3bQffyZhPa9oBvba2yu15HAabS50wnuFMf2Hb5GbkasazV6AeQ4ylpkGYlL6wM2tMv
         3UVd1U7SZxc3aLJQ6/8t0BC2xd8suIHcRNp5DKi13l7IcJyx8X5HE/tIG9Z4s+Sg0Fr1
         C/mFw7vpZMHOkgQj5ThpofATaA1xxtBdZ0IVpT5iYhlnRtqjEsbV95PXjTxCA17ACDqh
         jPXVN1q1buGwFxlVZVJ8lycq4XqpfYnA5Hk18u5Lic8L84LUGjgUIM2roFdE5au7ZCM+
         LU8A==
X-Gm-Message-State: AOAM5335+PiwGMQhu9xsOPT276nQXBERGCSQUuJagmhPByuaR6rx6sDR
        MS5kFCUB03syRDC2g6Lz1fyK4vg9G/ZylwuGGVP/uOrTicKWzunwSKEppKf8weCAsNKoTgXtdat
        Hycu0G8JPZaFYMOJnDl2vZ8MLcBwJFnwA/uyk
X-Received: by 2002:a05:622a:5d0:b0:2e1:d430:a5c9 with SMTP id d16-20020a05622a05d000b002e1d430a5c9mr18165666qtb.639.1651644429912;
        Tue, 03 May 2022 23:07:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyT9at3dyy49p7ygtqjnn3iZ98Q0x4cm/Pp83Gf0Q+fARZTC8s2PlCNURpWSkS9OWbeTV6qGIoQ3krclAffyI=
X-Received: by 2002:a05:622a:5d0:b0:2e1:d430:a5c9 with SMTP id
 d16-20020a05622a05d000b002e1d430a5c9mr18165653qtb.639.1651644429660; Tue, 03
 May 2022 23:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220503153057.105128-1-jtornosm@redhat.com> <E493EAE9-2F12-468E-BFBF-24809D78526E@holtmann.org>
In-Reply-To: <E493EAE9-2F12-468E-BFBF-24809D78526E@holtmann.org>
From:   Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Date:   Wed, 4 May 2022 08:06:58 +0200
Message-ID: <CABk-BGu1V2RM8BvpVic-CzJoY9rrCz0+sqnsQ-6R=7cH6cUo5A@mail.gmail.com>
Subject: Re: [PATCH] USB: core: skip unconfiguration if device doesn't support it
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

These devices are working perfectly, I haven't detected any wrong
bluetooth issues.
It is only related to usb unbind/bind operation, which is needed for
example for usbip, but I think it is not very used at the user level
normally. lNow, with the quirk, usbip is working for these devices.

I have checked 3 different devices (dongle USB 2.0 EDR, dongle USB 4.0
Trust and another one USB 4.0 unknown), with CSR chip and the same
result, that is, after unbinding they can not be bound again. The
sampling is not very large but it is 3 out of three
The first commented device is old so I guess unbind/bind operation is
not working for a long time (or from the beginning).

Thanks

Best regards
Jos=C3=A9 Ignacio

On Tue, May 3, 2022 at 8:45 PM Marcel Holtmann <marcel@holtmann.org> wrote:
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
> > index d3c14b5ed4a1..7d42fdc7404c 100644
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
> > @@ -510,6 +513,9 @@ static const struct usb_device_id usb_quirk_list[] =
=3D {
> >       /* INTEL VALUE SSD */
> >       { USB_DEVICE(0x8086, 0xf1a5), .driver_info =3D USB_QUIRK_RESET_RE=
SUME },
> >
> > +     /* CSR Bluetooth */
> > +     { USB_DEVICE(0x0a12, 0x0001), .driver_info =3D USB_QUIRK_SKIP_UNC=
ONFIGURE },
> > +
>
> NAK. These are billion of devices that are today working correctly. You a=
re not telling these devices they are broken now.
>
> Regards
>
> Marcel
>

