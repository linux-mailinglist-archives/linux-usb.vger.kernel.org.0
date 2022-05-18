Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3CA52B224
	for <lists+linux-usb@lfdr.de>; Wed, 18 May 2022 08:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbiERGN0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 May 2022 02:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbiERGNZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 May 2022 02:13:25 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B616A4DF60
        for <linux-usb@vger.kernel.org>; Tue, 17 May 2022 23:13:21 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id f201-20020a2538d2000000b0064d6dbc76d2so1056217yba.6
        for <linux-usb@vger.kernel.org>; Tue, 17 May 2022 23:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=qdumKa4FBuTxuZUv3F0lK1XSfSq71XoSNJznwmGquGM=;
        b=UZ0XzqGFyIRUXC3XR4/VnzNa5pkMteEGw9q++34hDNEuUG45TA4QDABcKn6K4+mDBY
         l7Ivyf2LlRsOnsDezdIQaNiupPyubwcYfFSz78nu+TEnezztwdD0p9OULhbGa/kQ4dhQ
         LhoW/Zt6nA4qmQrdJL3izOx01eMr3gUdJg7645B3+3tV70bBPw9iy1SuGE9e5FBfdO26
         rnKeMl0L5rKz4hQw3f0/wJP3L9NWNu093LUZzo+Y/pBR38bydJHtnNmGp4JIcVr2M6Sn
         4NQ+SSeA32kwYy2Sbi05N/WKP8ccmHpZvwDmDW53gW756hlyOHHE59E8Khz4fgl/r3mv
         DAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=qdumKa4FBuTxuZUv3F0lK1XSfSq71XoSNJznwmGquGM=;
        b=qUVrLEjY5LGTNA2BmJ2rhEsBiEiw+sAjEG22hMoW8nBJS+1c2rKSY3cVaW7Fcv0HgD
         7KPYOg7d7isCjbIR+VmuJLV81Nq94Og/iFK3fa76ZXi8UjZ63RLOQwR4Cp+po+vZl0r+
         mxUGw4SPr3ueenSLAQWETeckwkodYOZybcY+jkBqnYNsbFgwfiTT7lyEgCYLiEqCNkYe
         SeY1WIXm74q6KpGBVhw9VwEPK65pBrx/Nt8BM+Dazf0a4HGtMWdvQ5dYGqh9eQTZGLwi
         gW34czp9Y4Jnex9rnvflfzZFwT6Vizsji8JX21/fxYYYKItEp6Mrkw0IaNqdPa3nk1J5
         Yo6w==
X-Gm-Message-State: AOAM531w2d96vXkFUeqBEHh7ICqUXqvIdHsgqgEsGJGfjLaIquRtl8eJ
        y4orV7GpnCXXovI8mx4U8Tl/SoB9iIGZM0pIwM8=
X-Google-Smtp-Source: ABdhPJwNXQdoayoEo7D/1Qer+YG/oJ4ICu4ESGhezth/PoFtz4/B+AmIFIfwCrkCSr84e0m/YmL6j0k4SAthbBy+nZI=
X-Received: from albertccwang.ntc.corp.google.com ([2401:fa00:fc:202:3413:e42f:31c4:c4e8])
 (user=albertccwang job=sendgmr) by 2002:a25:264e:0:b0:64d:e13f:7911 with SMTP
 id m75-20020a25264e000000b0064de13f7911mr9913828ybm.27.1652854400861; Tue, 17
 May 2022 23:13:20 -0700 (PDT)
Date:   Wed, 18 May 2022 14:13:15 +0800
Message-Id: <20220518061315.3359198-1-albertccwang@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
Subject: [PATCH v5] usb: dwc3: gadget: Move null pinter check to proper place
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

When dwc3_gadget_ep_cleanup_completed_requests() called to
dwc3_gadget_giveback() where the dwc3 lock is released, other thread is
able to execute. In this situation, usb_ep_disable() gets the chance to
clear endpoint descriptor pointer which leds to the null pointer
dereference problem. So needs to move the null pointer check to a proper
place.

Example call stack:

Thread#1:
dwc3_thread_interrupt()
  spin_lock
  -> dwc3_process_event_buf()
   -> dwc3_process_event_entry()
    -> dwc3_endpoint_interrupt()
     -> dwc3_gadget_endpoint_trbs_complete()
      -> dwc3_gadget_ep_cleanup_completed_requests()
       ...
       -> dwc3_giveback()
          spin_unlock
          Thread#2 executes

Thread#2:
configfs_composite_disconnect()
  -> __composite_disconnect()
   -> ffs_func_disable()
    -> ffs_func_set_alt()
     -> ffs_func_eps_disable()
      -> usb_ep_disable()
         wait for dwc3 spin_lock
         Thread#1 released lock
         clear endpoint.desc

Fixes: 26288448120b ("usb: dwc3: gadget: Fix null pointer exception")
Signed-off-by: Albert Wang <albertccwang@google.com>
---
 v5: Supplement the change log
 v4: Modify the change log text
 v3: Add change log to be compliant with the canonical patch format
 v2: Remove redundant 'else' and add additional comments and more
     descriptive commit text

 drivers/usb/dwc3/gadget.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 19477f4bbf54..7edd4a5dc6af 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3366,14 +3366,14 @@ static bool dwc3_gadget_endpoint_trbs_complete(struct dwc3_ep *dep,
 	struct dwc3		*dwc = dep->dwc;
 	bool			no_started_trb = true;
 
-	if (!dep->endpoint.desc)
-		return no_started_trb;
-
 	dwc3_gadget_ep_cleanup_completed_requests(dep, event, status);
 
 	if (dep->flags & DWC3_EP_END_TRANSFER_PENDING)
 		goto out;
 
+	if (!dep->endpoint.desc)
+		return no_started_trb;
+
 	if (usb_endpoint_xfer_isoc(dep->endpoint.desc) &&
 		list_empty(&dep->started_list) &&
 		(list_empty(&dep->pending_list) || status == -EXDEV))
-- 
2.36.1.124.g0e6072fb45-goog

