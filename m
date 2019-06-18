Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35F5249A24
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 09:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbfFRHPd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 03:15:33 -0400
Received: from mga06.intel.com ([134.134.136.31]:28522 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbfFRHPd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Jun 2019 03:15:33 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jun 2019 00:15:32 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga002.jf.intel.com with ESMTP; 18 Jun 2019 00:15:30 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     dmg@turingmachine.org, linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, Daniel M German <dmg@turingmachine.org>
Subject: Re: [PATCH] usb: Replace a < b ? a : b construct with min_t(type, a, b) in drivers/usb
In-Reply-To: <20190617233050.21409-1-dmg@turingmachine.org>
References: <20190617233050.21409-1-dmg@turingmachine.org>
Date:   Tue, 18 Jun 2019 10:15:26 +0300
Message-ID: <87imt3gy9d.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

dmg@turingmachine.org writes:
> From: Daniel M German <dmg@turingmachine.org>
>
> Use min_t to find the minimum of two values instead of using the ?: opera=
tor.
>
> This change does not alter functionality. It is merely cosmetic intended =
to
> improve the readability of the code.
>
> Signed-off-by: Daniel M German <dmg@turingmachine.org>
> ---
>  drivers/usb/gadget/function/u_ether.c | 2 +-
>  drivers/usb/misc/adutux.c             | 2 +-
>  drivers/usb/storage/realtek_cr.c      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

could you split this into three patches? One per driver? That way they
can be reviewed separately.

Thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl0Ij44ACgkQzL64meEa
mQYy3A/9HQB4keIHQhTwVVIje8ljBw0x1caM3iTzimvEax6UpO6ydEx3RM7yekV1
Mp0lnNI/4GMq2M/0Mdk0qwQHYjUQF4DeNwtHOcMK6TEw/L7uNMH5APV8RyhQxY55
00jGy+fhYkXzHqZRxUkWvOKpOOQPAsvK9qxM3K0TuXsIQqPzp3Hi7fdN6GzFnEjL
xRT/b6PeMesYbqtGvWR7gfG249rorCUczQelzxlQd9L8f8/84sOHLDJ9zWI8JumD
7x3U6NsLJpZp/3cgcmaBFHAK9Ni0/wbQz+k6wDko7zZ7qTpa21Cx7iHGDkR6qEhI
bOI43hsvhwpfLdfh0D3sLjI+T2MU+F1z8yEGOLa1gMzNe8IfWi1wwOgtrOiLFFX3
GybAUjNYYimcQ0/EE22H2uZupU9TegS186rtPBtFK3Gm0lrKVqe1RuhyJA+gHHQQ
rKYp2D0Vh32mVh/vE1BazZDzQN2eMYiYWKqXvDPJTt8Q4EWGNFWiuQxNu3jkDdRu
cq6cLeo4U05VN/zQTsSV6HEDFXaJvVbERpiwTIATSRDr41ogX9GPVV2iuf5k1JH1
SrczRb7/ajyAuCBnC0RwKtMcYT9YtLMBTPpmBwL/q6CNuy5BSEaUjQbQz5aiqGci
dq7AFDM2xqert5D/r2/AAskBG2WNpXzDZB0FLlUh0GRytTQf1AQ=
=yzUJ
-----END PGP SIGNATURE-----
--=-=-=--
