Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC781FB388
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jun 2020 16:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728860AbgFPOHo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jun 2020 10:07:44 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:59705 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728557AbgFPOHo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jun 2020 10:07:44 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05GE2wij002436;
        Tue, 16 Jun 2020 16:07:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=5Hcd79p5ovxHgR2Kw+vJ8ycKacohfcjtHYW/V9jWRZU=;
 b=LQlgpY2PuUrJPpqbJ2bkNsqYx7LRUbCXYxr526KmqbAo6u6b+8mQreEakCrDmEQeFoKE
 Wl1DDz98V9dTNm7gWmOKwBQ0zn2aBcADVyfvinxmpVrL0xAQs4k2qxXsAu4/BzPMCzBt
 bFw6sZUCUUMKM8hP+kPh+W6Ypm4pW7pfZScttWpox8UDOBFhfuj0n3rDtuARZXq8P2ic
 C0UZgoIbFsLAriSPDz84DMrdg4BYhUrJbtAZC53k0M+AGiVOylMSaUoFI/sEE3sDHGcO
 0L236C5TIVaxyMNqBos64ddV5zOcAa8/Fe/TW81sHv54yNIYSaZAg9LB4O1UjBAGm41p rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31mmjvyrjv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 Jun 2020 16:07:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5F8DD10002A;
        Tue, 16 Jun 2020 16:07:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 48A582B56B6;
        Tue, 16 Jun 2020 16:07:27 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 16 Jun 2020 16:07:26
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
        Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 0/3] Add USB role switch support to DWC2
Date:   Tue, 16 Jun 2020 16:07:14 +0200
Message-ID: <20200616140717.28465-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-16_04:2020-06-16,2020-06-16 signatures=0
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
  usb: dwc2: override PHY input signals with usb role switch support
  usb: dwc2: don't use ID/Vbus detection if usb-role-switch on STM32MP15
    SoCs
  ARM: dts: stm32: enable usb-role-switch on USB OTG on stm32mp15xx-dkx

 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi |   2 +-
 drivers/usb/dwc2/Kconfig               |   1 +
 drivers/usb/dwc2/Makefile              |   2 +-
 drivers/usb/dwc2/core.h                |   8 ++
 drivers/usb/dwc2/drd.c                 | 190 +++++++++++++++++++++++++
 drivers/usb/dwc2/gadget.c              |   2 +-
 drivers/usb/dwc2/params.c              |   4 +-
 drivers/usb/dwc2/platform.c            |  13 ++
 8 files changed, 218 insertions(+), 4 deletions(-)
 create mode 100644 drivers/usb/dwc2/drd.c

-- 
2.17.1

