Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 199311D4C40
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 13:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgEOLQZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 07:16:25 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:19611 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgEOLQY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 07:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589541384; x=1621077384;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=ABwPSOt6Vn+yadZj5yycUyO4VKdjl4WcH7rpms4LysM=;
  b=k/XbgOhaE7i7EQJ3J2NRE9t0qSachKUYd/Mlw7ZpOUisn7wrg8WYcX3P
   v/3xkObXaDtqo37pWG8GWt/qlkicNgz0rS/I2o8dNFpCfIW2csQVyQHiO
   KgeIE0jlao1Sd6gMJXiqNaOi6Cmd673TrkoNoACK04mfaBRmIpjBJ8sVG
   Ml67EGbmGLORKXtnTBOBewmqUsSxM5g9pSbkA6BN6TyzdYbeepKY7Wie0
   aPmSvdRSzSi+Mxf5Kn0XF5128E1sq5DtDGx+GKqKkgVT5qgKn3Pcjyro/
   wFR3QgruvBZPbUr92TFFGLFK080xD3BXYuTLz8H+FVnV94mxt68xrBTfg
   w==;
IronPort-SDR: d1Ro/FnxzZNikeDUdQz/SltJMJxGFcl/zWK39dHh0MfNPIZD37uVX1zLfG3rF4HuUkePUfyT25
 w898hqe9GAvk4PHvCnXJ1shgJuVxQBN6scp70tlGwiucor15kWAtBQvclnIVtX2GfdQ7m8NgcB
 s0GalkDVsbOYWDopm6KBKlsK01D927pMnPQM4FPpB9NtIaXstLqjXSQbEP4LxjNbgo2g1gRrFq
 H2yF02dUkYL6EuYvXbRaHcBkQIoxsD8OjPy0xsWEdLcd7+gFjuDms5NMGgR/yljeuvvHzjKQoq
 stc=
X-IronPort-AV: E=Sophos;i="5.73,395,1583218800"; 
   d="scan'208";a="73566865"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 May 2020 04:16:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 May 2020 04:16:26 -0700
Received: from cristi-P53.lan (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 15 May 2020 04:16:20 -0700
From:   <cristian.birsan@microchip.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Cristian Birsan <cristian.birsan@microchip.com>
Subject: [PATCH v2 0/7] usb: gadget: udc: atmel: add usb device support for SAM9x60 SoC
Date:   Fri, 15 May 2020 14:16:24 +0300
Message-ID: <20200515111631.31210-1-cristian.birsan@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Cristian Birsan <cristian.birsan@microchip.com>

This patch set adds usb device support for SAM9x60 SoC.
The DPRAM memory for the USB High Speed Device Port (UDPHS) hardware
block was increased and the allocation method is changed. This patch
series simplifies the endpoint allocation scheme to acomodate this SoC
and the old ones.

Changes in v2:
- drop the patch that adds reference to pmc for sam9x60
- use dt-bindings: usb prefix
- enable usb device in device tree

Claudiu Beznea (1):
  usb: gadget: udc: atmel: use of_find_matching_node_and_match

Cristian Birsan (6):
  dt-bindings: usb: atmel: Update DT bindings documentation for sam9x60
  usb: gadget: udc: atmel: simplify endpoint allocation
  usb: gadget: udc: atmel: use 1 bank endpoints for control transfers
  usb: gadget: udc: atmel: rename errata into caps
  usb: gadget: udc: atmel: update endpoint allocation for sam9x60
  ARM: dts: at91: sam9x60ek: enable usb device

 .../devicetree/bindings/usb/atmel-usb.txt     |  1 +
 arch/arm/boot/dts/at91-sam9x60ek.dts          | 13 +++
 arch/arm/boot/dts/sam9x60.dtsi                | 74 ++++++++++++++++
 drivers/usb/gadget/udc/atmel_usba_udc.c       | 87 ++++++++++++-------
 drivers/usb/gadget/udc/atmel_usba_udc.h       |  6 +-
 5 files changed, 145 insertions(+), 36 deletions(-)

-- 
2.17.1

