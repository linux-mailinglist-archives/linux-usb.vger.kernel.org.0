Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65CA0A59BD
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2019 16:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731133AbfIBOul (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Sep 2019 10:50:41 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41457 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726916AbfIBOuk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Sep 2019 10:50:40 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1i4nf9-0007oF-W5; Mon, 02 Sep 2019 14:50:36 +0000
From:   Colin King <colin.king@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Pawel Laszczak <pawell@cadence.com>, linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][usb-next] usb: cdns3: fix missing assignment of ret before error check on ret
Date:   Mon,  2 Sep 2019 15:50:35 +0100
Message-Id: <20190902145035.18200-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the check on a non-zero return code in ret is false because
ret has been initialized to zero.  I believe that ret should be assigned
to the return from the call to readl_poll_timeout_atomic before the
check on ret.  Since ret is being re-assinged the original initialization
of ret to zero can be removed.

Addresses-Coverity: ("'Constant' variable guards dead code")
Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/cdns3/gadget.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 3094ad65ffc9..0eb3022838d6 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -2154,7 +2154,7 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_endpoint *priv_ep)
 {
 	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
 	struct usb_request *request;
-	int ret = 0;
+	int ret;
 	int val;
 
 	trace_cdns3_halt(priv_ep, 0, 0);
@@ -2162,8 +2162,8 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_endpoint *priv_ep)
 	writel(EP_CMD_CSTALL | EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
 
 	/* wait for EPRST cleared */
-	readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
-				  !(val & EP_CMD_EPRST), 1, 100);
+	ret = readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
+					!(val & EP_CMD_EPRST), 1, 100);
 	if (ret)
 		return -EINVAL;
 
-- 
2.20.1

