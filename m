Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7F341F1FD4
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jun 2020 21:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgFHT1j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Jun 2020 15:27:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:39638 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726594AbgFHT1f (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Jun 2020 15:27:35 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 3C2D5AEBB;
        Mon,  8 Jun 2020 19:27:37 +0000 (UTC)
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     f.fainelli@gmail.com, gregkh@linuxfoundation.org, wahrenst@gmx.net,
        robh@kernel.org, mathias.nyman@linux.intel.com,
        Eric Anholt <eric@anholt.net>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-usb@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     linux-kernel@vger.kernel.org, tim.gover@raspberrypi.org,
        helgaas@kernel.org, lorenzo.pieralisi@arm.com
Subject: [PATCH 3/9] ARM: dts: bcm2711: Add firmware usb reset node
Date:   Mon,  8 Jun 2020 21:26:55 +0200
Message-Id: <20200608192701.18355-4-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608192701.18355-1-nsaenzjulienne@suse.de>
References: <20200608192701.18355-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Now that the reset driver exposing Raspberry Pi 4's firmware based USB
reset routine is available, let's add the device tree node exposing it.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
index c7f1d97e69bb..47e7c9c14ddf 100644
--- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
@@ -83,6 +83,11 @@ expgpio: gpio {
 				  "";
 		status = "okay";
 	};
+
+	usb_reset: usb-reset {
+		compatible = "raspberrypi,firmware-usb-reset";
+		#reset-cells = <0>;
+	};
 };
 
 &gpio {
-- 
2.26.2

