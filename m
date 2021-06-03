Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D42D6399A80
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jun 2021 08:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbhFCGRX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Jun 2021 02:17:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:39116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229635AbhFCGRX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Jun 2021 02:17:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EDB7613D7;
        Thu,  3 Jun 2021 06:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622700939;
        bh=3jdkdC78JW6I7MqBdfCSbXBtGrxlwSk87jLZ+x1JUdE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=VBnZVZdcOlQtJ6V8nk6qglhFxfcvJwgXA02Z5MCFT/FZtGK3cFi1G5A4GZOwd0cKV
         mvSk9KixGoVzComd0mK8jhC0dooNdlZ53KEeYi+xY+yUimChAl3ZJolnr6cI9bc4rU
         LrVZwkTf9p2FIMOG2aUwRgZawsKtv8dSbvMfclT7lG7+XMdNFDMuVgNCEwuzIwZ3WG
         6wA/xgpG15t7YEw5TkVmVeb8N6dJDwpMQtMAJ++2t0vc8n7i1KsnN/Noprpw/kyWNv
         L0saxSbU35ehRTuDFP6TPtEi0gy4+Wh0mHue4jcnd9pQPTHpb8fcqN5xTMndN8wawb
         Ct3n3Ym3wkTcg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] USB: gadget: s3c2410_udc: remove dentry storage for
 debugfs file
In-Reply-To: <20210518162105.3698090-1-gregkh@linuxfoundation.org>
References: <20210518162105.3698090-1-gregkh@linuxfoundation.org>
Date:   Thu, 03 Jun 2021 09:15:31 +0300
Message-ID: <87bl8neanw.fsf@kernel.org>
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
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmC4c4MRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjvRwf/SbaVqXNxH5pEU/QUJD8SJKW4IWsZ4g8/
d9/kFoJPPHmi8J+ViDdbzbVV1mCblJpPlEgtmt5KV8PbDZfvJ3fqlhbG0Fwv0x4N
8et05uGFB9SPj7+e5/ED5ElAeMY0Yp+ONUZiHBBhZdKQr9hmiLX8+NP0dXSG4qdo
KwdzTzYbWLq/uwSXfLHbEZ0k8/Mfw/XrHanK1k25wUSmlovUXVDaMmFkdzwKk93A
+lHz3uxSCPQv7GgAil6lhkTEYTBhGexcx5jm7NTMumf6VQySJ/jp2dLYUCTK+jo4
DEvL5+8wc4o2pwouFmnF9VHe8GRQj+9ApYgJSC9HoP2MPD3tOGp8fg==
=YoUW
-----END PGP SIGNATURE-----
--=-=-=--
