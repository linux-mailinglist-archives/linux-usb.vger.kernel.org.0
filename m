Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3816222A89F
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 08:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbgGWGOJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 02:14:09 -0400
Received: from out28-75.mail.aliyun.com ([115.124.28.75]:44658 "EHLO
        out28-75.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgGWGN5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jul 2020 02:13:57 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2062509|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00557333-0.00122828-0.993198;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03299;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.I6H78tB_1595484804;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I6H78tB_1595484804)
          by smtp.aliyun-inc.com(10.147.40.7);
          Thu, 23 Jul 2020 14:13:50 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH v5 0/4] Add USB PHY support for new Ingenic SoCs. 
Date:   Thu, 23 Jul 2020 14:12:57 +0800
Message-Id: <20200723061301.82583-1-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

1.separate the adjustments to the code style into
  a separate patch.
2.Modify the help message, make it more future-proof.
3.Drop the unnecessary comment about hardware reset.
4.Create 'soc_info' structures instead having ID_* as platform data.

周琰杰 (Zhou Yanjie) (4):
  dt-bindings: USB: Add bindings for new Ingenic SoCs.
  USB: PHY: JZ4770: Unify code style and simplify code.
  USB: PHY: JZ4770: Add support for new Ingenic SoCs.
  USB: PHY: JZ4770: Reformat the code to align it.

 .../bindings/usb/ingenic,jz4770-phy.yaml           |   6 +-
 drivers/usb/phy/Kconfig                            |   4 +-
 drivers/usb/phy/phy-jz4770.c                       | 284 +++++++++++++++------
 3 files changed, 208 insertions(+), 86 deletions(-)

-- 
2.11.0

