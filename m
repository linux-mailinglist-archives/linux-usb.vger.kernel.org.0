Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49D5F38455
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 08:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfFGGdg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 02:33:36 -0400
Received: from mga09.intel.com ([134.134.136.24]:57657 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726248AbfFGGdg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Jun 2019 02:33:36 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Jun 2019 23:33:35 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga004.jf.intel.com with ESMTP; 06 Jun 2019 23:33:32 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB: fixes for v5.2-rc4
Date:   Fri, 07 Jun 2019 09:33:29 +0300
Message-ID: <87o939dhvq.fsf@linux.intel.com>
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

Here's my first set of fixes for this -rc cycle. Looks like most of what
I have in my inbox these days are new features. Very little fixes. I
guess folks are writing perfect code now :-p

Let me know if you want anything to be changed.

Cheers

 _________________________________=20
< That's some perfect C, partner. >
 ---------------------------------=20
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

The following changes since commit f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a:

  Linux 5.2-rc3 (2019-06-02 13:55:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-fo=
r-v5.2-rc4

for you to fetch changes up to 42cc68868ce9d5f5277f561bb17b4746a332bb28:

  usb: gadget: udc: lpc32xx: fix return value check in lpc32xx_udc_probe() =
(2019-06-06 13:51:57 +0300)

=2D---------------------------------------------------------------
USB: fixes for v5.2-rc4

DWC2 gets a fix for zlp handling which allows DWC2 to pass USBCV MSC
tests.

A memory leak in fusb300 was plugged.

DWC2 also got a fix for wMaxPacketSize handling while acting as host
which fixes a regression with USB Cameras.

Apart from these, the usual set of minor fixes.

Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>

=2D---------------------------------------------------------------
Alexandre Belloni (1):
      usb: gadget: udc: lpc32xx: allocate descriptor with GFP_ATOMIC

Andrey Smirnov (1):
      usb: phy: mxs: Disable external charger detect in mxs_phy_hw_init()

Andrzej Pietrasiewicz (1):
      usb: gadget: dwc2: fix zlp handling

Douglas Anderson (1):
      usb: dwc2: host: Fix wMaxPacketSize handling (fix webcam regression)

Martin Schiller (1):
      usb: dwc2: Fix DMA cache alignment issues

Minas Harutyunyan (1):
      usb: dwc2: Set actual frame number for completed ISOC transfer for no=
ne DDMA

Wei Yongjun (1):
      usb: gadget: udc: lpc32xx: fix return value check in lpc32xx_udc_prob=
e()

Young Xiao (1):
      usb: gadget: fusb300_udc: Fix memory leak of fusb300->ep[i]

 drivers/usb/dwc2/gadget.c            | 24 ++++++++++++++--------
 drivers/usb/dwc2/hcd.c               | 39 ++++++++++++++++++++++----------=
----
 drivers/usb/dwc2/hcd.h               | 20 +++++++++---------
 drivers/usb/dwc2/hcd_intr.c          |  5 +++--
 drivers/usb/dwc2/hcd_queue.c         | 10 +++++----
 drivers/usb/gadget/udc/fusb300_udc.c |  5 +++++
 drivers/usb/gadget/udc/lpc32xx_udc.c |  7 +++----
 drivers/usb/phy/phy-mxs-usb.c        | 14 +++++++++++++
 8 files changed, 82 insertions(+), 42 deletions(-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlz6BTkACgkQzL64meEa
mQYyVA/+OEFcEZAR73MrTYaiqoQnGS2KCGKiQXuIGEDUWSuE+mn6S2L6E+/4ibhg
DWihKeG2vldhHIbm52OfM/UNa2EqLhCj95oRNTXLoC4frEUfFv6Yx91wu2CwANqn
M69cqJp1Pi8Ib9QBdiLimJWyzJkZOaGl271SsrzNIeA8zrhtiFmINFzU2JvkscVz
U/cj9Hxhf6Kkm9pM+zsckrRE+zC8ssJwwKZ2nZmIAqyLLYVK6L4edKw7JoHDDCEt
YWL1OWDvuiq4IZ+9IZCd0RYestcrlshrmTv7+jQ0lH3Kro3gxy6EzFkhKHDBDpBM
ZCXpqwgJGq/cE2sdrv/7DuojCDyLGp6x8GyjQdEl97NEMMBaEW2N7lLfo76lKvv0
Xab62W6vjl/ZK/p8rkNQjwxuRr93qmTp8xnP66kErGqN0X0MQ/o2jSiDi+ExEvS8
krW+uEJZ8SZCUMaBKa3HMdUy15l6+ofIPR1JMy0XwwjSW8ETbeu7/c1DLEa3YESP
8n/WAnFuVzQYwLhuIHPYvLNHYydHkLfXL8sh4StzjIj4CEgjfhUvgEiR2e2cBL8Z
wnwEZdcM1RTPKKjjkuwFSzZiTNm0QbMS4b3CIWVJCB5D8wXYXmmEJ6LEJs7xyBEM
q97PYu8L/KsSzsG3ziesb16O58HkYWm4o6DIbszEX59AlqbYKh8=
=hVcn
-----END PGP SIGNATURE-----
--=-=-=--
