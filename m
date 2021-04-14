Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4E1835F0E9
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 11:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbhDNJiC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Apr 2021 05:38:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:36696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232167AbhDNJhy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 14 Apr 2021 05:37:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73DD461222;
        Wed, 14 Apr 2021 09:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618393052;
        bh=m7UsdohOxMhdYV2aQLc7XVkhAtilyU9UIq/rXCROxhI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=In2BH8aU6YuNzrqXs1rZsZzlUGgvtAl3qUwph701avNABKLe62gsovB6+tmtTE8jD
         BgHDkQUNq6j6PjyL1SkxhZabDlSsV7PNYIkz63cR536mKCztsgopwBDt/k+cTDajun
         HDKwdS7bSAdZFzOUenBgNPIWD9K57/7VCcNDV2Q0AGWfh9bQ96VmYJ8JTVx+hG9rQq
         gcqeHXLE0rTnIzZTsFlb7o00Er5+bG/xLU0T/ad/WZUrFN17VHTP44WmMYuPJEAIBN
         WooEvAJL8OTnhKbaPuuhcdk2TCu9TFFlErPsbNeTJ7wqmoZCZdnZq+YAOlTePc36sa
         7My3SbkVFHQhQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 2/2] usb: dwc3: gadget: Check for disabled LPM quirk
In-Reply-To: <9e68527ff932b1646f92a7593d4092a903754666.1618366071.git.Thinh.Nguyen@synopsys.com>
References: <cover.1618366071.git.Thinh.Nguyen@synopsys.com>
 <9e68527ff932b1646f92a7593d4092a903754666.1618366071.git.Thinh.Nguyen@synopsys.com>
Date:   Wed, 14 Apr 2021 12:37:25 +0300
Message-ID: <87y2dlnr56.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:

> If the device doesn't support LPM, make sure to disable the LPM
> capability and don't advertise to the host that it supports it.
>
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Sorry, acked the wrong version :-)

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmB2t9URHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbkCRAA0N/dyAbb8QbCQ9mYNPRp2yLWkh8lkvhM
4xTFW86zhF3vUn7Mmk19lT/H0IW+VQqWsvjwsZuOmSErTqJEsx7XPWWDc0QVgIB+
hYt/AIKqSMPMD1xZkGcxXS7Imp/gNLVkk4Rv/cqohmpIxvjpcH+TDpeJp8jre3aZ
KYm7jLja4B2CPwp1qOtiicYj5w8mO8C6I3UEwKaRuc72Pzqtemt6a/SbFHJeeD/a
xOU2I+LdxF+KsweSEa30m74hUl+JWSpdM6J6gEHkUkTjZLsZpm2enfpvHgBq/CgO
19d9wkQtHwA33uw29ISxlsgEbuhyFltLMrFAu4A/wyq0TRRQvMKxSdbryS4QH5vA
9RIBZBhiFo5HgbcANG3MZBgW2D93ADMSNmlGiwZtxadxH0PtDW7csxrqQtYxzfBe
L1h8fbRv87ryli1E2OOqFjGXOMAdb9If4ygTcQqdzTHKEg8RP+J5hRc7IVeDdavg
aYThGMqtV/gIQtptiGvBpxKAvRigFIbCG0JG5S0mC6wUFvz9lNgyCsGpxd91a4uR
gCXkxWK/Jl/NnH8bI1XY1aBQ7h4EwlBpdUSftNh0qwt42DJdduEIyRnsIIe9FGJM
ZpWv6KQe7joV+lX/BKRlfwlW5A6Wur8E93oFQVIfP4f0Vt6izEeWeHoJ8Q8g7rpP
nLvM1zBJGto=
=PryP
-----END PGP SIGNATURE-----
--=-=-=--
