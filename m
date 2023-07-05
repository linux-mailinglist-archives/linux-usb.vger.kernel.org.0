Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECCBA747ADE
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jul 2023 03:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbjGEBP1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jul 2023 21:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjGEBP0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jul 2023 21:15:26 -0400
Received: from mx2.ucr.edu (mx2.ucr.edu [138.23.62.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA7910DD
        for <linux-usb@vger.kernel.org>; Tue,  4 Jul 2023 18:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1688519725; x=1720055725;
  h=mime-version:from:date:message-id:subject:to;
  bh=q0HvZFnTXa9fgE+7yflwyqzGdoGApfl9T11jQdopfW8=;
  b=gx+rmd1aSNLNINuxAuzzXkuODe/KLcXyqm4w7reNJAq4zX1CXxtfKEdO
   asVcTnv99r0K9dD/CHYvNtCi2AZEns87mAezhM0XQaVr1I57S/ws2y3qk
   4quouSfvrxj5CkMFDvEvNGIx48EdXCk/Rcml1qrYYYuoPvWiR/5+jRLXh
   MeCl1c9rJUDUdS4Wafaq5AXcrq9GhYXAvXOBg5ZuZTPwrn7LVcpjPd5JM
   QUua49rV4TkMskDbMkzizy2xY43gdmNVSKFrs0eZhiYbk4+G+B6XBE3ic
   eVzIddFCnPbESpMiwA/bD6sLhZGwXCrkyVtz6Vg7lFeMJ5CHvuTyf6HCH
   A==;
Received: from mail-wr1-f70.google.com ([209.85.221.70])
  by smtp2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Jul 2023 18:15:24 -0700
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-2f2981b8364so3505225f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 04 Jul 2023 18:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1688519723; x=1691111723;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NIYq5ovgGYYcT2mwLIe/7Pwf4A8ZFgLTV67vPU1luuE=;
        b=OpDKa6aazYkYIruwvWLbwnWXzbvxhbV2XYMfpy978GxqtOHauKAOZYoLYn0DnSzCp9
         ZkBo2uz0ECn3yqxrbocDTgsrjomb0U1WSJGLsYJ8mT+MjEJyEfvRZ/JN275xRjGDN8si
         Ntv3h3tZAfU13NivPqTFkFQuidIgK+7sldNv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688519723; x=1691111723;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NIYq5ovgGYYcT2mwLIe/7Pwf4A8ZFgLTV67vPU1luuE=;
        b=KQC7AH2GUSFNjlVvMXi/soUFs2bL7GDi3on+44H3fyJ2iCLijS3jDI9aPnZVmAg7OB
         wVr6KnmW71V7Fv3xLnUFc/vTBt60SSDM4oFzSZo2dmHkLCooYZkzxo9yBNZt3o41U2hb
         3Ivdk7MonR6UrTUF/yGWiw6W+r7JkfVEl2xWyUwXFR/sntIGhUiHCJZEG+cj3inFm0TW
         xrD9/x2S9QaCksRFGJLJBK44QnUnBQcRc2UtP4k0h2WaLgWT8QFSDE9sCNsHTU2m66EL
         2hwD/+1qIDehx26eQjyDUeEaBTJFF3SLagoUlhrsiaq50Bxs7TccMAln5/xUxpZSFk6e
         hwnA==
X-Gm-Message-State: ABy/qLbnkVkNBgArb2/CCZdn/GOi8ZrbbU0z3gdQ9WEbXN1GWFKhi2kl
        B/ZJFVp2/yvtiWj5y5XgiHXRzN6f1YP4pkYiIBO102MwTh2518tv/ZQlNCw1jZUlb/+yGt669lx
        7urGfcZTxqgC7z+4I/b3qW6DYCejUWAibpc4i9g==
X-Received: by 2002:adf:f147:0:b0:314:38e4:2596 with SMTP id y7-20020adff147000000b0031438e42596mr5849448wro.49.1688519723015;
        Tue, 04 Jul 2023 18:15:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH0U4jLD27P3ah3ysuNk9sOys6goAlAbsY6dgFCEoGMpWROGB9rEd61YoyrMeyUAeyYjUe3bb9IYzKcnOuphfk=
X-Received: by 2002:adf:f147:0:b0:314:38e4:2596 with SMTP id
 y7-20020adff147000000b0031438e42596mr5849436wro.49.1688519722754; Tue, 04 Jul
 2023 18:15:22 -0700 (PDT)
MIME-Version: 1.0
From:   Yu Hao <yhao016@ucr.edu>
Date:   Tue, 4 Jul 2023 18:15:09 -0700
Message-ID: <CA+UBctD1E5ZLnBxkrXh3uxiKiKXphnLKiB=5whYtH73SCTESWw@mail.gmail.com>
Subject: [PATCH] net: lan78xx: Fix possible uninit bug
To:     woojung.huh@microchip.com, UNGLinuxDriver@microchip.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The variable buf should be initialized in the function lan78xx_read_reg.
However, there is no return value check, which means the variable buf
could still be uninit. But there is a read later.

Signed-off-by: Yu Hao <yhao016@ucr.edu>
---
 drivers/net/usb/lan78xx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index c458c030fadf..4c9318c92fe6 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1091,8 +1091,11 @@ static int lan78xx_write_raw_otp(struct
lan78xx_net *dev, u32 offset,
    int i;
    u32 buf;
    unsigned long timeout;
+   int ret;

-   lan78xx_read_reg(dev, OTP_PWR_DN, &buf);
+   ret = lan78xx_read_reg(dev, OTP_PWR_DN, &buf);
+   if (ret < 0)
+       return ret;

    if (buf & OTP_PWR_DN_PWRDN_N_) {
        /* clear it and wait to be cleared */
-- 
2.34.1
