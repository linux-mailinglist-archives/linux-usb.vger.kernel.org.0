Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B2A2A265A
	for <lists+linux-usb@lfdr.de>; Mon,  2 Nov 2020 09:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbgKBIqV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Nov 2020 03:46:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:60080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727902AbgKBIqV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 2 Nov 2020 03:46:21 -0500
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C08D3223BD;
        Mon,  2 Nov 2020 08:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604306780;
        bh=qx2T/W6tTjtmyp/rc1odgKmmTz4uBhsMMOSMRZ+z98U=;
        h=From:To:Cc:Subject:Date:From;
        b=xDL01MlHmfS/Q+uKzysq6nkI64FCY9t9L7L5lt4CtrhkSIPYDyka7TIvrgWptCct7
         0JBGPts4IspNCHY9iaFHhDM5wpflRQv+2NACz1hgBC2j6gqxLyNCeF5puqoJauFXCG
         6JYaE1Y6m/E+wFA0JjCNpeut2rTduXa+1dWvQpg0=
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB: fixes for v5.10-rc2
Date:   Mon, 02 Nov 2020 10:46:13 +0200
Message-ID: <87r1pcqh7u.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi Greg,

here's my first pull request for the current -rc. Not much here this
time around, hopefully this comment didn't jinx it ;-)

Let me know if you want anything to be changed.

cheers

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-fo=
r-v5.10-rc2

for you to fetch changes up to 129aa9734559a17990ee933351c7b6956f1dba62:

  usb: raw-gadget: fix memory leak in gadget_setup (2020-10-27 11:34:09 +02=
00)

=2D---------------------------------------------------------------
USB: fixes for v5.10-rc2

Nothing major as of yet, we're adding support for Intel Alder Lake-S
in dwc3, together with a few fixes that are quite important (memory
leak in raw-gadget, probe crashes in goku_udc, and so on).

Signed-off-by: Felipe Balbi <balbi@kernel.org>

=2D---------------------------------------------------------------
Evgeny Novikov (1):
      usb: gadget: goku_udc: fix potential crashes in probe

Heikki Krogerus (1):
      usb: dwc3: pci: add support for the Intel Alder Lake-S

Martin Blumenstingl (1):
      usb: dwc2: Avoid leaving the error_debugfs label unused

Ran Wang (1):
      usb: gadget: fsl: fix null pointer checking

Thinh Nguyen (1):
      usb: dwc3: ep0: Fix delay status handling

Zqiang (1):
      usb: raw-gadget: fix memory leak in gadget_setup

 drivers/usb/dwc2/platform.c            | 3 +++
 drivers/usb/dwc3/dwc3-pci.c            | 4 ++++
 drivers/usb/dwc3/ep0.c                 | 3 ++-
 drivers/usb/gadget/legacy/raw_gadget.c | 5 ++++-
 drivers/usb/gadget/udc/fsl_udc_core.c  | 2 +-
 drivers/usb/gadget/udc/goku_udc.c      | 2 +-
 6 files changed, 15 insertions(+), 4 deletions(-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+fx1URHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZ6GA//WYTvaA2PxnErWpOMah9CLY1uZLmMH2UX
6Xa79Ih23stsOSqxVXY0xENPrxw+5wBuW4txr24kMpET3j9W/O3g4qsF7ZZm7C1M
W5nmSRy0ZNRFmoYu1EtX/R8fu8mWoSBVm8O09LsbMtesAygOEEMQn3EYgPCwqozt
qAMNnS8XlEjjCLjexnQI3nAgqowEdaxlfScNff2yZtEN3W7lKWPoQkaaoBNo8BNl
Bbdh1wrwHuQF3RID7xc25Bf2BaJtQdqNWI5qk2DG7RQxYICCtoy8ODrJFz6yAR4X
hyGxvE5MLdySJErJ2K/035QGT/z3c4JArLHFCnOtnl8HUbj5DIzdTUo4/sBip/0W
3Hvn4TSRENH+m7kFPx/Tzdk8bkaw8n13Kph4d/DXZonSSxIN486x6ldUg6WsZ7fL
1916KnqmteeW52WfjNjMFCnQ6q5F69YZjtbuRz7GhpBl7KwGsb9jElRP4653pyTK
aB0PM4BI4FkbefT20qAUNxR8wVYSrMHWxNWceIE6xl/Bbub3zN5ar/3jHT9cE/yc
tEVkOkTPckPMXx1bKxUnYGuqiKHDnM1yC2ZjHumW7lWr5gZ/J6BF9r/rsd3JqkSh
IcTSVZSgj9gfObk0e+965KUqIfVWNwSoM4yZdpqgtCtOKa43aoCVe1/HlUGw/yB3
p3tVvPmLm5M=
=pbdQ
-----END PGP SIGNATURE-----
--=-=-=--
