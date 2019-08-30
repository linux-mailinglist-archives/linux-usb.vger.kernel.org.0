Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 449C4A2C05
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2019 03:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727410AbfH3BAX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Aug 2019 21:00:23 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:38964 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726991AbfH3BAX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Aug 2019 21:00:23 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AB8C5C03C2;
        Fri, 30 Aug 2019 01:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1567126822; bh=v+UvzZeB1e0YsYVXi4sl/Wp7VmXMNvPjweLxz/oTKLc=;
        h=Date:From:Subject:To:CC:From;
        b=Zpe9tYLzqSAD4x1BniolljyHkM77Aj44cLABd6uCVr9QaXfkmCk/CV9qCLiVh+ZoV
         cXsGxgcXU/kj1rNLMRhcC0QoB1umA4KoOqmpE1tmQiFW4h5cCik5YNwxHZEPmZIlya
         0LwDKWI+jHfBSJP1cDuce1xfISMfUEsAnxER7SEE3udtSIM7DxdJ+pbEYu279AJXVq
         BD6gcGxC4LkAEt0UOVfKTSg1yuuwJ0XG20rs54v/OXXcp1Mdz4WKGWQHvCSdGTabHW
         EGOPR7ofTLvObQPArt9+vuOOFukwnn+dtMWNu+Rh7KG3qr8Muyd5UjVbSERcx9YRkS
         fphyJcE4YzA1Q==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 95150A0091;
        Fri, 30 Aug 2019 01:00:22 +0000 (UTC)
Received: from US01WEHTC3.internal.synopsys.com (10.15.84.232) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 29 Aug 2019 18:00:21 -0700
Received: from te-lab16 (10.13.184.19) by US01WEHTC3.internal.synopsys.com
 (10.15.84.231) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 29 Aug
 2019 18:00:16 -0700
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 29 Aug 2019 18:00:16
 -0700
Date:   Thu, 29 Aug 2019 18:00:16 -0700
Message-ID: <6bbceb0a0468b5676fc4231169546ead91ce0c75.1567125618.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2] usb: dwc3: gadget: Workaround Mirosoft's BESL check
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.184.19]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

While testing our host system using Microsoft's usb stack against our
gadget for various BESL values, we found an issue with their usb stack
when the recommended baseline BESL value is 0 (125us) or when the deep
BESL is 1 or less. The Windows host will issue a usb reset immediately
after it receives the extended BOS descriptor and the enumeration will
fail after a few attempts.

To keep compatibility with Microsoft's host usb stack, let's workaround
this issue by using the recommended baseline BESL of 1 (or 150us)
and clamp the deep BESL value within 2 to 15.

This was tested against Windows 10 build 18956.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
changes in v2:
- Add comment in code for the new change


 drivers/usb/dwc3/gadget.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 7b58e0e1e438..3754bffb378c 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2083,9 +2083,19 @@ static void dwc3_gadget_config_params(struct usb_gadget *g,
 
 	/* Recommended BESL */
 	if (!dwc->dis_enblslpm_quirk) {
-		params->besl_baseline = 0;
+		/*
+		 * If the recommended BESL baseline is 0 or if the BESL deep is
+		 * less than 2, Microsoft's Windows 10 host usb stack will issue
+		 * a usb reset immediately after it receives the extended BOS
+		 * descriptor and the enumeration will fail. To maintain
+		 * compatibility with the Windows' usb stack, let's set the
+		 * recommended BESL baseline to 1 and clamp the BESL deep to be
+		 * within 2 to 15.
+		 */
+		params->besl_baseline = 1;
 		if (dwc->is_utmi_l1_suspend)
-			params->besl_deep = min_t(u8, dwc->hird_threshold, 15);
+			params->besl_deep =
+				clamp_t(u8, dwc->hird_threshold, 2, 15);
 	}
 
 	/* U1 Device exit Latency */
-- 
2.11.0

