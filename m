Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9453139A33A
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jun 2021 16:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbhFCOdJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Jun 2021 10:33:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:40832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230396AbhFCOdJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Jun 2021 10:33:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F4058613BA;
        Thu,  3 Jun 2021 14:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622730684;
        bh=DCOKtNXPhzHasta/XrPshyBninkqdve785rmEVRFr48=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=FtSTe5q2TMuvDRtV3qcJZdSSSbN5JYoMhzcH+aU8B8x0IYZ1K4X6vX/PT1wGh6pzR
         M5JFylLQxZtxjTzXoqO9YZECMjyvlVOnug/V3eAFzYyGFZ3+t0djBodkKH1a87tLBa
         HaUk/1cDwbaVsUGi0fDP0TDhm3kXch+fesjIc1GtDTkGQ0wbjIRhmaR+wuUwvS06No
         u9/gjNYiO9wL4rp+2jrTIAsCXJb9aKUmUBbCPZ8nGQLfiMq8YdN8BQrQkzvIJcyzRg
         ICzlKlt4Y1Rq5d2G4dNe9EqNE/Z8/ykXVlBVeDqF7ie828IudJj7VOsSN9F0N9FR5x
         FOSiMPJuWYj8Q==
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] USB: gadget: pxa27x_udc: remove dentry storage for
 debugfs file
In-Reply-To: <20210525171636.758758-1-gregkh@linuxfoundation.org>
References: <20210525171636.758758-1-gregkh@linuxfoundation.org>
Date:   Thu, 03 Jun 2021 17:31:15 +0300
Message-ID: <87im2vc958.fsf@kernel.org>
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
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmC457MRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjrFggApMC8N7gsBp28Ylucsbc13VhSMzLm6Vbf
2iKTE1lotxw9ytgWmh9buBOwIQ75Kg0KIayn+KZc34WHaCdj8Z1xm5mYthF+WGJ2
PXXHXVeTnGGuXZ1UWiJOgzyQSo9hFIIKHrCLGNj9E/BeJqII1UoCDoaTLt91k3kZ
JRM4DCCVN5j/QyF+Y+7LyVWPPy/2rFXA7vH9niuB4iQgSoTzrSXEsCvykuM1Ues9
DWkzoUyo2nRa2i+Yr/Hnpfx5gY5qbq/PS523CvUG7D8Mvy/nl5YOJdSyDK5bCzjH
TD9ZUeyW6x4rE8xihO7xN+LVOausbvoW4r6VEkLC2TRaGNTrGCSPoA==
=aCSN
-----END PGP SIGNATURE-----
--=-=-=--
