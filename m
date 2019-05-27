Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A65BF2AD20
	for <lists+linux-usb@lfdr.de>; Mon, 27 May 2019 05:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbfE0DEm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 May 2019 23:04:42 -0400
Received: from inva021.nxp.com ([92.121.34.21]:40200 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726005AbfE0DEl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 26 May 2019 23:04:41 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 104242001F2;
        Mon, 27 May 2019 05:04:40 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BB52420023A;
        Mon, 27 May 2019 05:04:34 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id DEB02402B5;
        Mon, 27 May 2019 11:04:27 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org
Cc:     robh+dt@kernel.org, fabio.estevam@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, aisheng.dong@nxp.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, chunfeng.yun@mediatek.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 3/8] doc: dt-binding: ci-hdrc-usb2: add compatible string for imx7ulp
Date:   Mon, 27 May 2019 11:06:11 +0800
Message-Id: <20190527030616.44397-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190527030616.44397-1-peter.chen@nxp.com>
References: <20190527030616.44397-1-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add compatible string for imx7ulp.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index a254386a91ad..cfc9f40ab641 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -10,6 +10,7 @@ Required properties:
 	"fsl,imx6sx-usb"
 	"fsl,imx6ul-usb"
 	"fsl,imx7d-usb"
+	"fsl,imx7ulp-usb"
 	"lsi,zevio-usb"
 	"qcom,ci-hdrc"
 	"chipidea,usb2"
-- 
2.14.1

