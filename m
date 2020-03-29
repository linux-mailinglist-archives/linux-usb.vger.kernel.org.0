Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8E5019710A
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 01:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbgC2XNG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Mar 2020 19:13:06 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45296 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726382AbgC2XNG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Mar 2020 19:13:06 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6974CC0084;
        Sun, 29 Mar 2020 23:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585523585; bh=ftGNMMX+UbJ0+sWej98tnEtCxrDD2tsF6QmsiMcLJkU=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=Wjs+SgYRvy5xtRyWRNLDeFwvvLqwT0gxw609+x/7OOaNiirLpBLihTAsLEBJl5xBU
         k9F0O8VB7V64TIg8ELXVJ6je04GjrhFFj0lwO6W3XdmyreWnC2aJ4k2ydW9l1QXMDR
         xeHQmz1B4PttgOyDs4izQP293PzMDtkTcQa8j+K9dkjEuntccLR3NHWfNDWVulq7LE
         Uhfj13RoP+I2iZiZ0+jY/owcl9/t4od3/kgjw4ViZVob3mrUJdrlYD4onx9RVO4YAt
         mPlQCqGmR3dvpWTShOYAVX4WP+ooYweNMssFfMxh7rkBFaAPCgceK1zwv4A03b5MG0
         0x2sDoaM1aWeA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 38D9EA00B1;
        Sun, 29 Mar 2020 23:13:04 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Sun, 29 Mar 2020 16:13:04 -0700
Date:   Sun, 29 Mar 2020 16:13:04 -0700
Message-Id: <7a132f0067d0969be47a082eecadf268b28f86cf.1585523081.git.thinhn@synopsys.com>
In-Reply-To: <cover.1585523081.git.thinhn@synopsys.com>
References: <cover.1585523081.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 2/4] usb: dwc3: gadget: Store resource index of start cmd
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As long as the START_TRANSFER command completes, it provides the
resource index of the endpoint. Use this when we need to issue
END_TRANSFER command to an isoc endpoint to retry with a new
XferNotReady event.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index b02832ad9e72..7989fe663300 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -387,9 +387,12 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned cmd,
 
 	trace_dwc3_gadget_ep_cmd(dep, cmd, params, cmd_status);
 
-	if (ret == 0 && DWC3_DEPCMD_CMD(cmd) == DWC3_DEPCMD_STARTTRANSFER) {
-		dep->flags |= DWC3_EP_TRANSFER_STARTED;
-		dwc3_gadget_ep_get_transfer_index(dep);
+	if (DWC3_DEPCMD_CMD(cmd) == DWC3_DEPCMD_STARTTRANSFER) {
+		if (ret == 0)
+			dep->flags |= DWC3_EP_TRANSFER_STARTED;
+
+		if (ret != -ETIMEDOUT)
+			dwc3_gadget_ep_get_transfer_index(dep);
 	}
 
 	if (saved_config) {
-- 
2.11.0

