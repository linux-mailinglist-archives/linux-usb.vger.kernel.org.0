Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C633019710B
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 01:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbgC2XNL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Mar 2020 19:13:11 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:53112 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726382AbgC2XNL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Mar 2020 19:13:11 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 649F143B0F;
        Sun, 29 Mar 2020 23:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585523591; bh=kxDtcREaUceHbLcD6pcVdJ6rOx6X20TIrqm4cTn84BY=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=UOJH8yHJRiYLEApuO5z12+kZxiUqe9Ag3pSdLwQrMmbYOwf4/A8HGe5x6Yre+t+OY
         jP8+5Dj1b/wnncspVQp92mcFOqn7PhNK14Ph//PObcX4D2J0+HyO+zuxEPE2jEafF1
         PmhvUazjOLbNnc9Ds6wHpywyF+TvEdpyq+zwmZv3aZ3bU0UaNZh4BpD/N/lm1P+i77
         OBmBME5gosgROgY+K3/gY+X+U4tlUT7Dr0X9cvs3/qkIA61VF+LZwx2Wt5AJUimyUh
         qZ+CYyrVqwkQ/85anWW4dZbk7kVEaiSITghsGp2llL6JV51aAkj5astH4xS9MLxEiZ
         vpQ62EJH+exMg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 4E6A9A00B1;
        Sun, 29 Mar 2020 23:13:10 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Sun, 29 Mar 2020 16:13:10 -0700
Date:   Sun, 29 Mar 2020 16:13:10 -0700
Message-Id: <dda524d74ae8b31a75fe8e6678e37e5bce3b3575.1585523081.git.thinhn@synopsys.com>
In-Reply-To: <cover.1585523081.git.thinhn@synopsys.com>
References: <cover.1585523081.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 3/4] usb: dwc3: gadget: Issue END_TRANSFER to retry isoc transfer
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
index 7989fe663300..ee87b7b383f6 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1413,7 +1413,8 @@ static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
 	int ret;
 	int i;
 
-	if (list_empty(&dep->pending_list)) {
+	if (list_empty(&dep->pending_list) &&
+	    list_empty(&dep->started_list)) {
 		dep->flags |= DWC3_EP_PENDING_REQUEST;
 		return -EAGAIN;
 	}
@@ -1436,6 +1437,27 @@ static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
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
 
@@ -2645,6 +2667,18 @@ static void dwc3_gadget_endpoint_transfer_not_ready(struct dwc3_ep *dep,
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

