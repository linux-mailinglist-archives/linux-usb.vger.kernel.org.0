Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1D6515C75D
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 17:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730147AbgBMQJy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 11:09:54 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38135 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728442AbgBMQJu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Feb 2020 11:09:50 -0500
Received: by mail-lj1-f195.google.com with SMTP id w1so7248954ljh.5
        for <linux-usb@vger.kernel.org>; Thu, 13 Feb 2020 08:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version;
        bh=yVtzRoMhCw3uuG9FTlaNhIMkB7hbfMfjAI/xOGojqW0=;
        b=mLyFWi3cqx7cTfTMfF9dHttdVUnsDouHb4jB+OBFvzQxz/n7gSg+cAT88v6KKJqH0u
         wLgEbJCNR2oXOjagZhrhKbAQiCU3459srUMOSFTDEscoZUSlRBN1t3pRmLHHzoJmA/Wi
         3QGs9BQgEYX7SDsR7SanJIb9XEbG1/YKS1RxzhZVtAwczqhqOTU82gTNaGrsg6oykqr4
         Jzp4GqbvGc1JQw89QZREkT6n6AEQ2X/D1GWU78R/fw8egPr/3acvkrfEPRgE5WX8l7hJ
         LLZURY9tM8id5SHizR9eI7wMYhKCXHFxsZGCQ1+CT6vBk/Sgo+wS6259W21bfCwMj9aN
         fEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version;
        bh=yVtzRoMhCw3uuG9FTlaNhIMkB7hbfMfjAI/xOGojqW0=;
        b=EoBmnP2rNA/tIVABdavrN4A307F1KZ6+bpdBmoAxpPeUAK7oJl6lNd5cM+WFwyHXCv
         nDDE94ZmTy9iv49CSD6sto/3eZoUves+wM+wmG2ACtYwD2P6dCjfUFfjL5OsBhimmXPD
         rDZcnhwcT4aXy6jK5zXUU1S17hUTSxZm/XakooUnZiBdIRDxWcIvKhNPcZFlhV8s9eMA
         DFALCduGEYFQuiRpjRYyCya8WNLLvaJvGXQoh08I8o3oJgXXAIcHe5ZOzHmvcmCJA9wv
         F21sn+eTBKBdELCMY9xUW6v5ImJxZdpuXM6rQ0IP82w1RAU6T/57Sva2yqPYfnJSbJrA
         B82g==
X-Gm-Message-State: APjAAAWOTgkiWrNKx5qNie03QDPBO15v5WRfz4OnH4KdDpvraX8fU4fk
        TK0GcyQO3XCjCOlcf/yZsNz1fIyu
X-Google-Smtp-Source: APXvYqyZztX6kmJw8Nr/YDHEKb9VWDH+lvbY1JUqFsTtIKglULnKGBVSMie1xf6Z8bQ5nXd4au9VMA==
X-Received: by 2002:a2e:b0c4:: with SMTP id g4mr11720450ljl.83.1581610187500;
        Thu, 13 Feb 2020 08:09:47 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id x23sm1566144lff.24.2020.02.13.08.09.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 08:09:46 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB fixes for v5.6-rc1
Date:   Thu, 13 Feb 2020 18:09:42 +0200
Message-ID: <87k14qqxix.fsf@kernel.org>
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

not too many fixes this time around. Only 9 commits. Let me know if you
need or want anything to be changed.

cheers


The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-fo=
r-v5.6-rc1

for you to fetch changes up to 42cd5ffe46c1037d5d9a253c72e71a024a7bfbef:

  usb: dwc3: debug: fix string position formatting mixup with ret and len (=
2020-02-11 08:45:45 +0200)

=2D---------------------------------------------------------------
USB: fixes for v5.6-rc1

DWC3 learned that we can't always depend on Event Status bits. A
problem was solved which would only surface with scatter list on IN
endpoints.

DWC2 got a fix for feature requests (both set and clear) and GetStatus
request.

The serial gadget got a fix for a TX stall bug.

Composite framework now works better for SSP devices.

=2D---------------------------------------------------------------
Anurag Kumar Vulisha (1):
      usb: dwc3: gadget: Check for IOC/LST bit in TRB->ctrl fields

Colin Ian King (1):
      usb: dwc3: debug: fix string position formatting mixup with ret and l=
en

Jack Pham (2):
      usb: gadget: composite: Fix bMaxPower for SuperSpeedPlus
      usb: gadget: composite: Support more than 500mA MaxPower

John Keeping (1):
      usb: gadget: u_audio: Fix high-speed max packet size

Lars-Peter Clausen (1):
      usb: gadget: ffs: ffs_aio_cancel(): Save/restore IRQ flags

Minas Harutyunyan (2):
      usb: dwc2: Fix in ISOC request length checking
      usb: dwc2: Fix SET/CLEAR_FEATURE and GET_STATUS flows

Sergey Organov (1):
      usb: gadget: serial: fix Tx stall after buffer overflow

 drivers/usb/dwc2/gadget.c              | 40 +++++++++++++++++++-----------=
----
 drivers/usb/dwc3/debug.h               | 39 +++++++++++++-----------------=
---
 drivers/usb/dwc3/gadget.c              |  3 ++-
 drivers/usb/gadget/composite.c         | 30 ++++++++++++++++---------
 drivers/usb/gadget/function/f_fs.c     |  5 +++--
 drivers/usb/gadget/function/u_audio.c  | 10 ++++-----
 drivers/usb/gadget/function/u_serial.c |  4 +++-
 7 files changed, 71 insertions(+), 60 deletions(-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5FdMYACgkQzL64meEa
mQYJShAA0PjnmSc+euuGXlfMwzQfZDkwq3BLOBPQsiywJyZ0ANTbswnaNx93IoGq
Of5a40xjE7HDNmKCIyLNYtGTav8/XBOg9F/UKJ3e2fJ3dCT+V0JpwxpcZJh7bZmu
SDtYtSO4sc4/7yUKcZhpFyrEOgQzQkPkGNCaHPScM5GEo2WfhYaDks+xsInRJ1io
sN7rmmDF/10U03cLBfAhz40Mqj+YfaPa+zqn1YEgSpn5qbjojxld1Xn4sfOD2N/h
aPieqca6/EEx0Bd0H0hwwaiwluZZawVsW7gwfmzXjElTEGNbvV3AM25biIeer121
Ramcqrcp9iGmnY4h7nWa6i83s3SaGX47J2SBclMUNwF5QfTzfVeDoHeb/eU/oHwd
RZHZYQ5yjnfYtvxYDuBXu2dDb5YOyoCBp2Tp5E5VfkeL6Hv0/mAuicA3/b2uKvCW
b8LWbGPoU8aSCNEt/K5ffsmf0o314GUB3erL5M0S5+wPWdtqQ9Rg9G4xJtAaTsg4
B6iRifGS5ufCCw21YW05f4msKhK21meyN06xSlo/VzLmisgyby1T8El4yfn2IR0B
8Gw0wmP3T6JyCZpS8tLcrOIj+oIT5+s3BPCAYs+R2/hHKOD8LVOe/dvkbZoiaYOC
4+IOwaAPuhEgDXcjGs5IFjmt0NsZWuGTSKPRlJHQxPCbrbV98wo=
=fQwN
-----END PGP SIGNATURE-----
--=-=-=--
