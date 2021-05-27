Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0CB392455
	for <lists+linux-usb@lfdr.de>; Thu, 27 May 2021 03:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233938AbhE0Bbc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 21:31:32 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:40994 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234378AbhE0Bbb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 21:31:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622078999; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=zNKgSS2B8w4fQ+PSmZezFDPZoxT8td5AgHUoEvJdSok=; b=pG6ujbb2thdhpLcfG1b9/Y5uMF3htNCDHjgYNeYVuLlMKQL/pxKJFpc2QH9rChpDI0fJvoSS
 myvrWOq+YI8BmV53MMLc827csztZ79gkROigVOJ1Ut+FR4/IuDBTpvrxM5OIqOp2pUtgd5Fk
 uGz1xPYjQ9QhPElRXlEPpgzLiGc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60aef6025f788b52a516ac5f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 27 May 2021 01:29:38
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C20D6C433F1; Thu, 27 May 2021 01:29:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E2D7AC433F1;
        Thu, 27 May 2021 01:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E2D7AC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, Mayank Rana <mrana@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH] usb: dwc3: trace: Remove unused fields in dwc3_log_trb
Date:   Wed, 26 May 2021 18:29:24 -0700
Message-Id: <20210527012924.3596-1-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Mayank Rana <mrana@codeaurora.org>

Commit 0bd0f6d201eb ("usb: dwc3: gadget: remove allocated/queued request
tracking") removed the allocated & queued fields from struct dwc3_ep
but neglected to also remove them from the dwc3_log_trb event class's
TP_STRUCT definition which are now unused. Remove them to save eight
bytes per trace event entry.

Signed-off-by: Mayank Rana <mrana@codeaurora.org>
Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
 drivers/usb/dwc3/trace.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/dwc3/trace.h b/drivers/usb/dwc3/trace.h
index 51d18e8d1602..cb998ba50fea 100644
--- a/drivers/usb/dwc3/trace.h
+++ b/drivers/usb/dwc3/trace.h
@@ -222,8 +222,6 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 	TP_STRUCT__entry(
 		__string(name, dep->name)
 		__field(struct dwc3_trb *, trb)
-		__field(u32, allocated)
-		__field(u32, queued)
 		__field(u32, bpl)
 		__field(u32, bph)
 		__field(u32, size)
-- 
2.24.0

