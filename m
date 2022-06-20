Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4DD755269A
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 23:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235804AbiFTVg1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 17:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiFTVg0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 17:36:26 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0572C1A07E
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 14:36:26 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id i15so10830205plr.1
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 14:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=USSZEUENZlM8SPwVYhAoMDzqLslbBkVwNjrmCGu2V/E=;
        b=Nn6yWv3VVHDV4xPy7zOxTnonkEvrAC4Pgd7D1pluWvy+mRT6oWg8IrCQH7IA+zzNIv
         TrJzIfN5uX6o5Zpt7K+isgX2BJx/2+CJ0tabTPNoO1b39QRzFwcdJA/j+3KCSmhqJ2nb
         +U6MPzyCxNDBwXpk9vK32Y+i9PtanKPgNHJvrWnoysJvz0QnnDDEhyLPR6kwKHiAR3Y9
         XWIo1/+HE9aBhs+36UB5ndvJFN1sYFZo3H25mKvdMh3Pi1rapmWTHMrfbrEifWA9OHd7
         uDxO9qUEPNfjrOsGjEUrfAouy9J9TDxC1cqN0gnZBYOJzRHyK7INBaQ/5x5D+12P71e0
         2Jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=USSZEUENZlM8SPwVYhAoMDzqLslbBkVwNjrmCGu2V/E=;
        b=JyQwZ7eoJRuYycGHLLViLlGU7VkeioxKrbvyPY0CQV6jwazdDKnh5xiOLziXsNmcfE
         QM2K82ivzxXhkWEzm/2pe8zzgdqi/nSic9l3UHLot7HiUH02ldkdkdDLHIs7yqLztA/i
         1axsv2Rnu/je4wMBH1DXdS7NdzGUg/XeIdErD3sXfFClRA7vIM5a9s+4BiJNy/FPsfX1
         drx45r4iCsCjJK1BEpvOQ7FCoCcSd2ZqogvzmfSLUZOKfaPrzLlU4KWWu6BfZTMrVgR3
         5b3lerQ/LmyofUGWK+APHqK8VnHVuPLMj7aNy4TVA1cUtT6vO+Y43WK0pwUFB1q7lM+e
         tV8w==
X-Gm-Message-State: AJIora8wNN4kSzQsH/JPHqNjn+SQtUfCcRnD3MU8EGkpnjrDp+v4iCf7
        LC+PRDYMya4Fk1LDDBje9MWf/TeDX8suew==
X-Google-Smtp-Source: AGRyM1u3vscmYpzkYja1ajCNdDlu/I4HbhOhR/yaBRPO04mVCN5EqR4wkcF+5HZ56KEM3zKVej0tAA==
X-Received: by 2002:a17:90b:4c06:b0:1e3:17fa:e387 with SMTP id na6-20020a17090b4c0600b001e317fae387mr39781856pjb.53.1655760985502;
        Mon, 20 Jun 2022 14:36:25 -0700 (PDT)
Received: from ubuntu ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id x6-20020a1709029a4600b0015e8d4eb1d1sm9182110plv.27.2022.06.20.14.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 14:36:25 -0700 (PDT)
Date:   Mon, 20 Jun 2022 14:36:21 -0700
From:   Hyunwoo Kim <imv4bel@gmail.com>
To:     stern@rowland.harvard.edu
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] usb: host: ehci-q: Fix ehci_submit_single_step_set_feature
 annotation typo
Message-ID: <20220620213621.GA694104@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear all,
this is Hyunwoo Kim.

I found the "argument" typo.

Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 drivers/usb/host/ehci-q.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-q.c b/drivers/usb/host/ehci-q.c
index 1163af6fad77..807e64991e3e 100644
--- a/drivers/usb/host/ehci-q.c
+++ b/drivers/usb/host/ehci-q.c
@@ -1162,7 +1162,7 @@ submit_async (
  * This is done in two parts: first SETUP req for GetDesc is sent then
  * 15 seconds later, the IN stage for GetDesc starts to req data from dev
  *
- * is_setup : i/p arguement decides which of the two stage needs to be
+ * is_setup : i/p argument decides which of the two stage needs to be
  * performed; TRUE - SETUP and FALSE - IN+STATUS
  * Returns 0 if success
  */
-- 
2.25.1

Regards,
Hyunwoo Kim.
