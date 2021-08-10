Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA10C3E5882
	for <lists+linux-usb@lfdr.de>; Tue, 10 Aug 2021 12:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235602AbhHJKnZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Aug 2021 06:43:25 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:33974 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231705AbhHJKnZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Aug 2021 06:43:25 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DAF23C0CBF;
        Tue, 10 Aug 2021 10:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1628592183; bh=BkBivD4JI9PGvsT3XRcGUrW2s1OU6CKWki/M+r0KmKY=;
        h=Date:From:Subject:To:Cc:From;
        b=fW8F92dDcDhQw1bsOb3vqrpNZa5uTTSBYyE2g+uLaWeJfwBMgok6AJdMemR5lLAuN
         bm83SlBUyI2giTtVsSGJN/ll8uGSCAJl7A2Cf+XKR+GKhgyqIxjCzKZ78I9WeUyL8/
         qI+hWtzpOlmbSQC9morOHBimvyrWdnbqfM2uUk38qbYfMl0UihKwwDRRP+Oqw7/y9T
         7s/Erl5HqQ6GmEIWnaQsq2jF15YgDstREcO0hlPW+WyKIJaaZsbeATf3CMjJmTSwWj
         lEp2Y3awqKCtJJzvUuo+eLnVjyKCcdJyrecPFydYdZAaGC6+aXo2IqTibjpU2emtZH
         4jjmcPbgseqnw==
Received: from aleksan (aleksan.internal.synopsys.com [10.116.75.32])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id D2497A0064;
        Tue, 10 Aug 2021 10:42:59 +0000 (UTC)
Received: by aleksan (sSMTP sendmail emulation); Tue, 10 Aug 2021 06:42:58 -0400
Date:   Tue, 10 Aug 2021 06:42:58 -0400
Message-Id: <c453469d618100321c876a8c2b0ebee15a456eac.1628583235.git.aleksan@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Argishti Aleksanyan <Argishti.Aleksanyan@synopsys.com>
Subject: [PATCH] usb: dwc2: gadget: implement udc_set_speed()
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Argishti Aleksanyan <Argishti.Aleksanyan@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Implemented udc_set_speed() gadget ops to allow the udc to select
the gadget speed on initialization.

Signed-off-by: Argishti Aleksanyan <aleksan@synopsys.com>
---
 drivers/usb/dwc2/gadget.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 985b272f53d5..837237e4bc96 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -4709,12 +4709,35 @@ static int dwc2_hsotg_vbus_draw(struct usb_gadget *gadget, unsigned int mA)
 	return usb_phy_set_power(hsotg->uphy, mA);
 }
 
+static void dwc2_gadget_set_speed(struct usb_gadget *g, enum usb_device_speed speed)
+{
+	struct dwc2_hsotg *hsotg = to_hsotg(g);
+	unsigned long		flags;
+
+	spin_lock_irqsave(&hsotg->lock, flags);
+	switch (speed) {
+	case USB_SPEED_HIGH:
+		hsotg->params.speed = DWC2_SPEED_PARAM_HIGH;
+		break;
+	case USB_SPEED_FULL:
+		hsotg->params.speed = DWC2_SPEED_PARAM_FULL;
+		break;
+	case USB_SPEED_LOW:
+		hsotg->params.speed = DWC2_SPEED_PARAM_LOW;
+		break;
+	default:
+		dev_err(hsotg->dev, "invalid speed (%d)\n", speed);
+	}
+	spin_unlock_irqrestore(&hsotg->lock, flags);
+}
+
 static const struct usb_gadget_ops dwc2_hsotg_gadget_ops = {
 	.get_frame	= dwc2_hsotg_gadget_getframe,
 	.set_selfpowered	= dwc2_hsotg_set_selfpowered,
 	.udc_start		= dwc2_hsotg_udc_start,
 	.udc_stop		= dwc2_hsotg_udc_stop,
 	.pullup                 = dwc2_hsotg_pullup,
+	.udc_set_speed		= dwc2_gadget_set_speed,
 	.vbus_session		= dwc2_hsotg_vbus_session,
 	.vbus_draw		= dwc2_hsotg_vbus_draw,
 };

base-commit: 73e19de7b79a2f26f0b370cc071728cede1ab3a0
-- 
2.30.2

