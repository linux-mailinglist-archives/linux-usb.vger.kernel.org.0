Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A133829A675
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 09:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894645AbgJ0IXG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 04:23:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:43188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2894642AbgJ0IXG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Oct 2020 04:23:06 -0400
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A90C32224E;
        Tue, 27 Oct 2020 08:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603786985;
        bh=j6rV2B2ZGonFGY/yYN9m8V9//PANCjhjAhkdaDqkpDw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=rCtP0+uzUyGR1mtQsDOtiiU/w7FxEwZSHpceWRu5Jr+NWol1bmRJ4kfZvuA9tM1E6
         r3zCIR3sGqu8aVObiWQqK7U+1iAU11nunCMDX03LlzyaLnBq0xflz9DDh8b4B7J9DT
         6pc52mdgBRYQZbopq2o7hLtBXcRNEOHnp+2xACwE=
From:   Felipe Balbi <balbi@kernel.org>
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: Re: [PATCH v2 02/15] usb: dwc2: Add support for dwc2 host/device
 clock gating.
In-Reply-To: <20201011135122.71764A0061@mailhost.synopsys.com>
References: <20201011135122.71764A0061@mailhost.synopsys.com>
Date:   Tue, 27 Oct 2020 10:22:57 +0200
Message-ID: <87a6w8dqn2.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Artur Petrosyan <Arthur.Petrosyan@synopsys.com> writes:

> If core doesn't support hibernation or partial power
> down power saving options, you can still use clock
> gating on all the clocks to reduce power consumption
> considerably.
>
> - Added control functions for dwc2 host/device mode clock gating.
> - Moved "bus_suspended" flag to "dwc2_hsotg" struct because we
>   need to set that flag in case when the driver is built in
>   peripheral mode.

similarly to previous patch, it seems like this could be broken down
into two or more patches. Think about doing really small, incremental
changes that are obviously correct.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+X2OERHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQa1zhAAnAXvuHO5sPcVoRZeodnDxyrXnsj7YPNi
lJsxeNiccZuCyvefAGDL9yYBdMlsRxKIIL5NAj9aOuvtqV6uo7+bP5x+RNCQ3R2S
6VA3nu9zZ4jDRrO+fRWYq1hXHQmxyvnSMl9y9KwyMXD4AR/od81ZYFXqe9ZFQIRH
fJJIJ4/t5cbufJHghjehVNABNQFuxeQtkX+ZoSysqIIHyPGm8q++v9q2rLfAWHTO
VfKl0t3C+LXwmjOrW7MLVyhjz0hgBV50vq0p3rkuMXx1bqIHFxls6FatImhLeS7h
2j3kKicIv6KHw1GtNeVZC2S8Imw+g+8mpgW7MDk3z1iASg7W1tuK82gzB6WLmDwb
VbtUbNAffki1JFz35ZcBaZgGLLgsymCJxVf+qw8qV+X3+l56omYhufQBZ5T1+2Zz
1ym4vvy6FTb3goCzGbt9x1L2ZlrE88P0vNWbVU0ooDHgsfEgiyWuBK7CVrSd/xh9
/oGjDoX3vGPXNvYgc0ZySksS8LDiAmTCWjyUA4mofGAHk+WtFGyh4bxpTkXqOgwf
QGZsR1oetl6EU8FqCk4zgtUCVDhW24F9oOPcgbCOMEJGnotOaUMAdeXEx41KqY5o
rL+HHCqqyWGLpil2IlibOE+6B0BAS9/+l+KL8zuQNSY26HQHB64j5Lz7L+qmkPEw
zyOSh9m0ngI=
=QCec
-----END PGP SIGNATURE-----
--=-=-=--
