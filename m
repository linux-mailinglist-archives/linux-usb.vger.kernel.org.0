Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614132B1643
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 08:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbgKMHTH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 02:19:07 -0500
Received: from cable.insite.cz ([84.242.75.189]:38678 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726133AbgKMHTH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Nov 2020 02:19:07 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id D722EA95CEB3B;
        Fri, 13 Nov 2020 08:18:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1605251933; bh=jqHIgBW38VyYlMJdSn0D9x9hP7tKzWCGLqTKs+HZ+mU=;
        h=From:Subject:To:Date:From;
        b=cxVLoX1XvbtjJBvdsoySsp1lH2rKtEmEJgF6zl36prE8zu78ZKhawvmQ7msKIcXag
         cwgNcLDL6DM5lq2gVnD/SVnB70Z/tZOxp1jfpC8+WiQ1M2gTStgnaSVNIWvPelfYf5
         tMtPIbXt4xRGdG40OfacO6ueVZAF89dqxHGPrOdA=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2I7Atbo5DQLv; Fri, 13 Nov 2020 08:18:48 +0100 (CET)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 41C55A95CEB37;
        Fri, 13 Nov 2020 08:18:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1605251928; bh=jqHIgBW38VyYlMJdSn0D9x9hP7tKzWCGLqTKs+HZ+mU=;
        h=From:Subject:To:Date:From;
        b=dIJxEwMI5JyTYt6O5LHsglRyRXoJnhLL1ZLO2FaYbLty5r1AbXxW5zLVjveuhis6y
         4++1il8ilYSQ9tV23uNmApuIOZ0LyqmXt70SZgMN9CSZ5tdJUdMjw0rygj34MTpZxh
         VVlK1cBD/Cw4d23Ium2bzATa+HVmxu6AwfnhGWvo=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Subject: [PATCH] ARM: dts: bcm283x: increase dwc2's RX FIFO size
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org
Message-ID: <e9e7d070-593c-122f-3a5c-2435bb147ab2@ivitera.com>
Date:   Fri, 13 Nov 2020 08:18:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The previous version of the dwc2 overlay set the RX FIFO size to
256 4-byte words. This is not enough for 1024 bytes of the largest
isochronous high speed packet allowed, because it doesn't take into
account extra space needed by dwc2.

RX FIFO's size is calculated based on the following (in 4byte words):
- 13 locations for SETUP packets
  5*n + 8 for Slave and Buffer DMA mode where n is number of control
  endpoints which is 1 on the bcm283x core

- 1 location for Global OUT NAK

- 2 * 257 locations for status information and the received packet.
  Typically two spaces are recommended so that when the previous packet
  is being transferred to AHB, the USB can receive the subsequent
  packet.

- 10 * 1 location for transfer complete status for last packet of each
  endpoint. The bcm283x core has 5 IN and 5 OUT EPs

- 10 * 1 additional location for EPDisable status for each endpoint

- 5 * 2 additional locations are recommended for each OUT endpoint

Total is 558 locations.

Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi        | 2 +-
 arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
b/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
index e2fd961..20322de 100644
--- a/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
+++ b/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 &usb {
 	dr_mode = "otg";
-	g-rx-fifo-size = <256>;
+	g-rx-fifo-size = <558>;
 	g-np-tx-fifo-size = <32>;
 	/*
 	 * According to dwc2 the sum of all device EP
diff --git a/arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
b/arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
index 0ff0e9e..1409d1b 100644
--- a/arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
+++ b/arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 &usb {
 	dr_mode = "peripheral";
-	g-rx-fifo-size = <256>;
+	g-rx-fifo-size = <558>;
 	g-np-tx-fifo-size = <32>;
 	g-tx-fifo-size = <256 256 512 512 512 768 768>;
 };
-- 
1.9.1


