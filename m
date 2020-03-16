Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20E5A187482
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 22:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732659AbgCPVLj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 17:11:39 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47688 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732645AbgCPVLi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 17:11:38 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02GLBb4r042918;
        Mon, 16 Mar 2020 16:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584393097;
        bh=w3owWkKJeDUPM0ySaYSXZaVybcJ4ChLk+cgxP74HJWA=;
        h=From:To:CC:Subject:Date;
        b=M9fAu+ZP6aIcj3HnzYTD8t3quTdxUsfsf4nlclkTJP0ZKVse8j1GKQz+dC+71ttIB
         7QMprDOH6PjnCQB3f6vPC5Y61gor47mtyaTyG26r+6Sk/xKL75g11YbKbMyO9y0Xh3
         g9g1wIvgl8qMCFmvPgZX/0EoO/RVFnKsN2+zGFZ0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02GLBbgi024269
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Mar 2020 16:11:37 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Mar 2020 16:11:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Mar 2020 16:11:37 -0500
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02GLBbLc119954;
        Mon, 16 Mar 2020 16:11:37 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 0/8] musb patches for v5.7-rc1
Date:   Mon, 16 Mar 2020 16:11:28 -0500
Message-ID: <20200316211136.2274-1-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Here are the musb patches for v5.7-rc1. The set adds DMA support for
JZ4740 and new device JZ4770, along with some trivial cleanup. It does
include a fix for a NULL-pointer dereference bug when usbmon is enabled.
The patch came in late in v5.6 rc cycles, so I am including the patch
here but added Cc: stable@ tag. Please let me know if there is any
change needed.

Thanks,
-Bin.
---

Colin Ian King (1):
  usb: musb: remove redundant assignment to variable ret

Macpaul Lin (1):
  usb: musb: tusb6010: fix a possible missing data type replacement

Mans Rullgard (1):
  usb: musb: fix crash with highmen PIO and usbmon

Paul Cercueil (5):
  dt-bindings: usb: Convert jz4740-musb doc to YAML
  usb: musb: jz4740: Add support for DMA
  usb: musb: jz4740: Register USB role switch
  usb: musb: jz4740: Unconditionally depend on devicetree
  usb: musb: jz4740: Add support for the JZ4770

 .../bindings/usb/ingenic,jz4740-musb.txt      |  32 -----
 .../devicetree/bindings/usb/ingenic,musb.yaml |  76 ++++++++++++
 drivers/usb/musb/Kconfig                      |   4 +-
 drivers/usb/musb/jz4740.c                     | 110 ++++++++++++++++--
 drivers/usb/musb/mediatek.c                   |   2 +-
 drivers/usb/musb/musb_host.c                  |  17 +--
 drivers/usb/musb/tusb6010.c                   |   2 +-
 7 files changed, 185 insertions(+), 58 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt
 create mode 100644 Documentation/devicetree/bindings/usb/ingenic,musb.yaml

-- 
2.17.1

