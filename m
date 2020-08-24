Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B896224F24F
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 08:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgHXGQR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 02:16:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:47536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725817AbgHXGQN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Aug 2020 02:16:13 -0400
Received: from saruman (unknown [194.34.132.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 90DC52063A;
        Mon, 24 Aug 2020 06:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598249773;
        bh=z1I0jmwcePQIh3dLQ4Het8/Wnr11stbkMBzGLlH5WNw=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=LzGAEJzWYL9J5fA8irWRjjlS5kcr5ZUlNCS45drXNOBJ7tGQ66NrA5pRqA92/jker
         kI8b383d5hKoF5Oq4vPWlTin7X7yH/yBfzbwGqNTAcP+WFDSP/PPWPt6voZegF/Ter
         LfBkad9Q8m1FCc+DTPZhRud/ddtiBRyZt3RhsnAQ=
From:   Felipe Balbi <balbi@kernel.org>
To:     Sid Spry <sid@aeam.us>, linux-usb@vger.kernel.org
Subject: Re: mkdir acm.${name} in configfs always fails with "Device or
 resource busy"
In-Reply-To: <508e531e-076d-4b02-8aac-783842346bc2@www.fastmail.com>
References: <508e531e-076d-4b02-8aac-783842346bc2@www.fastmail.com>
Date:   Mon, 24 Aug 2020 09:16:06 +0300
Message-ID: <87ft8ck1qx.fsf@kernel.org>
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

"Sid Spry" <sid@aeam.us> writes:
> See title. I'm getting this even when using shell commands, so I don't
> think it is my program.  Creating anything else, like ncm.usb0, will
> work.

which kernel version? which usb controller? which platform?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9DWyYRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbjwg/9FUpTYEtmua84kyB4gfXE97Ext1OdeQpy
RVAeVB1+OsnOlQpgPfjX8XMUm7mzw/wFPKSbFQQHXSvCCNFLDi6Oqr1F/4jEd9zP
72vzzx0xvXQBBSZ8Dnz6ow3/0qaJPEcgO0G6wveXBUH+GIjhlHAyi01FH/Mvf1MT
tbWaINwuS0fvH/FH5UQLcV2OgVj7wpiuOOu+7jFwAecvaMN4zu4DJnuZV9ElbA6q
rTmE6/b2suLK7oFSS+RnPjbAUoAaWbIbhE+tuZ311XUQZZFCjCp8a83mEjeyrVMX
7j/o3li1KCjTZCiX1Q0BQVMtLEoG+1kVUmrBGPvuZq4itnuBKVcK4TGejw7RsdtU
XR0hJm1t3ho4WOgpeUckd1tK8bXaWziuPUeJU+kz5sLf9yolRsY/MgVmTuRJVxhN
6LqB0paErj5r15ZPQJep5GDJmTfhyod2nire0JIiUCzxdZf5dAtVPdorjP89cMzS
oaxeghBb9RKYCucE54m/TZAe0+H34Qqk8D9oE+kEtk6rR8qeSX7kIqSy18DhMIne
T+/tjnSCkg4fTBmlsRHqY0x+0tjBOtxc3KOW3J0EUt58lmd8cGzIovyLr+59cV2g
5ouZrK7nyghyht6mcQVFbcrwObjJxGe2ZX/Oi5bQ4nAPEVk812pOSpABAMJqXvRb
0/uzCqKhozg=
=Bk51
-----END PGP SIGNATURE-----
--=-=-=--
