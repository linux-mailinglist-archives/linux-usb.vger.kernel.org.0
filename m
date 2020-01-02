Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3C5012E59D
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 12:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgABLXX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jan 2020 06:23:23 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45523 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbgABLXX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jan 2020 06:23:23 -0500
Received: by mail-lf1-f68.google.com with SMTP id 203so29631761lfa.12
        for <linux-usb@vger.kernel.org>; Thu, 02 Jan 2020 03:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=sg/fb/ZwRieIep0EAFtoJIs1x/LukVk3nycDSgwwjaw=;
        b=R7RVswc0BYit9ogJ6BKET31ArzmOX8b2LTxWqSabgSC6w3hyIbYfJX2fBA2Fdn3uuO
         HIdXnuQiTaJiNfRR6t7ohpa8/KiXw54pWiGFvxxg/eo9NMEYFqxZAodiGYR6xzE++CU7
         EY+yoM6m5FN8tgToDB8rg+JuHau5Xl0WRCNaGqQ3QBrTLTJVGH/x2xdOOQuqP8NRTQfX
         OnL/z8W/XnfK4A0brvSJOuduYOrzO24Lk6JAInQFg6e5DDg2vWEA4uca1biIeUOUMTZ7
         QwbkrzcQ+kM6KA5bh14Yrmossdi9izZbEMlLobXFnRuvo4rb2oS2R7rdavdih6irc6XB
         f0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=sg/fb/ZwRieIep0EAFtoJIs1x/LukVk3nycDSgwwjaw=;
        b=C9fKD5ugIb5ts/MevqVvTu75CQ7oyNNDLX1u2S/S5QpUUacvESDz2aNxkbvTApN8k8
         TYO41ltcOXyFUxNEoPPdyREYNFvAVEuuMY+bcJ8bPq+dR1Xb/oLmejH7EppQwgE127+z
         wKyFKY23ok8en1sLXCEBqCld9raatYcrjzk/iGgBTVDpN0brc536EhrnR9I3d0aEuPsH
         AKWdUWxKawmDcPF4D10vw6Vck8wTPCL23QonBNZVfNfNtFEZsrePsooBUZQKlpjh9X5K
         m1eJ6e/FBBchGnQ0g5vpNFoBZQS0Nip/7lBBrkA7SH4w0NWhIYDs6cvob68t7BBydNMF
         FP4g==
X-Gm-Message-State: APjAAAUpPVAOkY0NzjYbdxDUH9eYNEPPfTZ2AqbqPrMxCFuFsByCBnMW
        RxdOjqwz+h4bZnUKr7FMvqoiNN2tTFEfKQ==
X-Google-Smtp-Source: APXvYqzj1bc3gaDxGdbovTnRRmE/fDCq5Zi5KAhw+7uOos7g1/Vrtjm6O0TaTk/SGGGBsdrIIrTt5w==
X-Received: by 2002:ac2:54b4:: with SMTP id w20mr48160047lfk.67.1577964201439;
        Thu, 02 Jan 2020 03:23:21 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id z7sm27273908lfa.81.2020.01.02.03.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 03:23:20 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH] usb: phy: phy-gpio-vbus-usb: Convert to GPIO descriptors
In-Reply-To: <20191231174848.741314-1-linus.walleij@linaro.org>
References: <20191231174848.741314-1-linus.walleij@linaro.org>
Date:   Thu, 02 Jan 2020 13:24:04 +0200
Message-ID: <87blrmksob.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Linus Walleij <linus.walleij@linaro.org> writes:

> Instead of using the legacy GPIO API and keeping track on
> polarity inversion semantics in the driver, switch to use
> GPIO descriptors for this driver and change all consumers
> in the process.
>
> This makes it possible to retire platform data completely:
> the only remaining platform data member was "wakeup" which
> was intended to make the vbus interrupt wakeup capable,
> but was not set by any users and thus remained unused. VBUS
> was not waking any devices up. Leave a comment about it so
> later developers using the platform can consider setting it
> to always enabled so plugging in USB wakes up the platform.
>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> This change hits arch/arm/mach-pxa/* and
> arch/arm/mach-s3c64* so I have CC to the most active
> maintainers.
> ---
>  arch/arm/mach-pxa/colibri-pxa320.c  | 16 ++---
>  arch/arm/mach-pxa/eseries.c         | 40 +++++++-----
>  arch/arm/mach-pxa/gumstix.c         | 18 +++---
>  arch/arm/mach-pxa/hx4700.c          | 22 ++++---
>  arch/arm/mach-pxa/magician.c        | 22 ++++---
>  arch/arm/mach-pxa/mioa701.c         | 15 +++--
>  arch/arm/mach-pxa/palm27x.c         | 34 +++++------
>  arch/arm/mach-pxa/palmt5.c          |  1 -
>  arch/arm/mach-pxa/palmtc.c          | 18 +++---
>  arch/arm/mach-pxa/palmte2.c         | 18 +++---
>  arch/arm/mach-pxa/palmtx.c          |  1 -
>  arch/arm/mach-pxa/palmz72.c         |  1 -
>  arch/arm/mach-pxa/tosa.c            | 18 +++---
>  arch/arm/mach-pxa/vpac270.c         | 15 ++---
>  arch/arm/mach-s3c64xx/mach-smartq.c | 13 ++--
>  drivers/usb/phy/phy-gpio-vbus-usb.c | 95 +++++++++++++----------------

Acked-by: Felipe Balbi <balbi@kernel.org>


=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4N0tQACgkQzL64meEa
mQahsBAAsBaN5lPznpvYJwgdtJUR4pPGMxYhA+vINMKJFPmJ6raoZ1qhmtuIxWiZ
cSNZ8eil1MuhCwCEnLf/sCGeJ3Yph3UDuGDfmfEH5Ks5rNOiorKzF0ETyNo5/70O
jSNlrXG66JZ5qE8BPV2OZs99Lo68B+UvBYAfo4CWJzR/kEjaK3qVYrZ3uQBsgUMv
ZFYa5H8s00MJUaU9jCILmdiFX7zxNuiNPk0gOUnFdBVyEyVib6/OPK2Hfep/NgHW
ARpNiV93bxBuklQCMPiyLYOCGCBYVjppVWJ5uB5fd/49X38FVfydGlgzx3TxXhml
i+TZWIWzGYhboI+pSp6qaqtDDPV2bMgXNXO3cG9wxO6Gi9mGLzbgnU1pouxWMAlj
ek5K5EgAIL55l99NR4nLw9VnSnbln4XlxVHm41X3MPwvz9nEy+JWreOh2bTlaEB2
9/DRRp9V9w4Bc+KNaEtQgxJGoYzNi2tNUg5UNE0GR9T/sx4tEhNR4/RCNbQ6oL5y
uzIz0NUQuEVWBTgwTYEBgWeg5z6ghg5Re9HFFIjfpJGtPBhdYQUZoVyF5t/2sQGq
l5kKg/28xa4ejCwOPh+bhfdoCjp3aNFB4sXIveyNKNk5bvRNpUYdl6l4ShZvHSuH
N2B+rKNsDvOZ/Ll2gWzeAsCk3PgPM8bqkHxWPfS6gpff6S0XNDM=
=LUkc
-----END PGP SIGNATURE-----
--=-=-=--
