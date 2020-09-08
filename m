Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C1B260C42
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 09:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729390AbgIHHmS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 03:42:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:53306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729257AbgIHHmQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 03:42:16 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34D5F21D43;
        Tue,  8 Sep 2020 07:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599550935;
        bh=hKaHRpJbDAP61mlogxx+J36aBTwOe6e8JVopyzdIpE8=;
        h=From:To:Cc:Subject:Date:From;
        b=rJ9M26T8J4MM5NxL9udShVlCVKBH9/ouIl8rRcb6zqnSdSi0wCgUdhHb920kHrMny
         9/wERNivxgetIzUrIjKPAxW34rD5ex6H7+gqIqAamyL3nEZuPxy6o6F7apzEo2QcTg
         BAmltvr9wnrfqgRxeYKaR4y0N6MDO6Nb8tXpGZKU=
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB: fixes for v5.9-rc4
Date:   Tue, 08 Sep 2020 10:42:09 +0300
Message-ID: <87y2lklnou.fsf@kernel.org>
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

Here's my second pull request for the current -rc cycle. Not much going
on, I wonder where are all the bugs :-p

Nothing major here, simple fixes that have been around for some
time. Let me know if you want me to change anything here.

Cheers

The following changes since commit f4d51dffc6c01a9e94650d95ce0104964f8ae822:

  Linux 5.9-rc4 (2020-09-06 17:11:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-fo=
r-v5.9-rc4

for you to fetch changes up to ea4bbb80b523b723ec01dcffa9c50af3ba8cf5b4:

  usb: cdns3: gadget: free interrupt after gadget has deleted (2020-09-08 0=
9:16:41 +0300)

=2D---------------------------------------------------------------
USB: fixes for v5.9-rc4

Support for Hikey 970 has been added on dwc3-of-simple; cdns3 learned
that once the gadget is removed, its interrupt should be freed; dwc3
also got improvements to how we handle CLEAR_STALL requests.

=2D---------------------------------------------------------------
Mauro Carvalho Chehab (1):
      dwc3-of-simple: add support for Hikey 970

Peter Chen (1):
      usb: cdns3: gadget: free interrupt after gadget has deleted

Thinh Nguyen (2):
      usb: dwc3: gadget: Resume pending requests after CLEAR_STALL
      usb: dwc3: gadget: END_TRANSFER before CLEAR_STALL command

 drivers/usb/cdns3/gadget.c        |  2 +-
 drivers/usb/dwc3/core.h           |  1 +
 drivers/usb/dwc3/dwc3-of-simple.c |  4 ++-
 drivers/usb/dwc3/ep0.c            | 16 +++++++++++
 drivers/usb/dwc3/gadget.c         | 56 ++++++++++++++++++++++++++++++-----=
----
 drivers/usb/dwc3/gadget.h         |  1 +
 6 files changed, 65 insertions(+), 15 deletions(-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9XNdERHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQanuBAAm+bUNV4JcOIcot4pzPJ42pfW8/Lh/bpv
KhUWyuo7FMATHikHBZZ4qQhf5xpeqPXbIOoZy0PXK3ZZdx/EitMK4ht6bLdyK/pL
T3mALQExwAIi6sTy/rX33SkhvCtiDcEx1q3IzWSb3vGpypNgC3KeOXyEOOCF7U3m
epfrvLsCq//NL0UbPqosG1syNvUdhom65sOPoBRzokrka4JkRrsqnJ0pHuMyjzGp
2Q06JDrVbyZfRjPvoCBvqjWxYR7rIF8cjei4B49fqdmbQI7MJBWUwleBDQ7uKyTG
Bp7gB72XVANO0I2x5x2xqPS0/8cILhzfN+o/STUAVO/8plYN1RBm5fEw7PxkhUTy
Bat22UA6DSXSvh6jlxr7Cw0RK8hV2kOQ+hE51d0QECxRT9nZhJlwcnlilBAL0V7Z
uUqsL5tggEu1PvlAZQ789AlmwG1OKerFz6fAtAZxWBrg7kHn+MtaM0xnhLbTpEo4
ijS4GRaJp3++TU48vwXodf/2XAhVeHWZVR1/3bf3G+R+349wIDSF8QrRl6Eq/WGa
PEPA7zUw8YN5r4oQHnDEFjcnq7nXu0j19PVmZcS/C/pJLBmQoOhYL37x51WPYg9V
wCK0wxOJdyv/yJN5mpHmZoRaRDeC7UXRijq7Nce+QsuromzaM8a4UtdTEFFsadI9
1uavai/bw8k=
=Sw7X
-----END PGP SIGNATURE-----
--=-=-=--
