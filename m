Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B942F1947
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 16:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729154AbhAKPOW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 10:14:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727917AbhAKPOV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jan 2021 10:14:21 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F2B4C061794
        for <linux-usb@vger.kernel.org>; Mon, 11 Jan 2021 07:13:41 -0800 (PST)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1kyyt1-0006K2-Sw; Mon, 11 Jan 2021 16:13:39 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1kyyt1-0007R5-1j; Mon, 11 Jan 2021 16:13:39 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 0/2] usb: dwc2: Use clk bulk API for supporting multiple clocks
Date:   Mon, 11 Jan 2021 16:13:35 +0100
Message-Id: <20210111151337.5643-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently the dwc2 driver only supports a single clock. I have a board
here which has a dwc2 controller with a somewhat special clock routing
to the phy. Both the dwc2 controller and the ULPI phy get their phy
clock from a SI5351 clock generator. This clock generator has multiple
clock outputs which each is modelled as a separate clk in Linux.
Unfortunately the clock to the phy and the clock to the dwc2 core are on
two different output pins of the SI5351, so we have two clocks which
must be enabled.  The phy is driven by the usb-nop-xceiver driver which
supports a single clock. My first approach was to add support for a
second clock to that driver, but technically the other clock is
connected to the dwc2 core, so instead I added support for a second
clock to the dwc2 driver.  This can easily be archieved with the clk
bulk API as done in this series.

Sascha

Sascha Hauer (2):
  dt-bindings: usb: dwc2: Add support for additional clock
  usb: dwc2: use clk bulk API for supporting additional clocks

 .../devicetree/bindings/usb/dwc2.yaml          |  3 ++-
 drivers/usb/dwc2/core.h                        |  2 ++
 drivers/usb/dwc2/platform.c                    | 18 ++++++++----------
 3 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.20.1

