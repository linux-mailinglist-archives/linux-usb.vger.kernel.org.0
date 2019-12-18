Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA23E12538C
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2019 21:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbfLRUhi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Dec 2019 15:37:38 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21]:10675 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfLRUhi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Dec 2019 15:37:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576701456;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=BErOkmnJ7rtyFDhS4IRNkX3ktrVGAAw3V3ksnaK9qlw=;
        b=RZ3dPX6Sw2iq7PRgZ+9tKNpjTpcfMncBe3p84rJZJlnxFi11/kgD7YMY2S6M6mL0Kw
        e7rF/yVkNkBZo5T5FuynKG0Ou4o1/xYEGPPuzgt8g4sjkIlm22XWNkznh6pPFYLNr2Xb
        EygWetMGfTRKGn29AApF+9NISOD3dVr/tYhv4JkH/ko5ypnpjwjSf628GJt+bxbKdFIy
        mdDzVSNLyVy1aQ5RqoNkUDYKWohHUBAGBXNxzlIE+egmNIdLjlH706XfcQDwwqxnALYL
        dS62uXRIzWDFl2u036eRgo5qyk8kMmoZnD1Dl8z0MUqNnU0Ohv1kSn7NRgGssSV6CaPb
        C04Q==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQr4OGUPX+1JiWAnEWxQ="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.0.7 DYNA|AUTH)
        with ESMTPSA id 9046ccvBIKbYALE
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 18 Dec 2019 21:37:34 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] usb: phy: ab8500-usb: Keep PHY turned on in UART mode
Date:   Wed, 18 Dec 2019 21:34:50 +0100
Message-Id: <20191218203450.71037-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

AB8505 supports an "UART carkit mode" which makes UART accessible
through the USB connector. Upon detection of the UART cable,
this mode has to be manually enabled by:

  1. Turning on the PHY in peripheral mode
  2. Reconfiguring PHY/pins to route UART signals to USB pins

At the moment, we do not handle the UART link statuses at all,
which means that UART stops working as soon as phy-ab8500-usb is loaded
(since we disable the PHY after initialization).

Keeping UART working if the cable is inserted before turning on the device
is quite simple: In this case, early boot firmware has already set up
the necessary PHY/pin configuration. The presence of the UART cable
is reported by a special value in the USB link status register.

We can check for that value in ab8505_usb_link_status_update()
and set the PHY back to peripheral mode to restore UART.
(Note: This will result in some minor garbage since we still
 temporarily disable the PHY during initialization...)

Fully implementing this feature is more complicated:
For some reason, AB8505 does not update UART link status after bootup.
Regular USB cables work fine, but the link status register does not change
its state if an UART cable is inserted/removed.

It seems likely that the hardware is not actually capable of detecting
UART cables autonomously. In addition to the USB link status register,
implementations in the vendor kernel also manually measure
the ID resistance to detect additional cable types. For UART cables,
the USB link status register might simply reflect the PHY configuration
instead of the actual link status.

Implementing that functionality requires significant additions,
so for now just implement the simple case. This allows using UART
when inserting the cable before turning on the device.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/usb/phy/phy-ab8500-usb.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-ab8500-usb.c b/drivers/usb/phy/phy-ab8500-usb.c
index 4bb4b1d42f32..20c0f082bf9c 100644
--- a/drivers/usb/phy/phy-ab8500-usb.c
+++ b/drivers/usb/phy/phy-ab8500-usb.c
@@ -108,7 +108,8 @@ enum ab8500_usb_mode {
 	USB_IDLE = 0,
 	USB_PERIPHERAL,
 	USB_HOST,
-	USB_DEDICATED_CHG
+	USB_DEDICATED_CHG,
+	USB_UART
 };
 
 /* Register USB_LINK_STATUS interrupt */
@@ -393,6 +394,24 @@ static int ab8505_usb_link_status_update(struct ab8500_usb *ab,
 		usb_phy_set_event(&ab->phy, USB_EVENT_CHARGER);
 		break;
 
+	/*
+	 * FIXME: For now we rely on the boot firmware to set up the necessary
+	 * PHY/pin configuration for UART mode.
+	 *
+	 * AB8505 does not seem to report any status change for UART cables,
+	 * possibly because it cannot detect them autonomously.
+	 * We may need to measure the ID resistance manually to reliably
+	 * detect UART cables after bootup.
+	 */
+	case USB_LINK_SAMSUNG_UART_CBL_PHY_EN_8505:
+	case USB_LINK_SAMSUNG_UART_CBL_PHY_DISB_8505:
+		if (ab->mode == USB_IDLE) {
+			ab->mode = USB_UART;
+			ab8500_usb_peri_phy_en(ab);
+		}
+
+		break;
+
 	default:
 		break;
 	}
@@ -566,6 +585,11 @@ static irqreturn_t ab8500_usb_disconnect_irq(int irq, void *data)
 		ab->vbus_draw = 0;
 	}
 
+	if (ab->mode == USB_UART) {
+		ab8500_usb_peri_phy_dis(ab);
+		ab->mode = USB_IDLE;
+	}
+
 	if (is_ab8500_2p0(ab->ab8500)) {
 		if (ab->mode == USB_DEDICATED_CHG) {
 			ab8500_usb_wd_linkstatus(ab,
-- 
2.24.1

