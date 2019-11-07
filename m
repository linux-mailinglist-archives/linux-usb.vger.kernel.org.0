Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B9A7F3351
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2019 16:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388787AbfKGPet (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 10:34:49 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:56341 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729698AbfKGPes (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 10:34:48 -0500
X-Originating-IP: 92.137.17.54
Received: from localhost (alyon-657-1-975-54.w92-137.abo.wanadoo.fr [92.137.17.54])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 938F14000E;
        Thu,  7 Nov 2019 15:34:45 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Cristian Birsan <cristian.birsan@microchip.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 0/3] Remove the USB EP configuration from device tree
Date:   Thu,  7 Nov 2019 16:31:25 +0100
Message-Id: <20191107153128.11038-1-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

The Atmel USB device controller is the only one having the description
of the End Point configuration in the device tree.

This configuration depend on the version of the controller used in the
SoC. This variation is already documented by the compatible string of
the controller.

In this series the configuration is associated to the compatible
string which allows to remove the EP child node from the device
tree. The main benefit of it, beyond the simplification of the device
tree, is the reduction of the size of the dtb which was too big to be
managed by the bootloader.

The first two patches should be merged through the USB subsystem while
the last one should be take by the a91 subsystem. Moreover this last
patch should be merged only once the change in the driver is merged.

Gregory

Gregory CLEMENT (3):
  usb: gadget: udc: atmel: Don't use DT to configure end point
  dt-bindings: usb: atmel: Mark EP child node as deprecated
  ARM: dts: at91: Remove the USB EP child node

 .../devicetree/bindings/usb/atmel-usb.txt     |  56 +--------
 arch/arm/boot/dts/at91sam9g45.dtsi            |  52 --------
 arch/arm/boot/dts/at91sam9rl.dtsi             |  52 --------
 arch/arm/boot/dts/at91sam9x5.dtsi             |  52 --------
 arch/arm/boot/dts/sama5d2.dtsi                | 118 ------------------
 arch/arm/boot/dts/sama5d3.dtsi                | 105 ----------------
 arch/arm/boot/dts/sama5d4.dtsi                | 118 ------------------
 drivers/usb/gadget/udc/atmel_usba_udc.c       | 112 +++++++++++------
 drivers/usb/gadget/udc/atmel_usba_udc.h       |  12 ++
 9 files changed, 87 insertions(+), 590 deletions(-)

-- 
2.24.0.rc1

