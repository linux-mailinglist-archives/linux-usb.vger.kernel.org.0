Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57CEBA0FD1
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2019 05:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbfH2DLj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Aug 2019 23:11:39 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:46788 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725844AbfH2DLj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Aug 2019 23:11:39 -0400
Received: from mailhost.synopsys.com (dc2-mailhost1.synopsys.com [10.12.135.161])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7D6B7C01CE;
        Thu, 29 Aug 2019 03:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1567048298; bh=NAiiQJYD4E6pmQJH7mAH1CnI2z58cqgp/iMoYpAgcMc=;
        h=Date:From:Subject:To:CC:From;
        b=E18wv0sPKjpEluZlvSCdww9g+ihDzA/88VZt5dY8wDfcg7fv3hyLu43OyLTM42BKe
         Iex+3WKpa8YCwhdYQbYKa30wJnMlIST71BrTIF1YENzImp5qRr6c7TOuEqyBvH8yzx
         iT6YJyh6w8k/VeWqG1bQM49NKOaMJDI9JtaaetkTEeECf62PkUOOAy1RYn/6/x3Hfw
         d/IPQ+Z/TjRYYRUKkjZECuzYzCk4nKiHUi45fCjWD6Kb1l1muvnmG+tu2q/dUu3noq
         Rg77Z4LPOojoOD6EOlfFIKQzb0aY28nRApPAAn+ANTqzM8imaJJbTQ2MDIinZobHos
         pe8+VlcKFvZ7Q==
Received: from us01wehtc1.internal.synopsys.com (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 609ECA0097;
        Thu, 29 Aug 2019 03:11:38 +0000 (UTC)
Received: from US01WEHTC2.internal.synopsys.com (10.12.239.238) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 28 Aug 2019 20:11:37 -0700
Received: from te-lab16 (10.13.184.19) by US01WEHTC2.internal.synopsys.com
 (10.12.239.238) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 28 Aug
 2019 20:11:35 -0700
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 28 Aug 2019 20:11:35
 -0700
Date:   Wed, 28 Aug 2019 20:11:35 -0700
Message-ID: <02f8890eb7c60fa229ba599bf914936fe1491693.1567047731.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: gadget: Workaround Mirosoft's BESL check
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
 drivers/usb/dwc3/gadget.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 7b58e0e1e438..9ef2259829ba 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2083,9 +2083,10 @@ static void dwc3_gadget_config_params(struct usb_gadget *g,
 
 	/* Recommended BESL */
 	if (!dwc->dis_enblslpm_quirk) {
-		params->besl_baseline = 0;
+		params->besl_baseline = 1;
 		if (dwc->is_utmi_l1_suspend)
-			params->besl_deep = min_t(u8, dwc->hird_threshold, 15);
+			params->besl_deep =
+				clamp_t(u8, dwc->hird_threshold, 2, 15);
 	}
 
 	/* U1 Device exit Latency */
-- 
2.11.0

