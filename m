Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDE8827DBFB
	for <lists+linux-usb@lfdr.de>; Wed, 30 Sep 2020 00:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbgI2W0b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 18:26:31 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:37126 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728192AbgI2W0b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 18:26:31 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4A2DF42808;
        Tue, 29 Sep 2020 22:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601418391; bh=EjsJLWo7vauAzIWS21XH6KAsr6JNxKmE2vthl5OwzdA=;
        h=Date:From:Subject:To:Cc:From;
        b=IwxdVHdJFOg4kGjCBL+0J4uGweiQ97I4byju7bKpfhpA6fwxaoKpiIytJKuI22KJB
         9RJVkKck4fUqBH8IfVg2+yhPkTYYOCksMSQa3aE7p4dFu/rdzbB4PJuhMjtZpHz6+y
         Txt2rcBW57FIaWxZF8/Fo4XhaxmSK5Tpm4J9rcBdHo6vpF+Xorgkp4bas+di0j9LvO
         zNdG1WWw0jdZ9WcSAFYFUWJrfskjIJwT/9r+gcERWiF+xi1A139MhP2bm4IO8wW+hT
         8PbMwuNaydBQo1oBHkSpn6TjvdbN0MXu89+akytBTNGxikqLhkPtXWnhOyCKH6Afmo
         lhJQFWnQOarBQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id F1628A0096;
        Tue, 29 Sep 2020 22:26:29 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 29 Sep 2020 15:26:29 -0700
Date:   Tue, 29 Sep 2020 15:26:29 -0700
Message-Id: <41fcbd971c1a976e5353978172f11364a5534453.1601418253.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: gadget: Support up to max stream id
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DWC3 IPs can use the maximum stream id (up to 2^16) specified by the
USB 3.x specs. Don't limit to stream id 2^15 only. Note that this does
not reflect the number of concurrent streams the controller handles
internally.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 76c383eecfd3..bfae949dc3c6 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2510,7 +2510,7 @@ static int dwc3_gadget_init_in_endpoint(struct dwc3_ep *dep)
 
 	usb_ep_set_maxpacket_limit(&dep->endpoint, size);
 
-	dep->endpoint.max_streams = 15;
+	dep->endpoint.max_streams = 16;
 	dep->endpoint.ops = &dwc3_gadget_ep_ops;
 	list_add_tail(&dep->endpoint.ep_list,
 			&dwc->gadget->ep_list);
@@ -2559,7 +2559,7 @@ static int dwc3_gadget_init_out_endpoint(struct dwc3_ep *dep)
 		size /= 3;
 
 	usb_ep_set_maxpacket_limit(&dep->endpoint, size);
-	dep->endpoint.max_streams = 15;
+	dep->endpoint.max_streams = 16;
 	dep->endpoint.ops = &dwc3_gadget_ep_ops;
 	list_add_tail(&dep->endpoint.ep_list,
 			&dwc->gadget->ep_list);

base-commit: 8e9f3908b995a33443821dc3a977277f69a4adc3
-- 
2.28.0

