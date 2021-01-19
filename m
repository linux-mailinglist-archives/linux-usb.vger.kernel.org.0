Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C962FC0C4
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jan 2021 21:19:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729686AbhASUSv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 15:18:51 -0500
Received: from smtp.bonedaddy.net ([45.33.94.42]:42046 "EHLO
        smtp.bonedaddy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730412AbhASUSp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jan 2021 15:18:45 -0500
X-Greylist: delayed 614 seconds by postgrey-1.27 at vger.kernel.org; Tue, 19 Jan 2021 15:18:45 EST
Received: from [192.168.1.209] (unknown [49.190.168.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pabs3@bonedaddy.net)
        by smtp.bonedaddy.net (Postfix) with ESMTPSA id 6BB51180031;
        Tue, 19 Jan 2021 15:07:28 -0500 (EST)
Authentication-Results: smtp.bonedaddy.net; dmarc=fail (p=none dis=none) header.from=bonedaddy.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonedaddy.net;
        s=mail; t=1611086850;
        bh=oJurJotAuVy+DdDqjSNr0dJNWJWcdLgvHEYwkcV/6QM=;
        h=Subject:From:To:Cc:Date;
        b=GMdgHFNoUzp85aQ6oDAiRrR0/QMVGH24NwQdQsbaiixXKM8ns7qT0mFVA5BStH4IA
         Of/V2vmUPTK5J3qtqgSpIg+5wInVn6Y21cCUeXQMJcwTV2DAJbPY6AvPZW5OXn/YAT
         VCdh1f4u5hgAkQxY+z3EDupnY5faObjnBtLLRoNV8a6zUQVby/RFBoP6QWLVh0tDXs
         QQnW1CsnkgSXz3ucPo33yYHHGZFLWCgSiQ8g1Q0AAdjDA2AgFEBHtGnmWuPaafmJ3h
         GeNyfJKup5zNAuc3yfrRokCF7Q9YG5tV9O5ZjNSgZgqQHT36c2ren/dA1RIrbp7dPy
         GrcT5yOK1y1Iw==
Message-ID: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
Subject: proposal: move Linux userspace USB gadget projects to linux-usb
 GitHub organisation?
From:   Paul Wise <pabs3@bonedaddy.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Opasiak <k.opasiak@samsung.com>,
        Matt Porter <mporter@linaro.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-dDhTZbtXdQ96gg+LUiOI"
Date:   Wed, 20 Jan 2021 04:06:59 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.38.2-1 
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-dDhTZbtXdQ96gg+LUiOI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg, all,

Right now all the Linux userspace USB gadget projects (libusbg,
libusbgx, gt, gadgetd, cmtp-responder etc) are spread out across
different GitHub organisations and user accounts.

https://github.com/libusbg/libusbg
https://github.com/libusbgx/libusbgx
https://github.com/kopasiak/gt
https://github.com/gadgetd/gadgetd
https://github.com/cmtp-responder/cmtp-responder

I would like to move each of these projects to the linux-usb GitHub
organisation and add some more folks to the list of admins so that
these projects can be more collaboratively maintained. The linux-usb
GitHub organisation is currently solely owned by Greg Kroah-Hartman.

https://github.com/linux-usb

I don't propose to move maintenance of these projects to kernel.org
since the issue and pull request databases for them are on GitHub and
would need to be preserved.

--=20
bye,
pabs

https://bonedaddy.net/pabs3/

--=-dDhTZbtXdQ96gg+LUiOI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYQsotVz8/kXqG1Y7MRa6Xp/6aaMFAmAHO+AACgkQMRa6Xp/6
aaODXg//bEtNOdPu73iNJrfLIx6g9fW3G6kFw2T/oYVjHzVo1fwbrLc4bnP7n95P
QgQcsSGfTIPEdveHxa8I6JGLGlR6g1UNI+St1PzIAnSHwxyMqx2zpZgJ64iKXpor
0PeJHtR2OxhzA0bO4TtLqiWAD4SyxUll5IQNScE3o/y4y1pej4WyxflKTbz9ycFW
ENobW4ZZSlQlzFe4EVqkXwjGcTdIfJ/GvSZ29Mj6TWddyhMka0T1XnLQ4p8ZPlQY
iu5by4s0JYTZuRxtcJMS3/jqNPlU0kJNScbiTaMAkQtAlK8Wfhass0rtYVA3WIah
KKRlZwdoSPVwa4+aqFNJsRqJQnwVmBuiigdtuub+ET+JieXZuYDjZGdMsq3DByO0
QoQUU7wv/MgcmyMnDFjqOydg49IEIrjJY1vIxmotlLa2Nu4U4rFmjr7AV3Vc/xa2
h/sqBRJBQorKIUWJHs6ZrabMY23CBVMsX+a9K3WP+zJ/qSNS+t9T7g7M67rtol58
/CPnpv9nTQ7CcirZ+prPdFfBWstz5dSAT/mD50rQIgLtAZtoqtqfBQ1qUeQWH7rC
f6XD1/iou0PSl7SxpMe4oSx6XxwII2BGKV8nx9rfJ7/WSG5uGMI4pKqm+3va2hWC
ZRHkxgRQxUmW/Z+kJ8mTLYM1isLUEw/j6NZ6dcFM2/D0mIEsxYI=
=ynTr
-----END PGP SIGNATURE-----

--=-dDhTZbtXdQ96gg+LUiOI--

