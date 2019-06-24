Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A91644FEEC
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2019 04:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbfFXCBQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jun 2019 22:01:16 -0400
Received: from inva020.nxp.com ([92.121.34.13]:55266 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726438AbfFXCBP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 23 Jun 2019 22:01:15 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 082D31A04F6;
        Mon, 24 Jun 2019 04:01:14 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5F3641A0EDF;
        Mon, 24 Jun 2019 04:01:07 +0200 (CEST)
Received: from mega.ap.freescale.net (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 8024D40313;
        Mon, 24 Jun 2019 10:00:59 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org
Cc:     robh+dt@kernel.org, fabio.estevam@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, aisheng.dong@nxp.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, chunfeng.yun@mediatek.com,
        sergei.shtylyov@cogentembedded.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v5 4/8] doc: dt-binding: usbmisc-imx: add compatible string for imx7ulp
Date:   Mon, 24 Jun 2019 10:02:54 +0800
Message-Id: <20190624020258.21690-5-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190624020258.21690-1-peter.chen@nxp.com>
References: <20190624020258.21690-1-peter.chen@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add compatible string for imx7ulp

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 Documentation/devicetree/bindings/usb/usbmisc-imx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/usbmisc-imx.txt b/Documentation/devicetree/bindings/usb/usbmisc-imx.txt
index a85a631ec434..b353b9816487 100644
--- a/Documentation/devicetree/bindings/usb/usbmisc-imx.txt
+++ b/Documentation/devicetree/bindings/usb/usbmisc-imx.txt
@@ -7,6 +7,7 @@ Required properties:
 	"fsl,vf610-usbmisc" for Vybrid vf610
 	"fsl,imx6sx-usbmisc" for imx6sx
 	"fsl,imx7d-usbmisc" for imx7d
+	"fsl,imx7ulp-usbmisc" for imx7ulp
 - reg: Should contain registers location and length
 
 Examples:
-- 
2.14.1

