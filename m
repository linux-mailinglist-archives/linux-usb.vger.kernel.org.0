Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4282113BC1F
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 10:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728963AbgAOJM4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 04:12:56 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33911 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbgAOJM4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 04:12:56 -0500
Received: by mail-lj1-f195.google.com with SMTP id z22so17711334ljg.1
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 01:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version;
        bh=2ifwLGTtd29dCZtpbLy7YngaE9x47uAwghr6gi3NHZc=;
        b=tD+Y+CokLjIjvafYZENl/h8OxUUMf7Cs6YulLoYwm+X6d8bYWlh8wF4PUgi40PgWBx
         86qNxOaOfu3lSeYwYEw4l14tToTpqGIdf+QMeTUERhLaUE35qeJ0aBIdp7SolJm15frF
         5e64mZXCAgv+3A0Uowow+1tCVovCI8AmJDlg1hiVkhk9yE3lqkGi5S8Mi2qW6x5aN4pX
         rDZc4ClN7/O1OZC0R+i9jntWYORs9mP2ziJ6cKz0WhyjkBOCM027b7yWub97rQf4jo3y
         DH/bQILZu0F0o59jr6szOQleGNGxaPO5TkvZfRm8xr1vDFhiSrQ4b6ii06xX1EmEFmyE
         K9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version;
        bh=2ifwLGTtd29dCZtpbLy7YngaE9x47uAwghr6gi3NHZc=;
        b=RWhQVjna7U5YuCK/IOxIuNGuWn9p1/5/zMfUnhT2BSTw8pAOeoyTXGknjs/49DiMZR
         fcUyrSYYVppj6qtYCkPbQd+gNUrzGMI3lMshwt8JI0sR9e9Wq3n42PGiHzRwCuNjNZ52
         GqOgci3L7JAxvSdVvuCeUKMt8Q3jxuczeLXzc/8wM1jZzZ67i7UpWfvYykCM8fDigMYt
         WUEg8BE8PKh0NUma0tF0yebHSo568i3q3Om7NL3rGZVd3rnIPnY9pY+YcBgdDiy/j7Be
         wd5q3nrH5Y8xV3Jg055LMk0oE4qw8mGmcjRc4y6gI2Iz0cPZyFthjJleyXg/HTfSheKP
         Acbg==
X-Gm-Message-State: APjAAAUT2kRtrg6ZVyxazsnMhLJG86cH+BlwXreiRABdeUVnFk4X7aw5
        jRRpRVNWIFlVt4Z6GlaEMJvk00YHDnPn8Q==
X-Google-Smtp-Source: APXvYqwr5T8tuFV4akpxtDmPhDnXXioXb4fndTkvMQgQ050p9rJVlBQNy5fFBbppV28W59CJJpCAvw==
X-Received: by 2002:a2e:6c13:: with SMTP id h19mr1130748ljc.221.1579079573680;
        Wed, 15 Jan 2020 01:12:53 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id q17sm8897219ljg.23.2020.01.15.01.12.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 01:12:52 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB: changes for v5.6 merge window
Date:   Wed, 15 Jan 2020 11:13:54 +0200
Message-ID: <87blr56q0d.fsf@kernel.org>
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

here's my pull request for v5.6 merge window

The following changes since commit 845f081002eebd7a1216fc0a5ef2c862dc6d093e:

  Merge 5.5-rc6 into usb-next (2020-01-13 12:11:40 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/usb-for-=
v5.6

for you to fetch changes up to 8d891e324f4452ff1a0b324a2474b44ef04b491c:

  usb: gadget: f_ecm: Use atomic_t to track in-flight request (2020-01-15 1=
0:58:58 +0200)

=2D---------------------------------------------------------------
USB: changes for v5.6 merge window

A few important, albeit non-critical, fixes on dwc3 done by Thinh
Nguyen.

The cdns3 driver got ported to NXP, while also learning about streams.

Other than these highlights, we also have the usual set of non-critical
fixes all over the place.

Signed-off-by: Felipe Balbi <balbi@kernel.org>

=2D---------------------------------------------------------------
Alexandru M Stan (1):
      usb: dwc2: Fix NULL qh in dwc2_queue_transaction

Bin Liu (1):
      usb: dwc3: turn off VBUS when leaving host mode

Bryan O'Donoghue (2):
      usb: gadget: f_ncm: Use atomic_t to track in-flight request
      usb: gadget: f_ecm: Use atomic_t to track in-flight request

Dejin Zheng (1):
      usb: gadget: udc: core: Warn about failed to find udc

Jayshri Pawar (1):
      usb: cdns3: Add streams support to cadence USB3 DRD driver

Jia-Ju Bai (1):
      usb: gadget: udc: fix possible sleep-in-atomic-context bugs in gr_pro=
be()

John Keeping (3):
      usb: dwc2: Fix IN FIFO allocation
      usb: dwc2: fix debugfs FIFO count
      usb: gadget: f_uac2: fix packet size calculation

Linus Walleij (1):
      usb: phy-generic: Delete unused platform data

Minas Harutyunyan (1):
      usb: dwc2: Fix Stalling a Non-Isochronous OUT EP

Peter Chen (2):
      usb: gadget: f_fs: set req->num_sgs as 0 for non-sg transfer
      usb: cdns3: add NXP imx8qm glue layer

Roger Quadros (1):
      usb: gadget: legacy: set max_speed to super-speed

Thinh Nguyen (7):
      usb: dwc3: gadget: Don't send unintended link state change
      usb: dwc3: gadget: Set link state to RX_Detect on disconnect
      usb: dwc3: gadget: Clear DCTL.ULSTCHNGREQ before set
      usb: gadget: configfs: Add max_speed setting
      usb: dwc3: gadget: Check END_TRANSFER completion
      usb: dwc3: gadget: Delay starting transfer
      usb: dwc3: gadget: Remove END_TRANSFER delay

 Documentation/ABI/testing/configfs-usb-gadget |   4 +
 drivers/usb/cdns3/Kconfig                     |  10 +
 drivers/usb/cdns3/Makefile                    |   1 +
 drivers/usb/cdns3/cdns3-imx.c                 | 216 +++++++++++
 drivers/usb/cdns3/gadget.c                    | 533 ++++++++++++++++++++++=
+---
 drivers/usb/cdns3/gadget.h                    |  26 +-
 drivers/usb/cdns3/trace.h                     |  93 ++++-
 drivers/usb/dwc2/debugfs.c                    |   3 +-
 drivers/usb/dwc2/gadget.c                     |  25 +-
 drivers/usb/dwc2/hcd.c                        |   2 +-
 drivers/usb/dwc3/core.c                       |   3 +
 drivers/usb/dwc3/core.h                       |   2 +
 drivers/usb/dwc3/ep0.c                        |   4 +-
 drivers/usb/dwc3/gadget.c                     |  56 +--
 drivers/usb/dwc3/gadget.h                     |  14 +
 drivers/usb/gadget/configfs.c                 |  43 +++
 drivers/usb/gadget/function/f_ecm.c           |  16 +-
 drivers/usb/gadget/function/f_fs.c            |   2 +
 drivers/usb/gadget/function/f_ncm.c           |  17 +-
 drivers/usb/gadget/function/u_audio.c         |  10 +-
 drivers/usb/gadget/legacy/cdc2.c              |   2 +-
 drivers/usb/gadget/legacy/g_ffs.c             |   2 +-
 drivers/usb/gadget/legacy/multi.c             |   2 +-
 drivers/usb/gadget/legacy/ncm.c               |   2 +-
 drivers/usb/gadget/udc/core.c                 |   2 +
 drivers/usb/gadget/udc/gr_udc.c               |  16 +-
 drivers/usb/phy/phy-am335x.c                  |   2 +-
 drivers/usb/phy/phy-generic.c                 |  39 +-
 drivers/usb/phy/phy-generic.h                 |   3 +-
 drivers/usb/phy/phy-keystone.c                |   2 +-
 include/linux/usb/usb_phy_generic.h           |  12 -
 31 files changed, 1010 insertions(+), 154 deletions(-)
 create mode 100644 drivers/usb/cdns3/cdns3-imx.c

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4e19IACgkQzL64meEa
mQaHhQ/+KyNIlZkzUzzNxOwD94yVnzxXUzYan38OvsL/YvL9nhQl9DAfBXoS5jAq
+TybvCPJ57Tl3ciViRzAtMOLjqtcUHW/ak2zP2ZSo9TIhLDaTVJTRL90rz2IcJWq
F7BlBgFGIE1MwF9zyknpyR0Jy6h1qzCDibABRLg2z13bV45clCPjFF8GhCEK8brE
Fz7Rxw7SyD6ReL6h5udj6FLRY3WePoqxq0kci0AKi1zfmiMZiQ1sg4mOEM0eqFE3
sKp8RrHZUI20tcwKAnvdh6BipidpyFhWumalbl5/ZOFb3bK5wE3pADyIW/1Vma6w
lzHCuX2mex1HhkUr9ZZpZty99Dw7LqTXxFF/FyobFRz2QjAfkB3TxHFKuW17Rs6f
wO3q4xeRO+BUgT/4rvTjmiCJcOJrTQoRXeM8aLqra4LItxB4wK1WWgOQommW1dnd
n2sKhmI2GDarvHyQM/Kl7tzFAbrh6xtE8cZgPshqWxxBafMdTeWdsfdAV1mGOGls
H8UgyyEZf+vzJyroiRcggxdQ2SDmvFvSAV9x0DP8c7MLVc8dyQSfhLcVCarbrsxi
v0XqdfEljIySk4z6Ra+HYMDRbKWWqYpmr6rM/sJQ87iQnienIoqzrJVJKT1Sl6hx
VgePGAD4dtgdQCb5E2hCrrYgZi9HEiPLhqRkZZQvMdzyKdV0TBU=
=aE3U
-----END PGP SIGNATURE-----
--=-=-=--
