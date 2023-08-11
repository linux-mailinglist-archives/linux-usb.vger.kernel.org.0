Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 134A8779B09
	for <lists+linux-usb@lfdr.de>; Sat, 12 Aug 2023 01:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234142AbjHKXI1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Aug 2023 19:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230332AbjHKXIZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Aug 2023 19:08:25 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC1B26BC
        for <linux-usb@vger.kernel.org>; Fri, 11 Aug 2023 16:08:07 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-686f1240a22so2395654b3a.0
        for <linux-usb@vger.kernel.org>; Fri, 11 Aug 2023 16:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691795277; x=1692400077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eC39j/qLC1meMLZXhLnuCmKevyaWaXMIQe5VA3i/EhI=;
        b=lYqmJG6nt+sMNg0qGCGHC1RlKeB8pSaUVEjPDswITsPXzdYTZLc6X39cnz5R0YE2Rb
         n5NWz2sQonli3r5jMziSRI4zTkZzEy9UkHTHLItCH3Vk88PJtCwMedyD6JzqjddpzE39
         5pkDfOdcfLk2Dyq1aZKHeQFTcxJPfjfw9Q3kGp9fLxa3DyKbaA63OmfQmUiw6wsV4nmk
         QQq9kvbPvkY0V/f+qtWLmK896KZmp8bgIvVFBM7o+yJkMbZtuI9syaZdpRX1WFEbQ72k
         h6jHv90Bm52KzWqV/GsEhpwY7SaYCzzyrEGAUlPPnLrw7wBLzH74LXWSAVzVR8++8xD+
         ybNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691795277; x=1692400077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eC39j/qLC1meMLZXhLnuCmKevyaWaXMIQe5VA3i/EhI=;
        b=OtyQYMoU2w2Qzry8t2aar7++SwNwaDYxvuXt06JyltNwkcn3oJs7B7DUzDkbdNokTP
         IbHUEYXDQ2kwckwzjGYnSP3zu2PgFFq2ByHMyqkuXawU0f/98BjzoflV8G3ZumIyGphh
         NS2+JqYvt5MHQvqn0tfJQHQE/xPixdTn7Y6ggpgYvSmAsGq+Lnv5WOjIyFw/jJ1pFxew
         YHGjLMlAu1q9cMqSmnvNBitb2HSxD5v4JnqXL436xQ29O9XTYw05W92wUh+qOcl+q2Zo
         wJvcQhEC8FSVh7xhU/MJJyvtgTRbqketIPVNzoYuCDqaSoPw67wSAAAp11en66wgif2S
         XVyg==
X-Gm-Message-State: AOJu0YyRnpT9DftvC2VbtfmiG3IWj2j3GjdlXwg2f2vpKnw0xIMPaYWU
        7UbbPOioGT3e9uTVbiLWYxCmwOG9uCk0/A==
X-Google-Smtp-Source: AGHT+IHRqNyJNe+19V9Elh9HSRShZUzsgdjulzqpBTZstzqMg1Wuk5qoNbo94yghuRDQX6H8vVmIHQ==
X-Received: by 2002:a17:903:1248:b0:1b8:a70e:8a7e with SMTP id u8-20020a170903124800b001b8a70e8a7emr3475146plh.66.1691795277399;
        Fri, 11 Aug 2023 16:07:57 -0700 (PDT)
Received: from celestia.nettie.lan (static-198-54-134-172.cust.tzulo.com. [198.54.134.172])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902db0100b001b8622c1ad2sm4466857plx.130.2023.08.11.16.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 16:07:56 -0700 (PDT)
From:   Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org,
        Sam Edwards <CFSworks@gmail.com>
Subject: [PATCH] usb: usbip: fix use-after-free race
Date:   Fri, 11 Aug 2023 17:07:23 -0600
Message-ID: <20230811230723.59234-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

stub_recv_cmd_submit() allocates a `priv` structure, which is freed by
the TX thread after all URBs in the `priv` complete and are handled.
This means that stub_recv_cmd_submit() effectively loses ownership of
`priv` once the final URB is submitted: in the worst case, the RX
thread will be preempted before usb_submit_urb() returns, and the TX
thread will do all handling and cleanup before the RX thread resumes.

We don't lose ownership if usb_submit_urb() returns an error value,
since that means it won't eventually call stub_complete(), so the
error-handling `usbip_dump_urb(priv->urbs[i])` is still safe.

Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---
 drivers/usb/usbip/stub_rx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
index fc01b31bbb87..dba9a64830e6 100644
--- a/drivers/usb/usbip/stub_rx.c
+++ b/drivers/usb/usbip/stub_rx.c
@@ -592,8 +592,11 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
 	if (usbip_recv_iso(ud, priv->urbs[0]) < 0)
 		return;
 
-	/* urb is now ready to submit */
-	for (i = 0; i < priv->num_urbs; i++) {
+	/*
+	 * URB(s) are now ready to submit.
+	 * Note: priv is freed after the last URB is (successfully) submitted.
+	 */
+	for (i = 0; i < num_urbs; i++) {
 		ret = usb_submit_urb(priv->urbs[i], GFP_KERNEL);
 
 		if (ret == 0)
-- 
2.41.0

