Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 608CC22D47D
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 05:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgGYDxP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 23:53:15 -0400
Received: from out28-195.mail.aliyun.com ([115.124.28.195]:56103 "EHLO
        out28-195.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbgGYDxL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 23:53:11 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07448637|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0250197-0.000978011-0.974002;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16378;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=19;RT=19;SR=0;TI=SMTPD_---.I7EgnZy_1595649141;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I7EgnZy_1595649141)
          by smtp.aliyun-inc.com(10.147.40.2);
          Sat, 25 Jul 2020 11:53:06 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, kishon@ti.com, vkoul@kernel.org,
        gor@linux.ibm.com, hca@linux.ibm.com,
        christophe.jaillet@wanadoo.fr, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH v6 4/5] USB: PHY: JZ4770: Reformat the code to align it.
Date:   Sat, 25 Jul 2020 11:51:58 +0800
Message-Id: <20200725035159.31231-5-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200725035159.31231-1-zhouyanjie@wanyeetech.com>
References: <20200725035159.31231-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Reformat the code (add one level of indentation before the values),
to align the code in the macro definition section.

Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
Co-developed-by: 漆鹏振 (Qi Pengzhen) <aric.pzqi@ingenic.com>
Signed-off-by: 漆鹏振 (Qi Pengzhen) <aric.pzqi@ingenic.com>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    Add support for the JZ4780 SoC.
    
    v2->v3:
    No change.
    
    v3->v4:
    No change.
    
    v4->v5:
    No change.
    
    v5->v6:
    No change.

 drivers/usb/phy/phy-jz4770.c | 74 ++++++++++++++++++++++----------------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/usb/phy/phy-jz4770.c b/drivers/usb/phy/phy-jz4770.c
index b1540e059a09..23d38cbc150e 100644
--- a/drivers/usb/phy/phy-jz4770.c
+++ b/drivers/usb/phy/phy-jz4770.c
@@ -15,46 +15,46 @@
 #include <linux/usb/phy.h>
 
 /* OTGPHY register offsets */
-#define REG_USBPCR_OFFSET	0x00
-#define REG_USBRDT_OFFSET	0x04
-#define REG_USBVBFIL_OFFSET	0x08
-#define REG_USBPCR1_OFFSET	0x0c
+#define REG_USBPCR_OFFSET			0x00
+#define REG_USBRDT_OFFSET			0x04
+#define REG_USBVBFIL_OFFSET			0x08
+#define REG_USBPCR1_OFFSET			0x0c
 
 /* bits within the USBPCR register */
-#define USBPCR_USB_MODE		BIT(31)
-#define USBPCR_AVLD_REG		BIT(30)
-#define USBPCR_COMMONONN	BIT(25)
-#define USBPCR_VBUSVLDEXT	BIT(24)
-#define USBPCR_VBUSVLDEXTSEL	BIT(23)
-#define USBPCR_POR		BIT(22)
-#define USBPCR_SIDDQ		BIT(21)
-#define USBPCR_OTG_DISABLE	BIT(20)
-#define USBPCR_TXPREEMPHTUNE	BIT(6)
+#define USBPCR_USB_MODE				BIT(31)
+#define USBPCR_AVLD_REG				BIT(30)
+#define USBPCR_COMMONONN			BIT(25)
+#define USBPCR_VBUSVLDEXT			BIT(24)
+#define USBPCR_VBUSVLDEXTSEL		BIT(23)
+#define USBPCR_POR					BIT(22)
+#define USBPCR_SIDDQ				BIT(21)
+#define USBPCR_OTG_DISABLE			BIT(20)
+#define USBPCR_TXPREEMPHTUNE		BIT(6)
 
 #define USBPCR_IDPULLUP_LSB	28
-#define USBPCR_IDPULLUP_MASK	GENMASK(29, USBPCR_IDPULLUP_LSB)
-#define USBPCR_IDPULLUP_ALWAYS	(0x2 << USBPCR_IDPULLUP_LSB)
-#define USBPCR_IDPULLUP_SUSPEND	(0x1 << USBPCR_IDPULLUP_LSB)
-#define USBPCR_IDPULLUP_OTG	(0x0 << USBPCR_IDPULLUP_LSB)
+#define USBPCR_IDPULLUP_MASK		GENMASK(29, USBPCR_IDPULLUP_LSB)
+#define USBPCR_IDPULLUP_ALWAYS		(0x2 << USBPCR_IDPULLUP_LSB)
+#define USBPCR_IDPULLUP_SUSPEND		(0x1 << USBPCR_IDPULLUP_LSB)
+#define USBPCR_IDPULLUP_OTG			(0x0 << USBPCR_IDPULLUP_LSB)
 
-#define USBPCR_COMPDISTUNE_LSB	17
-#define USBPCR_COMPDISTUNE_MASK	GENMASK(19, USBPCR_COMPDISTUNE_LSB)
-#define USBPCR_COMPDISTUNE_DFT	(0x4 << USBPCR_COMPDISTUNE_LSB)
+#define USBPCR_COMPDISTUNE_LSB		17
+#define USBPCR_COMPDISTUNE_MASK		GENMASK(19, USBPCR_COMPDISTUNE_LSB)
+#define USBPCR_COMPDISTUNE_DFT		(0x4 << USBPCR_COMPDISTUNE_LSB)
 
-#define USBPCR_OTGTUNE_LSB	14
-#define USBPCR_OTGTUNE_MASK	GENMASK(16, USBPCR_OTGTUNE_LSB)
-#define USBPCR_OTGTUNE_DFT	(0x4 << USBPCR_OTGTUNE_LSB)
+#define USBPCR_OTGTUNE_LSB			14
+#define USBPCR_OTGTUNE_MASK			GENMASK(16, USBPCR_OTGTUNE_LSB)
+#define USBPCR_OTGTUNE_DFT			(0x4 << USBPCR_OTGTUNE_LSB)
 
 #define USBPCR_SQRXTUNE_LSB	11
-#define USBPCR_SQRXTUNE_MASK	GENMASK(13, USBPCR_SQRXTUNE_LSB)
+#define USBPCR_SQRXTUNE_MASK		GENMASK(13, USBPCR_SQRXTUNE_LSB)
 #define USBPCR_SQRXTUNE_DCR_20PCT	(0x7 << USBPCR_SQRXTUNE_LSB)
-#define USBPCR_SQRXTUNE_DFT	(0x3 << USBPCR_SQRXTUNE_LSB)
+#define USBPCR_SQRXTUNE_DFT			(0x3 << USBPCR_SQRXTUNE_LSB)
 
-#define USBPCR_TXFSLSTUNE_LSB	7
-#define USBPCR_TXFSLSTUNE_MASK	GENMASK(10, USBPCR_TXFSLSTUNE_LSB)
+#define USBPCR_TXFSLSTUNE_LSB		7
+#define USBPCR_TXFSLSTUNE_MASK		GENMASK(10, USBPCR_TXFSLSTUNE_LSB)
 #define USBPCR_TXFSLSTUNE_DCR_50PPT	(0xf << USBPCR_TXFSLSTUNE_LSB)
 #define USBPCR_TXFSLSTUNE_DCR_25PPT	(0x7 << USBPCR_TXFSLSTUNE_LSB)
-#define USBPCR_TXFSLSTUNE_DFT	(0x3 << USBPCR_TXFSLSTUNE_LSB)
+#define USBPCR_TXFSLSTUNE_DFT		(0x3 << USBPCR_TXFSLSTUNE_LSB)
 #define USBPCR_TXFSLSTUNE_INC_25PPT	(0x1 << USBPCR_TXFSLSTUNE_LSB)
 #define USBPCR_TXFSLSTUNE_INC_50PPT	(0x0 << USBPCR_TXFSLSTUNE_LSB)
 
@@ -63,21 +63,21 @@
 #define USBPCR_TXHSXVTUNE_DFT		(0x3 << USBPCR_TXHSXVTUNE_LSB)
 #define USBPCR_TXHSXVTUNE_DCR_15MV	(0x1 << USBPCR_TXHSXVTUNE_LSB)
 
-#define USBPCR_TXRISETUNE_LSB	4
-#define USBPCR_TXRISETUNE_MASK	GENMASK(5, USBPCR_TXRISETUNE_LSB)
-#define USBPCR_TXRISETUNE_DFT	(0x3 << USBPCR_TXRISETUNE_LSB)
+#define USBPCR_TXRISETUNE_LSB		4
+#define USBPCR_TXRISETUNE_MASK		GENMASK(5, USBPCR_TXRISETUNE_LSB)
+#define USBPCR_TXRISETUNE_DFT		(0x3 << USBPCR_TXRISETUNE_LSB)
 
-#define USBPCR_TXVREFTUNE_LSB	0
-#define USBPCR_TXVREFTUNE_MASK	GENMASK(3, USBPCR_TXVREFTUNE_LSB)
+#define USBPCR_TXVREFTUNE_LSB		0
+#define USBPCR_TXVREFTUNE_MASK		GENMASK(3, USBPCR_TXVREFTUNE_LSB)
 #define USBPCR_TXVREFTUNE_INC_25PPT	(0x7 << USBPCR_TXVREFTUNE_LSB)
-#define USBPCR_TXVREFTUNE_DFT	(0x5 << USBPCR_TXVREFTUNE_LSB)
+#define USBPCR_TXVREFTUNE_DFT		(0x5 << USBPCR_TXVREFTUNE_LSB)
 
 /* bits within the USBRDTR register */
 #define USBRDT_UTMI_RST				BIT(27)
 #define USBRDT_HB_MASK				BIT(26)
-#define USBRDT_VBFIL_LD_EN	BIT(25)
-#define USBRDT_IDDIG_EN		BIT(24)
-#define USBRDT_IDDIG_REG	BIT(23)
+#define USBRDT_VBFIL_LD_EN			BIT(25)
+#define USBRDT_IDDIG_EN				BIT(24)
+#define USBRDT_IDDIG_REG			BIT(23)
 #define USBRDT_VBFIL_EN				BIT(2)
 
 /* bits within the USBPCR1 register */
-- 
2.11.0

