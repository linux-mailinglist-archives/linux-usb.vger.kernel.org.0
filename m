Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90F3A5196F3
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 07:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238063AbiEDFoM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 01:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230474AbiEDFoL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 01:44:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9EB2B26104
        for <linux-usb@vger.kernel.org>; Tue,  3 May 2022 22:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651642835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ICQrNo0jcfyx97qZZC8MHC89OjMAPALyBecb8GRHD3w=;
        b=Ip+Yd8AzQYMw6vrDlY5498fSlXlodyxey6pX1pqnDDhy9xpOMKPa1Z4MILMkPSGY8hderL
        16nzxKZ+xHWV36nkcBpfDOoig3VgAcuE0OJpqGSigZbO0Xok0tExLm6GD+rMpV0MCXtjTi
        OcCoVeMP3steUCe2Amj0nXQYkOTQqKo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-PTit9zYvMCGtN0P0DxOYYg-1; Wed, 04 May 2022 01:38:11 -0400
X-MC-Unique: PTit9zYvMCGtN0P0DxOYYg-1
Received: by mail-qk1-f199.google.com with SMTP id u6-20020a05620a430600b0069c0f5ad4e2so304404qko.2
        for <linux-usb@vger.kernel.org>; Tue, 03 May 2022 22:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ICQrNo0jcfyx97qZZC8MHC89OjMAPALyBecb8GRHD3w=;
        b=fRQPpTjwwEqp1JfemeVB+dtbQDM/21JYYtNeTMupg3CzBkh9lwlq80IRc4RcxMmxpf
         eHiE1ewDbkow7oZl2FrJzud3zJ2jI7JSGSr5WEWBv/UxlhgmAFOWfg8YgXggmj34hkPe
         7n60ZxAViGWlbSZwU1VEmzsUZwDYRq++PlIvRqXvZI/atijp8o/D+8xEfesGaVp62+FP
         1LCUgqoa4fLj5i0Qst53d+7p+T2UDO72ZMDjLl0xfGckD9zi196UoB41vTYmxbk2UoBn
         sT0FGJRwWbUfM9Vzx+oJqsrDzGCxAHqn/sl0RRrS0/nM37pFGKqnw58yRIvoJNu3u4f3
         iYAw==
X-Gm-Message-State: AOAM530Ubuf2DvTVowzzO/kjAnMsmiC1InOVwjuuX85jf/7aGB2ZH3S0
        nOG0imHdeMeuaqv3Wbzv6JMRnWo8anHDsOMORKFaUPsj5ClQ16MD7cqXdH0ffsF2d/jRZO7UDlq
        wL+fkxsnACBc1UnYOjRQ9hcaMx8hYaEoheYT+
X-Received: by 2002:a05:6214:625:b0:441:1578:620b with SMTP id a5-20020a056214062500b004411578620bmr16254112qvx.126.1651642691367;
        Tue, 03 May 2022 22:38:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX3QLxDgiT2qZK5YfOu2c9c2u27iuSDKV8ui4jDdIMXouykcBxzplrQGgfT+jkkKWrAmgkXsyhFofdTpQ7FVs=
X-Received: by 2002:a05:6214:625:b0:441:1578:620b with SMTP id
 a5-20020a056214062500b004411578620bmr16254105qvx.126.1651642691128; Tue, 03
 May 2022 22:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220503153057.105128-1-jtornosm@redhat.com> <YnFPc9kWw+Jrxo8D@rowland.harvard.edu>
In-Reply-To: <YnFPc9kWw+Jrxo8D@rowland.harvard.edu>
From:   Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Date:   Wed, 4 May 2022 07:38:00 +0200
Message-ID: <CABk-BGt-PhcTBfkyMVgFxAdBaEUd43w-ueWQPXoCNSRsogqUjQ@mail.gmail.com>
Subject: Re: [PATCH] USB: core: skip unconfiguration if device doesn't support it
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

Hello Alan,

Ok, I will follow the order as you comment in the next patch

Thanks again

Best regards
Jos=C3=A9 Ignacio

On Tue, May 3, 2022 at 10:43 PM Alan Stern <stern@rowland.harvard.edu> wrot=
e:
>
> On Tue, May 03, 2022 at 05:30:57PM +0200, Jose Ignacio Tornos Martinez wr=
ote:
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
>
> This all looks okay except for one thing...
>
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
>
> These entries are supposed to be in numerical order according to the
> vendor ID and product ID.  Since 0x0a12 comes before 0x8086, your new
> entry does not belong at the end of the list.
>
> Alan Stern
>

