Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C33161CBEC4
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2020 10:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgEIILU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 May 2020 04:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725850AbgEIILU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 May 2020 04:11:20 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9EDC061A0C
        for <linux-usb@vger.kernel.org>; Sat,  9 May 2020 01:11:18 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id j3so4095211ljg.8
        for <linux-usb@vger.kernel.org>; Sat, 09 May 2020 01:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version;
        bh=RtEpq7FVI5yCvMYIKkV4/mzKlHTDQ5EMy5SBGjVVdyY=;
        b=lPXfpXv8Q75VBrk16Db9igY+PiLbw2KqmRcRO6FZ4VHrL7BwEKwiBJA4WdBZcReT0j
         Kv8KlHs6uueRjGr/BOWdYJNAWdHhRJ539oIX498LC6PKQEhboqL37KDo54jxjbqAgEWJ
         TfWIO3y47zrpx1HqvScUmyjTGjgl6GculAvXcaV6iYqMxOyrToxbnBXgQmMitVavmWoW
         ErHVdL+gVahdmDf5IvJlUrOyNZPNLD5mOT5sguvCLsxejG18/wLrwqLadhAFqCbyzQmT
         /KaXfAPjVsE0hKZB4dZdWAOLChueX02HKgd2Y5FdT1QeMWMKDsBnjfhPyh+oSan1M6ZE
         bpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version;
        bh=RtEpq7FVI5yCvMYIKkV4/mzKlHTDQ5EMy5SBGjVVdyY=;
        b=jEnSVbnCvOs3ZXemE5lvU+A3vK2zcos5MDKJolAjDIoNht7AE7wGK95iuLHikcpxor
         5vnj2rW2mzU4Wz8CqnCYarB0TuguIVm0NmQhkd9Yzz8p/pEI+BvOAnlJfH0HR/3pLlX7
         ykHWC9Kh+3ExriuxeZBnrkPYOaacbJAHo/z18WpCp0ShTmVKNfUX5NVP/T4WNEy1SRp0
         k+pryBubFmWzJUfYdJ0frTiInR4yu5O29FfwhFfYPZauc6sM0hxBZpstCTOSjhF559XE
         mHPjOQmDryXEZDJDepEZSRTQl6n4juyzIzWyCxRhYnh7OGV6v+w7QBLxuO0x0rdQe8eq
         cBtQ==
X-Gm-Message-State: AOAM5332eVt4TXN5+RMzi4I0CZhVWW4EhYxY8vqwsAdfujaYxHJ5D2iJ
        y6DkgEAj+Jo99ZhCdh0o2+1zDrxJ0pw=
X-Google-Smtp-Source: ABdhPJzSS21IxS9k5tAZyMhhpWlvf/mw+jQEKGP5QvuY1CGBLuGyUM77CJcLx87C1Bb+qfXx3u7ThA==
X-Received: by 2002:a05:651c:449:: with SMTP id g9mr4194038ljg.278.1589011876892;
        Sat, 09 May 2020 01:11:16 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id c4sm3196371lfi.13.2020.05.09.01.11.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 May 2020 01:11:16 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB fixes for v5.7-rc
Date:   Sat, 09 May 2020 11:11:12 +0300
Message-ID: <87v9l5le8v.fsf@kernel.org>
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

here's another pull request for the current -rc cycle. We may have
another pull request to add a few more fixes to the raw-gadget, but it
depends on your reply to my query on that thread ;-)

cheers

The following changes since commit d5eeab8d7e269e8cfc53b915bccd7bd30485bcbf:

  Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/j=
ejb/scsi (2020-05-08 10:36:56 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git fixes-for-v5.=
7-rc5

for you to fetch changes up to 6e507644209b4a043363e165855a3a3050c4d40e:

  usb: raw-gadget: fix return value of ep read ioctls (2020-05-09 11:05:09 =
+0300)

=2D---------------------------------------------------------------
USB: fixes for v5.7-rc5

Fixing raw-gadget's IOCTL return value. Enabling EXTCON for Intel
Merrifield. Couple leaks have been plugged in net2272 and
twl6030-usb. Returning an error code when things fail in cdc and ncm
legacy gadgets. An old bug on dwc3 regarding HWO bit handling has been
fixed.

Apart from these, some minor fixes.

Signed-off-by: Felipe Balbi <balbi@kernel.org>

=2D---------------------------------------------------------------
Andrey Konovalov (1):
      usb: raw-gadget: fix return value of ep read ioctls

Andy Shevchenko (1):
      usb: dwc3: pci: Enable extcon driver for Intel Merrifield

Arnd Bergmann (1):
      usb: dwc3: select USB_ROLE_SWITCH

Christophe JAILLET (3):
      usb: gadget: audio: Fix a missing error return value in audio_bind()
      usb: phy: twl6030-usb: Fix a resource leak in an error handling path =
in 'twl6030_usb_probe()'
      usb: gadget: net2272: Fix a memory leak in an error handling path in =
'net2272_plat_probe()'

John Stultz (1):
      dwc3: Remove check for HWO flag in dwc3_gadget_ep_reclaim_trb_sg()

Masahiro Yamada (1):
      usb: gadget: legacy: fix redundant initialization warnings

Peter Chen (1):
      usb: cdns3: gadget: prev_req->trb is NULL for ep0

Thierry Reding (1):
      usb: gadget: tegra-xudc: Fix idle suspend/resume

Wei Yongjun (2):
      usb: gadget: legacy: fix error return code in cdc_bind()
      usb: gadget: legacy: fix error return code in gncm_bind()

 drivers/usb/cdns3/gadget.c             |  2 +-
 drivers/usb/dwc3/Kconfig               |  1 +
 drivers/usb/dwc3/dwc3-pci.c            |  1 +
 drivers/usb/dwc3/gadget.c              |  3 ---
 drivers/usb/gadget/legacy/audio.c      |  4 +++-
 drivers/usb/gadget/legacy/cdc2.c       |  4 +++-
 drivers/usb/gadget/legacy/inode.c      |  3 +--
 drivers/usb/gadget/legacy/ncm.c        |  4 +++-
 drivers/usb/gadget/legacy/raw_gadget.c |  8 ++++++--
 drivers/usb/gadget/udc/net2272.c       |  2 ++
 drivers/usb/gadget/udc/tegra-xudc.c    |  8 ++++----
 drivers/usb/phy/phy-twl6030-usb.c      | 12 +++++++++---
 12 files changed, 34 insertions(+), 18 deletions(-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl62ZaAACgkQzL64meEa
mQYZ2g/+O1awOnJcuK9glJ8CD/QNDCBipLwGZHEfBkfqX8qJ11q5SSS2nSGl1RHU
1OR6IblP6eYGwlXPFJGWnSdAbO1P1QWH7jdBWNus21Gn4AavkApl5FCYMy1ZQbgJ
rnDZn1vJ9fXQAZH2BmIwt7zE89gULnOqUM1aAqfKxQoOi9JciV6K6wkDEI6ihQKp
CQaCwqgRz80jaeDfN7Wk5Mj7zHurF+aGHoOGvWkaKtpxzDr1/9GTXKAPA/dJC2KM
pBHkmf9E/XddsJMXzqMNrdKMMBO9IvqOd+lt/VYTRZZ3YTx9GsTMlZ9Mq3qKHyyg
wy0P/026dRY2Tr+4cKC9ssC88gBdHnKr/5tc759JeEMdtecw/Eq9dIEDbH3x2KiW
IBG1Hg/zIg4dw9gZqC4afWPJGamRqO9Fha2gjLn0lIAIbzS/pxlqRpo82tuFZa2z
xX9TZPX5XMmTS0+N2mItZIo2m6ULjUoAMi7OSsn13+3jFvvowDnvTrll5f4mCjQQ
ta0oGFOZibc2Ggd000s7y1FUobHF7td3QcYu3CmgFiy8r7r1Y9LSWt0qwn1bsa+d
phy28JAnMt+wsgAZvJ4hsc+WwkjMmhchtL2J0/0zMarU3eSw20WVhnF6Kyl/cadn
XKc0TjWtwRsBUymkA14stSRxWCwP+u4yN2fUgR+n7qTtkM9/8DY=
=hdz4
-----END PGP SIGNATURE-----
--=-=-=--
