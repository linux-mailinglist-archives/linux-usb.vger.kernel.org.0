Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12AAA367F0E
	for <lists+linux-usb@lfdr.de>; Thu, 22 Apr 2021 12:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235782AbhDVKwW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Apr 2021 06:52:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:57442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230285AbhDVKwU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Apr 2021 06:52:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1902613D8;
        Thu, 22 Apr 2021 10:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619088706;
        bh=m1hBAx/Zlgxkr9DDWUpgq6YocNmqukPDgKVqWEYZqrY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=T5IocDjX6Tog0NZ4z10KX/hL78ZGtsWlaYM2gdDrjEdzcjRf0THchOkRsrJUfL1oQ
         w0K7wxsfBoQ7SARqz7M/yhjfyzRFkNZJrNowiic4XOEWINuo82LYtsQfcapOQ8WA7l
         oysZOCG6Zu8XqwfyXwERYbL2RqvXm9syE79MT9/vDEVyxJOpjkm/WcUIvqJ5n4RNsW
         INW3HoPcnTdoRqWcmU3k1NflB4rTV1ErvNp14mJgrBA2rGwcskuonakXM1xiAp4dIn
         MsIWzDcQstgVovYvKddiDbYkscncd7bmOe4pV2VAvGP9q/dgViK++nyZKb7Qev7bS6
         xSzyWIvvPJsBg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, kernel@pengutronix.de
Subject: Re: [PATCH 1/2] dwc3: gadget: fix setting of pending_sgs
In-Reply-To: <20210421204837.4185-2-m.grzeschik@pengutronix.de>
References: <20210421204837.4185-1-m.grzeschik@pengutronix.de>
 <20210421204837.4185-2-m.grzeschik@pengutronix.de>
Date:   Thu, 22 Apr 2021 13:51:38 +0300
Message-ID: <87r1j2mw1x.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

(subject format, please prepend 'usb:')

Michael Grzeschik <m.grzeschik@pengutronix.de> writes:

> In the dwc3_prepare_trbs_sg routine, when all data from request was
> handled pending_sgs should be set to the number of mapped sgs that are
        ^^
        ,

> not queued up.
>
> Currently the code will result in pending_sgs =3D=3D queued_sgs. That
> variables value will likely not be zero and break dwc3_prepare_trbs.
  ^^^^^^^^^
  variable's

you say it's 'likely'. Got any minimal reproduction method?

> This patch fixes the setting of the variable to its intended purpose.
>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

please add Fixes tag and Cc stable

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCBVTsRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQazmRAAqTXd8s/H5Hoqk67rNLabwisBUI0b90Ez
LaMzeX6RFnX4U+Es/M+Cxs3CtW2yc2/97W2hLdllW0SQ/f+weQqwKdyjYY8hTZiH
sz0oOY4l8/aedaf7NmtKfvsGZdLdXgHT4DaQhfy3CHnea06WYQmoOgemSd8gujdN
2JOVNMO/XfoaS9Gx7fAcbUQnUhKaBrN299v9XK1LjyRaUhDhS4AhoqYSwnQ52aB2
CNc8F8fZYwfpNI+PVyp7BcaQ5QhpXKpY6rKQYBsDeEP6yVlSgNjXqaRzGmsy1M5R
oBl2Mrzxkhj0sUQQaZ6gYxiS8nlPq3KA6loeBMWhIp7VN/Qp7IV3vVIn1dprLih9
YhFr+VvRDFXfiQIKL1Tgw5E7vGdKtgcwy9jHprNSFASFn3P6D2DDo1vU+lgOfrnu
DvyNipuI7MeShoZQ5XxLVCEA5jhS78uiNfUs2mYDgAqPPl05iZmdXHsE12ILdmEq
LuGa6Nl3QUD48IQFYdBNZ073rZKOXxyi2o2fScR/y5knQ7h/nA7/ZxdS/I1eJ1jx
/rQoMVkqOLGTe5G3nJuodnYZfda8E0hPgUCzh7kvUihmR28yRGYAbZu935ViRA41
ZWXJ7wngn18SXyObZ6aFjS88af5Hnn2hkULqckbm2PUWhtNBT1gwRoHSwI1JatDO
AVvJZmTN+sY=
=KnFa
-----END PGP SIGNATURE-----
--=-=-=--
