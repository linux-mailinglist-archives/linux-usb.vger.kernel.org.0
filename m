Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A102420AC81
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jun 2020 08:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728498AbgFZGuG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Jun 2020 02:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726311AbgFZGuG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Jun 2020 02:50:06 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A396BC08C5C1
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2020 23:50:05 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id u25so4568700lfm.1
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2020 23:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version;
        bh=iONrBNrycWt9xPJJ/xJe4GV/AccTV3fWSFYoc66udsE=;
        b=R2Q+Ty/+n9v21cH5jXWuQbEBvuF9kxbAnNhIWa4+zMWw2cYwc6jWOY+pAMLwNsSci5
         vs+OOPQN6v87ppgT8XvMCVRSiIWahcjr775C1/iZWjdh4eJJvSC/Axp/kPOO9CsZ3pF0
         2JkfSti6Ju6hlNMp7cRnv5KJhgDG60JhGyyo8vRF7hlUbJUIJNk9uDhMfAIGH7N8vbQm
         DjfZUWJMRX6/ykDC9ddFpegi9nzUrAWvVui2grXnlZfYettPJmDAfIp0Jnc23Urla+Lt
         n9IMK2G6VFw3ikDgQhhNyXeqTxDIgRh6I9tHe3dDzyw5eWiU66/5WhSxhiwByET0FoZO
         aTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version;
        bh=iONrBNrycWt9xPJJ/xJe4GV/AccTV3fWSFYoc66udsE=;
        b=Rg0NCio85IbBDmmuENudMPnrmuEwOTTb6Vw8f6r/xnYq/jq1lAoKNQuomceIijfV7V
         jKWWcXRKS3XeABv9JYHPgMzxEK05Y7NDAsmhW0A6Y8tP68LIKiaEReLxZ19R1UfmZ+kx
         c9MJCDVlrYaZT4+t834+rYHT/RwQ2hwnvSO6LegCvVolF911kA1VFi1nhVecmR+r8IlM
         VjWvTSyJjhI2oij0TMrBzloEEwl6pJXfNwRibz2KLO7pZOQtQCtBintCTsv8pwk7MRwC
         ln8mEx5w1aBecpgCTdFAhxTO7ioKDSQx4Tg7Msm5Aq+SYp0TZHvpjCm6XMuPJBc+v/K4
         Dfaw==
X-Gm-Message-State: AOAM532gssAkN6zJqSg+jLamTVHxGgkER+HL6duObhZ54ubwl7l2mDC8
        WdEgNQPcALxna6Q2yleNUW/ilp6PoQM=
X-Google-Smtp-Source: ABdhPJyrYIjIuKabu3rsZlWf1D1r3gXPdTxnEBelvUn2AB7mctzBpj6sMBnbmV1SV4vUJvxh7bT2LA==
X-Received: by 2002:ac2:4550:: with SMTP id j16mr981987lfm.37.1593154203838;
        Thu, 25 Jun 2020 23:50:03 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id q14sm6544166lfn.75.2020.06.25.23.50.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 23:50:03 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB: fixes for v5.8-rc
Date:   Fri, 26 Jun 2020 09:49:58 +0300
Message-ID: <87bll65njd.fsf@kernel.org>
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

here's the first set of fixes for the current -rc cycle. Patches have
been soaking for a while now.

Let me know if you want anything to be changed.

cheers

PS: your branch is in -rc1, mine is in -rc2. Would you prefer that I
rebase or can you merge -rc2 on your usb-linus?

The following changes since commit 48778464bb7d346b47157d21ffde2af6b2d39110:

  Linux 5.8-rc2 (2020-06-21 15:45:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-fo=
r-v5.8-rc2

for you to fetch changes up to cd37c6976f6a5b681a900e74ff9d15062855bf87:

  Revert "usb: dwc3: exynos: Add support for Exynos5422 suspend clk" (2020-=
06-24 09:52:23 +0300)

=2D---------------------------------------------------------------
usb: fixes for v5.8-rc2

A revert of Exynos5422 suspend clock support, it turns out it wasn't
ready to be merged. CDNS3 got a fix for test mode initialization.

Signed-off-by: Felipe Balbi <balbi@kernel.org>

=2D---------------------------------------------------------------
Aditya Pakki (1):
      usb: dwc3: pci: Fix reference count leak in dwc3_pci_resume_work

Anand Moon (1):
      Revert "usb: dwc3: exynos: Add support for Exynos5422 suspend clk"

Dan Carpenter (1):
      usb: gadget: udc: Potential Oops in error handling code

Peter Chen (3):
      usb: cdns3: ep0: fix the test mode set incorrectly
      usb: cdns3: trace: using correct dir value
      usb: cdns3: ep0: add spinlock for cdns3_check_new_setup

Tang Bin (1):
      usb: phy: tegra: Fix unnecessary check in tegra_usb_phy_probe()

 drivers/usb/cdns3/ep0.c              | 10 ++++++----
 drivers/usb/cdns3/trace.h            |  2 +-
 drivers/usb/dwc3/dwc3-exynos.c       |  9 ---------
 drivers/usb/dwc3/dwc3-pci.c          |  4 +++-
 drivers/usb/gadget/udc/mv_udc_core.c |  3 ++-
 drivers/usb/phy/phy-tegra-usb.c      |  6 +-----
 6 files changed, 13 insertions(+), 21 deletions(-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl71mpcACgkQzL64meEa
mQYnpA/8C0gRdEzAYCc3c0jEnnJw48Wl7Cqah51ShyiM+BbcbdevWs03zCoOCGPb
ZoGuGMOXu58S0XlkVfU/Tp3WtSh0+NSCTSquKdHO2PatE7HaUUkw9j6jzKcUwzov
fVoc3ukeHf6Jur5JwmrIa/ptGhgGHMaZiGjreYvYhR5cKRG3nbqhCFgFgqU4g/4+
kVPWyRJLhiMzxODfADEYWgnrPZyBmKHkdtQ0cKhyRbYumVPgczUhSexKLTd8CLqN
NqPKnLBLVaUDA2pZh64QIGCxgSvw5CD8huQ9MoePgwaHYAa3FFh2U4ef2gDRsces
35gPitHIzkukIknpgCn/vlcevY/qkmocYqv5wk+7Vjdr0T7yI6CSQVevn5kUMiX+
FauqpvKAf3VjAtq8hbtYJHz1twjkemfAlSZZTS1SjjJde0J6jkmYAVKSP9OpWNMv
PXdNLa3jz/MVFGW7qmwzfaXLqUhWSGIRtrHlRdCNegZY3QqD7UQidDNWhLm5QMsO
qHcrbMzjU4LuL1U0VP6zGT28ksK18XLQi2OEzTCknPXRwB8+zsQzyN7B27B75pFo
/yhlTLdGVtHVXds+kVXhHAwGeay7aUyKWFsqStsmwnL+0I2GVI6X06r0YWj0MemX
fAxV5YmCTEioAzIifJ7AqwBkdjy4vCYZ1fuCLg22ncafXjJmw/Y=
=pQsQ
-----END PGP SIGNATURE-----
--=-=-=--
