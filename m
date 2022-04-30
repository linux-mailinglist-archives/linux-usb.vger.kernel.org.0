Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3506B515AFB
	for <lists+linux-usb@lfdr.de>; Sat, 30 Apr 2022 09:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382281AbiD3HfL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 Apr 2022 03:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382259AbiD3HfK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 30 Apr 2022 03:35:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8E70FB18BD
        for <linux-usb@vger.kernel.org>; Sat, 30 Apr 2022 00:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651303908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ecJA9Itfla76EvqMIcL7rLch0zXtk0g57WPeiqFPCPg=;
        b=LF98iaVXPrMEK6jA3Q7WsViPCI8DvFNxHpd4Z04BZjirrfN8i5alp3DGgvWa8ZD+6dIfeL
        7e6lSHTHGosMiRZWHGBBXxryqjda4sOSFR/S1tk6O7IVSfDCxQ/UJrKT4WJ4GtiGFkrZ6I
        brH7T8cxhTRdOllUd1QLoGdvTlocN1s=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-FOQIJa6bNiSK4FJenm0g2g-1; Sat, 30 Apr 2022 03:31:47 -0400
X-MC-Unique: FOQIJa6bNiSK4FJenm0g2g-1
Received: by mail-qv1-f70.google.com with SMTP id 33-20020a0c8024000000b0043d17ffb0bdso7500822qva.18
        for <linux-usb@vger.kernel.org>; Sat, 30 Apr 2022 00:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ecJA9Itfla76EvqMIcL7rLch0zXtk0g57WPeiqFPCPg=;
        b=WMiFDsqwbsngjPn/Q1Wz3mXjnDX18uTs6GhsjifiG2M5LjsJUgZk3h4t0P8llHrHax
         bYX865t2C1D+xzK0I/BaCUqZzGpXv/0HfyWfaYuFAj5OI18OvdkGqnpKRQzNetg0ncEt
         blcU4YLvUgR+gRdcW1bl9SwAZM1e+Pmmb3klJy1Kp5uPG2QfmO7gOlOrd/CwK4sjB5Ll
         EhyLo6OujNoU67xT386rqdEnjL7szOaB+xV7Ju1DUPm0CHoNTcmRBo7pXspJGNsw2JJ1
         /MdA436M6fQaP/vV/J2+NehAtCivs0QY4H3qmmtwwa6iN1N8mEhhKaaSO2mwuicLFz49
         NrZQ==
X-Gm-Message-State: AOAM533tTsgo7r1bOsk4sXlFHfJxvRCcqLTqnMfPQQO/3oyGQHBahqxo
        FXOtmE8+wmITc6qafzlvU6yZ1MSqpiWS3Fw57TZ5z58sopxoYfWeYUpxcEsBrxVwhN9Sgg6ml0y
        y/J+S+YV8U0lwt4Q2Hdqn65rqoIp1orkBMP8k
X-Received: by 2002:a05:6214:1c46:b0:456:3704:3d71 with SMTP id if6-20020a0562141c4600b0045637043d71mr2256883qvb.118.1651303906751;
        Sat, 30 Apr 2022 00:31:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6IDJn0FWqtw1yqSx6hDwlKl3BuWSpPgBbmNyu7reyoKtdlQueA3u46URMwhLCVM9jA//m/4KsHNEpaSrQrLQ=
X-Received: by 2002:a05:6214:1c46:b0:456:3704:3d71 with SMTP id
 if6-20020a0562141c4600b0045637043d71mr2256869qvb.118.1651303906469; Sat, 30
 Apr 2022 00:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220429153138.935435-1-jtornosm@redhat.com> <YmyMupSnd4X8LjXc@rowland.harvard.edu>
In-Reply-To: <YmyMupSnd4X8LjXc@rowland.harvard.edu>
From:   Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Date:   Sat, 30 Apr 2022 09:31:35 +0200
Message-ID: <CABk-BGtmoX3arVr1fTnriP1+iO4A2YDm-grMNdNFDqvJxmjb2A@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: CSR chip hangs when unbound
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        marcel@holtmann.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Alan,

Ok, I will prepare a new patch in that way.

Thanks

Best regards
Jos=C3=A9 Ignacio


On Sat, Apr 30, 2022 at 3:18 AM Alan Stern <stern@rowland.harvard.edu> wrot=
e:
>
> On Fri, Apr 29, 2022 at 05:31:38PM +0200, Jose Ignacio Tornos Martinez wr=
ote:
> > Bluetooth Dongles with CSR chip (i.e. USB Bluetooth V4.0 Dongle by
> > Trust) hang when they are unbound from 'unbind' sysfs entry and
> > can not be bound again.
> >
> > The reason is CSR chip hangs when usb configuration command with
> > index 0 (used to unconfigure) is sent during disconnection.
> >
> > To avoid this unwanted result, it is necessary not to send this
> > command for CSR chip when usb device is unbound.
> > Besides, "skip_unconfigure" sysfs entry has been created for
> > testing purposes with these or other devices.
>
> I don't see any good reason for adding this sysfs entry.  Normal users
> won't want to do it, and developers can add their own quirks to their
> kernels.  Also, see below.
>
> > Athough device is not unconfigured, it is better to avoid device
> > hanging to be able to operate. Even bluetooth can be previously
> > turned off.
> > On the other hand, this is not important if usb device is going to
> > be bound again (normal behavior), i.e. with usbip.
> >
> > Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> > ---
> >  drivers/bluetooth/btusb.c  |  8 +++++++-
> >  drivers/usb/core/generic.c |  2 +-
> >  drivers/usb/core/sysfs.c   | 36 ++++++++++++++++++++++++++++++++++++
> >  include/linux/usb.h        |  2 ++
> >  4 files changed, 46 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/usb.h b/include/linux/usb.h
> > index 86a73d834e38..55828cd0a0d1 100644
> > --- a/include/linux/usb.h
> > +++ b/include/linux/usb.h
> > @@ -618,6 +618,7 @@ struct usb3_lpm_parameters {
> >   *   parent->hub_delay + wHubDelay + tTPTransmissionDelay (40ns)
> >   *   Will be used as wValue for SetIsochDelay requests.
> >   * @use_generic_driver: ask driver core to reprobe using the generic d=
river.
> > + * @skip_unconfigure: disable unconfigure operation for devices withou=
t support.
> >   *
> >   * Notes:
> >   * Usbcore drivers should not set usbdev->state directly.  Instead use
> > @@ -704,6 +705,7 @@ struct usb_device {
> >
> >       u16 hub_delay;
> >       unsigned use_generic_driver:1;
> > +     unsigned skip_unconfigure:1;
> >  };
> >  #define      to_usb_device(d) container_of(d, struct usb_device, dev)
>
> This is not a good way to do it.  Instead you should create a new USB
> device quirk bit.  An advantage of this is that there is already a
> mechanism for users to manually set a quirk flag for a device (the
> "quirks" sysfs module file).
>
> Alan Stern
>

