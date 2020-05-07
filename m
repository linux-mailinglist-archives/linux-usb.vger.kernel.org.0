Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F20D71C95AF
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 17:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgEGP5N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 11:57:13 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:50461 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbgEGP5N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 11:57:13 -0400
X-Originating-IP: 87.231.134.186
Received: from localhost (87-231-134-186.rev.numericable.fr [87.231.134.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A6436C0002;
        Thu,  7 May 2020 15:57:09 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Cristian Birsan <cristian.birsan@microchip.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v2 0/3]
Date:   Thu,  7 May 2020 17:56:48 +0200
Message-Id: <20200507155651.1094142-1-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

A few month ago this series was sent and has not been merged while it
didn't have anything against it. I've ported the series onto v5.7-rc1,
added the acked by and reviewed by received on the first series and
took into account the comment from Robin Murphy for the last patch.

For the record this the original cover letter explaining the purpose
of this series:

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

 .../devicetree/bindings/usb/atmel-usb.txt     |  56 +-------
 arch/arm/boot/dts/at91sam9g45.dtsi            |  54 --------
 arch/arm/boot/dts/at91sam9rl.dtsi             |  54 --------
 arch/arm/boot/dts/at91sam9x5.dtsi             |  54 --------
 arch/arm/boot/dts/sama5d2.dtsi                | 120 ------------------
 arch/arm/boot/dts/sama5d3.dtsi                | 107 ----------------
 arch/arm/boot/dts/sama5d4.dtsi                | 120 ------------------
 drivers/usb/gadget/udc/atmel_usba_udc.c       | 112 ++++++++++------
 drivers/usb/gadget/udc/atmel_usba_udc.h       |  12 ++
 9 files changed, 87 insertions(+), 602 deletions(-)

-- 
2.26.2

