Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8884F399A81
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jun 2021 08:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhFCGSI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Jun 2021 02:18:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:39700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229635AbhFCGSI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Jun 2021 02:18:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20B1B61090;
        Thu,  3 Jun 2021 06:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622700984;
        bh=pUQqkGR6tFaC1Uqnufs5DDwoEnvRwr11aPfIYTJPURU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=PHPKs3GhksmxlyPTdoPvahiEUAsBseFGO0jYViUMQEmgGAt9kSYpxvW0QlXTSdofw
         icKR4B1W6yixaVMqejcGGw3LJce1C4I1fKouYyt9GhI068e5tq6fET7gbSsOPFK7D6
         3KNXV8gJiCVLOB5+sSzPQFNIRCnBwcaOu4cKjNvIVBXXcaZlbk4YXlOJL5xJ12ASvP
         CL+Bvcxx6T2LqxefFy55dCjtOynleBSmo68Z75KOl5eGYT/XiOGmD3xX9VADgnYkVl
         EQbWM+f3zGS+5pekKIkwsATCqXpzk748sonJtaszwdYOAjGPROhGbXoWdH/el2PsZF
         tfrbMq8eKyOmA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] USB: gadget: pxa25x_udc: remove dentry storage for
 debugfs file
In-Reply-To: <20210518162054.3697992-1-gregkh@linuxfoundation.org>
References: <20210518162054.3697992-1-gregkh@linuxfoundation.org>
Date:   Thu, 03 Jun 2021 09:16:13 +0300
Message-ID: <878s3reamq.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> There is no need to store the dentry pointer for a debugfs file that we
> only use to remove it when the device goes away.  debugfs can do the
> lookup for us instead, saving us some trouble, and making things smaller
> overall.
>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmC4c64RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjKlQf8Ca8CDaNHXSITJhKyEhxwY3S7SU70VBN/
3PyyigsyD/YzPiUTOSu1jsMA4NrEtpdwJa0fpfNnsoPB4AwAw7JqArRzjY2vZBIH
QttOmkUxxAp5whrFm5V8LVEmEtLelR4Pv5B9r3wesQAr60S3IrTOQKNpwesEESME
63BW3o+TUUCAuzvtRxw7M38RNVXV4bjz8+UeJZ823uZ+99VpcSjyIkiosR97NBgU
5MFWppQr3yEuLaCt59tsr6UkdlYtMTzwre2UNottTZmNMpyukUUiuPLUnTAjRu4i
SZnVSt7vI5z8r7MkubppvFHcifBVDZvERv5IlwY7npxnhjk3C/M/Hg==
=5nQN
-----END PGP SIGNATURE-----
--=-=-=--
