Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB40D21B182
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jul 2020 10:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgGJIlx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jul 2020 04:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgGJIlx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jul 2020 04:41:53 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A9A1C08C5CE
        for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2020 01:41:53 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id k15so2750604lfc.4
        for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2020 01:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version;
        bh=GAyePF6y2rsePaliWGJ4vYcX4twXh9Ha7v5zCHdSPzs=;
        b=bZ/LjWRcfoE1nA9ymHb0sMX7Bz0jowVsjKA7N210CTuQ4PdCmpWkkyJwQeYvufQdog
         mXalTne2xISTVL8XRO3U4XtgBxp6fi863dX6AMAJmPLuO4iKdrcEh1jtwmc/qM1H+z/c
         Nhyc+GJeqCV3t2pN3803wyDCw3hbLo0fwiiPnUv7hbG/T0D3Js+MdQrEuT5h39fquqDu
         w2sDS4otx+/gM3d05XE6JZjwUL+Sk1O3InNnGUhgkdvzMLa0YPyzUhMPO0lAjZBuyApP
         vVI7VFXEOFOHLDaVZPBkMWCyQWCLgabfVOwRcTBYUreSx2QRJhPCZylltsUpumPmUFHF
         mMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version;
        bh=GAyePF6y2rsePaliWGJ4vYcX4twXh9Ha7v5zCHdSPzs=;
        b=SAFQ6L3B82VuSqBLBqwJv5WoDZa+7HJLPfovfq4iwLt34Iza0cIuMIxdYg0EMB8LTF
         V1nXMncZqK8RQPUbnjyPm5cE5HErUNMSIK0FkXggMnVvY1X4rgs61aG9b7A3aTD99dBO
         0RMoE+5ujh1RNpeJMIAFgIhPW9XLcNtzIjtDc4lKJX6iFXw2LriA/QbKVnx4igUTIioe
         eqcfyOnyqovk4xB64PIHuUkpDJzIEohJxPusmnHaQCppEGI8MNAxnkbuVJJB748Bq4Jv
         vC/PqXwIH0g2X/pbQ/WPP2UExbDfvqUmNMq9Jpyl9l158JIjiT7mxcqb3CEN1EC2UHJD
         uNDw==
X-Gm-Message-State: AOAM532NX409CZkelwyUs+duArIou+vs5UEEPuD6k2977yX8Oh19M04F
        p1Pckc0CObP1SSXB6Oumy7E0PIY7
X-Google-Smtp-Source: ABdhPJxKGASZ1LemNt25GdPP8clhHTWXg4FMV1O5hLR8A4HNnkovYiNThlFhE8UUnRYsOeSfTieCfA==
X-Received: by 2002:a19:ac03:: with SMTP id g3mr42015975lfc.164.1594370511108;
        Fri, 10 Jul 2020 01:41:51 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id w19sm1666717ljm.120.2020.07.10.01.41.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 01:41:50 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB: fixes for v5.8-rc3
Date:   Fri, 10 Jul 2020 11:41:46 +0300
Message-ID: <87pn93ep85.fsf@kernel.org>
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

here's my second pull request for the current merge window. Nothing
major going on apart from the spinlock fix in legacy audio function and
a memleak plug on gr_udc.

Patches have been cooking for quite a while. Let me know if you want
anything to be changed

cheers

The following changes since commit af3cf0ac6805a36740089a5f200c28a04d452404:

  Merge tag 'usb-serial-5.8-rc5' of https://git.kernel.org/pub/scm/linux/ke=
rnel/git/johan/usb-serial into usb-linus (2020-07-08 17:10:17 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-fo=
r-v5.8-rc3

for you to fetch changes up to 8778eb0927ddcd3f431805c37b78fa56481aeed9:

  usb: gadget: function: fix missing spinlock in f_uac1_legacy (2020-07-09 =
10:13:07 +0300)

=2D---------------------------------------------------------------
USB: fixes for v5.8-rc3

Adding support for recent Intel devices (Tiger Lake and Jasper Lake)
on dwc3. We have some endianess fixes in cdns3, a memleak fix in
gr_udc and lock API usage fix in the legacy f_uac1

Signed-off-by: Felipe Balbi <balbi@kernel.org>

=2D---------------------------------------------------------------
Evgeny Novikov (1):
      usb: gadget: udc: gr_udc: fix memleak on error handling path in gr_ep=
_init()

Heikki Krogerus (2):
      usb: dwc3: pci: add support for the Intel Tiger Lake PCH -H variant
      usb: dwc3: pci: add support for the Intel Jasper Lake

Micha=C5=82 Miros=C5=82aw (2):
      usb: gadget: udc: atmel: remove outdated comment in usba_ep_disable()
      usb: gadget: udc: atmel: fix uninitialized read in debug printk

Minas Harutyunyan (1):
      usb: dwc2: Fix shutdown callback in platform

Peter Chen (2):
      usb: cdns3: ep0: fix some endian issues
      usb: cdns3: trace: fix some endian issues

Randy Dunlap (1):
      usb: gadget: fix langid kernel-doc warning in usbstring.c

Zhang Qiang (1):
      usb: gadget: function: fix missing spinlock in f_uac1_legacy

 drivers/usb/cdns3/ep0.c                     | 30 ++++++++++++++-----------=
----
 drivers/usb/cdns3/trace.h                   |  6 +++---
 drivers/usb/dwc2/platform.c                 |  3 ++-
 drivers/usb/dwc3/dwc3-pci.c                 |  8 ++++++++
 drivers/usb/gadget/function/f_uac1_legacy.c |  2 ++
 drivers/usb/gadget/udc/atmel_usba_udc.c     | 10 ++--------
 drivers/usb/gadget/udc/gr_udc.c             |  7 +++++--
 drivers/usb/gadget/usbstring.c              |  2 +-
 8 files changed, 38 insertions(+), 30 deletions(-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8IKcoACgkQzL64meEa
mQa6QxAAkCwN/mk4Ln6+5kr+JVOJby+rsCT+BjYjczS3vPifZdkHtPt01/+heFrk
WDZaLbd8J5OuZj/ok/euM6OIlWFs5rxheMOdL872j03y50OGHol+nrW+W3SOITqu
kHA97g9xWsac6wAOJipwuQA9ffWsZSqJ+U+FKEbC/+K7hx/Vmjwxx9gLLOkwdtGg
BThOo+D9fqreI3nFMuhD/Lb5TfY9WqWC0E2MdMjNNNCccomDBxjNEw+WrW9dB6sX
MW9tqwZuiwzPTTJysNpS2DtP8UVn79MyT28wjU2tk4ov1FfS5U95L8GXYaraF7HW
Es5gMLtbFfDg4YdeuicaP+xDK/r+froZPTmkggT+k8Hv98XO0RhyCZL9FoQN/EcQ
z4znzfMKUeRXRE798pmuLCT09+1DBD5IBANp4GfOI/srzGv/lw2uvnP+Rnv8faI8
K2RP7C84OUKCCcjz5BGAllpDLkhl39b3lFSg7RBy8LWUGWIOWtY5GBkTQsgMJ67X
Z9sYGT+KJe4C5PYpISvgoBHRsQkqqJb38uHvswtVFRG9Gk031ewOQ5GxCYJZer3g
HfKv3lsYpKdZGdr+TR4WlDKPq5mbvN9SyV+XxO1xj02K2ipJAAdL6mnBTQVlqGEf
kZeCa+/vAYc4KzO6hJuIPrC+c1gl9c7CvTrVe2gXoERLPk/dXQw=
=xUGU
-----END PGP SIGNATURE-----
--=-=-=--
