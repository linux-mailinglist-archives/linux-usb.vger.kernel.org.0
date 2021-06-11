Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C78383A42AA
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jun 2021 15:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbhFKNEn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Jun 2021 09:04:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:56158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231150AbhFKNEm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Jun 2021 09:04:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4CCA611CC;
        Fri, 11 Jun 2021 13:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623416564;
        bh=6HyrwxyzsLgnWnr/vOd8qyZqjGkzgoEyoC1EgSyB6XQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=EaEYmjEXhxfwEfoHiqc+eqIAa+W1LdRqB6JizfcCpLTYKTCdMeKtwIwiTuhN7WKBW
         v9Bj/l+GeSXUTYCdGwPzL96J4EoFovWKMG+Z/Md89/KqB4FdByKAfWQXMlaMMIv4Bj
         xg94TEoSUvDrFVxC1V4cGyHs7i/ie9u0lUfqpnl4vVRIFLJ5C4VzkbGeAr2M6hzN9q
         /GSnTiZLjxSYapp7dvrY69aWBevZsZr+LCX0GNqZ10QrIsMAyUAf3kRG1s3y9L1Ch+
         KCdgDCtW0bUZEypJdeMv2zbdNSneJQrnabHzcPnvFyCeuqyCXfZt+VFpFXSyBHJ+UP
         miljytMg89LLA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Yuan Fang <fangyuanseu@gmail.com>, linux-usb@vger.kernel.org
Cc:     Yuan Fang <yuan.fang@verisilicon.com>
Subject: Re: [PATCH] drivers/usb/dwc3: Set PHY ready after soft reset done
In-Reply-To: <20210611071805.9169-1-yuan.fang@verisilicon.com>
References: <20210611071805.9169-1-yuan.fang@verisilicon.com>
Date:   Fri, 11 Jun 2021 16:02:37 +0300
Message-ID: <87r1h8zh8y.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Yuan Fang <fangyuanseu@gmail.com> writes:

> It's more safe to set PHY ready after soft reset done
>
> Let's consider a test case like this:
> I have a usb PHY which don't need SW initial before access
> it, But i have a wrong PHY clock default setting in PHY
> register which means PHY is not ready in fact.
> in dwc3_core_init, dwc3_core_get_phy will return 0 despite
> usb get PHYs with return -ENODEV, and set phys_ready=3Dtrue

your PHY driver shouldn't return -ENODEV here. Why are you returning
=2DENODEV? The PHY isn't ready but it _does_ exist.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmDDXu0RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjxZwgAwrM0tfI3AM3NnTYKqDlnC3Whumt+pNPS
z/o4Z25fi2vq57Z0lRywOofpy5GUxbuvR6oDZVNMLCn526F/jDfVFRgimNjtzseU
hvapgdL2qpow0ZNpa3t4Z+MD2S8W8oJErF+8R1QpTnXSPgbqUMjqvEpAXu9ejk4B
VslThOBrS3W2u03rb0vkGGth45dDswC8Ro6a9lFQi5L74XgRrMh5LiW6jBhfDmAl
elnru0l0KzVsW8pFZXrhmBvallO/GgI8+2VHCpyfCDKkD4hAubXPN2dS+Y6ZRpqo
YX6ZHK3u6tk8OkgPAeBeki+f11+Wuoq0o+Tv4gGqVzKEVt42pRKeQg==
=oBnt
-----END PGP SIGNATURE-----
--=-=-=--
