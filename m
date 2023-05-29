Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D54C871526B
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 01:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbjE2Xs0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 19:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjE2XsY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 19:48:24 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C744DE
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 16:48:23 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-64d303dd87bso4094212b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 16:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685404103; x=1687996103;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=baisBCQdwcOD2KU8usJRfw00yVWo58O46yXkHEfqwQg=;
        b=KV7lcpWo+O6qpPfZ2jmZBGb0+i1sLwv1SQ4ANGNy1WwCAtCstSsvmF3Jl2x0isQsX9
         gSykC/NhRWU5Eurxu7K+u3pttImSPummjzcfCuojKtwJ8TNcUidYsy+3JEBewP6zHWdz
         gXqhqgDBHra0gG3yRfQQELEc+zf4kz0NLg9/CYaM8dniRaCWjrE9lAbRUWu8Lp0J1eYF
         pyhp9aR3mWCVmboIOVknrIltkEH93KBQxgP9QoG0SEZfDtTlzEarKmoJhcZt+HY5TtZ+
         kU8BNbSFTn33xy5Nu7gDzaeJ/todu3TiUvZhPduVEh5NhCLM4G5gnbtMs3aOt5KMtUfB
         UAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685404103; x=1687996103;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=baisBCQdwcOD2KU8usJRfw00yVWo58O46yXkHEfqwQg=;
        b=dwaQM1lZyD+WqPaLBRhgTLd82g4IFVZfb0lL5yhv7NkGCrhPjNtWsH9G3ZAZnXZzZQ
         OMA0IMGCEdml9cT+UxDzRqsugn6NbUNYT0/4MlxUrlUXtmn94vaTAISHxCJ6nECOH2yI
         Nh3Lex00kswAlu/Zn92/e2EkRGm9IcEtc1L4pWN1TXkXUIXdfqh/GDEqX1LYgqZ5qpyx
         PKeMog23Uow77ZkBeL1Y010VTDnu+5CKr27Kkq4+xc35YQp9sdjxqm/9Ib03Vx73+RGE
         A+WlH427zruCKfkIS/us5FPaHzZFpDP0eX+hg3Sa8bptzNTZdAUmb+J1Mm+Lo0TkMAFk
         8jUA==
X-Gm-Message-State: AC+VfDwrAEp6L55ODU+vhZcduNO3KIVJXqg8Du6gTFsrYtUDRnINqwTW
        bUXS8u6DUvZfdTIq8EgJeG60+4m1dBY=
X-Google-Smtp-Source: ACHHUZ5vqsgrMEbSaNBtIpT5HapudnsiP+POiET8cgvkhEpoJ0ahvYKvXspmq5zuBbULnsXrffnP33Vua2k=
X-Received: from badhri.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6442])
 (user=badhri job=sendgmr) by 2002:a05:6a00:b8a:b0:643:b756:d39e with SMTP id
 g10-20020a056a000b8a00b00643b756d39emr84087pfj.6.1685404103149; Mon, 29 May
 2023 16:48:23 -0700 (PDT)
Date:   Mon, 29 May 2023 23:48:15 +0000
In-Reply-To: <20230529234816.3720623-1-badhri@google.com>
Mime-Version: 1.0
References: <20230529234816.3720623-1-badhri@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230529234816.3720623-2-badhri@google.com>
Subject: [PATCH v4 2/3] Revert "Revert "usb: gadget: udc: core: Prevent
 redundant calls to pullup""
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        colin.i.king@gmail.com, xuetao09@huawei.com,
        quic_eserrao@quicinc.com, water.zhangjiantao@huawei.com,
        peter.chen@freescale.com, balbi@ti.com, francesco@dolcini.it,
        alistair@alistair23.me, stephan@gerhold.net, bagasdotme@gmail.com,
        luca@z3ntu.xyz
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit 5e1617210aede9f1b91bb9819c93097b6da481f9.

The regression reported in
https://lore.kernel.org/all/ZF4bMptC3Lf2Hnee@gerhold.net/ is being
fixed in
commit 7d7863db7cc0 ("usb: gadget: udc: core: Offload usb_udc_vbus_handler processing").
Hence reverting the revert.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/gadget/udc/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 583c339876ab..4641153e9706 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -703,6 +703,9 @@ static int usb_gadget_connect_locked(struct usb_gadget *gadget)
 		goto out;
 	}
 
+	if (gadget->connected)
+		goto out;
+
 	if (gadget->deactivated || !gadget->udc->started) {
 		/*
 		 * If gadget is deactivated we only save new state.
-- 
2.41.0.rc0.172.g3f132b7071-goog

