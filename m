Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B00C715254
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 01:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjE2XhK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 19:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjE2XhI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 19:37:08 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EBFECF
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 16:37:06 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-256258bea56so2097001a91.0
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 16:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685403425; x=1687995425;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=baisBCQdwcOD2KU8usJRfw00yVWo58O46yXkHEfqwQg=;
        b=1BVWXqdbg08i2AeV32T0lUkxp9lWZoLHH552jTCAxFVfR090dQGBi06nQIZqG7OIsF
         ekfuHSg6eBbUk/Z79MX56/efZU0bn5Y8JzQgk3JSwnCI9rIlRDVL6WJ9KCTuwnUGfY/G
         jxujFykeXR+j3J2MfjWwhgTQLDFOTitx008oqaiKrmK+va9qptqb0c+UluiZvQA/4hGx
         OWm17bSgh7xbdkNCWwK7b/jiLqVVvFevk+uDsZRXGxAOtWJeWW6y7O9Q6jBLwiun7R5t
         LmRgqQOEjuJyv3atnjymLDor+BH/FbV9l12ujQFweAldjvshvCJQ1LQFBnUDKGjG0g1E
         1b1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685403425; x=1687995425;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=baisBCQdwcOD2KU8usJRfw00yVWo58O46yXkHEfqwQg=;
        b=GnOqMWznGCx8lFQNHN6DslYWjATs4dFM+0aAslLu96ptx/7HwnJReQpSyeTCoOGFS5
         50fpo68FfWQqkEfpNn8D6gSNErA41FfzcclCzMxhFbw25HcmkIUbsXjVCpzRrd5rlpC9
         TW8fsyBpb/gIPbEI6j4v2koa6WnxTR/2ileRoM0anGK+YywdtNkGHgGgDApVYdFugCA8
         YJGFrHZ67GBfuDML2s1j2GHjPNi3jzREwFbgbg6zEdjxWZqzmE8v9LHZsrhEm7Cr/tOE
         bt2NVSHUCd9OQh9o9hzz7Qc1Bqs0UpoXiQHepK2ruqzE+ibbsUHDlD1dEhsmnHT7rnJ7
         qVsQ==
X-Gm-Message-State: AC+VfDwWdyv5tEehdJhGpYPgPxJInU+n8XyqrNU7xDYwGpcN4vO4dYi4
        4JA8//80wAv24xkY++pCJeafVgqynq4=
X-Google-Smtp-Source: ACHHUZ6qgR6y0TBgIq0o+ccP+/I4CCQM3KqQKjDbaA1DzbB5xR/AWB8DyxAQBKZO5Pxn6cxVkq0koDh4VKM=
X-Received: from badhri.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6442])
 (user=badhri job=sendgmr) by 2002:a17:90a:e601:b0:255:dd84:865d with SMTP id
 j1-20020a17090ae60100b00255dd84865dmr117435pjy.8.1685403425478; Mon, 29 May
 2023 16:37:05 -0700 (PDT)
Date:   Mon, 29 May 2023 23:36:59 +0000
In-Reply-To: <20230529233700.3706661-1-badhri@google.com>
Mime-Version: 1.0
References: <20230529233700.3706661-1-badhri@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230529233700.3706661-2-badhri@google.com>
Subject: [PATCH v3 2/3] Revert "Revert "usb: gadget: udc: core: Prevent
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
        autolearn=unavailable autolearn_force=no version=3.4.6
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

