Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB1419712D
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 02:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbgC3AKB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Mar 2020 20:10:01 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:46438 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726403AbgC3AKB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Mar 2020 20:10:01 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D3C8FC08E2;
        Mon, 30 Mar 2020 00:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585527000; bh=KZO16+o2QjRs4UxC4ORQLOQDWg5wibXQmGzn/dvBLY0=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=dCWuFHjVQJDy80yjyP9Vp9gGIwHAKQtcn0nDH7ZQAYR/+HAS8YulO/NzbibvQNkIY
         ysoUWudZIP2H8esiOpFMAKq6qKwfPxgTJ09mBTau4l2++fy7h4mc5n22FvA4FeCzj4
         YJi2Z8JIHlP0H3qlHRwghbsZdmh+yBff/2J/uRU/rmAREKOai7eJaamO0F8oOvK6pW
         69yOI86Z/ScC5hE8PaOZxxL8WxgwU5nY9Fz/Mp895vPfLMVO/EnHi/BV9q0bXuBYsm
         cF4TEgf77OnKcxOD8GLqaUseaKTqo908UNYlpBpIDT5a7HzCPXc/DAPCH7MijeneoN
         +Dm7q6Fa7ORRQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id A3B72A006D;
        Mon, 30 Mar 2020 00:09:59 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Sun, 29 Mar 2020 17:09:59 -0700
Date:   Sun, 29 Mar 2020 17:09:59 -0700
Message-Id: <c2892b14b915f3e8bd7df91cd44f126abd887bd2.1585526614.git.thinhn@synopsys.com>
In-Reply-To: <cover.1585526614.git.thinhn@synopsys.com>
References: <cover.1585526614.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 1/2] usb: dwc3: drd: Don't free non-existing irq
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the driver is configured to use DRD role-switch, it's not OTG. There
won't be OTG irq to free. Check for dwc->otg_irq before freeing it.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/drd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index db68d48c2267..e6ec01972029 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -651,6 +651,6 @@ void dwc3_drd_exit(struct dwc3 *dwc)
 		break;
 	}
 
-	if (!dwc->edev)
+	if (dwc->otg_irq)
 		free_irq(dwc->otg_irq, dwc);
 }
-- 
2.11.0

