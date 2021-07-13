Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1A83C68F8
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 05:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhGMEB3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 00:01:29 -0400
Received: from smtp.bonedaddy.net ([45.33.94.42]:53794 "EHLO
        smtp.bonedaddy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbhGMEB2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jul 2021 00:01:28 -0400
X-Greylist: delayed 573 seconds by postgrey-1.27 at vger.kernel.org; Tue, 13 Jul 2021 00:01:28 EDT
Received: from [192.168.1.209] (n49-190-172-168.per1.wa.optusnet.com.au [49.190.172.168])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pabs3@bonedaddy.net)
        by smtp.bonedaddy.net (Postfix) with ESMTPSA id 18A12180043;
        Mon, 12 Jul 2021 23:49:02 -0400 (EDT)
Authentication-Results: smtp.bonedaddy.net; dmarc=fail (p=none dis=none) header.from=bonedaddy.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonedaddy.net;
        s=mail; t=1626148145;
        bh=oPR8JDYixXNeskKH97Bit3Qm3/7xICYfxLhWQC1x0NQ=;
        h=Subject:From:To:Cc:In-Reply-To:References:Date;
        b=i99UhGWp2bm0iE92BLjtNhtuZPFwiHvWoelKxCjIxlvDDF+9zlpVByw35iOFdrtre
         F/YdJCo8pOh02tTzvO7XQJ6ISFY+hW1t2zGes6WWzC3tZ59cH4WWIqDllN4lz6l6xf
         +8xIIRCrLKCiYxlvITxbNZgGi61+wG11qq+FsKcWRC2W6yaXZcKQOwNmb1Dg84VFtt
         CkaO+mKpHVK0nS5kHVJpXFQFA5yR6cMgiisgIrxRYvkSo94t+TlnrgEswNS+/qBIZG
         syPbNMjel9tn6yryqW9uZHyf+NesR2QJYPyXAdx3Xmva8yv4v+tca+BuU+3s/Jz8We
         dV1BBKT6H4nXw==
Message-ID: <ac8342bbedc5aa0f5754cb6830e6d5628cc022f1.camel@bonedaddy.net>
Subject: Re: proposal: move Linux userspace USB gadget projects to
 linux-usb GitHub organisation?
From:   Paul Wise <pabs3@bonedaddy.net>
To:     Krzysztof Opasiak <k.opasiak@samsung.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        Matt Porter <mporter@kernel.crashing.org>
Cc:     linux-usb@vger.kernel.org
In-Reply-To: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
References: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-APVNShTI1bHlM7pGWajq"
Date:   Tue, 13 Jul 2021 11:43:57 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.40.2-1 
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-APVNShTI1bHlM7pGWajq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-01-20 at 04:06 +0800, Paul Wise wrote:

> Right now all the Linux userspace USB gadget projects (libusbg,
> libusbgx, gt, gadgetd, cmtp-responder etc) are spread out across
> different GitHub organisations and user accounts.
>=20
> https://github.com/libusbg/libusbg
> https://github.com/libusbgx/libusbgx
> https://github.com/kopasiak/gt
> https://github.com/gadgetd/gadgetd
> https://github.com/cmtp-responder/cmtp-responder
>=20
> I would like to move each of these projects to the linux-usb GitHub
> organisation and add some more folks to the list of admins so that
> these projects can be more collaboratively maintained.

FYI, we have now moved libusbgx, gt and ptp-gadget across:

https://github.com/linux-usb-gadgets/libusbgx
https://github.com/linux-usb-gadgets/gt
https://github.com/linux-usb-gadgets/ptp-gadget

We still need to move gadgetd/libusbg and archive libusbg.

We are also interested in finding funding for development.

--=20
bye,
pabs

https://bonedaddy.net/pabs3/

--=-APVNShTI1bHlM7pGWajq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYQsotVz8/kXqG1Y7MRa6Xp/6aaMFAmDtC/gACgkQMRa6Xp/6
aaMCcg/9HVPx8PzbN8PnEbs0Dw8MRu2CWBobHoCIsNgJKH4FR16Q5wDoSYJtsAJZ
zvuTBFb+BQkDSiumjm9t31ukosdVGGfArr6wiSy74KdJgQCTLOJVEMRWgw2O+Q8n
8nd0IrIIN3+MAdrpdlFN5Zs8JnHplZkpu2kOtkkXi+nKpPQAKzFIfJmkq1d1+xY4
FO8vK1nFJaLiTWC6LDT1OrOjIayOZQfXu0SU2Wr0Q45CoGeoNrctv1FQctOcJTeb
vDPzQvCNyECJ4aCeGX1hVMOYMcjUCBBV1ID23CAteyRelrmLqBp87Srz0ZD/ogKy
5FScicRGE6Qx2y6wKuB5F2Ghmgz9TJD51vOYi4TqiDMi27ucJSyKYb9wzzrAjG2B
H1LtBYHtboMH+Lhc+vCNxDnsGgVkOgWHIxsuj6kfzQ2AjCLhoN0UmBZDtjYNUwdV
EoV2keqXcjqR6t0R29cDoQLxCSNWC4A7mSomjGQ0VGgmA7VnhowEYdLQQ9fYWMFU
qb4QTh9uA9/Ke4pmQNk5x7ZMGmQsk7iH+9lEQjYCvcY7KOIMPkMslM5vdE15fZ4a
BASch3sejAtKqcGyIKipzVOMkOrYwCsA5HP458sqhAx0K5QhmmQJCmicMj+ECppR
TstoJaWxXprmb+S1MxkPIdfDfSbvAPE5WYUL1Airh6yjjR/3yXU=
=RCfa
-----END PGP SIGNATURE-----

--=-APVNShTI1bHlM7pGWajq--

