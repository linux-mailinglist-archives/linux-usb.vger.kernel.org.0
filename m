Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 145A56C02F4
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 17:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbjCSQAE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 12:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230358AbjCSQAC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 12:00:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63C49026
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 08:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679241555;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=kCgICu0KJAkXhiDRi5y/cM8U5p1k5bVMfl4yuYsdSQw=;
        b=dWQOYXgaLhFs6Dlbldi67ursN/z1B0yYGUpb5hRGzfYxyGTkrMzcJEnAMfjnV0pe708MJ9
        WEwQBXohlFTrHLqnuAMu1z9S1frnhjR5fATnSoCs2og++G0Fj5Mbq4rZrj03x7vbJJckNs
        teLgdq+s/7WrESXB8YLyPy0TAwaNUvY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-fU8yuXWkPsqAdCHQDnZ0gA-1; Sun, 19 Mar 2023 11:59:13 -0400
X-MC-Unique: fU8yuXWkPsqAdCHQDnZ0gA-1
Received: by mail-qt1-f197.google.com with SMTP id ga17-20020a05622a591100b003bfdf586476so5475759qtb.7
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 08:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679241553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCgICu0KJAkXhiDRi5y/cM8U5p1k5bVMfl4yuYsdSQw=;
        b=TFa1/Ag9mZEDTm5oJ2FrWwpscEWNF6sc5CeWfNJO8h2khfUO654LjG/3BcS8VNJN7/
         SMnE30EPW31cf0gxhHSh8sGvoSUoSC9NLOe3JowXY32Ur2X+FO5SO1BDA4WHla7Q1vOx
         WaLs6BjLb+KqTJ3VFNOqKXpyNyTt2Wl1GhcYld0ZsfBof577HFLr4/7jH2K9L876PnEG
         RfhYgdKej92/x8cNF13L97Y6WHyPvs+ntOro9OYGbCoEsalBgVohhPhhnS0pEyCqlPd0
         RupnsTNk2QFWf983HhS/XYtKmUUAZlTlAiqg7tL1tEYYCggJRwS+/NBBdYN3t8oF2y3F
         29jg==
X-Gm-Message-State: AO0yUKUmslkUFYOzcwCv6DFumbmkoMU5oMDPeNH9WsaUWCvg6/cmlECm
        URvpnudTpc6dMwLVevxd2+jv97QkHMnQMAO+moFJyH8kHhZNOQy9QqXRhDl+Sw1RyqdXAoiUKwl
        S5d+CHR6/HTwCA/Ic7zoh
X-Received: by 2002:a05:622a:188c:b0:3bf:e2ff:4c2f with SMTP id v12-20020a05622a188c00b003bfe2ff4c2fmr21989742qtc.51.1679241553401;
        Sun, 19 Mar 2023 08:59:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set9RY95IxUSoePkpXXO3x85piRzikUJ7diUt5Iu32z8WZrgmDSs16y56U1ABCRU7Dph61q/nLw==
X-Received: by 2002:a05:622a:188c:b0:3bf:e2ff:4c2f with SMTP id v12-20020a05622a188c00b003bfe2ff4c2fmr21989732qtc.51.1679241553187;
        Sun, 19 Mar 2023 08:59:13 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 139-20020a370591000000b00745a78b0b3asm1710434qkf.130.2023.03.19.08.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 08:59:12 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     herve.codina@bootlin.com, gregkh@linuxfoundation.org,
        nathan@kernel.org, ndesaulniers@google.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] usb: gadget: udc: remove unused usbf_ep_dma_reg_clrset function
Date:   Sun, 19 Mar 2023 11:59:10 -0400
Message-Id: <20230319155910.1706294-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

clang with W=1 reports
drivers/usb/gadget/udc/renesas_usbf.c:548:20: error: unused function
  'usbf_ep_dma_reg_clrset' [-Werror,-Wunused-function]
static inline void usbf_ep_dma_reg_clrset(struct usbf_ep *ep, uint offset,
                   ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/gadget/udc/renesas_usbf.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usbf.c b/drivers/usb/gadget/udc/renesas_usbf.c
index cb23e62e8a87..84ac9fe4ce7f 100644
--- a/drivers/usb/gadget/udc/renesas_usbf.c
+++ b/drivers/usb/gadget/udc/renesas_usbf.c
@@ -545,17 +545,6 @@ static inline void usbf_ep_dma_reg_bitclr(struct usbf_ep *ep, uint offset,
 	usbf_ep_dma_reg_writel(ep, offset, tmp);
 }
 
-static inline void usbf_ep_dma_reg_clrset(struct usbf_ep *ep, uint offset,
-					  u32 clr, u32 set)
-{
-	u32 tmp;
-
-	tmp = usbf_ep_dma_reg_readl(ep, offset);
-	tmp &= ~clr;
-	tmp |= set;
-	usbf_ep_dma_reg_writel(ep, offset, tmp);
-}
-
 static void usbf_ep0_send_null(struct usbf_ep *ep0, bool is_data1)
 {
 	u32 set;
-- 
2.27.0

