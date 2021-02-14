Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAECE31AEBA
	for <lists+linux-usb@lfdr.de>; Sun, 14 Feb 2021 03:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhBNCSh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 Feb 2021 21:18:37 -0500
Received: from smtp.bonedaddy.net ([45.33.94.42]:57922 "EHLO
        smtp.bonedaddy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbhBNCSg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 Feb 2021 21:18:36 -0500
Received: from [192.168.1.209] (unknown [49.190.168.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pabs3@bonedaddy.net)
        by smtp.bonedaddy.net (Postfix) with ESMTPSA id 0DB2518003F;
        Sat, 13 Feb 2021 21:18:01 -0500 (EST)
Authentication-Results: smtp.bonedaddy.net; dmarc=fail (p=none dis=none) header.from=bonedaddy.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonedaddy.net;
        s=mail; t=1613269084;
        bh=Kcc/Cp2d+vKean8IrqiPE2G5WjSvhy+Cwf7KSzQUuLA=;
        h=Subject:From:To:Cc:In-Reply-To:References:Date;
        b=gGWRzryetrMyYLVBSLPRPtp0CBrS+9Z285xuTpAq45aYJXJ0lzPCZ6O1kfSNJSo+Y
         b+lWPKnjuEL1wCuCL+QT0oLNIrCQp5+OlXniYNfsYM80Bn8bZlw9Y6IEDbg5K6hX6d
         GlF/DAF7mC2I46p/MXOi6jaHD9EJihSzFyU3g7l7jJXsPRTd+2ZVyCfpcqtWqwkG6e
         6Wxnc3Lpy1ob1l9EJkMs8P2612hxgrVx1cFtzHCEcxqkRHBNRuuLFxYmQVL8ALts8M
         ks7N2Fv5Q6wFcYtdJ92n9hl/hUmzkebiD0P/24LhxLj15izDWqlqfsiK5eGDbjCEdU
         D7t36I+EoxnKA==
Message-ID: <8f31baea8cad893f416fac972a3a64922c97bcc5.camel@bonedaddy.net>
Subject: Re: proposal: move Linux userspace USB gadget projects to
 linux-usb GitHub organisation?
From:   Paul Wise <pabs3@bonedaddy.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Krzysztof Opasiak <k.opasiak@samsung.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        linux-usb@vger.kernel.org
In-Reply-To: <ffd238f1787b8e23f974a220e94aa39eb62b2e60.camel@bonedaddy.net>
References: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
         <YAhKAiz2U9KQWQPE@kroah.com>
         <86c0f13b298c8584bc7070543637f424075e526f.camel@bonedaddy.net>
         <YB6WKs/6QMWJSS2t@kroah.com>
         <ffd238f1787b8e23f974a220e94aa39eb62b2e60.camel@bonedaddy.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-/fGI1C06f7JIb56Edt73"
Date:   Sun, 14 Feb 2021 10:17:19 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-/fGI1C06f7JIb56Edt73
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2021-02-07 at 07:28 +0800, Paul Wise wrote:

> All the standard benefits of the GitHub organisations feature and
> collaborative maintenance in general

Since the linux-usb GitHub organisation isn't yet available for
collaborative maintenance of Linux userspace USB gadget projects on
GitHub, we will create a linux-usb-gadgets GitHub organisation and can
move gadget projects to the linux-usb org when it becomes available.

--=20
bye,
pabs

https://bonedaddy.net/pabs3/

--=-/fGI1C06f7JIb56Edt73
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYQsotVz8/kXqG1Y7MRa6Xp/6aaMFAmAoiCwACgkQMRa6Xp/6
aaPHGg//YQ9zdcHPEFCDmdnFuGcVQL83njHHY/YwUTs27Nit/Xq2LBpmqZEO1L/l
Z1vVjAHt5hpIBL1bVkWvB9RGG6J7czePj6sLO4/2FtivuSh0Zh0u9nynPXLh9aAA
o9KOEDu2OiP/0a3L6SWiIoK6PQl2dfx+RUXLO4q7WLrhFd/UGjHsfs6s1uNpt6Bw
fluRyE4+vgC91FsNKOk+vuH7WNp2Fe4Jbgv7lFiYVqe4BsuUN6k5JgqF0ZUeYTa/
xn2BexTJkcv9vRhki0kiH/Eppg1JCR12ZBXtY5GJOn1nb9yZzDyiv9MFP9B9Wtjb
xdMQzEsHrpOhMI22r6V/KlfhS28An9zptMIsY1DDjpl68w8ludigF5HB1BRQWYXb
p149DqcKdMzsV9cZqqBEzEjuQE5c+u02aOPg877YxZUQl5TZ31yhfytXJh04nAfr
cixp3Q3FhyUvNabyMgUHE25Wf+OIxYHZvQ6qqVUk38LRg7U8HkzcHgzj07OJYJ2D
+Mn1l3c8fxYaiTrxmbATDYtzDcLKoBcZU0qyXzu3kJgfGGUXO0cljOudUDB+pEkX
PqAuOxucCVVB3OmzEnv9/UAlOs09orkBUbkoK3nxQCG2LkdE8pGAphGa1Odl6cFY
coDKfH7ZOVmpZ3gRuRzguzKxeQDhaup/3Hh2JuM/w0jsRl1kRbs=
=M2vm
-----END PGP SIGNATURE-----

--=-/fGI1C06f7JIb56Edt73--

