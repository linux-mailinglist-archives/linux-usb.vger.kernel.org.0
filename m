Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52AC362A174
	for <lists+linux-usb@lfdr.de>; Tue, 15 Nov 2022 19:41:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbiKOSlN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Nov 2022 13:41:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbiKOSlL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Nov 2022 13:41:11 -0500
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C902CCB9
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 10:41:09 -0800 (PST)
Received: by mail-vk1-xa30.google.com with SMTP id m18so7043600vka.10
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 10:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ew/kS0ApPSoUAdYuL8W2b5WTrzKo/qT7BVDW6jleAnI=;
        b=OvwABNQgofnJmpgMRxGIvnO/BdcZq8Nn4cFLo+dG2qUVcyiYxEqNadXTeoO7tmXWTy
         52goVdGBhCske78LH8RKeSx3u2zD83RGvEx0gEmYicFf+V4dwr5mZYVRWnh6ZMFd7tbr
         u3hN6yBI5h18Y55Ox7s4R0vTHAuzkKFrjzr+Ytw96R62tmDEZuAuFnZm6Islh93FN5Ho
         SITC8VfJuOUd0igtsQgZ6tt58wK6cWMFiNVB0f+tmbKXHPeXTMZmeTCXPruAV/A7gJRM
         GK58AtbCxYTvupjRf0ei9Sh9UoTtigie2esuDHW/hFbTn+zLT8YR5x30g9qEf0HojmCd
         R+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ew/kS0ApPSoUAdYuL8W2b5WTrzKo/qT7BVDW6jleAnI=;
        b=iHsNR6sdyZ5SCxwGH41fvIm/rz5d2CCoxa2WAhKdAdFBYj2Bxz06OTuh1RiEHy0UE9
         H4zTp7+RfIpYanBJX5FKaXsml2x/YQpwLxYnwxJRSv6aSAvg9RN7SQFaPvd6sCmDVVYS
         9tB7D4qYjUE6QjofemV5SUKzX2Qsr5onaCIXmJ9VH8uLDETQ/7Ly/plAt6OG+XPyZQ3r
         IFgn88xvIG1sUJv7vwu56HgcHhNdTcPwKFKH61kg2A9l4jSGreL+oJqM0kS4Ep3Azkwf
         erOb/XYPlAbkb8r8eNikKX4f690PhdrU3g+CKW1es/XL17a7cIn4wuV7sONRpa7Jwx6m
         8n1w==
X-Gm-Message-State: ANoB5pmXU16Vg4vNuu7uuWwIjDyVJAjUk2+dNej2evBeYd+rOf3NeWC7
        VJ/FMvMCtr3AKWuNKUIy34CxLXNntoNyFLB7zay7KA==
X-Google-Smtp-Source: AA0mqf7pnrADpTZF74fBg4VaMnbIzUDAlnQMsSQUOnQvxEhwP1Pu068qiIjQYm7GeWXewzlKkFJSgIGHstyBmtjeaM0=
X-Received: by 2002:a05:6122:1989:b0:3b8:1bb4:b750 with SMTP id
 bv9-20020a056122198900b003b81bb4b750mr10368533vkb.20.1668537668924; Tue, 15
 Nov 2022 10:41:08 -0800 (PST)
MIME-Version: 1.0
References: <b2d1004d-4a76-ab0b-d369-a38c2d7c1624@csgroup.eu>
 <20221111152852.2837363-1-allenwebb@google.com> <Y26UcbviRaoK9a3C@bombadil.infradead.org>
 <CAJzde06b4d065y7KSoGO6qQBgvcVdkUai1WAy_TkrkTCDHS41A@mail.gmail.com>
 <20221114172214.ilnk5wj3eevpsqts@ldmartin-desk2.lan> <CAJzde04id1kWhnR5HfuFEZR+ej7xXAsmQ9HpwYT5rQEY4Jsntw@mail.gmail.com>
 <Y3PN0GZYvFyUF83g@bombadil.infradead.org>
In-Reply-To: <Y3PN0GZYvFyUF83g@bombadil.infradead.org>
From:   Allen Webb <allenwebb@google.com>
Date:   Tue, 15 Nov 2022 12:40:57 -0600
Message-ID: <CAJzde06cFefEFwRxYo1ia=27rUw6yPn9ejkNChEH8YnVK1LWYQ@mail.gmail.com>
Subject: Re: [PATCH] modules: add modalias file to sysfs for modules.
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Lucas De Marchi <lucas.demarchi@intel.com>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When i get the modinfo for usbhid, there are no aliases listed:
```
localhost ~ # modinfo usbhid
name:           usbhid
filename:       (builtin)
author:         Andreas Gal
author:         Vojtech Pavlik
author:         Jiri Kosina
description:    USB HID core driver
file:           drivers/hid/usbhid/usbhid
license:        GPL
parm:           quirks:Add/modify USB HID quirks by specifying
quirks=vendorID:productID:quirks where vendorID, productID, and quirks
are all in 0x-prefixed hex (array of charp)
parm:           ignoreled:Autosuspend with active leds (uint)
parm:           kbpoll:Polling interval of keyboards (uint)
parm:           jspoll:Polling interval of joysticks (uint)
parm:           mousepoll:Polling interval of mice (uint)
```

bluetooth however has an alias listed:
```
localhost ~ # modinfo bluetooth
filename:
/lib/modules/5.10.154-20424-gea7532c123d8/kernel/net/bluetooth/bluetooth.ko.gz
author:         Marcel Holtmann <marcel@holtmann.org>
description:    Bluetooth Core ver 2.22
version:        2.22
license:        GPL
alias:          net-pf-31
vermagic:       5.10.154-20424-gea7532c123d8 SMP preempt mod_unload
name:           bluetooth
intree:         Y
retpoline:      Y
depends:        ecdh_generic
srcversion:     F8E46CD048C50B0AA1CD471
parm:           disable_esco:Disable eSCO connection creation (bool)
parm:           enable_ecred:Enable enhanced credit flow control mode (bool)
parm:           disable_ertm:Disable enhanced retransmission mode (bool)
```

I believe the reason for this is many modules use `#define
MODULE_DEVICE_TABLE(type, name)` which is a noop for buildin modules.
I have a local patch that resolves that issue here:
See: https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/3840672/1/include/linux/module.h#b246

However, I probably ought to rework that patch to create the
MODULE_ALIAS defines instead of the buildin.alias file.

On Tue, Nov 15, 2022 at 11:35 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Tue, Nov 15, 2022 at 10:05:35AM -0600, Allen Webb wrote:
> > On Mon, Nov 14, 2022 at 11:22 AM Lucas De Marchi
> > <lucas.demarchi@intel.com> wrote:
> > >
> > > On Mon, Nov 14, 2022 at 10:42:50AM -0600, Allen Webb wrote:
> > > >On Fri, Nov 11, 2022 at 12:29 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> > > >>
> > > >> On Fri, Nov 11, 2022 at 09:28:52AM -0600, Allen Webb wrote:
> > > >> > USB devices support the authorized attribute which can be used by
> > > >> > user-space to implement trust-based systems for enabling USB devices. It
> > > >> > would be helpful when building these systems to be able to know in
> > > >> > advance which kernel drivers (or modules) are reachable from a
> > > >> > particular USB device.
> > > >> >
> > > >> > This information is readily available for external modules in
> > > >> > modules.alias. However, builtin kernel modules are not covered. This
> > > >> > patch adds a sys-fs attribute to both builtin and loaded modules
> > > >> > exposing the matching rules in the modalias format for integration
> > > >> > with tools like USBGuard.
> > > >> >
> > > >> > Signed-off-by: Allen Webb <allenwebb@google.com>
> > > >>
> > > >> Thanks for the patch Allen!
> > > >>
> > > >> I'd rather have something generic though, and it would seem kmod [0] already
> > > >> does this, have you seen the kmod support for builtin.alias.bin
> > > >>
> > > >> Can't that be used?
> > > >
> > > >Probably, but I don't see the builtin.alias.bin in my build. Is it experimental?
> > >
> > > no. That is generated by depmod since v27 using modules.builtin.modinfo
> > > generated by the kernel build system. Highly recommend v30 though
> > > as there were fixes in v28 and v29 and some changes to speed up its
> > > generation/use in v30:  See entries mentioning
> > > builtin.alias and bultin.modinfo in
> > > https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/tree/NEWS
> > >
> > > libkmod/modprobe/modinfo also have the corresponding changes to lookup that
> > > index when resolving aliases.
> >
> > I see the file but it is largely missing the aliases I am interested
> > in, so it looks like I might need to modify my patch that creates
> > buildin.alias to add the missing alias defines in the header along
> > with the other module metadata for builtin modules. Does this sound
> > right to you?
>
> Can you clarify what is missing and why? And an RFC is welcomed if it
> helps demonstrates what you mean.
>
>   Luis
