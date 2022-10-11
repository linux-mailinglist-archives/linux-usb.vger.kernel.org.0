Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7AD35FAE5F
	for <lists+linux-usb@lfdr.de>; Tue, 11 Oct 2022 10:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbiJKI3r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Oct 2022 04:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbiJKI3n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Oct 2022 04:29:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052DCBDC
        for <linux-usb@vger.kernel.org>; Tue, 11 Oct 2022 01:29:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1oiAdl-0005Sq-73; Tue, 11 Oct 2022 10:29:29 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oiAdj-000r71-77; Tue, 11 Oct 2022 10:29:27 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oiAdi-003iNb-AF; Tue, 11 Oct 2022 10:29:26 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Peter Chen <peter.chen@kernel.org>,
        Peng Fan <peng.fan@oss.nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 0/6] usb: chipidea: Export more phy tuning parameters to device tree
Date:   Tue, 11 Oct 2022 10:29:18 +0200
Message-Id: <20221011082924.884123-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series exports more phy tuning settings to device tree. There are
some values already exported and I follow that example in this series.

Patches 1 and 2 contain two small bugfixes for issues I stumbled upon
along the way. Patches 3 and 4 are cleanups. These patches could be
applied without the remaining two patches.

The binding patch is based on
https://lore.kernel.org/linux-arm-kernel/20221010101816.298334-3-peng.fan@oss.nxp.com/t/,
so this will need a rebase once this series settles.

Sascha

Sascha Hauer (6):
  usb: chipidea: usbmisc_imx: Fix i.MX53 clock sel masks
  usb: chipidea: usbmisc_imx: Fix setting i.MX6SX wakeup source
  usb: chipidea: usbmisc_imx: Use GENMASK/FIELD_PREP for bitfields
  usb: chipidea: usbmisc_imx: Add prefix to register defines
  usb: chipidea: usbmisc_imx: Add device tree properties for i.MX7 phy
    tuning
  dt-bindings: usb: ci-hdrc-usb2: Add more phy tuning properties

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  79 ++++++++
 drivers/usb/chipidea/ci_hdrc_imx.c            |  14 ++
 drivers/usb/chipidea/ci_hdrc_imx.h            |   7 +
 drivers/usb/chipidea/usbmisc_imx.c            | 186 ++++++++++++------
 4 files changed, 230 insertions(+), 56 deletions(-)

-- 
2.30.2

