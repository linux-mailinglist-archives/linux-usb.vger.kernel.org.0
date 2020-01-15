Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E63313BC20
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 10:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729048AbgAOJNa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 04:13:30 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42320 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbgAOJNa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 04:13:30 -0500
Received: by mail-lf1-f68.google.com with SMTP id y19so12113917lfl.9
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 01:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version;
        bh=nRBQOHw4Z5izn/Wsr8AytPNgrWfFSlrAHrea5jgEmRQ=;
        b=R6dh5vBPhpBCcx7Y5ucqwdAIn+/5wWTfogmjhiXVlp7R//PxyoSg5bX1NS9sEE//94
         kgpTGQca0lE+Qlj06vmk2onoma+QcPcX+mQEgYYdnp9E0PDN1yYFk+sAwh08buBnPeTs
         tuIPsGT9cOJ9WfaLIvUoh0k1spaZ179RA/yz7tVsFF8FekksbxGtO9QT+4zAWlbU/hF9
         56zmXk1lYN0/S5iNsL4X1uYf3QCwK5B5pwr1+kGgf4PRCHG6RGviMdmvU2nGTtdqZ6TS
         HjpwAHFSBWl1gaoB3znZs3t9fL6LtHgzfAwLbf2TC2uU+1GvWMwfO5ywHJwIC1IOmqZx
         lMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version;
        bh=nRBQOHw4Z5izn/Wsr8AytPNgrWfFSlrAHrea5jgEmRQ=;
        b=aBfjJJ17gpYh642BPNHpYKAFjp8QaoSH+V9UKhEkZrYA3phNvwBnm7voCaHourryhJ
         xdibYd/rFe7JR7hssu4JCW1bX/eaAzcQ0FqEkZ0q8WzhHFowmndbHCCh9jAdh0u0e6/+
         prXKUxajA70Eb9TXAYcnHD+2XJDIOU+tUfKa9dXRUw3gGsH55F8DnqNIAO6h+TQVbvq0
         ZnVKOOW1Y+SCZ4i9lBDTENwgzfBBgS1isx/6QQUTtapV84UIB0ZXyK6fMCPh4zLXFGEB
         /hi0Z/WGIACAEgzxfpjSMpzYyajvg+kL9E2bLbiC5zSfHTHVEwGXgpRlBTaykas8N2eH
         Jj5w==
X-Gm-Message-State: APjAAAXy/QpucHofDms6J2FmfpfF9Ciwa9m55NpQQljRBvO3LnQAgg+6
        9wft94+ZVVjbFqvdvm+J4CqvlfUxujtmFQ==
X-Google-Smtp-Source: APXvYqyKhApI6rWUQyEuHfC3d+Hcm9VtqN84prIZvS2N3/npMCxINK2jKEShZHF9Ii7CFatreSuQGQ==
X-Received: by 2002:ac2:508e:: with SMTP id f14mr3810147lfm.72.1579079607110;
        Wed, 15 Jan 2020 01:13:27 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id i4sm8796007ljg.102.2020.01.15.01.13.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 01:13:26 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB: changes for v5.6 merge window
Date:   Wed, 15 Jan 2020 11:14:28 +0200
Message-ID: <878sm96pzf.fsf@kernel.org>
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

here's my pull request for v5.6 merge window. If you want anything to be
changed, let me know.

cheers

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

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4e1/QACgkQzL64meEa
mQbM0hAAj8+GAg8pvXcgSzIzz/UTfL5uaKIDhyqGOfyywSzXUm8NmghgTs1N7SEB
bPwiPmLaNWVEWCr8zQ/B19dZ82gM1Z3xatpnHP3TUarNz2lYA7+5hb7yFEGBTnWf
s76vfozaCavTYgBfhqsOg88eEqIy3lvomj1G0DfYc9+oolc7fWDV8Qthy1nPzzrn
R1ujl1WJDhd/JPczXX7poPF09+mGKeruFJxYu/592OFkJHureAmE+sCfuuvZAbbS
oN6F4AaCUDWxBKCPgmxcYH2ypM06XXdJtKbE2Fe6P9mZoGvCBeh6rSfrvbUy9QWP
tmaNI17f/XoNBM0aeQ3/nXlgNzinXn7LrMn4KHg9DaYUJLfy2CcXpOwoD/LsX88c
QaLDFcdSyDlv1PPgjn832uXE/0iFMF54NZ0JuXiPwkt8WuyisBeMNzSDWoYXdN2h
Al+s4+zFqB0yeLpjhrmkJobDKbqztXF1RFqn2DqTuv/OunJ4OvHXPGFfYPxnNcSJ
fby7bXxHbiouI8ZXF6hj6byrNKy7L+y65V2aZcz3SKtYzLqgwYSIUIYYfweaD3UW
ciSV73Y4t68GTClMszYo9Rbvi9f1klW4zZVzSrPUS5e1eY5qbNE2EAZZnmW0WV+A
Onxkm8FEbUKdbjJFnd+zflGjtzUKdJ075+22XRzsqDgQDlVy44I=
=5n6w
-----END PGP SIGNATURE-----
--=-=-=--
