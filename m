Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0953293BA2
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 14:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406091AbgJTMcV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 08:32:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:46278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406077AbgJTMcV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Oct 2020 08:32:21 -0400
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9BC4222282;
        Tue, 20 Oct 2020 12:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603197140;
        bh=CpI03KrZmOMisH5RfgUH++7KvUW8XwawMAJfeV9NE6g=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=p+03NEZJTMdh0F7ArAyccnXcb0AfmlXKWoh+g3xKzvHeDis3AXSV2/3dm4UoTe2A1
         QNZQD9fIlPI/6EOr8tfMQgZFicpqbpc6XuPKbUSzlOZVVgx0i5i1ue2elbiMIg/JjF
         jO3h+5u4LB/Pou5JRnK8N1z1u/Ar5M752u06t/Jc=
From:   Felipe Balbi <balbi@kernel.org>
To:     Ferry Toth <fntoth@gmail.com>, linux-usb@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     felipe.balbi@linux.intel.com
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
In-Reply-To: <a565dc52-27ab-f5be-4fee-5a8f96d66456@gmail.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org>
 <a565dc52-27ab-f5be-4fee-5a8f96d66456@gmail.com>
Date:   Tue, 20 Oct 2020 15:32:12 +0300
Message-ID: <874kmpf583.fsf@kernel.org>
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

Ferry Toth <fntoth@gmail.com> writes:

8< snip

>>> [   12.657416] CR2: 0000000100000000
>>> [   12.660729] ---[ end trace 9b92dea6da33c71e ]---
>>=20
>> It this something you can reproduce on your end? Ferry, can you get dwc3
>> trace logs when this happens? ftrace_dump_on_oops may help here.
> I will do that tonight. Is flipping on ftrace_dump_on_oops sufficient or=
=20
> do I need to do more?

you'd have to enable dwc3 trace events first ;-)

> BTW after posting this I found in host mode dwc3 is not working properly=
=20
> either. No oops, but no driver get loaded on device plug in.

okay

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+O2MwRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQb6dA/+PwTQZnIaI5uwAE3o0GIcAeEnpqJ32ASm
patr3fWV2nDqxltnrvCP9L4yLxDY+dxDFpM6ozGhwkhNmTcSeoFhCa4sQlTimBhR
iFRYY+1lGZKK1MycaLV7I/qJASg3qUXrGAOTntR2km3EuyZzQ9D1/eP9neLT3gP9
EEyqEpfdlkuHMqeUw1jW3yM3mphX7p6lw9XsA3Fvadr0VRIev36F03qWr5GB32a3
uzU+BUCUzp5CoDgUvPCwF6Em8nQmbjqW7KMnxhD01jt01/BqcngjhuLrMElm4rPj
VjNbrUkDBYHLuJRGIaa6ZkHySoKJApXvh+J3kGHVrN7vXXx31cqqTGmnFy+lP3qV
EwSb8+GMtv2qlQjvIdzH8oxUKp5MaLBVDXHzGmZhjbJRAP2l2jyGCaIF9Nux2Ay/
aHITKWRn2rslRwOwGXIItXEt8QZpOJepap2rW2qWEoycThvziqFzkZTHV7K9YLh8
ECKcD/qZJaAUO4tNNXg5oqS0MCbrhgH2Bqv2kYqoidz6HmKuYCIyvtSYtjnE+hq6
r+7fCTroZzGtRzkMh0nuDVzD4KlG8R82RKEBWWgRFclDVjnOVhnzj46hsM+R+LDW
HZXyEuoTSD6Kl3N8oziP7wlvst7uZJxnoMFjfam9DjQI37XRlBoA7rKjkTpmw41K
v6XYwO27Ip4=
=LMD7
-----END PGP SIGNATURE-----
--=-=-=--
