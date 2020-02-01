Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90F4914F5F2
	for <lists+linux-usb@lfdr.de>; Sat,  1 Feb 2020 03:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgBACuo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 21:50:44 -0500
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:41816 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726475AbgBACuo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jan 2020 21:50:44 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 172D7C0081;
        Sat,  1 Feb 2020 02:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1580525443; bh=mH1MNj7shoH90lQtfngrvtwzhpKCt/2PTdc14RxyJ9c=;
        h=Date:From:Subject:To:Cc:From;
        b=JfvDNZ+H7EJACOCT47X2JZCDMGJjrH8aQW1TSRKmjNeMG7BaQU++RRSkjsmsOkLlW
         /LMJfPoaA0iFe/OPXth3D10WpLU6j8FTcNMyRIi+k/RghJ/5AXEPxbo3W8d2LtDwMY
         GR+mj9nvWD1u3Kx5NXgf3EFFZm2e4gp0IdKwPihRR/VGyjmq/Kf1ANZ3e7cTUXlQS4
         vioWn4lcSeJxNgukGZHnway2qKRYxSEmTLDwabquB+QzETbzJaifB/xkE9ialoaRrr
         Y3lBog3xi4hwdqT1JysL2coJqDRSe3Z3LQLp4rkBZlJ2FcmiQvdWIRl+KVWonnwz63
         FmZ/9QkDbuiMg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 7CBAFA007C;
        Sat,  1 Feb 2020 02:50:40 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 31 Jan 2020 18:50:40 -0800
Date:   Fri, 31 Jan 2020 18:50:40 -0800
Message-Id: <87bd6e525dbc59cd636c3cf5a4fa1758e9da6727.1580525268.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: gadget: composite: Inform controller driver of self-powered
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@ti.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Different configuration may draw different power. Inform the controller
driver of the change so it can respond properly (e.g. GET_STATUS
request). This fixes an issue with setting MaxPower from configfs. The
composite driver doesn't check this value when setting self-powered.

Fixes: 88af8bbe4ef7 ("usb: gadget: the start of the configfs interface")
Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/gadget/composite.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 223f72d4d9ed..2fbeb2c19665 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -861,6 +861,11 @@ static int set_config(struct usb_composite_dev *cdev,
 	else
 		power = min(power, 900U);
 done:
+	if (power <= USB_SELF_POWER_VBUS_MAX_DRAW)
+		usb_gadget_set_selfpowered(gadget);
+	else
+		usb_gadget_clear_selfpowered(gadget);
+
 	usb_gadget_vbus_draw(gadget, power);
 	if (result >= 0 && cdev->delayed_status)
 		result = USB_GADGET_DELAYED_STATUS;
-- 
2.11.0

