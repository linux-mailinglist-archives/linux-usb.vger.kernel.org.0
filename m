Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1589A51981F
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 09:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239579AbiEDHbp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 03:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345335AbiEDHbo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 03:31:44 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6AC523169
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 00:28:09 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-2dc7bdd666fso5909287b3.7
        for <linux-usb@vger.kernel.org>; Wed, 04 May 2022 00:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=hA3u9eSuEePEoFRhMep+qYQOWmkLXVxq7KVdtZnsNKA=;
        b=SpzVGiGCbD6/HZZiZgR05m6m+NpY8k1eGoto0qoHtvb4arQ8CE3wsbygXYV+wRJ7+T
         fhYuPlFcce3ePojKAj6sGKjQW5r1YbUAYnqCmsAyn3S014HY0uAGJjUTpCtUQTwrZKvL
         oBp0Uz4m5IRdULZ8MSEXIZS23YdTGc1nm+Zghl06PZ9DLykFb13uUkQaOiPtnexTqQEn
         EbzvPkxQMW9tFYTBRtXHMK8O2yzVmMMqTRKUdftjceI2GcLpmRpEn0Xh5rpUuvoTy9+r
         1+I58fDGm4WWCf8b4PFFCvWO2ZGI7WZb0izgY2kvyZVtqtIDHXBnJ2sgjOKa0oZgWwbG
         xJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=hA3u9eSuEePEoFRhMep+qYQOWmkLXVxq7KVdtZnsNKA=;
        b=jVaBhN1Fzh2cuJtl3297TxJquOMUrhp0mtFF8fNqECA+R6GJboRSX6QWYOpi3ZSiKn
         dQ15/9IJUTUdHeb5Xz2nmz+c7WgwC0gqI7JQ5NJ7sSvopfFAoOp0M0bJrbR9f7F5133X
         IOfi5Ssb6LfHu5ricpms0ndo38SAaorplcq2qIUieexxCmXGqbauJlv9Fy5IoNXVYWxz
         1XyHosCp+p07/BUW1euQUtJwRpy9LeUdJjaWjVASvjXnsd2CXzP2ccWbgoARx3Ei+wfE
         JNpB45VZY/bbJWmdSwWjWkp3xAsNiYcIM1y7yyeXg00DsNRbVEx45JqrbpRy4VQi580G
         DwMg==
X-Gm-Message-State: AOAM533iycAoXfB5oLaUXOZAXsuwljoIz0lSeuoYa9vobm1ocj6dR8kK
        Op1wvVQUoiIVCOQcQPCGnlk3hSsmFWaSLj93Ijo=
X-Google-Smtp-Source: ABdhPJz2S/z7hFPwO3u1No3eN3M5Wal+zR89mZHHX3sClbXnrbWpoWe1gdJ+Eo4yphvLYT9OYUaiB779G8VQ9n3cAM0=
X-Received: from albertccwang.ntc.corp.google.com ([2401:fa00:fc:202:d785:65ad:d184:1448])
 (user=albertccwang job=sendgmr) by 2002:a5b:712:0:b0:648:ae36:88a0 with SMTP
 id g18-20020a5b0712000000b00648ae3688a0mr16389544ybq.355.1651649289161; Wed,
 04 May 2022 00:28:09 -0700 (PDT)
Date:   Wed,  4 May 2022 15:28:02 +0800
Message-Id: <20220504072802.83487-1-albertccwang@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
Subject: [PATCH] usb: dwc3: gadget: Fix null pointer dereference
From:   Albert Wang <albertccwang@google.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        quic_jackp@quicinc.com
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Albert Wang <albertccwang@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There are still race conditions to hit the null pointer deference
with my previous commit. So I re-write the code to dereference the
pointer right after checking it is not null.

Fixes: 26288448120b ("usb: dwc3: gadget: Fix null pointer exception")

Signed-off-by: Albert Wang <albertccwang@google.com>
---
 drivers/usb/dwc3/gadget.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 19477f4bbf54..f2792968afd9 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3366,15 +3366,14 @@ static bool dwc3_gadget_endpoint_trbs_complete(struct dwc3_ep *dep,
 	struct dwc3		*dwc = dep->dwc;
 	bool			no_started_trb = true;
 
-	if (!dep->endpoint.desc)
-		return no_started_trb;
-
 	dwc3_gadget_ep_cleanup_completed_requests(dep, event, status);
 
 	if (dep->flags & DWC3_EP_END_TRANSFER_PENDING)
 		goto out;
 
-	if (usb_endpoint_xfer_isoc(dep->endpoint.desc) &&
+	if (!dep->endpoint.desc)
+		return no_started_trb;
+	else if (usb_endpoint_xfer_isoc(dep->endpoint.desc) &&
 		list_empty(&dep->started_list) &&
 		(list_empty(&dep->pending_list) || status == -EXDEV))
 		dwc3_stop_active_transfer(dep, true, true);
-- 
2.36.0.464.gb9c8b46e94-goog

