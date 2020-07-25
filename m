Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6E622D476
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 05:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgGYDxF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 23:53:05 -0400
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:58703 "EHLO
        out28-97.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgGYDxF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 23:53:05 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1341577|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.040148-0.00170086-0.958151;FP=0|0|0|0|0|-1|-1|-1;HT=e01l10434;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=19;RT=19;SR=0;TI=SMTPD_---.I7EgnZy_1595649141;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I7EgnZy_1595649141)
          by smtp.aliyun-inc.com(10.147.40.2);
          Sat, 25 Jul 2020 11:53:01 +0800
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
Subject: [PATCH v6 0/5] Add USB PHY support for new Ingenic SoCs.
Date:   Sat, 25 Jul 2020 11:51:54 +0800
Message-Id: <20200725035159.31231-1-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

v5->v6:
1.Fix the warning that appears during compilation.
2.Used the generic PHY framework API to create the PHY,
  and move the driver to driver/phy/ingenic.

周琰杰 (Zhou Yanjie) (5):
  dt-bindings: USB: Add bindings for new Ingenic SoCs.
  USB: PHY: JZ4770: Unify code style and simplify code.
  USB: PHY: JZ4770: Add support for new Ingenic SoCs.
  USB: PHY: JZ4770: Reformat the code to align it.
  USB: PHY: JZ4770: Usethe generic PHY framework.

 .../bindings/usb/ingenic,jz4770-phy.yaml           |   6 +-
 drivers/phy/Kconfig                                |   1 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/ingenic/Kconfig                        |  12 +
 drivers/phy/ingenic/Makefile                       |   2 +
 drivers/phy/ingenic/phy-ingenic-usb.c              | 403 +++++++++++++++++++++
 drivers/usb/phy/Kconfig                            |   8 -
 drivers/usb/phy/Makefile                           |   1 -
 drivers/usb/phy/phy-jz4770.c                       | 243 -------------
 9 files changed, 424 insertions(+), 253 deletions(-)
 create mode 100644 drivers/phy/ingenic/Kconfig
 create mode 100644 drivers/phy/ingenic/Makefile
 create mode 100644 drivers/phy/ingenic/phy-ingenic-usb.c
 delete mode 100644 drivers/usb/phy/phy-jz4770.c

-- 
2.11.0

