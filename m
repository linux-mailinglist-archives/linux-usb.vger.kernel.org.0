Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E796E602972
	for <lists+linux-usb@lfdr.de>; Tue, 18 Oct 2022 12:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiJRKhg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Oct 2022 06:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiJRKhe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Oct 2022 06:37:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A8E0B44A7
        for <linux-usb@vger.kernel.org>; Tue, 18 Oct 2022 03:37:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1okjyU-0002Gp-8m; Tue, 18 Oct 2022 12:37:30 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1okjyS-002G1G-BA; Tue, 18 Oct 2022 12:37:28 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1okjyQ-00BIPx-Lp; Tue, 18 Oct 2022 12:37:26 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     Peng Fan <peng.fan@oss.nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Xu Yang <xu.yang.nxp@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2 0/4] usb: chipidea: small bugfix and cleanup
Date:   Tue, 18 Oct 2022 12:37:21 +0200
Message-Id: <20221018103725.2580679-1-s.hauer@pengutronix.de>
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

This series was originally sent as "usb: chipidea: Export more phy
tuning parameters to device tree" here:
https://lore.kernel.org/linux-arm-kernel/20221017004153.GC12701@nchen-desktop/T/

As I don't know when I'll find time to implement the changes Rob
requested I dropped 5/6 and 6/6 and only send the bugfixes and cleanups
for now.

Changes since v1:
- Drop device tree changes
- Fix wrong MX53_USB_CTRL_1_H3_XCVR_CLK_SEL mask

Sascha Hauer (4):
  usb: chipidea: usbmisc_imx: Fix i.MX53 clock sel masks
  usb: chipidea: usbmisc_imx: Fix setting i.MX6SX wakeup source
  usb: chipidea: usbmisc_imx: Use GENMASK/FIELD_PREP for bitfields
  usb: chipidea: usbmisc_imx: Add prefix to register defines

 drivers/usb/chipidea/usbmisc_imx.c | 119 +++++++++++++++--------------
 1 file changed, 63 insertions(+), 56 deletions(-)

-- 
2.30.2

