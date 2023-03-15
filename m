Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00B6B6BBF95
	for <lists+linux-usb@lfdr.de>; Wed, 15 Mar 2023 23:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbjCOWF4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Mar 2023 18:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232153AbjCOWFx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Mar 2023 18:05:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 617F06BC22
        for <linux-usb@vger.kernel.org>; Wed, 15 Mar 2023 15:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678917907;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=vtEJDLbF9WmAEdnDmr80aR+9cRSDi/orK5tPxK8EaW8=;
        b=YdpWVs9uFROHv/59slGzqvuGeLXi9X9Y+eAAW60Go8iPreEztPC3KK5P0f2+NouFRUXBkY
        UVlwg3J6cu9STBfX+UQmdlnVVotTCKP8m1NFxHPCNo2SE7Lf0/xg/QlfB6iIKgf0qILmdf
        bWWLXr/p56guAhJ8+AC2XllGhm4BS1M=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-XJSmEUtlOIWVNsVMvdgiTw-1; Wed, 15 Mar 2023 18:05:03 -0400
X-MC-Unique: XJSmEUtlOIWVNsVMvdgiTw-1
Received: by mail-qv1-f71.google.com with SMTP id q1-20020ad44341000000b005a676b725a2so14697qvs.18
        for <linux-usb@vger.kernel.org>; Wed, 15 Mar 2023 15:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678917903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtEJDLbF9WmAEdnDmr80aR+9cRSDi/orK5tPxK8EaW8=;
        b=aEGUWLpy5UaNPWZ5kS/md5Rp0HbVhdN37DvXlt18BQ4eQMKwfIup+EVLtKnuAf4/ET
         0szVE5mhj2p56GdCjztXNRU/CrLWrXtP8ZGi8Ap3phO/RRvRFFas1gDiQ/7ClLIft81Z
         yyMU5AzkyVWJkoVruRZt+NtraPBOZQdd1RbsZ4l/HTphQl9iwHUL4OCNU7Xvlsd1SA9O
         MX6a4kKttZKZ/Vpm6i/J1vTtiQXQPiEDZAtGycDhlr0JsXkgt5//vbQG5WLKlGU512NC
         yFkL3yDJahBz8E5RtYg5P/ipg3gq2lpbfGvVUE0JH5q4lGBi1H91Nv5klzhQ17P5XvFB
         NUhw==
X-Gm-Message-State: AO0yUKXtnyqtdfLvv3vwXquYdpJ+ke9kEeFypR/8xuDYYb3SBxNraoFB
        mgKtpW5hUJLD+JR8Xx18Vav7wKuv4+LCxavPW8lrv2TWS6q2a+F6y5Mpw+AoUY16irkNw6HUmTF
        WCro5aDnqN9P5J7asr/9+
X-Received: by 2002:ac8:7f84:0:b0:3bf:d310:cc93 with SMTP id z4-20020ac87f84000000b003bfd310cc93mr2481033qtj.35.1678917903267;
        Wed, 15 Mar 2023 15:05:03 -0700 (PDT)
X-Google-Smtp-Source: AK7set9MdfIq7K5S6X/GE0J53hxHvTme/hey7A0eZNFBdJNPbmSFMGbb7HvTM6TLE2b/6fO3dM0gCA==
X-Received: by 2002:ac8:7f84:0:b0:3bf:d310:cc93 with SMTP id z4-20020ac87f84000000b003bfd310cc93mr2481009qtj.35.1678917902967;
        Wed, 15 Mar 2023 15:05:02 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id f33-20020a05622a1a2100b003bfb5fd72a7sm4741019qtb.86.2023.03.15.15.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 15:05:02 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] thunderbolt: rename shadowed variables bit to interrupt_bit and auto_clear_bit
Date:   Wed, 15 Mar 2023 18:04:50 -0400
Message-Id: <20230315220450.1470815-1-trix@redhat.com>
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

cppcheck reports
drivers/thunderbolt/nhi.c:74:7: style: Local variable 'bit' shadows outer variable [shadowVariable]
  int bit;
      ^
drivers/thunderbolt/nhi.c:66:6: note: Shadowed declaration
 int bit = ring_interrupt_index(ring) & 31;
     ^
drivers/thunderbolt/nhi.c:74:7: note: Shadow variable
  int bit;
      ^
For readablity rename the outer to interrupt_bit and the innner
to auto_clear_bit.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/thunderbolt/nhi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 318d20bd5b69..d0d26d288be8 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -63,15 +63,15 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
 {
 	int reg = REG_RING_INTERRUPT_BASE +
 		  ring_interrupt_index(ring) / 32 * 4;
-	int bit = ring_interrupt_index(ring) & 31;
-	int mask = 1 << bit;
+	int interrupt_bit = ring_interrupt_index(ring) & 31;
+	int mask = 1 << interrupt_bit;
 	u32 old, new;
 
 	if (ring->irq > 0) {
 		u32 step, shift, ivr, misc;
 		void __iomem *ivr_base;
+		int auto_clear_bit;
 		int index;
-		int bit;
 
 		if (ring->is_tx)
 			index = ring->hop;
@@ -91,11 +91,11 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
 		 */
 		misc = ioread32(ring->nhi->iobase + REG_DMA_MISC);
 		if (ring->nhi->quirks & QUIRK_AUTO_CLEAR_INT)
-			bit = REG_DMA_MISC_INT_AUTO_CLEAR;
+			auto_clear_bit = REG_DMA_MISC_INT_AUTO_CLEAR;
 		else
-			bit = REG_DMA_MISC_DISABLE_AUTO_CLEAR;
-		if (!(misc & bit))
-			iowrite32(misc | bit, ring->nhi->iobase + REG_DMA_MISC);
+			auto_clear_bit = REG_DMA_MISC_DISABLE_AUTO_CLEAR;
+		if (!(misc & auto_clear_bit))
+			iowrite32(misc | auto_clear_bit, ring->nhi->iobase + REG_DMA_MISC);
 
 		ivr_base = ring->nhi->iobase + REG_INT_VEC_ALLOC_BASE;
 		step = index / REG_INT_VEC_ALLOC_REGS * REG_INT_VEC_ALLOC_BITS;
@@ -115,7 +115,7 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
 
 	dev_dbg(&ring->nhi->pdev->dev,
 		"%s interrupt at register %#x bit %d (%#x -> %#x)\n",
-		active ? "enabling" : "disabling", reg, bit, old, new);
+		active ? "enabling" : "disabling", reg, interrupt_bit, old, new);
 
 	if (new == old)
 		dev_WARN(&ring->nhi->pdev->dev,
-- 
2.27.0

