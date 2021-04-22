Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E055F368983
	for <lists+linux-usb@lfdr.de>; Fri, 23 Apr 2021 01:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239790AbhDVXwU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Apr 2021 19:52:20 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:46252 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231605AbhDVXwT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Apr 2021 19:52:19 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 704E9C0551;
        Thu, 22 Apr 2021 23:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619135504; bh=V48qCrrN3qj7kK84zdt1V2DAh1FhPn1jRGyTO+hCCnw=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=g+A+tTfUhgrNyRlcFHJluijgbwY+fq/Q2rxKTGkD404YetpcLFQ+aItQAuOUHa6Cl
         uVQa3lSnC4Dhuo1Ewf18r1WXBPo73xQuY352vEKpH8kVuWXY79GU0TXoi5PdVpC+w4
         7+KaTMDreulVPldD5z4HvGS9SXYozRilV9ZrOOp4sdL/0sAY8oKDQXaNnF0yZc9096
         kC+2LXCpch5Gqq0Xj+HtgZVXLI70wmBNP+dzO55QJ4L62rTldW7+hWZ5QnLi1tddsb
         KaPn8LXixG1uEnV1JiKc9HP4l84gfPFRYNVgzBWpOqn9ueW+37eBYbPF6+iAzTSnv9
         AQpui4U71OUYw==
Received: from lab-vbox (unknown [10.205.129.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 202CAA006F;
        Thu, 22 Apr 2021 23:51:43 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Thu, 22 Apr 2021 16:51:43 -0700
Date:   Thu, 22 Apr 2021 16:51:43 -0700
Message-Id: <65c3070c666cd6b8beeee62d7f8e3e704ebf2d32.1619134559.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1619134559.git.Thinh.Nguyen@synopsys.com>
References: <cover.1619134559.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 2/2] usb: dwc3: gadget: Handle DEV_TXF_FLUSH_BYPASS capability
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DWC_usb32 IP introduces a new behavior when handling NoStream event for
IN endpoints. If the controller is capable of DEV_TXF_FLUSH_BYPASS, then
the driver does not need to force to restart stream for IN endpoints.
The controller will generate ERDY and restart the stream periodically.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/core.h   |  3 +++
 drivers/usb/dwc3/gadget.c | 10 +++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index b678200cc51e..b1e875c58f20 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -379,6 +379,9 @@
 #define DWC3_GHWPARAMS7_RAM1_DEPTH(n)	((n) & 0xffff)
 #define DWC3_GHWPARAMS7_RAM2_DEPTH(n)	(((n) >> 16) & 0xffff)
 
+/* Global HWPARAMS9 Register */
+#define DWC3_GHWPARAMS9_DEV_TXF_FLUSH_BYPASS	BIT(0)
+
 /* Global Frame Length Adjustment Register */
 #define DWC3_GFLADJ_30MHZ_SDBND_SEL		BIT(7)
 #define DWC3_GFLADJ_30MHZ_MASK			0x3f
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 90f4f9e69b22..dd80e5ca8c78 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -730,8 +730,16 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *dep, unsigned int action)
 			 * All stream eps will reinitiate stream on NoStream
 			 * rejection until we can determine that the host can
 			 * prime after the first transfer.
+			 *
+			 * However, if the controller is capable of
+			 * TXF_FLUSH_BYPASS, then IN direction endpoints will
+			 * automatically restart the stream without the driver
+			 * initiation.
 			 */
-			dep->flags |= DWC3_EP_FORCE_RESTART_STREAM;
+			if (!dep->direction ||
+			    !(dwc->hwparams.hwparams9 &
+			      DWC3_GHWPARAMS9_DEV_TXF_FLUSH_BYPASS))
+				dep->flags |= DWC3_EP_FORCE_RESTART_STREAM;
 		}
 	}
 
-- 
2.28.0

