Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16D521BE471
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 18:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgD2Q5o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 12:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726423AbgD2Q5o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 12:57:44 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B51EC03C1AE
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2020 09:57:44 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id a21so3367888ljb.9
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2020 09:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Xi4iDibWDbLhPvWQ9akE+87w7/35NrQsYNKu5z1n3v0=;
        b=WTkKtZMN0zzT2OT7skJQAhh47if/tpHMnWmiecG0eFF984gxLcYjrANu3g0XLDhmBS
         00qt48l0xD0Cmlopc/zPnFpBi2wD85HBN4hb54a6u94E87AtdsH9+UZvoVCCveTIa8ei
         48rr7CBb49PWbwXEKWwe3vLAvSl5wchLMMGVq/E+AVo4A7A4V3FzvQ+E88B5maXpnf/8
         FRzkLr+J/nTvySgsmUIVNdfKhNtd19AvSESYXpudiUmKM/Vf1aoG3+XbVkzBWYx8/uVH
         qk3K+IcDr1t+S/yBgcAxdxrokdu4atNmyDj0TbOyAJha2obAcekSZDqqL46aIw+PeB5f
         U73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=Xi4iDibWDbLhPvWQ9akE+87w7/35NrQsYNKu5z1n3v0=;
        b=HCULjD9XFPUFi9rkR8OHncoBi2ZVMZl1K2x9dYdQmw25xenFQDPQL0y8UwlNOxMW9/
         loc4KUdUz6czEy07Vne3Md9WFW85Dp1XUpdzS+FgfV6BnV1aK+aI2AXjUszohxsSutGt
         dVazRmQGfYPami8F2uITqMUZhwmdj6W2Gd6u2TlX+WrHASKRDuGrdB5GIG0pirnvA0wn
         4HZSLvm+MAHTn08HB35SNJwqPWn08bk24fAxNBSUskL3p20oZvwd35gq/IIqAktwLm6h
         Vj2CHs9u90Ifr7DrR9M9IrzBONtjYUQvI7I2slY791vk/gUf6OnVnOmpmfJfPuZBKt38
         4i6Q==
X-Gm-Message-State: AGi0PuZ1/Seiz624ss+oAqp7gnHXJYsbV26edXY5g047h0QuAKtlX5aA
        jOme2WxhoXP20uSHaM+3zOOk5GzMu3w=
X-Google-Smtp-Source: APiQypIURcx+7WK9w1vwe0AqEK6ikhPPPfNB6Ru9TW0otMm5ZexQ2tWGRbQvy4VeleyoD3L6MXPWZw==
X-Received: by 2002:a05:651c:291:: with SMTP id b17mr21923913ljo.166.1588179462493;
        Wed, 29 Apr 2020 09:57:42 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id d5sm1186257lfn.56.2020.04.29.09.57.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Apr 2020 09:57:41 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: Recommended USB3/SuperSpeed gadget device
In-Reply-To: <CAAeHK+yRMBFX4zgYLSLECdnM54GoEYcbocTDw=GrGrAD+cJ1bA@mail.gmail.com>
References: <CAAeHK+zBLWKn-YQjoD6S5uwwhuB-kTmdnBD28E06ujrx8ymv7A@mail.gmail.com> <87ees62114.fsf@kernel.org> <CAAeHK+yRMBFX4zgYLSLECdnM54GoEYcbocTDw=GrGrAD+cJ1bA@mail.gmail.com>
Date:   Wed, 29 Apr 2020 19:57:37 +0300
Message-ID: <877dxy1b7i.fsf@kernel.org>
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

Andrey Konovalov <andreyknvl@google.com> writes:
>> If you're not willing to do that, I anything using dwc3 (dragonboard,
>> beaglebone AI, and many many others) would be good here.
>
> All DragonBoards that I found have USB 2.0 device ports AFAIU, but

Oh, they put a USB2.0 only connector. That sucks, as it actually has
dwc3 inside.

> BeagleBone AI looks like what I need. Thanks!

beware that beaglebone AI runs quite hot. Get yourself some beefy
heatsink and a fan. Also, make sure to get the non-standard serial cable.

> While looking for a board with USB 3.0 device support, I've also found
> the UP board [1]. I'm not sure which driver it uses though.
>
> [1] https://up-board.org/up/specifications/

It uses dwc3. It's Intel CherryTrail inside. Heikki and Andy (Cc) should
have information about those, hopefully.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6psgEACgkQzL64meEa
mQYDnQ//eXK6S6JANxJdGcOCYTknWoryILBCO2YkmVaqy/BGrUf8wJc5T1JN/hnv
fDSY3fjvRv9dg5MagdxvJ5FQdBeN3+HyGqmgEy664Srb2ypuPbkGMmtMK1En4Mra
MOXSlwhPaRdx48lh98ebXmDRlPvGRxS2foFBXFBm2rgLaILaLUZ5wyZedSJJERBt
84kmx/2MKp40jWcsoQ+PcztaEqJ15Y+B3V+Lmh5k8J2OXSnFzduV0iGaEY45Ss2l
9ccUkg1j/0x5u1gAVjYg0btiBwMoXvMuTPE76QGKFKr3XH4SK4dkDFRNbj+c5aWs
9yEvNfp8R/Bb2DyiCsKaUT6EVjyVe6+NN7NpWWJVwGrRzjnyvfVScM1k4hEhQYa3
NwEpLatxnbfHBN+Pm9xll6YYsMSw59r/5WE4Dr+/be3q+64Dd8s5o7mvxjxuoriP
DwRlT3Chxq4ArDkniVuZniMD90FyMYBLm70if0jmbcmdI2XlOh/l/CKgnCVxJeBM
b5lfjDD3WAE5mEG42UlsMfCzRmgFmHfkUx9/vBlSBtA7TiHMjTv9WOPH3XQ5PZj4
AMinlbbIYJE6KYuXYU7MaQoX5zA7W/psbABisxKLdvavlf40Q7tHKhvDhGL8bi20
Ph562oRcfERiZxhWk1etuf2efI/Kv8eKpPDn+e9LB0D19vy7QcE=
=02a7
-----END PGP SIGNATURE-----
--=-=-=--
