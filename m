Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEF1550C175
	for <lists+linux-usb@lfdr.de>; Sat, 23 Apr 2022 00:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbiDVV4b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 17:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbiDVV4T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 17:56:19 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B01022A6FE9
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 13:38:51 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id t25so16253837lfg.7
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 13:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=ctXSJzHGq6XfP+13TGvR1c4w3+DN+wSyA82XeXS6yo0=;
        b=Mj6m5Xx3FXRsi4Ta9omOZq8+V1syOS1TShMO80PIk0DHh092Dpnfc29TMPgF2sWV2D
         +ThiUh/T+bDbwxbVfjO7Bcv41pDhqCV7JvYgTKYl8PTKDyZh1nKd/usBMwD7wOZ76zn1
         A5ZxhVaJsI9I6O9byepM2gfHFnr0gCN6l572lLCHxLH8WD4zjb6gssEg0Ts+K5QgCtEQ
         4ROf6/FB0fLjdscDbg32m0MkEbZXWXecCORDZPtWo12Ysiy4ZloR9yCb5X5ZyNbt+Mpg
         mJH1RlBjzxV+tKQO4tcpi1V2qhuJOiWgdM2hv0gSWw20jPm9tFmfcyKpvfnu4M7X0wCR
         aoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=ctXSJzHGq6XfP+13TGvR1c4w3+DN+wSyA82XeXS6yo0=;
        b=nUddOPacSX/V+kW0F+3+G76HiYN3ey5ovm7musP1zenSNXZSB4ahIErnCxVA3Cn8kI
         xCqKrFQit0AFTAxFCI30sOiMekD7LwjQxpAHh8iDVGshpIGfO145cwi0bmh8eY5vkdSP
         4CdXkVvRAWPSjzMkD1wZ+8HtQryX/i58itYjjRDls+Znowx0VbfbpBtPMKZjHvPHavAw
         sX++WxZV9kVmpiaBjmNH3dUeUG4XzB51vrRwhKnvARGvexRcE+SWMnHTCy8Aba6Eq7Cr
         nO6Gir3JLoBUD3ueXDiRT+Hd8RSrPQV+RA8hgMLTQzCRRQgKScdg1JnKpRagKHVDX4Di
         1T8A==
X-Gm-Message-State: AOAM533wCYf4B3cB4kP5aB65Xub5bK5CAGDBfGkySNynxMSkeWcyOuZD
        Mp9nFZefmz+T+xCZQ6NFUe0=
X-Google-Smtp-Source: ABdhPJycAe561LHmIdHAc3u/5vRHlCbM6hQAPFrPJMFQiLQNXeSARWVjMIP098aIJtM2sJyvU1bTmQ==
X-Received: by 2002:a05:6512:2627:b0:44a:f55c:ded9 with SMTP id bt39-20020a056512262700b0044af55cded9mr4350070lfb.373.1650659912673;
        Fri, 22 Apr 2022 13:38:32 -0700 (PDT)
Received: from [192.168.1.168] (078088109026.wroclaw.vectranet.pl. [78.88.109.26])
        by smtp.gmail.com with ESMTPSA id b38-20020a05651c0b2600b0024dd3537eadsm323999ljr.41.2022.04.22.13.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 13:38:32 -0700 (PDT)
Message-ID: <76629b1698c129864b9853348f69520f19bd6b4c.camel@gmail.com>
Subject: Re: Wake from Thunderbolt dock doesn't work
From:   Tomasz =?UTF-8?Q?Mo=C5=84?= <desowin@gmail.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>
Date:   Fri, 22 Apr 2022 22:38:29 +0200
In-Reply-To: <YmLEPWxolnOyCgnP@lahna>
References: <6580ca29cd8e245627c4a742189e27acf79f6b39.camel@gmail.com>
         <YmI8g2Jaye8Kk+hA@lahna>
         <CAOHtt38-+tnyrUX5u0McHyutofEwZLeLF7siZab7XgLYXVdm9Q@mail.gmail.com>
         <YmJLg3maiAY6cwDp@lahna>
         <ef495f23d541face3d8495602c2896bf62afbf97.camel@gmail.com>
         <YmLEPWxolnOyCgnP@lahna>
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

On Fri, 2022-04-22 at 18:05 +0300, Mika Westerberg wrote:
> On Fri, Apr 22, 2022 at 03:54:16PM +0200, Tomasz Mo=C5=84 wrote:
> > On Fri, 2022-04-22 at 09:30 +0300, Mika Westerberg wrote:
> > > If that's the case then you should be getting same kind of "support"
> > > by passing "thunderbolt.start_icm=3D1" in the kernel command line.
> >=20
> > Passing "thunderbolt.start_icm=3D1" in the kernel command line made
> > things worse. The system does not wake from suspend at all. It does not
> > wake from USB keyboard connected directly to the host. And it does not
> > wake after opening the lid nor after pressing power button (Touch ID).
> >=20
> > The only way to get system back running seemed to be pressing and
> > holding power button long enough until the Apple bootloader starts.
>=20
> OK. The start_icm=3D1 starts the connection manager firmware which is one
> thing that Windows relies too. However, all the PM stuff is still not
> there unfortunately.

Is the connection manager firmware interface (from Linux perspective)
implementation specific or is it standarized?

> > > That should do the same than what the boot camp does and start the TB=
T firmware connection manager.
> >=20
> > I have no idea what boot camp does on the low level, but atleast
> > Windows can wakeup successfully.
>=20
> please try the same in Linux if that's possible. Running Linux natively
> will likely have issues because all the non-standard stuff in those
> systems.

What do you mean by trying the same in Linux? I would like to, but I
simply don't know how.

Using "thunderbolt.start_icm=3D1" results in Linux being unable to wakeup
at all.
