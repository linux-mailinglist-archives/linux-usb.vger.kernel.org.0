Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5993150B938
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 15:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390301AbiDVN5Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 09:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231343AbiDVN5P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 09:57:15 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DBCA5A0B9
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 06:54:22 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bu29so14493510lfb.0
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=q2cKfjwj2G2P2IeS2jO7kS+B4DTFneKwjD4KxBf50i0=;
        b=cDgnfxYMh+Gp22HSbyMokm/yZV/nb5+LVdByRFoc3b9mf0XSqSXodUfPSk1Ic9ynrf
         NYB9HzW5ly/OOA8NA7N0WVjvNeds51dDZFpwi+y34AFmkDNNIRWU2JWRtm7gJ7i+/1jz
         P3PgCTamThzSN6is0UfPU0VuRtc0BOKizyRq8zCaE5X/8zuoKvxAGUy8S6eKsrQQOp59
         O4e1lRdlebaMaH3gBNBEKxpk5ftMYBLCRHLS489yqpc5GneolatYrc52+L7tp6qppMca
         lC2+KIPxSL9Dqm5QZ6q2MoLXY34wfQqAyIFYtv60FOeCFyI+jj9FqCv15KN5ejK5J/hQ
         ynXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=q2cKfjwj2G2P2IeS2jO7kS+B4DTFneKwjD4KxBf50i0=;
        b=DEobZzJbPkrSLg0MApZXV2pV+nn1M/h6N/czQ8PPAIWIgzBlw0yJSdNnDy3CxnEbGb
         H7YcfLJLmKeJ9nCPZcb+2a41GFXbAEfSGqS2qg61sgSdP9TPryK9YY+4ms2Bd53xWFHU
         YoMR2l4g9Tsfn8hIdk1vX7u33N6Dxg8agxMlY9TVkjT2NujORozn2JP1mRHR4DR2/EhJ
         NnK/0w/0L9IkkqLjZLS2Em77kBPT/SGOnyrfn0NYqOiTtXKLq3CzTcj/Iqmh0AQaknmV
         FetWJIlY7YtSrGZia9tyh2IxeQP+ChH85yyHIdgrG9s9FEsC9jwfhEHJLta0WqxmIxTR
         BuKg==
X-Gm-Message-State: AOAM530tx/ldrDmcgM/rp1UF7AKLQLsHmNJ4jQ6HkXCVF/PXxgSZR2d1
        6zP4rH/kgNbtfpfhaARpnY8=
X-Google-Smtp-Source: ABdhPJxb9xRkdTPGMFh0uK65oUM/uoQ6wczGXxnmKK66z5FSXv+Dtn59n/6fcBQUCkEM2IOcG22rKA==
X-Received: by 2002:ac2:435a:0:b0:46b:ae5b:83e8 with SMTP id o26-20020ac2435a000000b0046bae5b83e8mr3238606lfl.485.1650635660530;
        Fri, 22 Apr 2022 06:54:20 -0700 (PDT)
Received: from [192.168.1.168] (078088109026.wroclaw.vectranet.pl. [78.88.109.26])
        by smtp.gmail.com with ESMTPSA id m20-20020a194354000000b0046f8c68f965sm235019lfj.166.2022.04.22.06.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 06:54:19 -0700 (PDT)
Message-ID: <ef495f23d541face3d8495602c2896bf62afbf97.camel@gmail.com>
Subject: Re: Wake from Thunderbolt dock doesn't work
From:   Tomasz =?UTF-8?Q?Mo=C5=84?= <desowin@gmail.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Tomasz =?UTF-8?Q?Mo=C5=84?= <desowin@gmail.com>
Date:   Fri, 22 Apr 2022 15:54:16 +0200
In-Reply-To: <YmJLg3maiAY6cwDp@lahna>
References: <6580ca29cd8e245627c4a742189e27acf79f6b39.camel@gmail.com>
         <YmI8g2Jaye8Kk+hA@lahna>
         <CAOHtt38-+tnyrUX5u0McHyutofEwZLeLF7siZab7XgLYXVdm9Q@mail.gmail.com>
         <YmJLg3maiAY6cwDp@lahna>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2022-04-22 at 09:30 +0300, Mika Westerberg wrote:
> On Fri, Apr 22, 2022 at 08:09:23AM +0200, Tomasz Mo=C5=84 wrote:
> > On Fri, Apr 22, 2022 at 7:27 AM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > > On Thu, Apr 21, 2022 at 09:52:18PM +0200, Tomasz Mo=C5=84 wrote:
> > > > I have observed that when I suspend to RAM, I cannot wakeup the
> > > > host
> > > > (MacBook Pro 2019) with my low-speed USB keyboard (Microsoft
> > > > Comfort
> > > > Curve Keyboard 2000) connected to Thunderbolt 3 dock (CalDigit
> > > > USB-C
> > > > Pro Dock).
> > > >=20
> > > > The host runs on Intel Core i9-9980HK and lspci shows Intel
> > > > Corporation
> > > > JHL7540 Thunderbolt 3 NHI [Titan Ridge 4C 2018] and Intel
> > > > Corporation
> > > > DSL6540 Thunderbolt 3 Bridge [Alpine Ridge 4C 2015].
> > > >=20
> > > > On Windows and Mac OS the system can be successfully woken up
> > > > by
> > > > pressing key on keyboard connected via the dock.
> > >=20
> > > Is the system that has the problem an Apple system or a regular
> > > PC?
> >=20
> > It is an Apple system (MacBook Pro 2019) as noted in in first
> > paragraph. All tests were performed on the same host with the same
> > equipment.
>=20
> OK, I see. I was bit confused because you mention that it works in
> Windows. I guess you run the Windows on boot camp or so?

Yes, Windows was installed using Boot Camp Assistant.

> If that's the case then you should be getting same kind of "support"
> by passing "thunderbolt.start_icm=3D1" in the kernel command line.

Passing "thunderbolt.start_icm=3D1" in the kernel command line made
things worse. The system does not wake from suspend at all. It does not
wake from USB keyboard connected directly to the host. And it does not
wake after opening the lid nor after pressing power button (Touch ID).

The only way to get system back running seemed to be pressing and
holding power button long enough until the Apple bootloader starts.

> That should do the same than what the boot camp does and start the
> TBT firmware connection manager.

I have no idea what boot camp does on the low level, but atleast
Windows can wakeup successfully.


> Apple systems by default have the firmware connection manager
> disabled so the OS does all the tunneling and in Linux we do not
> supportThunderbolt 3 hosts fully in the software connection manager
> side (we do support devices, though).=C2=A0 Mostly it's the power
> management that is missing and I don't see it being fully supported
> in the future either because the Apple systems are not like the most
> standardized systems in the market so there are lots of "magic"
> things happening that are completely undocumented :(

Apple "magic" is just one thing, but for someone outside Intel it is
even worse, as basically the whole JHL7540 is just a black box. Or is
there a way for casual programmer to get hold on the Intel Thunderbolt
3 datasheet/specification?
