Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0791122D478
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 05:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgGYDxH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 23:53:07 -0400
Received: from out28-173.mail.aliyun.com ([115.124.28.173]:38981 "EHLO
        out28-173.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbgGYDxG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 23:53:06 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.6804061|0.7769073;CH=green;DM=|SPAM|false|;DS=CONTINUE|ham_system_inform|0.0106752-0.00182843-0.987496;FP=0|0|0|0|0|-1|-1|-1;HT=e01l10422;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=19;RT=19;SR=0;TI=SMTPD_---.I7EgnZy_1595649141;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I7EgnZy_1595649141)
          by smtp.aliyun-inc.com(10.147.40.2);
          Sat, 25 Jul 2020 11:53:02 +0800
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
Subject: [PATCH v6 1/5] dt-bindings: USB: Add bindings for new Ingenic SoCs.
Date:   Sat, 25 Jul 2020 11:51:55 +0800
Message-Id: <20200725035159.31231-2-zhouyanjie@wanyeetech.com>
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

Add the USB PHY bindings for the JZ4780 SoC, the X1000 SoC and
the X1830 SoC from Ingenic.

Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Notes:
    v1->v2:
    Add bindings for the JZ4780 SoC.
    
    v2->v3:
    No change.
    
    v3->v4:
    No change.
    
    v4->v5:
    No change.
    
    v5->v6:
    No change.

 Documentation/devicetree/bindings/usb/ingenic,jz4770-phy.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/ingenic,jz4770-phy.yaml b/Documentation/devicetree/bindings/usb/ingenic,jz4770-phy.yaml
index a81b0b1a2226..2d61166ea5cf 100644
--- a/Documentation/devicetree/bindings/usb/ingenic,jz4770-phy.yaml
+++ b/Documentation/devicetree/bindings/usb/ingenic,jz4770-phy.yaml
@@ -4,10 +4,11 @@
 $id: http://devicetree.org/schemas/usb/ingenic,jz4770-phy.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Ingenic JZ4770 USB PHY devicetree bindings
+title: Ingenic SoCs USB PHY devicetree bindings
 
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
+  - 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
 
 properties:
   $nodename:
@@ -16,6 +17,9 @@ properties:
   compatible:
     enum:
       - ingenic,jz4770-phy
+      - ingenic,jz4780-phy
+      - ingenic,x1000-phy
+      - ingenic,x1830-phy
 
   reg:
     maxItems: 1
-- 
2.11.0

