Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94CDA19712E
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 02:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbgC3AKH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Mar 2020 20:10:07 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:46446 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726403AbgC3AKH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Mar 2020 20:10:07 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F4127C08E2;
        Mon, 30 Mar 2020 00:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585527007; bh=To0bn0Fbz/hp7lX/UMgT2EPa1Uk/d3wQS6ReJrKzy0Y=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=BLuG83oZ/ixexq+k4JGFZ9AD5xArbdlfQNUuFh5+y6Bv1aPvSv0mLhStzN0PsnRZa
         KLJ0vGwACTwgL2jv8nauJU4cHf1bGEwvZRNO1xlhWMYU+9tI7EatpxCmrd2XB18knr
         BVc8Te3NWE2jIVB9Y2co4ve+vgIBba9RAF3Xqsk/N4yGXOyz4vlriGJmqRQsGNC4eC
         u82TWm/ekUzsmv60QO6pTNCPWceCN6UtDfeAt76f4slMJNKVdNbEKM+cwVxro5oYg1
         DzhsIkyPt2UqOKPL406ke1gUrYEqISKaklF9dD4MQ3xb9YeL055Od7Tno7voMDMwqt
         0zw344ZSr+8tg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id B7B79A00B1;
        Mon, 30 Mar 2020 00:10:05 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Sun, 29 Mar 2020 17:10:05 -0700
Date:   Sun, 29 Mar 2020 17:10:05 -0700
Message-Id: <8c861d467863a87202df2df37cd84e590a665bdf.1585526614.git.thinhn@synopsys.com>
In-Reply-To: <cover.1585526614.git.thinhn@synopsys.com>
References: <cover.1585526614.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 2/2] usb: dwc3: core: Use role-switch default dr_mode
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the driver is configured to use DRD role-switch, let the drd code
path decide the default dr_mode.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 7046c681fece..ab6323b8e323 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -85,6 +85,8 @@ static int dwc3_get_dr_mode(struct dwc3 *dwc)
 		 * specified or set to OTG, then set the mode to peripheral.
 		 */
 		if (mode == USB_DR_MODE_OTG &&
+		    (!IS_ENABLED(CONFIG_USB_ROLE_SWITCH) ||
+		     !device_property_read_bool(dwc->dev, "usb-role-switch")) &&
 		    dwc->revision >= DWC3_REVISION_330A)
 			mode = USB_DR_MODE_PERIPHERAL;
 	}
-- 
2.11.0

