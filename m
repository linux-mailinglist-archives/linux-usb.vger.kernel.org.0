Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8BF27F6D9
	for <lists+linux-usb@lfdr.de>; Thu,  1 Oct 2020 02:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732234AbgJAAol (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Sep 2020 20:44:41 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:55904 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730155AbgJAAok (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Sep 2020 20:44:40 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1EEDFC08E7;
        Thu,  1 Oct 2020 00:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601513080; bh=w4bQMMPMytV5Fqto2kYUq5ZP20jsNlOdXC9UuB1FQB0=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=RGPOXfy4J/jJXe6W4dWXKAMEfi41122rh2B+GmsSpuXW8whbAinNxPoVs+rwy5agz
         9pd55FtMs9/A/KElJ8ahN0WDMthhwzvwSJfw11XaGVNGSyay7X3UFP7BiP9xq+Uum3
         29F5A2aRWs5nSEVtVJBiNzIvlH+aWAVbeOL1W1s/XhbxZQJUbhak5orMriYSklxYH6
         ocmwuFHC4sRDaEhJQsRNFwzHt852jOILzAyLkDiAsdX2G22u5S5A0p8ZZegM6dErgb
         qXTvs0cYqwuR3kQlrVynSn5est6CKIUZU3iqm1fRNd/5Xkc7GdFg/Nv40oxOkQ3RfS
         paoUzEUsPhB8A==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id E1949A00A0;
        Thu,  1 Oct 2020 00:44:38 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 30 Sep 2020 17:44:38 -0700
Date:   Wed, 30 Sep 2020 17:44:38 -0700
Message-Id: <d6992af19d752076b77d3097b84135f11e33e70d.1601511883.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1601511883.git.Thinh.Nguyen@synopsys.com>
References: <cover.1601511883.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 4/4] usb: dwc3: gadget: Return early if no TRB update
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the transfer had already started and there's no TRB to update, then
there's no need to go through __dwc3_gadget_kick_transfer(). There is
no problem reissuing UPDATE_TRANSFER command. This change just saves
the driver from doing a few operations. This happens when we run out of
TRB and function driver still queues for more requests.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index ff924656f690..da1f2ad2ad90 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1347,6 +1347,13 @@ static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
 
 	starting = !(dep->flags & DWC3_EP_TRANSFER_STARTED);
 
+	/*
+	 * If there's no new TRB prepared and we don't need to restart a
+	 * transfer, there's no need to update the transfer.
+	 */
+	if (!ret && !starting)
+		return ret;
+
 	req = next_request(&dep->started_list);
 	if (!req) {
 		dep->flags |= DWC3_EP_PENDING_REQUEST;
-- 
2.28.0

