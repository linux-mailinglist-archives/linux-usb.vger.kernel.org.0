Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 513724047D2
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 11:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233055AbhIIJdv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 05:33:51 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:59218 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbhIIJds (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Sep 2021 05:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1631179959; x=1662715959;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dQBaVHGr4VyeSS4P0+YFnN85cIqQuFJeQVu9IUxSO8s=;
  b=gqkFczYINqKCb1unw2xBNBRojQroB02/6cM7F73gBMhl1PBU9dRaOJvF
   ZYUDcw3On92/EEmRC1PluZjmImKpkyazLZQEiP+qHqLDFBHjDQgaThags
   zMepoRl9z3UgjmWhHMKR0k505q4tm/vQUVfDvyQIzzfETY4HqRjbtnSnH
   s=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 09 Sep 2021 02:32:38 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2021 02:32:38 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 9 Sep 2021 02:32:36 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v2] usb: dwc3: gadget: clear gadget pointer after exit
Date:   Thu, 9 Sep 2021 17:32:32 +0800
Message-ID: <1631179952-28023-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

when do role switch from device to host mode,
first disable device mode, currently there is no better way to
confirm when gadget was complete removed.

change device release function to clear gadget pointer,
this will confirm device stop complete when it is NULL.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: fix comment from Greg Kroah-Hartman and improve commit log

 drivers/usb/dwc3/gadget.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 804b505..e2ab5f6 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4188,9 +4188,10 @@ static int dwc3_gadget_get_irq(struct dwc3 *dwc)
 
 static void dwc_gadget_release(struct device *dev)
 {
-	struct usb_gadget *gadget = container_of(dev, struct usb_gadget, dev);
+	struct dwc3 *dwc = dev_get_platdata(dev);
 
-	kfree(gadget);
+	kfree(dwc->gadget);
+	dwc->gadget = NULL;
 }
 
 /**
-- 
2.7.4

