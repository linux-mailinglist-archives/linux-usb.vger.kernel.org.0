Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D88761D497C
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 11:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728095AbgEOJ0q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 05:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727116AbgEOJ0p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 05:26:45 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0A1C061A0C
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2020 02:26:45 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id h26so1233487lfg.6
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2020 02:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version;
        bh=mDwgqBBgdj8wFe2i1CPo2sYCrtWpvg+/hfFXWdLu3x0=;
        b=A4rnhKWdFl4zDP2ppmSzmtYt8qcRo+yvT04Mz5sI5FZ9FXXKm7ItMxkWdUkDfEi8KW
         +FGG/VzlbRHpyNvqw6N2wCWyLvq+Pe7WpD+Ej528lWcKsdehQkrHBcE/cq4LYxqggEPD
         bdxU1Nhz6YZ4N4G4wRrtFzsZuWCET2W2yF+goCF5o0iNDNFW3kbxHEIq4h04bdoa18N7
         baTSjWzzd8kCYb3/+9Jl5bFra9HnUv6xXtaEgTCVKsVgxyXetvIo3ZsRBgCeoJNq9t+X
         GGFOZdv5qOZ4xbeMHg6FzJZ9czYSI6XM4HPtCEY668dYClqE/hmc15A8tprTlxISdfqY
         +waQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version;
        bh=mDwgqBBgdj8wFe2i1CPo2sYCrtWpvg+/hfFXWdLu3x0=;
        b=KUkwcLfBhQZzD1TMsyK0a7Vc4/dniaveerqz+NASESezgAYLhgmL8a+wA7lj1vW9Ns
         VSH68OeMkC3MM1VFVlSmg24x8sKa4GhtOFcG48GYi8734cKa3GeT8wuwrh6wVc6Gteyv
         IoVN/LMk2YvXBOQx/rJqDAhaMQH227DMdvrYBZtQbcSYIhYWxorKjDpdGCmHHQaKw8kd
         3dcvvoIrBTZYQY1e+kt7j41gLsjaCnXn6G0HzK1jYfvPOeOzxODdvyy+4HTuhUx84ZVr
         TFf0hZCM7O0xOAGszOJcKMefVjb34Y2x++42Af6K5BW2cBCl6OrQACBhwwQZDuTS3KPY
         JjTQ==
X-Gm-Message-State: AOAM530bZRBIMY4KAf0aGlQh6Cy1/rZ0Dio4XDZZeY95vl9ckZtFJ29Y
        xwtYgJJu9RuuG5r6TqF2SMBmT9fqnkI=
X-Google-Smtp-Source: ABdhPJwS8r2wa3PaDqR332PoTjwvPlbRRRfJpvdFeMwTG15x6/i7TFydgyYJ0mvetNRCkNwLZ5wwwg==
X-Received: by 2002:ac2:4c29:: with SMTP id u9mr1785512lfq.209.1589534803598;
        Fri, 15 May 2020 02:26:43 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id q13sm975550lfh.73.2020.05.15.02.26.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 02:26:42 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB fixes for v5.7-rc6
Date:   Fri, 15 May 2020 12:26:38 +0300
Message-ID: <87o8qp35wx.fsf@kernel.org>
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

here's what I hope to be the last set of fixes for the current
cycle. The important part are all the fixes on the raw-gadget which have
been discussed in the mailing list.

Let me know if you want anything to be changed.

cheers

The following changes since commit 5c4edcdbcd97fb3fb657898d0463afb84e4fbbb3:

  usb: typec: mux: intel: Fix DP_HPD_LVL bit field (2020-05-13 14:33:51 +02=
00)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git fixes-for-v5.=
7-rc6

for you to fetch changes up to 172b14b48ca10b280482b164506892ea09edb946:

  usb: cdns3: gadget: make a bunch of functions static (2020-05-14 12:46:10=
 +0300)

=2D---------------------------------------------------------------
USB: fixes for v5.7-rc6

The main part here are the important fixes for the raw-gadget before it
becomes an ABI. We're adding support for stall/halt/wedge which is
actually pretty important in many situations. There's also a NULL
pointer deref fix.

Apart from raw-gadget, I've included some recent sparse fixes to a few
drivers.

Signed-off-by: Felipe Balbi <balbi@kernel.org>

=2D---------------------------------------------------------------
Andrey Konovalov (5):
      usb: raw-gadget: improve uapi headers comments
      usb: raw-gadget: fix gadget endpoint selection
      usb: raw-gadget: support stalling/halting/wedging endpoints
      usb: raw-gadget: documentation updates
      usb: raw-gadget: fix null-ptr-deref when reenabling endpoints

Jason Yan (1):
      usb: cdns3: gadget: make a bunch of functions static

Rikard Falkeborn (1):
      usb: mtu3: constify struct debugfs_reg32

Samuel Zou (1):
      usb: gadget: udc: atmel: Make some symbols static

 Documentation/usb/raw-gadget.rst        |  37 +++-
 drivers/usb/cdns3/gadget.c              |  20 +--
 drivers/usb/gadget/legacy/raw_gadget.c  | 307 +++++++++++++++++++++++++---=
----
 drivers/usb/gadget/udc/atmel_usba_udc.c |   4 +-
 drivers/usb/mtu3/mtu3_debugfs.c         |   4 +-
 include/uapi/linux/usb/raw_gadget.h     | 108 +++++++++--
 6 files changed, 385 insertions(+), 95 deletions(-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6+YE4ACgkQzL64meEa
mQZUVg/+P0yAuhcZuY1Pc0jXOr8vjgDrxzwXftfck5R2xhw/m+bhUQtQiI+wxD6q
SHm1lbQSqjPXju5x1eIjxtmv/aLhDeiUGfIhDTPrelyniURC23uHjIpZK48luYyc
WW7MpxRhD/BxKQzeeVj3sXzuE4DSk/RhwMhVswZ0r580Z7YY4pm/Pf4TsGtArLb/
YdjF905lkJt5rrgDhKGdRl+9nta/S8ziz1m4IChAZWEm5d1NP+G4Fke7KTWPYhfP
ZPQs9H1uD+fGJvlbdm8ctDAB3WBiPK6AWHcN2BpE9qWxf2hPAN+bJFK2VDzkDfUd
+XKDwV2gRfAtekfjY3D0O+w0J9Sytx7dAmo75xVt6CnYFdUHoHzyiH5DKq5YPitp
Kz02RLhzreGk9GHt2lyWiIm5NSHodYsd2SHeEPa31ZdNcfB9ByBSw+YN107iI2rN
hLXG+G+T2DZXyaDvBI+pm2bxq8ocHjN2L29x+AC3DNgck/DIt33JEivlIuxevHTn
37u1mBwNT36yVg7nRt4zfVLyN3u8ISkNPUFnR4N+sCytJ7r+3OyRfdJubx8f73ke
oGKMOqFAydMV1uPpKr2Fv0u433v67YwgpV5Lybf2uiNrb6oizCCpqQctveWpFBYD
9GMXHSLZUltp0ml5xwnMnvOCvtP3NKTEBQ6uf+0Jus50YEa65s0=
=4k8G
-----END PGP SIGNATURE-----
--=-=-=--
