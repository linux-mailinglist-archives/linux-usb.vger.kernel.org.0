Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80AE052A7FD
	for <lists+linux-usb@lfdr.de>; Tue, 17 May 2022 18:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350929AbiEQQdi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 May 2022 12:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350923AbiEQQdh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 May 2022 12:33:37 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE004E396
        for <linux-usb@vger.kernel.org>; Tue, 17 May 2022 09:33:36 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-2fb7cb07885so161798547b3.23
        for <linux-usb@vger.kernel.org>; Tue, 17 May 2022 09:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Nst/okWzt+1Pt7btm5FYdNUScd4Lw2KRfwoUVrWaXsw=;
        b=NUjqy/+bSbXrnYySDW8oHLK7ZvYo8UxSan1NjQOA0bI65RPnMb9WnR8tImW6L88OHi
         V36uWEmPNdeRafPTRd9eC+JpOr60TfgZdy3f6mTSXAZp8MyQxR1Twg85xE1SWCE/MC75
         Fg80X4tCgEOggsX6AKjdLhvX4UPF0MEKnfv02sHr60SQ9QCLpZEfTTLp3dlkexRmhzy+
         tCwSZJNpk++N6G+lwt4t+097KiDUTySpn9hD/KkoEITW2KP9SMs3jHNCnLEUypJRX14J
         fcOf5HP9xcwDUhK5vMIbCeS6kGgCZKbthNoXMuwmGql1IZN+Nwv9UfWZ1EpL2cAYGk6s
         UGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Nst/okWzt+1Pt7btm5FYdNUScd4Lw2KRfwoUVrWaXsw=;
        b=0XQqO7KVQ2lFPPZvyHNbNJ3VDGTPtwaKHTztiGAhgQne9AEjRWoqW8DOj+Gg50ym0j
         9FkmwIrI28H7IUJLL7j/7A+Q+HuorDhEcznWXLyz79xM3akK1i/12t7WZXHkwAMHMObG
         /FahfMnF1rjB3PW4iKXQV1OC1pCWwRWADxvXPXn+wKL/HOrPKETGhgBHH49jzV2gkEcg
         dYUr/E1Pvg64dydrPu4YJWnXjYRUnkqAZnhSVjVsVs2kOlTMSAlzZelvP1N2ZzgFODYE
         HIjB+rEV1WTwIdOjl30j8/U6Sk4m6AbOAoJ/PIE0STUHkEko3JQ8CQl8DUMLlx0pClJb
         H08g==
X-Gm-Message-State: AOAM533U3GlPOtu0WNvCbcVG0Xsg1WX43GIr7oCNuY32PXpadWur/I9z
        Vdt6IUU6hS2gs5f/F0gliz5A5PI4LFs5fbKskfA=
X-Google-Smtp-Source: ABdhPJzQMrJAB31cWyVhMrErVTIoNbT/VAktbZdlxzhC/MUZI8Jyjq+7+cHrQz0Gq+msR06t6x8V7DPcPbfvFWxOi6c=
X-Received: from albertccwang.ntc.corp.google.com ([2401:fa00:fc:202:e585:74ab:1a58:5276])
 (user=albertccwang job=sendgmr) by 2002:a25:d741:0:b0:64d:b05e:f263 with SMTP
 id o62-20020a25d741000000b0064db05ef263mr11319662ybg.72.1652805215997; Tue,
 17 May 2022 09:33:35 -0700 (PDT)
Date:   Wed, 18 May 2022 00:33:28 +0800
Message-Id: <20220517163328.3135065-1-albertccwang@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
Subject: [PATCH v4] usb: dwc3: gadget: Move null pinter check to proper place
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

