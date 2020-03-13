Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A615183F01
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2020 03:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgCMCSt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Mar 2020 22:18:49 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:59758 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726114AbgCMCSt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Mar 2020 22:18:49 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C319BC0F90;
        Fri, 13 Mar 2020 02:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1584065928; bh=pO/SNUjIYWdzbrgJFeSQiHKyCGbQNnG/ACsmePrUyfk=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=d+DNsNPR+8HlKcTceep9bntU1qXGW343AczVaBMtU5yYAxxUW8lKd7gmYc/JcCX7q
         aEdOHN/3vkQzXfNxYDKuVrtI3/SFe/VC27za1OmvhK1JlkJeg8VxEByv/nOICQPFMH
         LHoBry0XQg5HJ2xs+aZ/LHYxWKhfZzGYXi14jwfVHzIDO7/8AcXR3xqPyOHrWFtDV+
         rK3Uuda8phHbUbZyZ0sqFrATQXx9oBkmfM6gYmoPKSEBh+q3Mwbe5k/kMXesBbOUFW
         Mrc6r9srCL9DohiVWj1MD7da4rfWS3f2pRlVkfVNS2bCF41XfvXD3HhFnUaznPJ9oi
         kTBM8jIrkFhGg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 958B2A0072;
        Fri, 13 Mar 2020 02:18:47 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 12 Mar 2020 19:18:47 -0700
Date:   Thu, 12 Mar 2020 19:18:47 -0700
Message-Id: <ab34698f56f613cdf63d7d955e94c064a185b001.1584065705.git.thinhn@synopsys.com>
In-Reply-To: <cover.1584065705.git.thinhn@synopsys.com>
References: <cover.1584065705.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 3/3] usb: dwc3: gadget: Issue END_TRANSFER to retry isoc transfer
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

After a number of unsuccessful start isoc attempts due to bus-expiry
status, issue END_TRANSFER command and retry on the next XferNotReady
event.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index f1aae4615cf1..a5ad02987536 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1406,7 +1406,8 @@ static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
 	int ret;
 	int i;
 
-	if (list_empty(&dep->pending_list)) {
+	if (list_empty(&dep->pending_list) &&
+	    list_empty(&dep->started_list)) {
 		dep->flags |= DWC3_EP_PENDING_REQUEST;
 		return -EAGAIN;
 	}
@@ -1429,6 +1430,27 @@ static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
 			break;
 	}
 
+	/*
+	 * After a number of unsuccessful start attempts due to bus-expiry
+	 * status, issue END_TRANSFER command and retry on the next XferNotReady
+	 * event.
+	 */
+	if (ret == -EAGAIN) {
+		struct dwc3_gadget_ep_cmd_params params;
+		u32 cmd;
+
+		cmd = DWC3_DEPCMD_ENDTRANSFER |
+			DWC3_DEPCMD_CMDIOC |
+			DWC3_DEPCMD_PARAM(dep->resource_index);
+
+		dep->resource_index = 0;
+		memset(&params, 0, sizeof(params));
+
+		ret = dwc3_send_gadget_ep_cmd(dep, cmd, &params);
+		if (!ret)
+			dep->flags |= DWC3_EP_END_TRANSFER_PENDING;
+	}
+
 	return ret;
 }
 
@@ -2609,6 +2631,18 @@ static void dwc3_gadget_endpoint_transfer_not_ready(struct dwc3_ep *dep,
 		const struct dwc3_event_depevt *event)
 {
 	dwc3_gadget_endpoint_frame_from_event(dep, event);
+
+	/*
+	 * The XferNotReady event is generated only once before the endpoint
+	 * starts. It will be generated again when END_TRANSFER command is
+	 * issued. For some controller versions, the XferNotReady event may be
+	 * generated while the END_TRANSFER command is still in process. Ignore
+	 * it and wait for the next XferNotReady event after the command is
+	 * completed.
+	 */
+	if (dep->flags & DWC3_EP_END_TRANSFER_PENDING)
+		return;
+
 	(void) __dwc3_gadget_start_isoc(dep);
 }
 
-- 
2.11.0

