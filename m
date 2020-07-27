Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 191A622E8E0
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 11:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbgG0JYM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 05:24:12 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:17974 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728114AbgG0JYL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jul 2020 05:24:11 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06R9DcH6023314;
        Mon, 27 Jul 2020 11:23:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=GYuL87S7YPoqYEQ8fLjuaH+A2tOWajNHf5iOqsZhpfI=;
 b=LIJBfl13winPriDeJ679lLSitR1k2XuX6TA4qNkeZAhz896tGIXzbiZDWOVrrS+2iwYP
 9bAhZlnhJMWyjXwc0VQBnhmfGEiks066/h7Eks1U1lwspzxCMiVfqpyBhFOGhOirIy9E
 WpcC3HHOF9u0x9dR4MMqUGNxbl9KyYGE2Kt8hjvPrto/DK8bITG7cpMGZnaB57NN6MAw
 poH0/X7qMp62r9BcfYRMe+LK8Vl9PXGt+anznGBXObopKDsPZfVF71ZDAQiGFesGAAt7
 /y/3fYFdDSVje8EHWQx5ZzqgmwaIdsxLW4Mvqxus1it8Jb9oBhPyG5g3PC81R8lm/zex WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 32gagv0e58-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jul 2020 11:23:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40F6D100038;
        Mon, 27 Jul 2020 11:23:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A1052AE6B3;
        Mon, 27 Jul 2020 11:23:54 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 27 Jul 2020 11:23:53
 +0200
From:   Amelie Delaunay <amelie.delaunay@st.com>
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v4 0/3] Add USB role switch support to DWC2
Date:   Mon, 27 Jul 2020 11:23:43 +0200
Message-ID: <20200727092346.19780-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-27_06:2020-07-27,2020-07-27 signatures=0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When using usb-c connector (but it can also be the case with a micro-b
connector), iddig, avalid, bvalid, vbusvalid input signals may not be
connected to the DWC2 OTG controller.
DWC2 OTG controller features an overriding control of the PHY voltage valid
and ID input signals.
So, missing signals can be forced using usb role from usb role switch and
this override feature.

This series adds support for usb role switch to dwc2, by using overriding
control of the PHY voltage valid and ID input signals.

It has been tested on stm32mp157c-dk2 [1], which has a Type-C connector
managed by a Type-C port controller, and connected to USB OTG controller.

[1] https://www.st.com/en/evaluation-tools/stm32mp157c-dk2.html

Amelie Delaunay (3):
  dt-bindings: usb: dwc2: add optional usb-role-switch property
  usb: dwc2: override PHY input signals with usb role switch support
  usb: dwc2: don't use ID/Vbus detection if usb-role-switch on STM32MP15
    SoCs
---
Changes in v4:
- Simplify call to dwc2_force_mode in drd.c
- Add error_drd label in probe error path in platform.c
Changes in v3:
- Fix build issue reported by kernel test robot in drd.c
Changes in v2:
- Previous DT patch already in stm32-next branch so removed from v2 patchset
  "ARM: dts: stm32: enable usb-role-switch on USB OTG on stm32mp15xx-dkx"
- DWC2 DT bindings update added
- Build issue reported by kernel test robot fixed
- Martin's comments taken into account
---
 .../devicetree/bindings/usb/dwc2.yaml         |   4 +
 drivers/usb/dwc2/Kconfig                      |   1 +
 drivers/usb/dwc2/Makefile                     |   2 +-
 drivers/usb/dwc2/core.h                       |   9 +
 drivers/usb/dwc2/drd.c                        | 180 ++++++++++++++++++
 drivers/usb/dwc2/gadget.c                     |   2 +-
 drivers/usb/dwc2/params.c                     |   4 +-
 drivers/usb/dwc2/platform.c                   |  20 +-
 8 files changed, 217 insertions(+), 5 deletions(-)
 create mode 100644 drivers/usb/dwc2/drd.c

-- 
2.17.1

