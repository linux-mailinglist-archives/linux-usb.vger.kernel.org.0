Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 847D41AF867
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2020 09:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbgDSHvd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Apr 2020 03:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725914AbgDSHvc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Apr 2020 03:51:32 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D050C061A0C
        for <linux-usb@vger.kernel.org>; Sun, 19 Apr 2020 00:51:32 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id t11so5305163lfe.4
        for <linux-usb@vger.kernel.org>; Sun, 19 Apr 2020 00:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version;
        bh=m5j5c7OB+m9HmlIPzjxQWbmoOwGSfuiIxfgftytAQko=;
        b=PQnQL+GFtR8igOdtQ3/w1PuZCcp345bOPBq9fsmxF0LQrjwH/2m6s+lq3bUbUEfntu
         6YLMyZxyPzMP6SaUomzDQAi8Ap0aTp2zT188h/6JZwbyA4Id0fyKFhay4fsulQI5FsFT
         uNNLPYs5BBWbxL8T+lZoTbqYD+RCtF03Kc8m8FD3dGpqKrDF+3PHYzfjeJs+lLviMEws
         8bmC9bQxqpDXHya0O/fD7MnTVoc8b3JBqk8v/gv5gco4VIifBXIZ7is24BblyouDP+oF
         PMKRdKuIdDYOaQADYeA5rUkp6R94xfEkgtxiZWzM4DMTi09a9IC0+hVgkJsiwmn92mRP
         4UTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version;
        bh=m5j5c7OB+m9HmlIPzjxQWbmoOwGSfuiIxfgftytAQko=;
        b=VXFJ8WqdgYRyty3PohvVcLGFz/jLA5ThyD0va6zD21IH+3709DuQMq53NhvA2FScBt
         MQSo+kwuuqo/WTGtagJUAxUuC+6JqJaSgJKxnqYbFnFIjWy3Ut8bEiWgLaq3xoYzICWx
         8AdQEjuSlA0E7/srV+U+1TAigW0dtBKlA2Kr41s00n1PEFXF1+FN0HDPACS/zQSGTTZc
         5mjD3khSS8Y5eECLo5BnWcf5yNcTavVcejUNzP3FwVZzcm/slIMk71vsICp7XrIPMrAP
         dLblMuk6yRdMmKXPLIS8gAJZ4crTBzeewP7Uk2qukxXoLg0FnTfDdkWFF9hhk9tlf2pJ
         lAng==
X-Gm-Message-State: AGi0PubmnghWqn31upVb/bNtvlfHZJ99/ZSX0yf20x1tR8oE3bL2lzSa
        1bfNF269UMxquxiQ529nz3FwTXvf
X-Google-Smtp-Source: APiQypJ90Ju8kk7dD32IasSkbU6u8KpoyIjbbJG9uEFjB6YyAGnKq8DWpDcHNB6O8GdzRSkTBBOFbw==
X-Received: by 2002:a19:e041:: with SMTP id g1mr6851792lfj.70.1587282690241;
        Sun, 19 Apr 2020 00:51:30 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id l29sm9128219ljb.95.2020.04.19.00.51.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Apr 2020 00:51:29 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB fixes for v5.7-rc2
Date:   Sun, 19 Apr 2020 10:51:24 +0300
Message-ID: <87eesjdibn.fsf@kernel.org>
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

here's the first pull request for the current -rc cycle. Patches have
been in next for a few days without any new reports.

Let me know if you want anything to be changed.

Cheers

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-fo=
r-v5.7-rc2

for you to fetch changes up to a7b778357ca48df71bbaad6612beaca30bd96e54:

  usb: raw-gadget: Fix copy_to/from_user() checks (2020-04-17 12:26:26 +030=
0)

=2D---------------------------------------------------------------
USB: fixes for v5.7-rc2

DWC3 learns how to properly set maxpacket limit and got a fix for a
request completion bug. The raw gadget got a fix for
copy_to/from_user() checks. Atmel got an improvement on vbus
disconnect handling.

We're also adding support for another SoC to the Renesas DRD driver.

=2D---------------------------------------------------------------
Andrey Konovalov (1):
      usb: raw-gadget: fix raw_event_queue_fetch locking

Cristian Birsan (1):
      usb: gadget: udc: atmel: Fix vbus disconnect handling

Dan Carpenter (1):
      usb: raw-gadget: Fix copy_to/from_user() checks

Mauro Carvalho Chehab (1):
      docs: dt: qcom,dwc3.txt: fix cross-reference for a converted file

Nathan Chancellor (1):
      usb: gadget: udc: bdc: Remove unnecessary NULL checks in bdc_req_comp=
lete

Thinh Nguyen (4):
      usb: dwc3: Fix GTXFIFOSIZ.TXFDEP macro name
      usb: dwc3: gadget: Properly set maxpacket limit
      usb: dwc3: gadget: Do link recovery for SS and SSP
      usb: dwc3: gadget: Fix request completion check

Yoshihiro Shimoda (3):
      dt-bindings: usb: usb-xhci: add r8a77961 support
      dt-bindings: usb: renesas,usbhs: add r8a77961 support
      dt-bindings: usb: renesas,usb3-peri: add r8a77961 support

 .../devicetree/bindings/usb/qcom,dwc3.txt          |  4 +-
 .../devicetree/bindings/usb/renesas,usb3-peri.yaml |  1 +
 .../devicetree/bindings/usb/renesas,usbhs.yaml     |  1 +
 Documentation/devicetree/bindings/usb/usb-xhci.txt |  3 +-
 drivers/usb/dwc3/core.h                            |  8 ++-
 drivers/usb/dwc3/gadget.c                          | 76 +++++++++++++-----=
----
 drivers/usb/gadget/legacy/raw_gadget.c             | 71 +++++++++++-------=
--
 drivers/usb/gadget/udc/atmel_usba_udc.c            |  4 +-
 drivers/usb/gadget/udc/bdc/bdc_ep.c                |  2 +-
 9 files changed, 104 insertions(+), 66 deletions(-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6cAvwACgkQzL64meEa
mQYosBAAykUf9w7o8eg+1vpIjlLzlpLeAJDTDuEmSBbK3NHFGxkd8DGwXQsCA92L
RXT0UD/5E+QvbAYtXWctB65n2MmugKtv+TGdul+p6D13yJWahm2uypoJ9s1vGlwT
PA2HTUUJ8aVxQOlHmWldPiPBxkL1pviU1K3WYcXsAemojbQVuEXKZUID9uzwlfsm
wxdp7Lwq6oZYzCymzd4zDeHSWHYw+geDkcrWFhsp+WMgB3Dq75me2LOTfTDyBTrk
3YWE/zCX7F2aD8Hu4E011+iDcb/5qv/wGEHZFOdJymIUeXHEbi7xRm65ckPydSmp
IYsMYd1X3X0FujfwVTggta97OAR0aosXcv4aUUmEorGb5JN0yT9hxKdz3Hmb4yb8
nHdkhJGD7L5kOU7tpJqjqCSkurjq8tb7mW34QiswHMysfmeHeHANsCuRitLE6KuP
eNOuIUIw6z/jwGuWkyCACIuaoKobasxy9Ed33DtpunHEH79IfEO17zWiduJdLNQA
pBaFpb1Qhgs7UctRZ8e2+sehy6SuX2q421Q8QZ+eaTM3+UgkrGS9Lm+0iUpKtKae
RLUVBFz/0wSiJo68GP/OM5ZVoj7/zRydy/25N0mZfqzN0+lOUQT0vJ13SLUPcSHs
UgnNSDxTGBkvg5bv3tVEm8lUg+l8iRh9/mj/IaTkql1B5vTTOHA=
=0hF6
-----END PGP SIGNATURE-----
--=-=-=--
