Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E89F4FFF43
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 08:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbfKRHDw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 02:03:52 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46676 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfKRHDw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Nov 2019 02:03:52 -0500
Received: by mail-lj1-f194.google.com with SMTP id e9so17542649ljp.13
        for <linux-usb@vger.kernel.org>; Sun, 17 Nov 2019 23:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version;
        bh=60XTquUbrFhwi6o1Xftxbbc9gRf0FoRJJnur8P99Ah0=;
        b=XlguZg9KHWdhRibD2RGMOMRibJqGj7ijLgkS86Kgff5xLMm/cCH+lyjL+gzs4wTIje
         tzcJYhHdU/t7p7v32z3A/wjw4RyICG+40FQ1mRgDRSHlojV9B2Z2Jzu6mN/lP+NDBTil
         QzDUXsMBvLM0WArxzuUR7HjazlVz7QMl/J0QtN5AZoP/wrZ+dt69QS9Sr7a1s6wb/QIv
         M5JszqDl8LOTkJytgbDW7mWuIBrvGScxRQBrwK/z3pEYdC3q+LABGZfMRskxMpAxW8M2
         x3ezKlHxgro3aKCOW2/abrVR/6NZBUm5XpzHWSNytwuL08PXD7rGnfyNfyrYrdch41F9
         +sPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version;
        bh=60XTquUbrFhwi6o1Xftxbbc9gRf0FoRJJnur8P99Ah0=;
        b=MylZzMzYDZ0p3YoqCZafJgLqn7ustYmIFTOqTZ/HE4cQOqgOejzMzPeqU6tMg1Q+d3
         UvO9N45J0oZb2fgCu3yMJuHFZY2llfZLdaRda3npnZrSZOWk2G3U6mciBY+nVvkY3mtZ
         du82XGPSnuqgHjKGU7spcBa8ylZRHM+86HeDgEppz82yRi/biaRf1akYUhThfvwQ5FgE
         dy//GzZs0buSEb5r+h1xbUkSLLlFYqwqXROfD5BsRx+pCZR2obN0UTilFmhLpEoJAmtA
         D/sgpDGKouL27gwNqbNmaekYS1D9luCmTY3Aj3D0i0/J/g+RGbDRb01mIqj0OBwSXvpK
         jQlA==
X-Gm-Message-State: APjAAAXBF5f3PIMI5o1yN3eJJQHjHILf3do07ciNZ9qXAS9qdiTaapBH
        yIFsFlO4IbhCGeviE3FnCJBynBor0kg=
X-Google-Smtp-Source: APXvYqwHE8ycHZD1JS4TDWX++geNnWcFieM3owve4uruMSYqNxFnx/Z+FivlpaL7I8mGNlnGJfMWYg==
X-Received: by 2002:a2e:89c6:: with SMTP id c6mr19898608ljk.113.1574060629145;
        Sun, 17 Nov 2019 23:03:49 -0800 (PST)
Received: from saruman (85-76-32-252-nat.elisa-mobile.fi. [85.76.32.252])
        by smtp.gmail.com with ESMTPSA id w20sm8154528lff.46.2019.11.17.23.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2019 23:03:47 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB changes for v5.5 merge window
Date:   Mon, 18 Nov 2019 09:04:41 +0200
Message-ID: <87eey5psvq.fsf@gmail.com>
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

Here's my pull request for v5.5 merge window. Let me know if you want
anything to be changed.

Cheers

The following changes since commit 7d194c2100ad2a6dded545887d02754948ca5241:

  Linux 5.4-rc4 (2019-10-20 15:56:22 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/usb-for-=
v5.5

for you to fetch changes up to 726b4fba94bec7e4c16bc681316e82455652c3a8:

  usb: dwc3: of-simple: add a shutdown (2019-10-29 12:56:11 +0200)

=2D---------------------------------------------------------------
USB: changes for v5.5

We have TI's glue layer for the Cadence USB3 controller going
upstream. Tegra's XUDC driver is also going upstream with this pull
request.

Apart from these two big features, we have a bunch of patches switching
over to devm_platform_ioremap_resource() in order to simplify code a
little; and a non-critical fix for DWC3 usage via kexec.

=2D---------------------------------------------------------------
Andrey Konovalov (2):
      USB: dummy-hcd: increase max number of devices to 32
      USB: dummy-hcd: use usb_urb_dir_in instead of usb_pipein

Chunfeng Yun (2):
      usb: mtu3: add a new function to do status stage
      usb: mtu3: fix race condition about delayed_status

Colin Ian King (1):
      USB: gadget: udc: clean up an indentation issue

Eugeniu Rosca (2):
      usb: renesas_usbhs: enable DVSE interrupt
      usb: renesas_usbhs: simplify usbhs_status_get_device_state()

Felipe Balbi (1):
      usb: dwc3: of-simple: add a shutdown

Geert Uytterhoeven (1):
      phy: renesas: rcar-gen3-usb2: Use platform_get_irq_optional() for opt=
ional irq

Jayshri Pawar (1):
      usb: gadget: f_tcm: Provide support to get alternate setting in tcm f=
unction

Joel Stanley (1):
      usb: gadget: Quieten gadget config message

Markus Elfring (1):
      usb: gadget: udc: lpc32xx: Use devm_platform_ioremap_resource() in lp=
c32xx_udc_probe()

Mathias Kresin (1):
      usb: dwc2: use a longer core rest timeout in dwc2_core_reset()

Micha=C5=82 Miros=C5=82aw (7):
      usb: gadget: u_serial: add missing port entry locking
      usb: gadget: u_serial: reimplement console support
      usb: gadget: u_serial: make OBEX port not a console
      usb: gadget: u_serial: allow more console gadget ports
      usb: gadget: legacy/serial: allow dynamic removal
      usb: gadget: u_serial: diagnose missed console messages
      usb: gadget: u_serial: use mutex for serialising open()s

Nagarjuna Kristam (1):
      usb: gadget: Add UDC driver for tegra XUSB device mode controller

Nikhil Badola (2):
      usb: fsl: Remove unused variable
      usb: gadget: Correct NULL pointer checking in fsl gadget

Peter Chen (1):
      usb: gadget: configfs: fix concurrent issue between composite APIs

Roger Quadros (2):
      dt-bindings: usb: Add binding for the TI wrapper for Cadence USB3 con=
troller
      usb: cdns3: Add TI specific wrapper driver

Thinh Nguyen (2):
      usb: dwc3: Disable phy suspend after power-on reset
      usb: dwc3: debug: Remove newline printout

Veeraiyan Chidambaram (2):
      usb: gadget: udc: renesas_usb3: add suspend event support
      usb: renesas_usbhs: add suspend event support in gadget mode

YueHaibing (12):
      usb: phy: keystone: use devm_platform_ioremap_resource() to simplify =
code
      usb: phy: mxs: use devm_platform_ioremap_resource() to simplify code
      usb: renesas_usbhs: use devm_platform_ioremap_resource() to simplify =
code
      usb: gadget: at91_udc: use devm_platform_ioremap_resource() to simpli=
fy code
      usb: gadget: bcm63xx_udc: use devm_platform_ioremap_resource() to sim=
plify code
      usb: bdc: use devm_platform_ioremap_resource() to simplify code
      usb: gadget: gr_udc: use devm_platform_ioremap_resource() to simplify=
 code
      usb: gadget: pxa25x_udc: use devm_platform_ioremap_resource() to simp=
lify code
      usb: gadget: pxa27x_udc: use devm_platform_ioremap_resource() to simp=
lify code
      usb: gadget: r8a66597-udc: use devm_platform_ioremap_resource() to si=
mplify code
      usb: gadget: renesas_usb3: use devm_platform_ioremap_resource() to si=
mplify code
      usb: gadget: s3c-hsudc: use devm_platform_ioremap_resource() to simpl=
ify code

zhengbin (2):
      usb: gadget: Remove set but not used variable 'opts' in acm_ms_do_con=
fig
      usb: gadget: Remove set but not used variable 'opts' in msg_do_config

 .../devicetree/bindings/usb/ti,j721e-usb.yaml      |   86 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           |    2 +-
 drivers/usb/cdns3/Kconfig                          |   10 +
 drivers/usb/cdns3/Makefile                         |    1 +
 drivers/usb/cdns3/cdns3-ti.c                       |  236 ++
 drivers/usb/dwc2/core.c                            |    2 +-
 drivers/usb/dwc3/core.c                            |   37 +
 drivers/usb/dwc3/debug.h                           |    4 +-
 drivers/usb/dwc3/dwc3-of-simple.c                  |   28 +-
 drivers/usb/gadget/composite.c                     |    6 +-
 drivers/usb/gadget/configfs.c                      |  110 +-
 drivers/usb/gadget/function/f_acm.c                |   21 +
 drivers/usb/gadget/function/f_obex.c               |    2 +-
 drivers/usb/gadget/function/f_serial.c             |   21 +
 drivers/usb/gadget/function/f_tcm.c                |   13 +-
 drivers/usb/gadget/function/u_serial.c             |  516 +--
 drivers/usb/gadget/function/u_serial.h             |    8 +
 drivers/usb/gadget/legacy/acm_ms.c                 |    3 -
 drivers/usb/gadget/legacy/mass_storage.c           |    3 -
 drivers/usb/gadget/legacy/serial.c                 |   49 +-
 drivers/usb/gadget/udc/Kconfig                     |   11 +
 drivers/usb/gadget/udc/Makefile                    |    1 +
 drivers/usb/gadget/udc/at91_udc.c                  |    4 +-
 drivers/usb/gadget/udc/bcm63xx_udc.c               |    7 +-
 drivers/usb/gadget/udc/bdc/bdc_core.c              |    4 +-
 drivers/usb/gadget/udc/bdc/bdc_udc.c               |    2 +-
 drivers/usb/gadget/udc/dummy_hcd.c                 |   10 +-
 drivers/usb/gadget/udc/fsl_udc_core.c              |   10 +-
 drivers/usb/gadget/udc/gr_udc.c                    |    4 +-
 drivers/usb/gadget/udc/lpc32xx_udc.c               |    6 +-
 drivers/usb/gadget/udc/pxa25x_udc.c                |    4 +-
 drivers/usb/gadget/udc/pxa27x_udc.c                |    4 +-
 drivers/usb/gadget/udc/r8a66597-udc.c              |    5 +-
 drivers/usb/gadget/udc/renesas_usb3.c              |   19 +-
 drivers/usb/gadget/udc/s3c-hsudc.c                 |    5 +-
 drivers/usb/gadget/udc/tegra-xudc.c                | 3810 ++++++++++++++++=
++++
 drivers/usb/mtu3/mtu3_gadget_ep0.c                 |   35 +-
 drivers/usb/phy/phy-keystone.c                     |    4 +-
 drivers/usb/phy/phy-mxs-usb.c                      |    4 +-
 drivers/usb/renesas_usbhs/common.c                 |    5 +-
 drivers/usb/renesas_usbhs/common.h                 |    3 +-
 drivers/usb/renesas_usbhs/mod.c                    |   19 +-
 drivers/usb/renesas_usbhs/mod_gadget.c             |   12 +-
 43 files changed, 4776 insertions(+), 370 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
 create mode 100644 drivers/usb/cdns3/cdns3-ti.c
 create mode 100644 drivers/usb/gadget/udc/tegra-xudc.c


=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3SQokACgkQzL64meEa
mQbGdRAAzD5oigBpzbSH30SDuBXz1yGVoJj/LrgNwTFmdGHC5yKxFbsAX/Ov2Mj/
fJ40uuxyaCMRi87kS5uAd5GdFd7wE2WFMk7zmVor/ht00IjHJ8s7b2ERB5KfbJdP
3yotkVgazPlo6mPT/gPnd3g2R1FDk41b1pAjwtRlZRLmg7KI2t6/+rm3ANVraZuU
1Z5AQY6aAERVuDGZlp1D2AwUw2B7VUvubG91PnlQO833It9NJdoVVPtz+iBvUty+
sr0RPbAoBJr8VvBrGiB+ti1g/RPQtv91MRVq9qDp8PNukm7jmzv9qcIdWhdyXoti
ePSIi6cl0JJgLNL27sJiNkFYW5ZrUgz5aQOYH9uTjE/+mu5BYfULMG1YAhnPv+YR
ONJfDiOXwQrOkbu/5O+2duBTkPORtkU2215OaBEmyph4FELsZDOfhpA4upVhePbC
FXxsN5Kzuvu5YeXvYbWKEISSNBOyVodrDORrfnlP0xtN1HlEGZZGRWOjWwGTUBgf
cf1w9BPb+K5ZElQENGXxRHhQx7QPHJgUNW+/BqOjJCBAqiLgGwa97xOy1ygiHz2D
vPCknAWM2SrqnGUJiVErqo5mfYzF/TJR1ZCGs7SBaWV1Irn2fnA1ktbdMdyEm6n0
UzUFq2hwI9n3i44pOsjjUaVfGEIG9B/Prwjyy8sf6mbm/lc6O80=
=2XsJ
-----END PGP SIGNATURE-----
--=-=-=--
