Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4212F4CC0
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jan 2021 15:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbhAMOKO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 09:10:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:43140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725801AbhAMOKO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 Jan 2021 09:10:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3597C23382;
        Wed, 13 Jan 2021 14:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610546973;
        bh=MFOlVdNl829n7XohVBvFrri2Qe87LO98BxJzsNTQAfA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=CNEqGyLt7JyTIBenXfVyIkwx5XjtulViZy0RuF88FE76/nR89qiTZBjgwFjTSWhuM
         i901T0BuuIQY6hnatK1NcUOaKr4Cqp2K2I5pXBEeDpV8WapFFNqBnMgU6s9C8cAJze
         CsUAQBRpvKFPvN08UnwHTTNGC50njnzBLQO6qwTmaP1Ux61pyt+eVC3/lbL1IWFSfa
         UlvZXlBM4P4EyR/n4FPc2wckon0gedFr/cyw41oLTeBTTbvcDsVg6NSBTYkh2hjmTz
         0IvYoDTkOx3dM3KeifxHJZMI5LOeHpkbAvv/NKGdqHUmn7Az5douLfFNQopcD29wOg
         oz4uy4O2hK7zA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Lorenzo Colitti <lorenzo@google.com>, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org
Cc:     zenczykowski@gmail.com, Lorenzo Colitti <lorenzo@google.com>
Subject: Re: [PATCH] usb: gadget: u_ether: support configuring interface names.
In-Reply-To: <20210113140331.73500-1-lorenzo@google.com>
References: <20210113140331.73500-1-lorenzo@google.com>
Date:   Wed, 13 Jan 2021 16:09:26 +0200
Message-ID: <87r1mp2ajt.fsf@kernel.org>
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

Lorenzo Colitti <lorenzo@google.com> writes:
> diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/f=
unction/u_ether.c
> index c019f2b0c0af..6527d169ae7c 100644
> --- a/drivers/usb/gadget/function/u_ether.c
> +++ b/drivers/usb/gadget/function/u_ether.c
> @@ -78,8 +78,9 @@ struct eth_dev {
>  	unsigned long		todo;
>  #define	WORK_RX_MEMORY		0
>=20=20
> -	bool			zlp;
> -	bool			no_skb_reserve;
> +	bool			zlp:1,
> +				no_skb_reserve:1,
> +				ifname_set:1;

let's keep one declaration per line, as it was before. Other than that,
patch looks good.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl/+/xYRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZqGw/5AUqhT8lpbvTOMKgGOPiiXB/ECHqDSbQz
EepxDvCQZo2N3jfZXAyj4i+pw9o6oaXjePQDSSGykYo5eb1witgCauQuI8qYJONJ
mOptgIOZD0kAr5sd3b6mZb4KtZdPhPfzQgb7W0olFsUa0gctlFpjcnXyO6LSHOi1
pJjQHO4G3x4kI8IwwmSKFvQfI3qUowvvNDleXSLx+8MzXz5DQqzSWHgwPICxp50R
k0O+2dR7QWSyvJald2agPRguUYkTxoV1cEZnamhHL+SxZt0dDTs4t3rRcjupVg2H
2r0hK/u1PNVE4hQ/tIbqNVeUYQ0N+bj3Tuse6T3MJiKgk//ClyIQG4caVUUyASWH
vBEWMvxUvybwgi371RLL9aellGdlZlhx06Fdzyw1LLeyq273awCoufIkZTwolir3
cfCJ01O7lt1zz8L+1p6MEFbtMtyCZbG+ZNyvvdHTVv9GUe70hv9w5A8WDnVg9RAq
N0/VvFFE+P3TXA0h4Xm1TeyvKoYFXFuuHd8p7KpZYl/l8C67pYNlV5Iym7jnXgv1
kJXHY8ysZcAOdRHrcNoE6qdssdGL+lhiisKHngtoUhrH1L7Y/oE04W6tIwCGyJhr
Z6OURTN/HN+Pq2ikaiA8iso/C7zZ4TiZAmCgq2nWMEjgdsUmthUp9czDnFcnS67+
k9SZFW6d5j0=
=UnwO
-----END PGP SIGNATURE-----
--=-=-=--
