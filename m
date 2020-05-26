Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E49651A0D9E
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2020 14:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbgDGM3l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Apr 2020 08:29:41 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:32794 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbgDGM3k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Apr 2020 08:29:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1586262581; x=1617798581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=NM+S8OMTmsMYRTLlSMp9bGaPdfxmccXI/+aoH5UKQmY=;
  b=ARTkUIkPQ89J+jvLV/6RwIC+m3CRVLP9uqeUPoc4LVGb9UPDcqyw/Hna
   6SLhxQ9iFn0SmKeF4ZxXvymjTtE4adwnB4pbeM9ErxzqpBGmYa2ItQcwl
   0pFu2A7lqpzbQa4VIMG7bHm5MapAQaZ183fjoe101YL0wm+aMHMv77Lrx
   Wifw9McoNF1LJpsuDo7mQmevMKvPE3nfhLIKylgy7MdCfni9FT10nBR77
   fNWpMTBvOsYINJGLWiWxG+xeNBsD9yP+ElDhpq6Da8EXxYyvqgYbOrA0X
   N78icLfZSrG3dMRSL0qwfklvut0FjFn1QeIZ1EGTZyRQiY78t81qkg2hD
   w==;
IronPort-SDR: iUlV/m0red8C47RO7L5KQr8rbp6swxs+xdLN7tIAtARdQcTP7m6avMkU6oMHHT2XS1Fp8CoS5J
 7jYJ0XP93JKicD3AJb7YNQ0UBk/BEoBS7OtENmRoqAGx0fWxvNnQpmntazIGpFW6H6BL6028GN
 m4cyZrPnixcUfJpnP4S2iH7+L8odZHvp9aBQDPGz3/hGUQSrEwe1ldvYCiU8ZJoGZfRd3V4OCS
 t0FcSPKHM4QOpN6demaPby1e9ppSbvgaI7Z6qUSREAYntXQiyJvwzzKM59C0cq1uqF+AxV+x7Z
 L3c=
X-IronPort-AV: E=Sophos;i="5.72,354,1580799600"; 
   d="scan'208";a="71684386"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Apr 2020 05:29:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 7 Apr 2020 05:29:39 -0700
Received: from cristi-P53.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Tue, 7 Apr 2020 05:29:37 -0700
From:   <cristian.birsan@microchip.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <nicolas.ferre@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
        Cristian Birsan <cristian.birsan@microchip.com>
Subject: [PATCH 3/7] usb: gadget: at91_udc: Update DT binding documentation
Date:   Tue, 7 Apr 2020 15:28:48 +0300
Message-ID: <20200407122852.19422-4-cristian.birsan@microchip.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407122852.19422-1-cristian.birsan@microchip.com>
References: <20200407122852.19422-1-cristian.birsan@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Cristian Birsan <cristian.birsan@microchip.com>

Add sam9x60 binding.

Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
---
 Documentation/devicetree/bindings/usb/atmel-usb.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
index 44e80153b148..bae2b928a014 100644
--- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
+++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
@@ -82,6 +82,7 @@ Required properties:
 	       "atmel,at91sam9rl-udc"
 	       "atmel,at91sam9g45-udc"
 	       "atmel,sama5d3-udc"
+	       "microchip,sam9x60-udc"
  - reg: Address and length of the register set for the device
  - interrupts: Should contain usba interrupt
  - clocks: Should reference the peripheral and host clocks
-- 
2.17.1

