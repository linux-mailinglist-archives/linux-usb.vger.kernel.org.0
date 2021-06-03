Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75EF439A405
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jun 2021 17:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbhFCPMk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Jun 2021 11:12:40 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:39563 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbhFCPMk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Jun 2021 11:12:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622733055; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=nnMaHTNW7V6t61B/K4XmaWZEIIl32P8m6s5d/Jz9Kmk=; b=ishUOykmih1KIiY/jjwYkp+GWWJW03MA7GM1gNN2EFxDRoEeX25jlZ1bCHbLzUBEhQ4omiO/
 oha3Q5QFqoVMsHNJFzCcg1fJo6DRNLn7IvxK8guRpkebayT0WnZFkKwg4jX50d3+nUY6BgED
 F1vj/xloe7FwN4cafGvCEHIQabY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60b8f0cbe27c0cc77f6e3395 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Jun 2021 15:10:03
 GMT
Sender: linyyuan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 92D4DC433D3; Thu,  3 Jun 2021 15:10:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from localhost.localdomain (unknown [101.87.142.17])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: linyyuan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9412BC433D3;
        Thu,  3 Jun 2021 15:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9412BC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=linyyuan@codeaurora.org
From:   Linyu Yuan <linyyuan@codeaurora.org>
To:     linux-usb@vger.kernel.org
Cc:     Linyu Yuan <linyyuan@codeaurora.com>
Subject: [PATCH] usb: gadget: eem: fix wrong eem header operation
Date:   Thu,  3 Jun 2021 23:09:47 +0800
Message-Id: <20210603150947.4627-1-linyyuan@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Linyu Yuan <linyyuan@codeaurora.com>

when skb_clone() or skb_copy_expand() fail,
it should pull skb with lengh indicated by header,
or not it will read network data and check it as header.

Signed-off-by: Linyu Yuan <linyyuan@codeaurora.com>
---
 drivers/usb/gadget/function/f_eem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_eem.c b/drivers/usb/gadget/function/f_eem.c
index cfcc4e81fb77..28dd5f1fd106 100644
--- a/drivers/usb/gadget/function/f_eem.c
+++ b/drivers/usb/gadget/function/f_eem.c
@@ -495,7 +495,7 @@ static int eem_unwrap(struct gether *port,
 			skb2 = skb_clone(skb, GFP_ATOMIC);
 			if (unlikely(!skb2)) {
 				DBG(cdev, "unable to unframe EEM packet\n");
-				continue;
+				goto next;
 			}
 			skb_trim(skb2, len - ETH_FCS_LEN);
 
@@ -505,7 +505,7 @@ static int eem_unwrap(struct gether *port,
 						GFP_ATOMIC);
 			if (unlikely(!skb3)) {
 				dev_kfree_skb_any(skb2);
-				continue;
+				goto next;
 			}
 			dev_kfree_skb_any(skb2);
 			skb_queue_tail(list, skb3);
-- 
2.25.1

