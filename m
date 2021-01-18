Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7D252FA55F
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 16:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391666AbhARPsC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 10:48:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:57810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405905AbhARPfS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 10:35:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 656F7206F7;
        Mon, 18 Jan 2021 15:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610984077;
        bh=6GTqoZchCCl+pg1cvsUfjvtaJ2GscCX3936gcI2+0qE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=gEryLTwTdXXu5rnS26oASmTsdHClm8w/AgPiKIuqWiPxxTpY3ddfWozwytkZ1+wfk
         FZOU1VjgKeaqgQS5A/2kMswhTWuJOS6ZTw68jzJgPxkoY7Vsu4G0XwcKq52xHE1H8L
         M8TUv+aTrj8MWC1M9BMnulUbALGfpOMRmuKkZ2NF2MFBZMM74Gi1QSv6lLs/aq1kfv
         g7LyGS5DjfbXuaKw6MeMPETKiYdE1bsCmtJDTmud18h6RwjGqaSgHzdkepfnm6f9n4
         +GsM8fiu2l2VUNhckjND0SP8ZbfEG5Nf66bizRFE5Po5vi//g0ooWhbdgMowF6IZ2l
         cDfu43ORntkXQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     linux-usb@vger.kernel.org, peter.chen@nxp.com,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH RESEND] usb: phy: phy-mxs-usb: Use
 of_device_get_match_data()
In-Reply-To: <20210118152615.1644861-1-festevam@gmail.com>
References: <20210118152615.1644861-1-festevam@gmail.com>
Date:   Mon, 18 Jan 2021 17:34:30 +0200
Message-ID: <87o8hmuum1.fsf@kernel.org>
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

Fabio Estevam <festevam@gmail.com> writes:

> The retrieval of driver data via of_device_get_match_data() can make
> the code simpler.
>
> Use of_device_get_match_data() to simplify the code.=20
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> Acked-by: Peter Chen <peter.chen@nxp.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmAFqoYRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZw+Q//WDljAbn2YHdu0Q2SHCB7ry8J8DOFyWPO
9JiP6zUQLQj2HxwIWsnsg5snh8CJteVtrmJkqy3loKKhXa9jXHV2+0QlZ0OkRPIt
cJFyj2ypnbwLAlDo5oRVJa82pLNPX3OvSys3GDuYZCjocKEpveVkhAcGD2/9QMWw
Jd+K4fcMmeEs0NGWXptmR1eKS6I9IL4lIUuDyt232tOgDEUZh+aEVTA6rKp0ORBm
yGKF54tB64RdtsyTq9qvczRmBNojETOMN5F4cHweZXFtfwId8NSh5/8rieZEWggn
orNpnCs66qnrEyCjAbN6vMB7QAOiKSlXS4kUZpRzncVZdqotBqZwZAkSHxhmiUUB
Dc4KgMadczxHiwXpz3Yj9akxlcA2QL660FrAa9VJn3X7viZiou9nkgfDGk5kEuOs
puCRw7J5p3acXUQVIGcfqJWgm3Wbvhvq64uMZOURV88c/1meOMY6vnNy6gpXOZjv
AAdua0sV/d0i+FWTPWlig52b/+KjI+IP9vX7Fhu5dNfPXRETTo05AxCk/0z6T+1N
vlU7ciewSAJRatvGIi/PNIDmbLu+8HY+ngkwyd2E9TGE3uoBekIuTI2lWdf9Stj+
WOJ1GU7jQf4Z7zGI/OrVOjBzekNxx/1ue+T4o0F1nAlX9RoUzHdtMYS49gIXX13n
kBZoxoWOKCc=
=0NIQ
-----END PGP SIGNATURE-----
--=-=-=--
