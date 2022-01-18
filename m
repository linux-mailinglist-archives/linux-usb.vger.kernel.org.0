Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85976492E46
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jan 2022 20:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348124AbiARTQh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jan 2022 14:16:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244903AbiARTQg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jan 2022 14:16:36 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C834AC061574
        for <linux-usb@vger.kernel.org>; Tue, 18 Jan 2022 11:16:36 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id w12-20020a17090a528c00b001b276aa3aabso3653580pjh.0
        for <linux-usb@vger.kernel.org>; Tue, 18 Jan 2022 11:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ljg+brCnr93TiE/08DAQoohwnab8UHFmg+YktD2G/oY=;
        b=QT16LG/l4yTFZi53kouVqyMLp3XOeteVyql7jmQCZEGEIQZSxGWkwzIgIYdQHxLucw
         9h3Sa0X2C6afgM8vpoopj45xWUaCda4phCy6SPC0bBe7LTygD7yh7NofRlpX3K96AOk7
         7mi2tHOtw572zNnjbNaihrYKS11bJcYGN8y0kPcfYlu4j7uKB9+znhxWM0vRYFgIEPCQ
         PfzJStyMvNcyAYkh47ee8HKGa794yDYopQgu57dJmH2VOu/LzUN2TuuoqtzalalgTppw
         cW4mpD0DqOjQ5DTHqqdzH9YaKemSKR4SDeLeu0MOBjnI+OVeYwv75k1IfIA8PZ/A+7jI
         AYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ljg+brCnr93TiE/08DAQoohwnab8UHFmg+YktD2G/oY=;
        b=PrtkeOHvgVGUcB8iP8UDEImbHAKNfW2ihrbyNDR55jX2mzL5xN3GgiEq47tLsqyNNX
         DQ0Om92pcrLnh2LltbxJrd3j5Bj2n3C/eCaUzg26nOEetOT7GMwTAv5iqwKnsEn6LLog
         nB6COrxdUea+Hs7dW191IzxxIZcYi8kuxtumkJF7RWt9bDadFhyD60HVAo1z9g5lNldW
         Ujce8UljTJs0MnPtuoNEqZEQKx5WTCMdCfCjYriMCuLZr1ObwCgIb2hrBVF+X0QDiJYE
         EG5+kehMcLvCz1Q9bCO09m0/aji5CFumM2XSY5dRH9bih7Leye5WUiCCDQtLj83wRqh2
         EXwg==
X-Gm-Message-State: AOAM530lfYgld20PJkjEBmMD8NHzEwHEKN/O9xDmnLtRm/Pd2qkJEka3
        EbH2j3nwYhpk3ljn6qn+O3Egng==
X-Google-Smtp-Source: ABdhPJwxfwt0LZeAjqJ0KoE/aTeaCJvFV/s5SZ72K7MtUKrHab/zVboYJp+aHpjzayDTeMXMKcQb+w==
X-Received: by 2002:a17:902:ac98:b0:14a:dffc:ba69 with SMTP id h24-20020a170902ac9800b0014adffcba69mr3250044plr.2.1642533395652;
        Tue, 18 Jan 2022 11:16:35 -0800 (PST)
Received: from google.com ([2620:15c:202:201:d4a9:6caf:1ad8:3664])
        by smtp.gmail.com with ESMTPSA id e6sm9611273pfv.170.2022.01.18.11.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 11:16:34 -0800 (PST)
Date:   Tue, 18 Jan 2022 11:16:28 -0800
From:   Benson Leung <bleung@google.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Rajaram Regupathy <rajaram.regupathy@gmail.com>,
        linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>, jthies@google.com,
        saranya.gopal@intel.com
Subject: Re: [ANNOUNCE] libtypec_0.1/lstypec_0.1 is released
Message-ID: <YecSDHXscl4LX5g9@google.com>
References: <CAD039W71Hf06Bw4H_qjm7bRg__BjHfG=p-E7HXL62g0Yc7txBA@mail.gmail.com>
 <YeUYQB4neDz8Z0Tb@kroah.com>
 <CAD039W5ZmTcYErXsnSpdksc6k2L3fNwry1uP2Kr96Uo04fO9PQ@mail.gmail.com>
 <YeWNYUkOYBWXjBFw@kroah.com>
 <CAD039W41ds-1xi0owBTRPCweB-tt=7gL7uH4FmUSOyEdgrq77g@mail.gmail.com>
 <YecIA5hEYqrZo+6G@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LqQgaoJVDHcmxSw3"
Content-Disposition: inline
In-Reply-To: <YecIA5hEYqrZo+6G@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--LqQgaoJVDHcmxSw3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Tue, Jan 18, 2022 at 07:33:39PM +0100, Greg KH wrote:
> On Tue, Jan 18, 2022 at 10:01:02PM +0530, Rajaram Regupathy wrote:
> > > Again, why does this have to be a library?
> > >
> > The aim of having a library is to abstract application(s) from OS,
> > platform, PD Controller or Embedded Controller protocols ambiguities
> > and provide common methods. The methods will be similar/closer to UCSI
> > standard.
>=20
> What methods are needed by an operating system that your library is
> going to provide?  How will it be done in a unified way that the current
> user/kernel api isn't providing already today?
>=20

A unified libtypec would be useful because the USB Type-C and USB PD
specifications are evolving, and continue to change. Spec changes affect the
decoding of the objects that are exposed by the connector class (the existi=
ng
API), and we are at a point where if we left it as-is, you'd have multiple
userspace implementations that would have to independently be updated and
fixed every time there's a new USB PD spec revision or version update.

Just as a concrete example, Jameson (jthies@google.com), who works on my te=
am,
recently put together a little helper utility to decode the typec connector
class in order to print it to our feedback report collector. This was all
done before libtypec:

https://chromium.googlesource.com/chromiumos/platform2/+/749621a6288cc5e80b=
31a9e6050437a419209fb9/debugd/src/helpers/typec_connector_class_helper.cc

A problem we ran into almost immediately was that the utility was based on
the most recent USB PD specification documents (USB PD R2.0 and USB PD R3.1=
),
and had definitions on how to decode PD 2.0 and PD 3.1 objects that it would
read from the typec connector class, however, it was missing definitions for
USB PD R3.0 (a spec revision which is not obvious how to find in USB-IF's
document archive).

So, we added it: https://chromium.googlesource.com/chromiumos/platform2/+/e=
b1efefc187feab1182a7680f42fcec6bb14c618

Now, every other hypothetical type-c connector class user application or da=
emon
could potentially make this mistake, and would have to duplicate the work
to fix it.

If we had libtypec, it would be the unified place to make such a change, and
we'd reduce the burden of new typec apps from having to do all this decode
in the future.

Thanks,
Benson



> thanks,
>=20
> greg k-h

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--LqQgaoJVDHcmxSw3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYecSCQAKCRBzbaomhzOw
wtCcAQDSte4dZXZeyNaC0VjtIb2/Db0e0aBG5ZPwUg6OO1FncwD/ZTJggLC4JHIn
1g4m1wktgG6CXVHWDpuu0nT4+xJwzgI=
=C1jf
-----END PGP SIGNATURE-----

--LqQgaoJVDHcmxSw3--
