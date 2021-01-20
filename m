Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B002FD467
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jan 2021 16:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733099AbhATPmx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jan 2021 10:42:53 -0500
Received: from smtp.bonedaddy.net ([45.33.94.42]:42494 "EHLO
        smtp.bonedaddy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732906AbhATPkU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jan 2021 10:40:20 -0500
Received: from [192.168.1.209] (unknown [49.190.168.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pabs3@bonedaddy.net)
        by smtp.bonedaddy.net (Postfix) with ESMTPSA id AA010180031;
        Wed, 20 Jan 2021 10:39:32 -0500 (EST)
Authentication-Results: smtp.bonedaddy.net; dmarc=fail (p=none dis=none) header.from=bonedaddy.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonedaddy.net;
        s=mail; t=1611157175;
        bh=Ge/SXjcXwEveYoaZLhUHiCTOeoWvk+GLGGVqQVDCUOk=;
        h=Subject:From:To:Cc:In-Reply-To:References:Date;
        b=O8SgIVfENLLaUjAgAqmB0ilggqvcXqxnvJ1sHUl86FAxCXKY72bno/MWhZqPWstn4
         peLdZa6cJzDxk45rftzCLbR0mvHPUyf7J+grcAWrZkdz/9F54jAXWPAr+Ny+MzPZjb
         TvAUhvqAJQbPiTCHA63P5Giu53EknKlSUqL6DEt8E2Wk8CpwP6wNOgWYYb4BghYA3w
         gEn2Upse2tMvcYvmvgwDuCb3u4ohi0LTLkoypn5fPCx3rYBcbhg9qdNgjkh4UjExdt
         TK1QcK+PXJkrS4QAkyDB2/ia2hcVF3p60JFfnG+DIwMvYRHvxl7qhpgFQjVr1tiOkV
         FtOuE3gMp5VuA==
Message-ID: <42c4ad2fa7709312b7ac7bc682f05ed1a3edc9a7.camel@bonedaddy.net>
Subject: Re: proposal: move Linux userspace USB gadget projects to
 linux-usb GitHub organisation?
From:   Paul Wise <pabs3@bonedaddy.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Krzysztof Opasiak <k.opasiak@samsung.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        linux-usb@vger.kernel.org
In-Reply-To: <YAhKAiz2U9KQWQPE@kroah.com>
References: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
         <YAhKAiz2U9KQWQPE@kroah.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-uzKUI9Rf0blnipBuP3BC"
Date:   Wed, 20 Jan 2021 23:39:22 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.38.2-1 
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-uzKUI9Rf0blnipBuP3BC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-01-20 at 16:19 +0100, Greg Kroah-Hartman wrote:

> If you can get the "owners" of these repos to agree, than sure.

Excellent, please invite these GitHub users to the linux-usb admin
list, so that they can move the projects if they want to.

Matt Porter: @ohporter (for libusbg)
Krzysztof Opasiak: @kopasiak (for libusbgx, gt)
Karol Lewandowski: @lmctl (for gadgetd)
Andrzej Pietrasiewicz: @andrzejtp (for cmtp-responder)

If you would like to invite me too, I'm @pabs3 on GitHub.

I expect some other folks on linux-usb might like to join too.

> But we should work out the libusbg and libusbx issue, which is really
> the "latest" one?

libusbgx is a fork of libusbg and is more recently updated.

I'd suggest to also move libusbg and archive it (make it read-only).

> If you are moving the repos, why do you care about the issue and pull
> request database anymore?  Will they just not end up going away?

When moving projects (as opposed to forking them), GitHub moves
everything along with the git repo, including issues and pull requests.

--=20
bye,
pabs

https://bonedaddy.net/pabs3/

--=-uzKUI9Rf0blnipBuP3BC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYQsotVz8/kXqG1Y7MRa6Xp/6aaMFAmAITqoACgkQMRa6Xp/6
aaM7sBAAgksO12wM4TTQCH3Qq5BoAf5OtBC8glQhq005p6ceYlhx25WqLMTl+dQ8
U1AaU6dLVTiU/1aaJ2LtYYQe0k8uqRSyMSAuX9KQz3mFSEO/Qmqs98j4T9mLLb7Y
mrlRtAo79tEaOejnvewK3SlFwTdCQFAVqso6BmQiuDKKXsswuB03SCBnLV1WmYh2
4FhRBpAhuudx13f2CsT096Jl+xzCFq4d4/Rq1v6NB7ZGwL4Zl3oIc3/nGqjcSNB/
N5yYq059ov3d0qgFT372qxkNJ12uvGjqQ+jqOjMlevIRwr3paTk0wBY9PnMWyKYz
w1AWWKf/bCsumtOiYepjo1aBdBtiC5KVoJ4ZloCpog4+d4XUYAB3m0O83+algEHF
SPU0LQSGHgXIzFPWXdeNED0gOV9Um6X32NeAy0aXZYOWZlUiVV49/6XHnt06lzJv
v+LAc/vOnNE3e7O/jvc6gznHHEBgN+9j9cdLx1MEIJLl/KtbfnCYM9KeHmxJ63qf
0UsLoo9iuctVllUXvDTlMknSWJB46eVnnyZZA2icqMM/NuwAku2RDtNHiUjqMshM
z1riEu6i41Q9S6S7qsyHABlWZA91bRpod5Wc4PLnL64A+rdlllHi0NryA4U2Z0my
gFpbJhWa6qQS0HJABnhf6MDJpcYmmKfTzj6/FNUHM4VJyR4AADc=
=meMF
-----END PGP SIGNATURE-----

--=-uzKUI9Rf0blnipBuP3BC--

