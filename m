Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 295F6298742
	for <lists+linux-usb@lfdr.de>; Mon, 26 Oct 2020 08:11:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1770941AbgJZHLl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Oct 2020 03:11:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:47296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1770936AbgJZHLk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Oct 2020 03:11:40 -0400
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BFB0F222EA;
        Mon, 26 Oct 2020 07:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603696299;
        bh=knOCeL3f1JsdAQ1BwrEpZGQDDRpwc69Fj6F8Nc0TAYQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=k3/kxOgXL9rxlOr7UbDDQ1A83uvIoSmfDRWNjj6KEBmTPRYCT2r/ATQSa4lZ0H8Rt
         viZ9PKnhYo9zwSjo0Yb6G6vZ66ZuTJuI3zodOxqJ55yiPl12lYkLFicyHCLpYheUw4
         XVmBG0bvlcMaMv9axKqn0O28ROiqNUiWVLZ/f8d8=
From:   Felipe Balbi <balbi@kernel.org>
To:     "Dmitry N. Mikushin" <maemarcus@gmail.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: Any example of USB gadget for DRD device mode on Intel Gemini
 Lake?
In-Reply-To: <CAGR4S9GnD6CbZXbO+cA0HUY_8BOpRqkWmqcmVw=i4yEtgOhFKg@mail.gmail.com>
References: <CAGR4S9HQiZCsA7Y5_47j-xBOkydKiT2Exam=36L=-vwRjt+UWA@mail.gmail.com>
 <20201019133607.GC1667571@kuha.fi.intel.com>
 <CAGR4S9F1wdUyywuBxcMYfH9wMa91xw1rL8dmZrhJrGSGbmgbzg@mail.gmail.com>
 <20201023064855.GR1667571@kuha.fi.intel.com> <87lffxdzk4.fsf@kernel.org>
 <CAGR4S9GnD6CbZXbO+cA0HUY_8BOpRqkWmqcmVw=i4yEtgOhFKg@mail.gmail.com>
Date:   Mon, 26 Oct 2020 09:11:33 +0200
Message-ID: <87imaxea1m.fsf@kernel.org>
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

(please avoid top-posting)

"Dmitry N. Mikushin" <maemarcus@gmail.com> writes:
> This is what I get from acpidump:
>
> marcusmae@m1k:~$ sudo acpidump | grep OTDG
> marcusmae@m1k:~$ sudo acpidump | grep XDCI
>     1AA0: 5F 41 44 52 0C 00 00 15 00 5B 82 0F 58 44 43 49  _ADR.....[..XD=
CI
>     3160: 42 38 58 44 43 49 14 1A 5F 50 4C 44 00 A4 5E 5E  B8XDCI.._PLD..=
^^
>     31B0: A0 0E 90 50 4D 45 45 60 86 58 44 43 49 0A 02 5B  ...PMEE`.XDCI.=
.[
>     3200: 44 44 4E 0D 42 72 6F 78 74 6F 6E 20 58 44 43 49  DDN.Broxton XD=
CI
>     B170: 00 5C 2F 04 5F 53 42 5F 50 43 49 30 58 44 43 49  .\/._SB_PCI0XD=
CI
>
> Does this look sufficient?

you need to decompile it to look at the sources. Have a look at the help
for acpidump and iasl ;-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+WdqURHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZJJhAAsUQO6Q8vOBGFTtackjHFhaXKh9Q3Onm/
tFazkmOvIzx6sxg7koM9n4HRbsP9XSiCHzRtc0YjBMxXsn/eJvGlU+WMFAtM3VVV
CcxRXx4psQ70T/ZVl2MlXE2A8UQtx/ZdWgiHMybRt9HAfMB2AI4z44ODF4jPTdgU
yO+WSEGjrufOQhAhJtLHiNHDO6b3iQcBgQc/684auL868sA+814UbRdS1oARHQmO
x69jNTiLXsrQ1MSka55xdVws6v6QLn4+sytxSHtrK4gCZ/nAKCpxyMd2DLADR7I3
MRy0Czi6Rw4O/U+K+y9NN6XnithWYgGT0M4IAyi70Hj+6TsBvxCRBkoK7UTebMWT
wx62SoZm2M2z24lyQqaRvIzOmNEQsQ/Z+MLoeRcxaUkc3xvPeswxxJsn/5iu1IcZ
+zQDiEVAFlhGZCsenmDALcIwnzVWXwoIKny/DPLwIzQRJndOJJwHebzgjd+LsCIJ
GdFTB3dKltGlDOWfZPqwcqdAHPx56cMU8Remdeyp0kPbXTg9V1//w1Xk4bAUZl8A
nuldHcvrGw8NsuwD6D+06+tlijUSgj6NjxRRkU1zvAcZpIoqBBKv4a+hjIOAgf/B
CbCm9yMFVFOLu+1Z+eEcQqAu0AgVzOG2N8W/yXg/Xd+wciy5MfC9Cgyg5HtNcqw1
DC3XISy1xW8=
=8cUx
-----END PGP SIGNATURE-----
--=-=-=--
