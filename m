Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3B791E92B3
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2020 18:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729188AbgE3Qx3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 May 2020 12:53:29 -0400
Received: from out29-173.mail.aliyun.com ([115.124.29.173]:51895 "EHLO
        out29-173.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728927AbgE3Qx2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 30 May 2020 12:53:28 -0400
X-Alimail-AntiSpam: AC=SUSPECT;BC=0.6639204|-1;BR=01201311R401b1;CH=blue;DM=|SUSPECT|false|;DS=CONTINUE|ham_system_inform|0.0217762-0.0127684-0.965455;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03301;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.HfvVT0t_1590857595;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.HfvVT0t_1590857595)
          by smtp.aliyun-inc.com(10.147.40.26);
          Sun, 31 May 2020 00:53:23 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-usb@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        balbi@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH 1/2] dt-bindings: USB: Add Ingenic X1000 and X1830 bindings.
Date:   Sun, 31 May 2020 00:52:52 +0800
Message-Id: <20200530165253.17445-2-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200530165253.17445-1-zhouyanjie@wanyeetech.com>
References: <20200530165253.17445-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the USB PHY bindings for the X1000 SoC and
the X1830 SoC from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 Documentation/devicetree/bindings/usb/ingenic,jz4770-phy.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/ingenic,jz4770-phy.yaml b/Documentation/devicetree/bindings/usb/ingenic,jz4770-phy.yaml
index a81b0b1a2226..95ba3b9aa801 100644
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
@@ -16,6 +17,8 @@ properties:
   compatible:
     enum:
       - ingenic,jz4770-phy
+      - ingenic,x1000-phy
+      - ingenic,x1830-phy
 
   reg:
     maxItems: 1
-- 
2.11.0

