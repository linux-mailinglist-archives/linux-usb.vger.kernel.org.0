Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCFE84FED9
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2019 04:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfFXCBL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jun 2019 22:01:11 -0400
Received: from inva021.nxp.com ([92.121.34.21]:40558 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726331AbfFXCBL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 23 Jun 2019 22:01:11 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C52FF20051F;
        Mon, 24 Jun 2019 04:01:08 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 27F7D20051E;
        Mon, 24 Jun 2019 04:01:02 +0200 (CEST)
Received: from mega.ap.freescale.net (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 52C95402F6;
        Mon, 24 Jun 2019 10:00:54 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org
Cc:     robh+dt@kernel.org, fabio.estevam@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, aisheng.dong@nxp.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, chunfeng.yun@mediatek.com,
        sergei.shtylyov@cogentembedded.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v5 0/8] Add imx7ulp USBOTG1 support
Date:   Mon, 24 Jun 2019 10:02:50 +0800
Message-Id: <20190624020258.21690-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Changes for v5:
- Change DT node name from 'usbphy' to usb-phy'. [Patch 1/8, 6/8]

Changes for v4:
- Delete the oldest compatible for usbotg1, usbmisc and usbphy.
[Patch 6/8]

Changes for v3:
- Using readl_poll_timeout to replace private function. [Patch 2/8]
- Add more commit log for new flag CI_HDRC_PMQOS. [Patch 5/8]
- Move 'compatible' at the beginning of propeties. [Patch 6/8]

Changes for v2:
- Use common 'phys' property [Patch 6/8]
- Add the last patch that "fsl,usbphy" phandle is not mandatory now
[Patch 8/8]
- Add Reviewed-by from Rob.


There is a dual-role USB controller at imx7ulp, we add support for it
in this patch set, and the dual-role function is tested at imx7ulp-evk
board.

Thanks.

Peter Chen (8):
  doc: dt-binding: mxs-usb-phy: add compatible for 7ulp
  usb: phy: phy-mxs-usb: add imx7ulp support
  doc: dt-binding: ci-hdrc-usb2: add compatible string for imx7ulp
  doc: dt-binding: usbmisc-imx: add compatible string for imx7ulp
  usb: chipidea: imx: add imx7ulp support
  ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
  ARM: dts: imx7ulp-evk: enable USBOTG1 support
  usb: chipidea: imx: "fsl,usbphy" phandle is not mandatory now

 .../devicetree/bindings/phy/mxs-usb-phy.txt        |  3 +-
 .../devicetree/bindings/usb/ci-hdrc-usb2.txt       |  1 +
 .../devicetree/bindings/usb/usbmisc-imx.txt        |  1 +
 arch/arm/boot/dts/imx7ulp-evk.dts                  | 35 +++++++++++
 arch/arm/boot/dts/imx7ulp.dtsi                     | 28 +++++++++
 drivers/usb/chipidea/ci_hdrc_imx.c                 | 33 ++++++++++-
 drivers/usb/chipidea/usbmisc_imx.c                 |  4 ++
 drivers/usb/phy/phy-mxs-usb.c                      | 67 +++++++++++++++++++++-
 include/linux/usb/chipidea.h                       |  1 +
 9 files changed, 168 insertions(+), 5 deletions(-)

-- 
2.14.1

