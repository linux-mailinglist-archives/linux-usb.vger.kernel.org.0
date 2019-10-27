Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65741E6160
	for <lists+linux-usb@lfdr.de>; Sun, 27 Oct 2019 08:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfJ0HJp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 27 Oct 2019 03:09:45 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38035 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbfJ0HJo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 27 Oct 2019 03:09:44 -0400
Received: by mail-lf1-f68.google.com with SMTP id q28so5394455lfa.5
        for <linux-usb@vger.kernel.org>; Sun, 27 Oct 2019 00:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version;
        bh=Zac9jE4DCkPuACytDutStj7TnphRwfDlbsiPxHJZvGQ=;
        b=lNkEI+qeiyMjDBtKDnRXW2mdZvnAgXq3h0TkxDzFIHR9p9ZRUJnhz8lL1DRe9knMwm
         8b5NB0oxptvyH7Cd1zBeJuAqeRoq7JVC7VfNqhkMOWekqMqyXisO7koKtA+5/29od6DG
         4tNIm2M2b2TfKTMxO/qKMSpKnPzg5KNwXFy22wopoKhYHon3cDDNsUzC4DOtLfwD/ddo
         XmWE5MxyB9X7G/wLPO4rXbKvfGvHtMgUbzX+cYqskDkF8j91ohndmzebBpkMhvcG4Tc0
         KzWbC72RIFkZIgPXS0xWoBLYp3FxchI4k4Re3C3/Y5R3ItFUoBTlJltIqwQ/LxXnpP6U
         GjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version;
        bh=Zac9jE4DCkPuACytDutStj7TnphRwfDlbsiPxHJZvGQ=;
        b=aeLX4gDzUuEkz5ADqiJ6Ix/AxLJEUsJWLI5G0UlcLJSRUmeFMcXA1TX/MPWTTkjPO6
         7W2TzqKHdwRc3iaNOnwHXVqASZkwbv0I/5CmHAE4E9nvju+KI1rHz5AoUJVYshpQ8CGB
         bukavQhlsmIP4Xfyh3iNmO7uwXOwT/IkVtTNm2B4x2DCMCGMxiM3TjMj7esZOkSkIEUH
         uQV5mLlpl9Wsxo2uH91VXHgfWWoHxGmbA4y7N0d4oAgssiMT9/enLo/UMLSSyuy45+6R
         7fw0z63zBg1LNbEZYHy62VDSC9CjieLkIYs/r2L0NIQOGwmVTwFhw9CKZUj/PpOWrtmp
         hU9A==
X-Gm-Message-State: APjAAAWH06aNyHNTgVGClfHBg7Plsnh6uoK2k9bdGZ7cvV9VSVewoP/6
        6pVRegT7xBRGyeYFj6l+IRc7W/TgOmZ+xw==
X-Google-Smtp-Source: APXvYqz1KelZGkNrN9fjaOa4ugxRbvOcXwh6l2npkqSSWjgPUxvcxgquTqwAzNoF2x7YxiJTdEBE8w==
X-Received: by 2002:ac2:41d4:: with SMTP id d20mr7565535lfi.24.1572160182053;
        Sun, 27 Oct 2019 00:09:42 -0700 (PDT)
Received: from saruman (85-76-160-55-nat.elisa-mobile.fi. [85.76.160.55])
        by smtp.gmail.com with ESMTPSA id 12sm3240155lju.55.2019.10.27.00.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2019 00:09:41 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB fixes for v5.4-rc5
Date:   Sun, 27 Oct 2019 09:10:19 +0200
Message-ID: <87v9say884.fsf@gmail.com>
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

Here's a pull request for this -rc cycle. It took me longer than usual
to produce a pull request, sorry about that.

Anyway, pull request follows. Let me know if you want anything to be
changed.

Cheers

The following changes since commit 9794476942d8704cfbdef8d5f13427673ab70dcd:

  usb: cdns3: Error out if USB_DR_MODE_UNKNOWN in cdns3_core_init_role() (2=
019-10-18 12:00:15 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-fo=
r-v5.4-rc5

for you to fetch changes up to f3fb802efaef3662744a2215a51294d52a7cfc0e:

  usb: cdns3: gadget: Don't manage pullups (2019-10-27 08:58:45 +0200)

=2D---------------------------------------------------------------
USB: fixes for v5.4-rc5

Not much here, only 14 commits in different drivers.

As for the specifics, Roger Quadros fixed an important bug in cdns3
where the driver was making decisions about data pull-up management
behind the UDC framework's back.

The Atmel UDC got a fix for interrupt storm in FIFO mode, this was done
by Cristian Brisan.

Apart from these, we have the usual set of non-critical fixes.

Signed-off-by: Felipe Balbi <balbi@kernel.org>

=2D---------------------------------------------------------------
Arnd Bergmann (1):
      usb: dwc3: select CONFIG_REGMAP_MMIO

Ben Dooks (Codethink) (4):
      usb: mtu3: fix missing include of mtu3_dr.h
      usb: cdns3: include host-export,h for cdns3_host_init
      usb: renesas_usbhs: fix __le16 warnings
      usb: renesas_usbhs: fix type of buf

Chandana Kishori Chiluveru (1):
      usb: gadget: composite: Fix possible double free memory bug

Cristian Birsan (1):
      usb: gadget: udc: atmel: Fix interrupt storm in FIFO mode.

Navid Emamdoost (1):
      usb: dwc3: pci: prevent memory leak in dwc3_pci_probe

Nikhil Badola (1):
      usb: fsl: Check memory resource before releasing it

Peter Chen (1):
      usb: gadget: configfs: fix concurrent issue between composite APIs

Roger Quadros (1):
      usb: cdns3: gadget: Don't manage pullups

Yinbo Zhu (1):
      usb: dwc3: remove the call trace of USBx_GFLADJ

Yoshihiro Shimoda (2):
      usb: gadget: udc: renesas_usb3: Fix __le16 warnings
      usb: renesas_usbhs: Fix warnings in usbhsg_recip_handler_std_set_devi=
ce()

 drivers/usb/cdns3/gadget.c              |   4 --
 drivers/usb/cdns3/host-export.h         |   1 -
 drivers/usb/cdns3/host.c                |   1 +
 drivers/usb/dwc3/Kconfig                |   1 +
 drivers/usb/dwc3/core.c                 |   3 +-
 drivers/usb/dwc3/dwc3-pci.c             |   2 +-
 drivers/usb/gadget/composite.c          |   4 ++
 drivers/usb/gadget/configfs.c           | 110 ++++++++++++++++++++++++++++=
++--
 drivers/usb/gadget/udc/atmel_usba_udc.c |   6 +-
 drivers/usb/gadget/udc/fsl_udc_core.c   |   2 +-
 drivers/usb/gadget/udc/renesas_usb3.c   |  11 ++--
 drivers/usb/mtu3/mtu3_core.c            |   1 +
 drivers/usb/renesas_usbhs/common.c      |  12 ++--
 drivers/usb/renesas_usbhs/mod_gadget.c  |   4 +-
 14 files changed, 133 insertions(+), 29 deletions(-)


=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl21QtsACgkQzL64meEa
mQbZ4BAAmwUKwjT+NZnc5iET5hO/F99KpzRgTQHoF0QQhyHMjL0zVlnKuiTLDLrR
8Yz9MskW/lOLDeMKdU0h9XMOAdoMdTVZXwOtxwbFAsfKPrjWGlolF1GVs47uhyBZ
lIlx4k9ZENuvs+ZWigs3X3RaM5Q/icBY4VdNO67Y3U8jidDkTfVhd4poPwSTyAyh
S3AM+QRTCWeBp22LuE9CLrEGjQR75t6plwWiqOpZiVtIOAHwj/46sMhdK/kbkBBa
MQwqfOrq1Le1NWVpB6N8OVzhR6UPM45nBw7vQrtho3d/15tKi+ad/o7ZmiWjWJkH
O4rIpi6qQkWuyYY/r3DuANP2e0mq9g35rvUHSUwjSuplc9uHhp5qUu/TJK2RECWt
+lEAtdsPI6L8T41cE59q1x4Nbl9/5B7o64O3L8B029RnvuT8aNJh4aNcZVUan91S
SXcWl4AufRoee69aWkx1wQKlhLSrKoYTPOcLybkpWR4yka3l0rKXEXFP7di1+xO2
sVZ1Vc5oKgIwHCoFUFXoAnmbh9j/Osu9ROkTgSK2FVzdIa+lkqkWc7HJlCgrLcl3
aO5lYuUs8s9hzCraEz2XiNLY4PonDN7fQArhRR1DsRC6Dgup+oC8QmRLOqvR2O4d
AL5PTn16ch5RfoUzjrVJBNqhDxQi2IisI9fCB8b3/jjQluuyPEk=
=G+Cl
-----END PGP SIGNATURE-----
--=-=-=--
