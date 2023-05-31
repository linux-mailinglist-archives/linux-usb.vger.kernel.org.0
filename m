Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8317717ACD
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 10:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235172AbjEaI4J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 04:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234310AbjEaI4H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 04:56:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C64BE
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 01:56:02 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91EB77FC;
        Wed, 31 May 2023 10:55:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685523339;
        bh=+T/dhEBOGXHWr4myrNXKuQOel0Aor+qSh/ChxsQWfg8=;
        h=From:To:Cc:Subject:Date:From;
        b=Titebr4JM0s8sOB+sF/KosrQiKhUeHx9SE18veNLCL8cYI1vsM/+YMhUmi443GjZK
         9DaAeCIhbaMTJn4YkmbIDw1IQYJVrTNKGXxLmEqUD52XYebjyD9sMVbK5f1El/tn3X
         DGi3Y/lDeB8z895KUGJuzq0JntJYdWetuZDFANvE=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     torleiv@huddly.com, Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH] usb: dwc3: gadget: Clear DWC3_EP_PENDING_REQUEST from non-0 endpoints
Date:   Wed, 31 May 2023 09:55:44 +0100
Message-Id: <20230531085544.253363-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The DWC3_EP_PENDING_REQUEST flag is set against an endpoint when
there are no pending or started requests available. This flag is
cleared on queuing to the endpoint for endpoint 0, but not for any
other endpoints. This can exacerbate timing problems by allowing a
queue to go ahead for an isochronous endpoint that should not be
started, so clear the flag upon a successful dwc3_gadget_ep_queue().

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/usb/dwc3/gadget.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 578804dc29ca..bc1d93c56d82 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1988,13 +1988,17 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
 	 */
 	if (usb_endpoint_xfer_isoc(dep->endpoint.desc)) {
 		if (!(dep->flags & DWC3_EP_TRANSFER_STARTED)) {
+			int ret = 0;
+
 			if ((dep->flags & DWC3_EP_PENDING_REQUEST))
-				return __dwc3_gadget_start_isoc(dep);
+				ret = __dwc3_gadget_start_isoc(dep);
 
-			return 0;
+			dep->flags &= ~DWC3_EP_PENDING_REQUEST;
+			return ret;
 		}
 	}
 
+	dep->flags &= ~DWC3_EP_PENDING_REQUEST;
 	__dwc3_gadget_kick_transfer(dep);
 
 	return 0;
-- 
2.34.1

