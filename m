Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44A6E2B12FB
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 01:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgKMAGP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Nov 2020 19:06:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgKMAGP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Nov 2020 19:06:15 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 076A0C0613D1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2020 16:05:57 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id b6so7874336wrt.4
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2020 16:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=M/DNdhVAn+pj9y0xoI33n3R+K7GRe7kKavsf/Ah+nsk=;
        b=m0sxsIVG0ByZVmnxTxIO4wIiaZWWiqYENqL3CB0KdB+j6i07uxTXviGjJvMzBwHeTk
         be2JfgfJIsjWv6Sf8F6KATPB5wwYmLWqrw9nHdbZp43P/NAp/5kbiqINpmM3W1SuIINj
         Noa0/opEJVYol7p//o/y8VXhdSS9vKRIy9pI6bI0jL7SLj8ls9b3hgtck4FEcSaLXKfg
         JlS5yg89JjEBKnVOU0ojtvvss9N+42CGN3i4Mg/O45gW0R9sAVCZy2jSR3Imm6lPuHQY
         OqXu+glLJw0TbiR9tKPVEbNBTdsDV+034/11gpT0+WpXn103N1P62oAiXMtvCNTEQhy0
         nF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=M/DNdhVAn+pj9y0xoI33n3R+K7GRe7kKavsf/Ah+nsk=;
        b=sifero4EI9eVZFaTfX8tj7a/QTEP8EmRkWwgfVudx4SVBIjED4Ez/vcMSWuMgDYsjm
         1Oa9zqJ7CZ02YFIeyG7Te4G4FSI2+cYpGGzdLBbPQC3YuzbRUHi5ROykZLtIUagGxAqX
         xvERYhkdf1vN8Sy8Jh6agYsl8KTNI6vWV/iLuQg23B3vv9PT/KnU2CEm6P1ccz4/qjJJ
         hlelhGyTGvfIOtzVtrOyKSrcaVd7Oz4f7gjExvCTELnc+YboC6/6Ih7+zIEVe8/jka7O
         8WSx9TM5YS6KZIDG9XTCSByXQ/AN+BewSCoaKlzC+2ygbRoR2Cf1nVBoXrkFRrniVasH
         3neQ==
X-Gm-Message-State: AOAM531+jiUdcHfizYZqbPORPCTGUxw0nHyEv60+BEB1fiWgGpGgTMTK
        sIgMmufwidqieaNQpxzhMeHipLTO+ZVZyerU
X-Google-Smtp-Source: ABdhPJyOfMhgxUx1TQm9cSxUD6UDuhp2p0OWAe5n5ufvbYsNNIbvJu1hetzgvu2L4r0uzBW0o4MSgQ==
X-Received: by 2002:a5d:4e07:: with SMTP id p7mr2397929wrt.63.1605225955746;
        Thu, 12 Nov 2020 16:05:55 -0800 (PST)
Received: from localhost.localdomain ([2001:861:3a84:7260:5d3c:83d5:8524:33ca])
        by smtp.googlemail.com with ESMTPSA id t11sm2010114wrm.8.2020.11.12.16.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 16:05:54 -0800 (PST)
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH 0/3] usb: meson: fix shared reset control use
Date:   Fri, 13 Nov 2020 01:05:05 +0100
Message-Id: <20201113000508.14702-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patchset fixes a usb suspend warning seen on the libretech-cc by
using reset_control_rearm() call of the reset framework API. 
This call allows a reset consummer to release the reset line even when 
just triggered so that it may be triggered again by other reset
consummers.

reset_control_(de)assert() calls are called, in some meson usb drivers, 
on a shared reset line when reset_control_reset has been used. This is not
allowed by the reset framework.

Finally the meson usb drivers are updated to use this new call, which
solves the suspend issue addressed by the previous reverted 
commit 7a410953d1fb ("usb: dwc3: meson-g12a: fix shared reset control
use").

Important:
Please DO NOT merge before this patch [0] is merged, it adds 
reset_control_rearm() call to the reset framework API.

[0] https://lore.kernel.org/lkml/20201112230043.28987-1-aouledameur@baylib
re.com/

Amjad Ouled-Ameur (3):
  phy: amlogic: phy-meson-gxl-usb2: fix shared reset controller use
  usb: dwc3: meson-g12a: fix shared reset control use
  phy: amlogic: meson8b-usb2: fix shared reset control use

 drivers/phy/amlogic/phy-meson-gxl-usb2.c |  5 ++++-
 drivers/phy/amlogic/phy-meson8b-usb2.c   |  4 ++++
 drivers/usb/dwc3/dwc3-meson-g12a.c       | 19 +++++++++++++------
 3 files changed, 21 insertions(+), 7 deletions(-)

-- 
2.17.1

