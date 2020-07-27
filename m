Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48A322EAEE
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 13:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbgG0LNq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 07:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726324AbgG0LNq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jul 2020 07:13:46 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF94C061794
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2020 04:13:45 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b11so8771364lfe.10
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2020 04:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version;
        bh=yLW2PKygP2rBHlKq/REoMcGAkVAFC/OXVS80ugP7Smg=;
        b=QX810ht7KRa9owjrzZ13p91ApF7/VYZOO59SNBOyuAiRElLUIGndziaQyyFkEUIRBQ
         c67izop4g3z+XTkf1tT4dQk8Q2a07oq7r2qr5APssP/YxlDggswfT5wltlEK0EbgGqdt
         cbwf1TNFohBbPiJHXnB7SnfgtvQ/OZiAcPZUbeEwF5ZhwjgY+UZzdMl4JEJAsLSweH1H
         p8B76l/As+cU5WZk9GrwTIPhm1cWvwpGTybSG6T1UDQv76eD1zRnY0wIinbJizwweBA8
         eaZM0ZH+zPV3rBzLDM26UgtKw0IoRa5r5qCLoYi+LgrIzegLY9Wzka1EQJb8S26vlsCQ
         jtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version;
        bh=yLW2PKygP2rBHlKq/REoMcGAkVAFC/OXVS80ugP7Smg=;
        b=Qc5mLLJmxoAbMMuJZAqJ/MSPKaNVGVItpNJgO/wzeCkqkKjNuzdC2O0jzCPFscY0lv
         dVwX7SqVDYNcgl2j0o+94Z1L3Cqzy1fQaznDqg8C4o+iW4L5N+lUrjRNUtI9gKuP2oJy
         tL4DCZ50sbZB15aPX/inZKBOiJdtJHvaW2Zn2KDjs2AGO8gZ6ZlK6ptVhuoWQ1U0mU6t
         FbC5eisU2UpB4ikD9D+Jng5p2jADXe6HQCQhJsxqRPmhpUx/iBTl7XTwDvJiAq18Ru6h
         mCOV5rEynbv1PK4vKWqQ2b2qyrDehvwc9kdrJEh7Jdd4dXFI+WpqJlFsxx+7/DX6duPN
         /M/Q==
X-Gm-Message-State: AOAM530XDP9bf8TNzo/0X5ITaJzeQjO+r1pk4ci6u7onIDMwdqzI5i8l
        Uq/4YGsHxsXgjx1f8WcTjnEY69ok
X-Google-Smtp-Source: ABdhPJzvhADYahGbg2kv6l2X+umErUhVFReo2GDUUfspfn0kIbTYujBvBbzSxak4b2O4PeBUwNl8Cg==
X-Received: by 2002:ac2:522b:: with SMTP id i11mr11677492lfl.30.1595848423314;
        Mon, 27 Jul 2020 04:13:43 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id b6sm2289493ljj.89.2020.07.27.04.13.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jul 2020 04:13:42 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB changes for v5.9 merge window
Date:   Mon, 27 Jul 2020 14:13:38 +0300
Message-ID: <87d04hnrbx.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi Greg,

here's my pull request for v5.9. I have rebase on your usb-next one week
ago to avoid merge conflicts. Let me know if you want anything to be
changed.

cheers

The following changes since commit c17536d0abde2fd24afca542e3bb73b45a299633:

  usb: usbfs: stop using compat_alloc_user_space (2020-07-22 13:13:22 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/usb-for-=
v5.9

for you to fetch changes up to f5e46aa4a124bfac34a770c4cfe5023de99380d4:

  usb: dwc3: gadget: when the started list is empty stop the active xfer (2=
020-07-24 16:45:15 +0300)

=2D---------------------------------------------------------------
USB: changes for v5.9 merge window

CDNS3 got several improvements, most of which are non-critical fixes.
DWC3 has a reset fix for the meson platform, while dwc2 has
improvements for role switch on STM32MP15 SoCs.

Apart from these, we have the usual set of non-critical fixes all over
the place and support for new Ingenic SoC to their PHY driver.

=2D---------------------------------------------------------------
Al Cooper (4):
      dt-bindings: usb: bdc: Update compatible strings
      usb: bdc: Add compatible string for new style USB DT nodes
      usb: bdc: Adb shows offline after resuming from S2
      usb: bdc: driver runs out of buffer descriptors on large ADB transfers

Amelie Delaunay (2):
      usb: dwc2: override PHY input signals with usb role switch support
      usb: dwc2: don't use ID/Vbus detection if usb-role-switch on STM32MP1=
5 SoCs

Chunfeng Yun (1):
      usb: gadget: bdc: use readl_poll_timeout() to simplify code

Dan Robertson (1):
      usb: dwc3: meson-g12a: fix shared reset control use

Danesh Petigara (1):
      usb: bdc: Halt controller on suspend

Evgeny Novikov (2):
      usb: gadget: net2272: skip BAR1 on error handling paths in probe
      usb: gadget: net2280: fix memory leak on probe error handling paths

Florian Fainelli (1):
      usb: bdc: Use devm_clk_get_optional()

Marek Szyprowski (2):
      usb: gadget: udc: Flush pending work also in error path
      usb: dwc2: Fix error path in gadget registration

Michael Grzeschik (2):
      usb: dwc3: gadget: add frame number mask
      usb: dwc3: gadget: when the started list is empty stop the active xfer

Michael Olbrich (1):
      usb: dwc3: gadget: make starting isoc transfers more robust

Micha=C5=82 Miros=C5=82aw (1):
      usb: gadget: udc: atmel: implement .pullup callback

Pawel Laszczak (9):
      usb: cdns3: core: removed cdns3_get_current_role_driver function
      usb: cdns3: drd: removed not needed variables initialization
      usb: cnds3: drd: deleted !=3D
      usb: cdns3: drd: return IRQ_NONE explicitly.
      usb: cdns3: drd: changed return type from int to bool
      usb: cdns3: Added CDNS3_ID_PERIPHERAL and CDNS3_ID_HOST
      usb: cdns3: core: removed 'goto not_otg'
      usb: cdns3: core: removed overwriting some error code
      usb: cdns3: drd: simplify *switch_gadet and *switch_host

Peter Chen (3):
      usb: cdns3: gadget: improve the set_configuration handling
      usb: cdns3: ep0: delete the unnecessary operation
      usb: cdns3: gadget: always zeroed TRB buffer when enable endpoint

Roger Quadros (1):
      dt-bindings: usb: ti,keystone-dwc3.yaml: Improve schema

Ruslan Bilovol (1):
      usb: gadget: f_uac2: fix AC Interface Header Descriptor wTotalLength

Sasi Kumar (1):
      bdc: Fix bug causing crash after multiple disconnects

Zqiang (1):
      usb: gadget: function: printer: Interface is disabled and returns err=
or

=E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) (4):
      dt-bindings: USB: Add bindings for new Ingenic SoCs.
      USB: PHY: JZ4770: Unify code style and simplify code.
      USB: PHY: JZ4770: Add support for new Ingenic SoCs.
      USB: PHY: JZ4770: Reformat the code to align it.

 Documentation/devicetree/bindings/usb/brcm,bdc.txt |   4 +-
 .../bindings/usb/ingenic,jz4770-phy.yaml           |   6 +-
 .../devicetree/bindings/usb/ti,keystone-dwc3.yaml  |  51 +++-
 drivers/usb/cdns3/core.c                           |  39 +--
 drivers/usb/cdns3/drd.c                            | 165 ++++++------
 drivers/usb/cdns3/drd.h                            |  13 +-
 drivers/usb/cdns3/ep0.c                            |  18 +-
 drivers/usb/cdns3/gadget.c                         |  10 +-
 drivers/usb/cdns3/host.c                           |   4 +-
 drivers/usb/dwc2/Kconfig                           |   1 +
 drivers/usb/dwc2/Makefile                          |   2 +-
 drivers/usb/dwc2/core.h                            |   8 +
 drivers/usb/dwc2/drd.c                             | 190 ++++++++++++++
 drivers/usb/dwc2/gadget.c                          |   2 +-
 drivers/usb/dwc2/params.c                          |   4 +-
 drivers/usb/dwc2/platform.c                        |  17 +-
 drivers/usb/dwc3/dwc3-meson-g12a.c                 |  15 +-
 drivers/usb/dwc3/gadget.c                          |  30 ++-
 drivers/usb/dwc3/gadget.h                          |   2 +
 drivers/usb/gadget/function/f_printer.c            |  36 +++
 drivers/usb/gadget/function/f_uac2.c               |   7 +-
 drivers/usb/gadget/udc/atmel_usba_udc.c            |  20 ++
 drivers/usb/gadget/udc/bdc/bdc.h                   |   2 +-
 drivers/usb/gadget/udc/bdc/bdc_core.c              |  53 ++--
 drivers/usb/gadget/udc/bdc/bdc_ep.c                |  16 +-
 drivers/usb/gadget/udc/core.c                      |   1 +
 drivers/usb/gadget/udc/net2272.c                   |   2 +
 drivers/usb/gadget/udc/net2280.c                   |   4 +-
 drivers/usb/phy/Kconfig                            |   4 +-
 drivers/usb/phy/phy-jz4770.c                       | 284 +++++++++++++++--=
----
 30 files changed, 731 insertions(+), 279 deletions(-)
 create mode 100644 drivers/usb/dwc2/drd.c

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8etuIACgkQzL64meEa
mQbf4Q/9FXfgKvIaLRpPQNoxI6t0aciN/mq3Wr3EZT7eIY5Dp9aXzgEwKKlcVl1s
x96NQ3U6v5kXDSv05rEUVQWtUhVbvaG2bI/CE6gXgeDVW0l6jDRzZ/5P4GBIzVCP
m35Mzc1JiLbShlZ1MNolOnGVu5F5Xswco49QzSUtvmtf2hkSH+EbLYKqoZqqYEZs
6ZvHj5zmjGG/iXQRhgtPqNeYPoWFy/LcY+FNaDFEJnKw7j70y/Do/xxKEkvjp1xP
yQhTrh9uligY/oJcOfB4vTCsesJEB0eUcNhO1eZHT/2TxMhFf/5zme9ECjGOb7sY
qbSkcy9SsttGD7WA3K+f6EixIMOyXriieaLbasXVu290Aw+j3aCMW2Nj60j+p5up
k3BGIiIXeFpXeBtzEbHZOBpWCYI4MRoDQ+hDMvJdqVxrpDcidc2pa9I6+wq3tMLm
onPNp2NseH3iLhlJcP02bhYYr/TAONvmNS5MoerTg4jnH5IVXR6yIDWD/rN8RVNB
+CfSFNbVNq8dq3Q0yLWvKIIQsPxvqxzzqeeqUg2l8q5eAL1cl253+pWHvvEja5iz
/Sa9vPNAboMVZJulAI8zMpQoZpp4A6nHm26/O3MnZWDXrYXnYW2wE6bFonLJNmdl
b88mBd78OUZncgya5qBTOEHg+vlkYiMf8b+jF2WLCUJ97jh++ho=
=SpwA
-----END PGP SIGNATURE-----
--=-=-=--
