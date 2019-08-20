Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED849537A
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 03:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728846AbfHTBgB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 21:36:01 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:50132 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728809AbfHTBgB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Aug 2019 21:36:01 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6E138C039E;
        Tue, 20 Aug 2019 01:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1566264961; bh=OnOxp4i1P6lyaoXQrxq3LlGqEaga2wnIm2gNF17zvBg=;
        h=Date:In-Reply-To:References:From:Subject:To:CC:From;
        b=SHFG9cfNWmhUIFc7hqvz+SGiVwCrEyYUC/4OB2OrZJSaevXakN85pAAtMlRUikUDr
         QP70kVuuvF+imaAtL63f6gSehRmw0tpYrroQ/pUtVCf8n0aMfqc49nH6Y8p2QXna/i
         zSpfyJsGD/SwzdbcIpZyBVtHrz1JB4PPFU0mpkptxkSquEVtg/aXYBtUK18gRJDXHs
         SqSogwoNek08Ft8B8exVdFicwflmEPLymkAJbnRVvjsVMoBs8ho2P3E6oGH4RI/MXK
         LuqxVrA+NQSp7r9fS7/suzTf968zpElA9rfi81Tn05dneYOzcCtS1Y2R7JM1xrhZLC
         Qwa4PUBsrOH4g==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 234F7A023B;
        Tue, 20 Aug 2019 01:36:01 +0000 (UTC)
Received: from US01WEHTC3.internal.synopsys.com (10.15.84.232) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 19 Aug 2019 18:36:00 -0700
Received: from te-lab16 (10.13.184.19) by US01WEHTC3.internal.synopsys.com
 (10.15.84.231) with Microsoft SMTP Server (TLS) id 14.3.408.0; Mon, 19 Aug
 2019 18:35:58 -0700
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 19 Aug 2019 18:35:58
 -0700
Date:   Mon, 19 Aug 2019 18:35:58 -0700
Message-ID: <6527c4dfde0bf135a085050f24ba28180b20dc5e.1566263914.git.thinhn@synopsys.com>
In-Reply-To: <cover.1566263914.git.thinhn@synopsys.com>
References: <cover.1566263914.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 2/4] usb: dwc3: Separate field holding multiple properties
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.184.19]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

dwc->hird_threshold field should store "snps,hird_threshold" property
only and not a combination of multiple properties. Remove the value of
"snps,is-utmi-l1-suspend" property from the field dwc->hird_threshold.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.c   | 3 +--
 drivers/usb/dwc3/gadget.c | 3 ++-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 30ebf3c65a63..f56d5058a66c 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1321,8 +1321,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	dwc->lpm_nyet_threshold = lpm_nyet_threshold;
 	dwc->tx_de_emphasis = tx_de_emphasis;
 
-	dwc->hird_threshold = hird_threshold
-		| (dwc->is_utmi_l1_suspend << 4);
+	dwc->hird_threshold = hird_threshold;
 
 	dwc->rx_thr_num_pkt_prd = rx_thr_num_pkt_prd;
 	dwc->rx_max_burst_prd = rx_max_burst_prd;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 173f5329d3d9..afc2ddb080ae 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2868,7 +2868,8 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 		reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 		reg &= ~(DWC3_DCTL_HIRD_THRES_MASK | DWC3_DCTL_L1_HIBER_EN);
 
-		reg |= DWC3_DCTL_HIRD_THRES(dwc->hird_threshold);
+		reg |= DWC3_DCTL_HIRD_THRES(dwc->hird_threshold |
+					    (dwc->is_utmi_l1_suspend << 4));
 
 		/*
 		 * When dwc3 revisions >= 2.40a, LPM Erratum is enabled and
-- 
2.11.0

