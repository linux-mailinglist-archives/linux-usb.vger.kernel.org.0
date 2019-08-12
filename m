Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E028789AB3
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2019 12:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727552AbfHLKAq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Aug 2019 06:00:46 -0400
Received: from mga06.intel.com ([134.134.136.31]:54562 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727423AbfHLKAq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Aug 2019 06:00:46 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Aug 2019 03:00:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,377,1559545200"; 
   d="asc'?scan'208";a="183510825"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Aug 2019 03:00:19 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB fixes for v5.3-rc
Date:   Mon, 12 Aug 2019 13:00:15 +0300
Message-ID: <87a7ceu2j4.fsf@gmail.com>
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


Hi Greg,

here's a pull request for some fixes that I collected from linux-usb
mailing list.

Let me know if you want anything to be changed.

Cheers

The following changes since commit d45331b00ddb179e291766617259261c112db872:

  Linux 5.3-rc4 (2019-08-11 13:26:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-fo=
r-v5.3-rc4

for you to fetch changes up to 4a56a478a525d6427be90753451c40e1327caa1a:

  usb: gadget: mass_storage: Fix races between fsg_disable and fsg_set_alt =
(2019-08-12 08:55:24 +0300)

=2D---------------------------------------------------------------
USB: fixes for v5.3-rc4

Just a three fixes this time around.

A race condition on mass storage gadget between disable() and
set_alt()

Clear a flag that was left set upon reset or disconnect

A fix for renesas_usb3 UDC's sysfs interface

=2D---------------------------------------------------------------
Benjamin Herrenschmidt (2):
      usb: gadget: composite: Clear "suspended" on reset/disconnect
      usb: gadget: mass_storage: Fix races between fsg_disable and fsg_set_=
alt

Yoshihiro Shimoda (1):
      usb: gadget: udc: renesas_usb3: Fix sysfs interface of "role"

 drivers/usb/gadget/composite.c               |  1 +
 drivers/usb/gadget/function/f_mass_storage.c | 28 ++++++++++++++++++------=
----
 drivers/usb/gadget/udc/renesas_usb3.c        |  5 +++--
 3 files changed, 22 insertions(+), 12 deletions(-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl1ROK8ACgkQzL64meEa
mQY+Xw//bTPzmz/jyAPF+I75rYqWIa/8uXRNzvWf0dA2QlV2EtS6LdXIRazy9EWU
Vtivfy5S2RDAUYBZYNuyhKHzF8fZTg37jWierxQySgrDxzZPu+woDVO8CHpdE3za
szj/pRHDVyLR/wiYbUyjegX4+AeDzSNzNKzXbV8H7iYCR/BITwdbE6qD/kN/VzOr
nLh2e53/gjL+KQ5qKJyJaHO1kFLgKY9Hvf2AM9mQkonQqrkuv+yoH+cEOkMzX4Mi
wDkgiu8UKM96N4965+JDR7vPQyFH+ZOu1T9lNFF01/QJ2DwEIyy1K52GY90upLjZ
p2wflsCbDbyDrx4wbWclawrfBMhiHipeixPysAGijQHbjm4EuU2m0ou/MOp2JjEj
PAepmgjWuBbN4am0vzuAtEQ8IuM17z+dsOHmJnBAByAsJJjzcfqLIJt0ztjHlBU4
4sarbuT4UVGfw/SYyM7jRc9jBwO49I+A3mE+yWWGcfd0gAPt6gSaLhng+YtWweIB
K6Dia3C+w8C/+qCOhrLh6b1fEmsID593KSuoY9Qf6QXFJuMNTfSb3nrJuEM6kvwT
GogBZz4+VNPKDtcHw0iXVosqm39xW6LFrBs0Vrw/YKZ9ZSk0rHypLFSdOckLR9C8
np/LbIVo8uFwkEe/bsLLCOzMMluZIEKT+igAGVCv9qI5FHd/N2U=
=bSpz
-----END PGP SIGNATURE-----
--=-=-=--
