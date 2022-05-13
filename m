Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBF2525F26
	for <lists+linux-usb@lfdr.de>; Fri, 13 May 2022 12:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379151AbiEMJun (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 May 2022 05:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379143AbiEMJum (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 May 2022 05:50:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 05662C07
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 02:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652435439;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sZAI778kucdOOZyKcC5lyrkl5sFPlCBweQEC8iVf9/Y=;
        b=VnPfRlMR0svbWNNM8A86ingtyKQ9XUweP3QPDOwHROcRMtAlw4N/W1MjKyzYS1dzH/aXbB
        UkwejgbfyCic6hD7v/sl3RPLNsD+m7BgpvHyf9FnNUAxRj2uokuwr1BMXRbBLX8DfrZf0E
        lX/y4MBEysfOqGb5PAU7AunBjEgow2E=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-B-klTTcnOW-9xRcmfYH_EA-1; Fri, 13 May 2022 05:50:37 -0400
X-MC-Unique: B-klTTcnOW-9xRcmfYH_EA-1
Received: by mail-qv1-f72.google.com with SMTP id t15-20020ad45bcf000000b0045a8cfef66bso6475667qvt.11
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 02:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sZAI778kucdOOZyKcC5lyrkl5sFPlCBweQEC8iVf9/Y=;
        b=15bGyJp8FlyURxfKd7lbhwtmoeo6PGwF8YNpPxBB9w7oQOael+4y9pTa1+SrBxVbn+
         mWxg08zF7abru1FUJl6XY5sThBTNMzweChmM1R/Z7qNPXhl7dZVV5kwxuRFhD3etee5C
         KUxknr/ps61TRZgoLSoEPM7BBgNMmQzpqUYEfjF8sU8l9o73VO0lfc5JImsZ+fFMiI9m
         s3sgvCCtCVtep2OA0RFUfve/1qffUlwdaHS9Bw/iipcnOfQz+PxV9fhPsAhLfCm1EuSw
         vzJGWuKBw8wcKnDWPrRjQ20VYe00DKq4blsO66c6hcJ48MjxhzkI/578nKygAUFztSo8
         NDTw==
X-Gm-Message-State: AOAM531nxz1F22sgrC6IygCotPiSeQzKKFcRBh9f1dTYc/p32lbOBCtx
        DDq8VqxXtwVKjT2vAD8X5uXYMCdxbavzsv9aqKO6aAuYrfafjdoyulxtC4jBDlGff1Rlmv2Zif1
        Pv/+F4sXfmTOt7kYBJSkiced6Ow9fvpLToIBo
X-Received: by 2002:a05:6214:c8d:b0:45b:27e:b81a with SMTP id r13-20020a0562140c8d00b0045b027eb81amr3524108qvr.80.1652435437333;
        Fri, 13 May 2022 02:50:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOn7VtAEdHyswb1iJBgBeivvU3MLNrAez5yLaQicFL5gLmkZ0mxf8zMo/IC/xfDDCVOmQYtEf5EK/AozZy7LI=
X-Received: by 2002:a05:6214:c8d:b0:45b:27e:b81a with SMTP id
 r13-20020a0562140c8d00b0045b027eb81amr3524100qvr.80.1652435437102; Fri, 13
 May 2022 02:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220504151647.471885-1-jtornosm@redhat.com> <Ynzz6Jh5OeEikvfh@kroah.com>
In-Reply-To: <Ynzz6Jh5OeEikvfh@kroah.com>
From:   Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Date:   Fri, 13 May 2022 11:50:26 +0200
Message-ID: <CABk-BGte9qHwmdqCU6oZ9-E3LvOqcMf3z46e00hypNdD_hPxPQ@mail.gmail.com>
Subject: Re: [PATCH v5] USB: core: skip unconfiguration if device doesn't
 support it
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        Marcel Holtmann <marcel@holtmann.org>
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

Ok, I will try to identify the "bad" devices in some way.

Thanks

Jos=C3=A9 Ignacio


On Thu, May 12, 2022 at 1:48 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 04, 2022 at 05:16:47PM +0200, Jose Ignacio Tornos Martinez wr=
ote:
> > Some devices like Bluetooth Dongles with CSR chip (i.e. USB
> > Bluetooth V4.0 Dongle by Trust) hang when they are unbound from
> > 'unbind' sysfs entry and can not be bound again.
> >
> > For these devices, CSR chip hangs when usb configuration command
> > with index 0 (used to unconfigure) is sent during disconnection.
> >
> > To avoid this unwanted result, it is necessary not to send this
> > command, so a new quirk has been created. By default, quirk is
> > not applied for any device and needs to be enabled by user.
> >
> > For these devices, athough device is not unconfigured, it is
> > better to avoid device hanging to be able to operate. Even
> > bluetooth can be previously turned off.
> > On the other hand, this is not important if usb device is going to
> > be bound again (normal behavior), i.e. with usbip.
> >
> > Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> > ---
> > V4 -> V5:
> > - By default, quirk is not applied for any device and needs to be enabl=
ed
> > by user if necessary.
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
> >  Documentation/admin-guide/kernel-parameters.txt |  2 ++
> >  drivers/usb/core/message.c                      | 12 +++++++++---
> >  drivers/usb/core/quirks.c                       |  3 +++
> >  include/linux/usb/quirks.h                      |  3 +++
> >  4 files changed, 17 insertions(+), 3 deletions(-)
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
> > index d3c14b5ed4a1..f4cdf85a9eb6 100644
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
> > diff --git a/include/linux/usb/quirks.h b/include/linux/usb/quirks.h
> > index eeb7c2157c72..79cb0616f394 100644
> > --- a/include/linux/usb/quirks.h
> > +++ b/include/linux/usb/quirks.h
> > @@ -72,4 +72,7 @@
> >  /* device has endpoints that should be ignored */
> >  #define USB_QUIRK_ENDPOINT_IGNORE            BIT(15)
> >
> > +/* device doesn't support unconfigure. */
> > +#define USB_QUIRK_SKIP_UNCONFIGURE           BIT(16)
> > +
> >  #endif /* __LINUX_USB_QUIRKS_H */
> > --
> > 2.35.1
> >
>
> I'll drop this for now as there are no in-kernel users for this quirk
> yet.  When there is a need for one, please resubmit it.
>
> thanks,
>
> greg k-h
>

