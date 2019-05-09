Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ADFE193B1
	for <lists+linux-usb@lfdr.de>; Thu,  9 May 2019 22:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfEIUnA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 May 2019 16:43:00 -0400
Received: from pbmsgap01.intersil.com ([192.157.179.201]:35388 "EHLO
        pbmsgap01.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726749AbfEIUnA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 May 2019 16:43:00 -0400
Received: from pps.filterd (pbmsgap01.intersil.com [127.0.0.1])
        by pbmsgap01.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x49K2vvK012618;
        Thu, 9 May 2019 16:12:11 -0400
Received: from pbmxdp03.intersil.corp (pbmxdp03.pb.intersil.com [132.158.200.224])
        by pbmsgap01.intersil.com with ESMTP id 2scabqgtyy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 09 May 2019 16:12:11 -0400
Received: from pbmxdp03.intersil.corp (132.158.200.224) by
 pbmxdp03.intersil.corp (132.158.200.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Thu, 9 May 2019 16:12:09 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp03.intersil.corp (132.158.200.224) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Thu, 9 May 2019 16:12:08 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        "Chris Brandt" <chris.brandt@renesas.com>
Subject: [PATCH v2 00/15] usb: Add host and device support for RZ/A2
Date:   Thu, 9 May 2019 15:11:27 -0500
Message-ID: <20190509201142.10543-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-09_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905090114
X-Proofpoint-Spam-Reason: mlx
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For the most part, the RZ/A2 has the same USB 2.0 host and device
HW as the R-Car Gen3, so we can reuse a lot of the code.

However, there are a couple extra register bits, and the CFIFO
register 8-bit access works a little different..

There is a dedicated DMAC for the RZ/A2 USB Device HW, but we
have not been able to reliably get that working yet, so device
operation is pio only at the moment.

On the RZ/A2M eval board, both USB channels can be used as either
host or device. But, it's not set up for otg (ie, there are jumpers
and separate connectors). Therefore, below is an example of what it
would look like to enable USB channel 0 as a device instead of a host.

&usb2_phy0 {
	pinctrl-names = "default";
	pinctrl-0 = <&usb0_pins>;
	dr_mode = "peripheral";
	status = "okay";
};

&usbhs0 {
	status = "okay";
};






Chris Brandt (15):
  ARM: dts: r7s9210: Add USB clock
  ARM: dts: rza2mevb: Add 48MHz USB clock
  phy: renesas: rcar-gen3-usb2: detect usb_x1 clock
  dt-bindings: rcar-gen3-phy-usb2: Document use of usb_x1
  phy: renesas: rcar-gen3-usb2: Check dr_mode when not using OTG
  dt-bindings: rcar-gen3-phy-usb2: Document dr_mode
  dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support
  usb: renesas_usbhs: move flags macros
  usb: renesas_usbhs: add support for CNEN bit
  usb: renesas_usbhs: support byte addressable CFIFO
  usb: renesas_usbhs: Add support for RZ/A2
  dt-bindings: usb: renesas_usbhs: Add support for r7s9210
  ARM: dts: r7s9210: Add USB Host support
  ARM: dts: r7s9210: Add USB Device support
  ARM: dts: rza2mevb: Add USB host support

 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 17 ++--
 .../devicetree/bindings/usb/renesas_usbhs.txt      |  2 +
 arch/arm/boot/dts/r7s9210-rza2mevb.dts             | 42 ++++++++++
 arch/arm/boot/dts/r7s9210.dtsi                     | 95 ++++++++++++++++++++++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 22 +++++
 drivers/usb/renesas_usbhs/Makefile                 |  2 +-
 drivers/usb/renesas_usbhs/common.c                 | 25 ++++--
 drivers/usb/renesas_usbhs/common.h                 | 13 +++
 drivers/usb/renesas_usbhs/fifo.c                   |  9 +-
 drivers/usb/renesas_usbhs/rza.h                    |  1 +
 drivers/usb/renesas_usbhs/rza2.c                   | 79 ++++++++++++++++++
 include/linux/usb/renesas_usbhs.h                  |  1 +
 12 files changed, 292 insertions(+), 16 deletions(-)
 create mode 100644 drivers/usb/renesas_usbhs/rza2.c

-- 
2.16.1

