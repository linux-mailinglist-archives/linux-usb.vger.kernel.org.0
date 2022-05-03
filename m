Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77A6E517D35
	for <lists+linux-usb@lfdr.de>; Tue,  3 May 2022 08:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiECGRM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 May 2022 02:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiECGRL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 May 2022 02:17:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 92DF836141
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 23:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651558419;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YBmEe6IcJeKNtLABaml1o++OQj1EakENpPckGwCQus8=;
        b=cKunFBVJmh7PM00+kDAT65Za1NSb7BcB9DEXpIno3i6+oJOe3JHjP9Shxnm+QOzZ2SasdA
        slMjKvSqYAlLDfEhe9VNpbNuumjAearOWSR6YSs5HtiqYCF7Ucz+GQr00VN6TakOJY0F7t
        dAMpCWCe+nQrOjt4hc+nEc6VBkNZrpU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-JLAYOVxhNGCwIrCJLDF06A-1; Tue, 03 May 2022 02:13:38 -0400
X-MC-Unique: JLAYOVxhNGCwIrCJLDF06A-1
Received: by mail-qt1-f200.google.com with SMTP id a20-20020a05622a02d400b002f390c55f36so9759739qtx.16
        for <linux-usb@vger.kernel.org>; Mon, 02 May 2022 23:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YBmEe6IcJeKNtLABaml1o++OQj1EakENpPckGwCQus8=;
        b=3haM9wgBYxq6vacKzej5R0Mm31zHu84jvzT/OUeRfB2XV1gciPPeU8dC4InRUu08lY
         oMhC0I3WZ1H7FhlniPnXMFkvdL3F3bCdD1vrLSeg4BVeEjXPCjZb8RjSZ1XSaCZ/YrH1
         64GdWFS9T+StFjY+mnNAZY2kDRLu8aWSefLc258f0uV6OOQOQzl3dXDtjLobrDxd6Kea
         rSuH58oAictTxhEw55l8pEiG6b6T8vXSv0Phc3zUTzxurKnCweozFUk5nzg4KQE6XWhr
         s+/rvnHD57UWTMIV02Djog19F/L4nE2G7Lb8eNgtw7LniIaeHOilrgCadMoTRRh3HdSE
         aQvQ==
X-Gm-Message-State: AOAM533faAqa4TsOgg3wWW4ex+F3Ip5/BchtlckO/bBtmCaH//1F9Kax
        moGC73cm1n0Fs7MfBKTWoTnqSoIhQ8m6Mwby0rwivSFJCO+eE4PTeUScTeQL4R3y1X2oaHjt8WY
        +qd6PmMp1pbIyE5gW7tAyhdR8+KqvQQBTyO0X
X-Received: by 2002:a05:6214:5089:b0:45a:a3bf:11f2 with SMTP id kk9-20020a056214508900b0045aa3bf11f2mr1488060qvb.118.1651558417709;
        Mon, 02 May 2022 23:13:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx58/5ecT8VGOxqyTgeRx0MkP3Y7I8sMzUAzhz8AN58U+ucwvnvAnQw2h+kmJsKkPUhEA3aQOiGuX6e9hNkSCo=
X-Received: by 2002:a05:6214:5089:b0:45a:a3bf:11f2 with SMTP id
 kk9-20020a056214508900b0045aa3bf11f2mr1488052qvb.118.1651558417499; Mon, 02
 May 2022 23:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220502070758.67396-1-jtornosm@redhat.com> <Ym/pEqY+F57YzFwl@rowland.harvard.edu>
In-Reply-To: <Ym/pEqY+F57YzFwl@rowland.harvard.edu>
From:   Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Date:   Tue, 3 May 2022 08:13:26 +0200
Message-ID: <CABk-BGvq+1+1=jT4-ZpTkGzk_ztFg5Gyi+OdeECaqt2kj0CWUQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: CSR chip hangs when unbound
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        marcel@holtmann.org
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

Thanks everyone for your help.
I will prepare a new better patch.

Best regards
Jos=C3=A9 Ignacio

On Mon, May 2, 2022 at 4:22 PM Alan Stern <stern@rowland.harvard.edu> wrote=
:
>
> On Mon, May 02, 2022 at 09:07:58AM +0200, Jose Ignacio Tornos Martinez wr=
ote:
> > Bluetooth Dongles with CSR chip (i.e. USB Bluetooth V4.0 Dongle by
> > Trust) hang when they are unbound from 'unbind' sysfs entry and
> > can not be bound again.
> >
> > The reason is CSR chip hangs when usb configuration command with
> > index 0 (used to unconfigure) is sent during disconnection.
> >
> > To avoid this unwanted result, it is necessary not to send this
> > command for CSR chip when usb device is unbound, so a new quirk
> > has been created for this device.
> >
> > Athough device is not unconfigured, it is better to avoid device
> > hanging to be able to operate. Even bluetooth can be previously
> > turned off.
> > On the other hand, this is not important if usb device is going to
> > be bound again (normal behavior), i.e. with usbip.
> > ---
> >  drivers/usb/core/generic.c | 3 ++-
> >  drivers/usb/core/quirks.c  | 3 +++
> >  include/linux/usb/quirks.h | 3 +++
> >  3 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
> > index 740342a2812a..ea770b83d876 100644
> > --- a/drivers/usb/core/generic.c
> > +++ b/drivers/usb/core/generic.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/usb.h>
> >  #include <linux/usb/hcd.h>
> >  #include <uapi/linux/usb/audio.h>
> > +#include <linux/usb/quirks.h>
> >  #include "usb.h"
> >
> >  static inline const char *plural(int n)
> > @@ -256,7 +257,7 @@ void usb_generic_driver_disconnect(struct usb_devic=
e *udev)
> >
> >       /* if this is only an unbind, not a physical disconnect, then
> >        * unconfigure the device */
> > -     if (udev->actconfig)
> > +     if (!(udev->quirks & USB_QUIRK_SKIP_UNCONFIGURE) && udev->actconf=
ig)
>
> The usual programming convention is that when an "if" statement tests
> more than one condition, the test which is more likely to fail should
> come first.  In this case, it is more likely that udev->actconfig is
> non-NULL than that the USB_QUIRK_SKIP_UNCONFIGURE flag is set, because
> the quirk flag affects only one type of device whereas udev->actconfig
> can be non-NULL on any device.  So the test of udev->actconfig should
> come first.
>
> >               usb_set_configuration(udev, -1);
> >  }
> >
> > diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> > index d3c14b5ed4a1..13989629d743 100644
> > --- a/drivers/usb/core/quirks.c
> > +++ b/drivers/usb/core/quirks.c
> > @@ -510,6 +510,9 @@ static const struct usb_device_id usb_quirk_list[] =
=3D {
> >       /* INTEL VALUE SSD */
> >       { USB_DEVICE(0x8086, 0xf1a5), .driver_info =3D USB_QUIRK_RESET_RE=
SUME },
> >
> > +     /* CSR Bluetooth */
> > +     { USB_DEVICE(0x0a12, 0x0001), .driver_info =3D USB_QUIRK_SKIP_UNC=
ONFIGURE },
> > +
> >       { }  /* terminating entry must be last */
> >  };
>
> Did you want people to be able to test this quirk interactively?  If you
> do, you should add a flag character for this quirk to quirks_param_set()
> and document it.  But if you don't think people will need to test the
> new quirk then you don't need to add anything else.
>
> > diff --git a/include/linux/usb/quirks.h b/include/linux/usb/quirks.h
> > index eeb7c2157c72..84ab0a369931 100644
> > --- a/include/linux/usb/quirks.h
> > +++ b/include/linux/usb/quirks.h
> > @@ -72,4 +72,7 @@
> >  /* device has endpoints that should be ignored */
> >  #define USB_QUIRK_ENDPOINT_IGNORE            BIT(15)
> >
> > +/* device doesn't support unconfigure when unbound. */
> > +#define USB_QUIRK_SKIP_UNCONFIGURE           BIT(16)
>
> The comment isn't right.  In fact, the device doesn't ever support
> unconfigure.  Whether it is bound or not makes no difference.
>
> Alan Stern
>

