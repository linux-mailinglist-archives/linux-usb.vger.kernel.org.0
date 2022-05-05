Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1E551C557
	for <lists+linux-usb@lfdr.de>; Thu,  5 May 2022 18:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382044AbiEEQwk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 May 2022 12:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244049AbiEEQwg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 May 2022 12:52:36 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.133.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0967232EC7
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 09:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651769336;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MMLP3q0bFWEmgUvSqRBJNYvVG3wAOUbHF9dOLzvP/LE=;
        b=OgGfc9fqbVlDHfvW5F9LdQbEToetVxnMys/9+OeS5MxEK8FJfhYECULDS6KDZA9snpuqli
        fYrTWMM31HHDrO8dCt8XQ9gQA/HqWVZ/nq7H0ZE4YOco6uFrAHiKMJ/Smj0Xxh6ORLUB6I
        Tbc87sbtyv0jhZCOIGoLF1xgVM9nedU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-bIcafjc3Nw-HwM7POr652g-1; Thu, 05 May 2022 12:48:55 -0400
X-MC-Unique: bIcafjc3Nw-HwM7POr652g-1
Received: by mail-qt1-f200.google.com with SMTP id x5-20020a05622a000500b002f37cb8b803so3795594qtw.9
        for <linux-usb@vger.kernel.org>; Thu, 05 May 2022 09:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MMLP3q0bFWEmgUvSqRBJNYvVG3wAOUbHF9dOLzvP/LE=;
        b=w27Kufe7DWDMNQIK7Ly/UZbP2usDKRitXAx8p0f0b+jgDETTXOzVOqI+tpWz+QGvHY
         nrS4eLRVWbM6IzqBSkVw7N+36BMJZvIhXoGFB0t5TZG9ZqLiQ/Qecjy3QqFUkqG6tQjM
         db4d7gAnqiUIHTusR5Ac07DbuMuVc8mJBJ0oFWxXtz3LLiqMscvYn/mXRl/PhGHAihHc
         m3LkkkJ8idIDprdMtg2lOs66P9pJq4eyIN22jR0kXQ4Lx69+JlVIsrSatGwtusahtmlN
         nPW+fKniVccrDdXxzI7IhkXbI6HkA2GHaJvuqh3eqOHUc6x6Oi13N562px8cgAkmT3Lv
         2FJQ==
X-Gm-Message-State: AOAM532Yx8Eu8JmSLA95T3u+KkVjsnt1tuZ7JSz7xam/ra/tReZA7231
        p8dNRxE1YchBl3iHlpbxf0zzhOTBwbSRCFJO7v4GaUfZeK5vdpV83RE+Sx09XX+f7WGwxaI9aVI
        wwsN2w26zHvN0Xlv1onnLa6lA+uoMSVj1cAWp
X-Received: by 2002:a05:620a:1:b0:6a0:23ae:e507 with SMTP id j1-20020a05620a000100b006a023aee507mr5152544qki.6.1651769334545;
        Thu, 05 May 2022 09:48:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgffYLIhGqeDM9plELPCe+SHSHc+vkw2GEdLd6gt54F1Y+FdAmk19e4oM8MZCC/9IMKQwlwqmZZr+4gCuIQsE=
X-Received: by 2002:a05:620a:1:b0:6a0:23ae:e507 with SMTP id
 j1-20020a05620a000100b006a023aee507mr5152533qki.6.1651769334306; Thu, 05 May
 2022 09:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220504083612.143463-1-jtornosm@redhat.com> <6A6E8A20-1994-44AD-981A-C8CF472541AC@holtmann.org>
 <15f82796-fa82-fa26-ed38-f0785f39f87e@suse.com> <87levgkyjy.fsf@miraculix.mork.no>
 <YnPb04ynkSTlhg4H@rowland.harvard.edu> <875ymkknqy.fsf@miraculix.mork.no>
In-Reply-To: <875ymkknqy.fsf@miraculix.mork.no>
From:   Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Date:   Thu, 5 May 2022 18:48:43 +0200
Message-ID: <CABk-BGsvm_FQ0-sTJg_DVTVKd4oHAKYt6SCZby=XmdgmEdcOjQ@mail.gmail.com>
Subject: Re: [PATCH v4] USB: core: skip unconfiguration if device doesn't
 support it
To:     =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

Just repeating the same sequence here without the patch:

$ hciconfig
hci0:    Type: Primary  Bus: USB
    BD Address: 00:1A:7D:DA:71:13  ACL MTU: 310:10  SCO MTU: 64:8
    UP RUNNING
    RX bytes:696 acl:0 sco:0 events:49 errors:0
    TX bytes:3168 acl:0 sco:0 commands:49 errors:0
$
< scanning is working from Bluetooth Settings from GNOME >
$ echo 0 >/sys/bus/usb/devices/1-3/bConfigurationValue
$ hciconfig
$
< bluetooth device is not found in Bluetooth Settings from GNOME >
$ echo 1 >/sys/bus/usb/devices/1-3/bConfigurationValue
< it takes a while>
bash: echo: write error: Connection timed out
$ hciconfig
$
< bluetooth device is not found in Bluetooth Settings from GNOME >

Definitely, Bjorn, your device is working better than mine.

And the same sequence with the patch, to show that it is working:

$ cat /proc/cmdline
BOOT_IMAGE=3D... usbcore.quirks=3D0a12:0001:p
$ cat /sys/module/usbcore/parameters/quirks
0a12:0001:p
$ hciconfig
hci0:    Type: Primary  Bus: USB
    BD Address: 00:1A:7D:DA:71:13  ACL MTU: 310:10  SCO MTU: 64:8
    UP RUNNING
    RX bytes:806 acl:0 sco:0 events:66 errors:0
    TX bytes:5168 acl:0 sco:0 commands:65 errors:0
$
< scanning is working from Bluetooth Settings from GNOME >
$ echo 0 >/sys/bus/usb/devices/1-3/bConfigurationValue
$ hciconfig
$
< bluetooth device is not found in Bluetooth Settings from GNOME >
$ echo 1 >/sys/bus/usb/devices/1-3/bConfigurationValue
$ hciconfig
hci0:    Type: Primary  Bus: USB
    BD Address: 00:1A:7D:DA:71:13  ACL MTU: 310:10  SCO MTU: 64:8
    UP RUNNING
    RX bytes:696 acl:0 sco:0 events:49 errors:0
    TX bytes:3168 acl:0 sco:0 commands:49 errors:0
$
< scanning is working from Bluetooth Settings from GNOME >

In both cases, I also see similar log errors: Bluetooth: hci0: urb
00000000exxxxxxx failed to resubmit (2)

Best regards
Jos=C3=A9 Ignacio




On Thu, May 5, 2022 at 5:23 PM Bj=C3=B8rn Mork <bjorn@mork.no> wrote:
>
> Alan Stern <stern@rowland.harvard.edu> writes:
>
> > Please pardon me for butting in, but I don't see how this tests the
> > condition that Jose is worried about.
> ..
> > And presumably the device is working again.  However, none of this show=
s
> > what happens when the device is unconfigured.  To test that, you would
> > have to do:
> >
> >       echo 0 >/sys/bus/usb/devices/1-8/bConfigurationValue
> >       echo 1 >/sys/bus/usb/devices/1-8/bConfigurationValue
> >
> > and then see if the device continues to work.
>
> Ah, sorry. Scanned briefly, saw "bind", and assumed too much.  Making an
> ass out of... you know.
>
> Actually I didn't understand the part about unconfiguration since I
> can't see how that would happen during normal usage?  Anyway,
> unconfiguring also works for me:
>
> canardo:/tmp# hciconfig hci0
> hci0:   Type: Primary  Bus: USB
>         BD Address: 00:1A:7D:DA:71:15  ACL MTU: 310:10  SCO MTU: 64:8
>         UP RUNNING
>         RX bytes:660 acl:0 sco:0 events:43 errors:0
>         TX bytes:2178 acl:0 sco:0 commands:43 errors:0
>
> canardo:/tmp# echo 0 >/sys/bus/usb/devices/1-8/bConfigurationValue
> canardo:/tmp# hciconfig hci0
> Can't get device info: No such device
> canardo:/tmp# echo 1 >/sys/bus/usb/devices/1-8/bConfigurationValue
>
>
> Not entirely sure how to validate that "everything" works at this point?
> I can use the rfcomm session the adapter usually handles and also run
> lescan after this.  So I guess both BLE and BDR works.
>
> And the counters count something:
>
> canardo:/tmp# hciconfig hci0
> hci0:   Type: Primary  Bus: USB
>         BD Address: 00:1A:7D:DA:71:15  ACL MTU: 310:10  SCO MTU: 64:8
>         UP RUNNING
>         RX bytes:3883 acl:40 sco:0 events:81 errors:0
>         TX bytes:2518 acl:19 sco:0 commands:50 errors:0
>
>
> I can see an error like this logged every time I unconfigure the device:
>
> Bluetooth: hci0: urb 00000000e66a2492 failed to resubmit (2)
>
> There is nothing else logged in kernel log
>
>
> Bj=C3=B8rn
>

