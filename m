Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB7DA36F70E
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 10:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbhD3IZT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 04:25:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:34202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhD3IZS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Apr 2021 04:25:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7ED8C60FD9;
        Fri, 30 Apr 2021 08:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619771071;
        bh=HJ1Of4qnD6Z5sVC3H58HwMM2soCmh4GEDRMgeiFB+eQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=WOuUDSTOlQ3CSPAW2F2ScltoZ1DFM9fGF8sVg+JMae2LUW4301BvBVVo+sbFTmry2
         rgYkaRaHhmEwk6gUpmDdySFNcAEZxOpldw8L1xcrWd0TmZ459io72RY9C3bBo701VW
         ZBp8pnWxMW06nrTK91YAQHu6iViZOnE1Yc+w4McnRK8LTCGsHguOWDgl3k2tClJjSq
         LG6wA8tM5G1WYgXNIZP3hSGNQHGbhbsBZ7tae3gpn6loVTqPmSZcgWzgZ7XhKF+MwS
         XoC8IEMq9YVql+iYoaIrpeWl+5LPup1yFUH8DG/Q8m5UKboE5NL7QvBTYg+r+UQiXb
         x0IRNDftL7+yQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Li Jun <jun.li@nxp.com>, gregkh@linuxfoundation.org
Cc:     shawnguo@kernel.org, linux-imx@nxp.com, thunder.leizhen@huawei.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible
 string
In-Reply-To: <1619765836-20387-1-git-send-email-jun.li@nxp.com>
References: <1619765836-20387-1-git-send-email-jun.li@nxp.com>
Date:   Fri, 30 Apr 2021 11:24:18 +0300
Message-ID: <8735v8ji31.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Li Jun <jun.li@nxp.com> writes:

> New schema of usb controller DT-node should be named with prefix
> "^usb(@.*)?", dt changed the node name, but missed counter part
> change in driver, fix it by switching to use compatible string as
> the dwc3 core compatible string keeps "snps,dwc3" in all dt.
>
> Fixes: d1689cd3c0f4 ("arm64: dts: imx8mp: Use the correct name for child =
node "snps, dwc3"")
> Signed-off-by: Li Jun <jun.li@nxp.com>


Nice fix :-) It may break down if we have two dwc3 nodes as child of a
single parent, but I guess that's very unlikely anyway.

Acked-by: Felipe Balbi <balbi@kernel.org>

That being said, why do need to keep a pointer to the child? I had a
quick look at the driver and it doesn't seem like the pointer is
necessary at all.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCLvrIRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUimvwf8C2TV8VMD7mSy7hRqWnAJHxC9Ia0+jmT6
haomy57r9IcUPPYZVJPOiHi3wOlTwFHnVPpeMRpTTytRGYL2dyliaZ7fgMQFABmq
7DYxzZhFYZlr6tkTrgVgqJqicDFYLCeJr9877sNu5xZyYSeficvZyvBlJ3an0caN
mEK8pk1upP5USFETXJYfrrwAH7ULQIeJovMzzptxQdJlWcxrlit0CtgJ0UHi5dEA
WYZTl102kwVAktTh8M3vfbf68b7DnkV0FN6jnOMDQRjKMa3ZFb+zHDw/a4fA6nG6
aNZ0VQ641w4UlPu2pqRdYne7HW1TxbW0xaqUREp8AfTDwWY+YqK0hg==
=dSPQ
-----END PGP SIGNATURE-----
--=-=-=--
