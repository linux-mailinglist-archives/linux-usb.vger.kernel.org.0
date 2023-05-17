Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6798B706A0A
	for <lists+linux-usb@lfdr.de>; Wed, 17 May 2023 15:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbjEQNiY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 09:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbjEQNiW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 09:38:22 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B40874C3D
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 06:38:19 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ac8c0fbb16so7237341fa.2
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 06:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684330698; x=1686922698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ly7Sv2grDSLouanjUEzIq82Frd3YseMb/l+QstdnfJQ=;
        b=Dmvjct3gKXrPwPz7AhbdmHWwAuq2Es9vmNFvfxgsoJNv6V9hWhvklATBORJJB5qbJt
         SV9VuHyHeiRFiMEl95USGDcvXq2EPact/RuQUMxHVytPsTpks6NzwLuxYWb4aojhRIUJ
         Kd0wr9k/gjJeQS968vAdXqSZXpwdmQ/FQjJ5csPZErJn8sEUa7PCLxVkhNfItBtvLa3u
         9WNV5VDFJGiNXHII+fxMMk+RvOAk+QFnWFTH5w7+uMwa2BlV9ygrWx16O0jKwHQh0qjw
         UiSOh2bhAcYqZD1IQ+4AbiseFvrEej/lZ8vhXZqbd+D+hNv1PHkj+7Sf0Xc0vSzC7tdk
         Wfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684330698; x=1686922698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ly7Sv2grDSLouanjUEzIq82Frd3YseMb/l+QstdnfJQ=;
        b=SPs5+W3ktaWF23W1tJKLrePD6OabzQ00LiAiRKwtDTz/Q72XHgHnT53gPRV/PYyBQA
         2rB9PxI3GizJVNCT+e/t4FzAT2eUH8i8Du5vpLSd4vICqdmH8WqwbAksucAzncT2Jcrn
         h4LZDqh6koBXCy4IQaNVccPBavQFvZeJV4HAN6Y2/l4ewgFMOFFBKYO8vTTePC4W6Cx0
         +awXhsQJ1uD6iUL1IRhJJMTBzyuA5V3OeMDsaCuuRp/5r6FIU+o1PY+Kmn2CkPaLoBDK
         I66rgHN049n7cAJqxYry68D5SO4WJ5iHZsbapWU6prcG3wbMAol0DAnjsBUcMGkc/zb+
         AEAA==
X-Gm-Message-State: AC+VfDyrve/GCVUx2+H1zK8g6wVDMiirDuaa51APe83Op1PmX7F7M45M
        R2rQ8kzNyGb/MBjD1hljm0VhGQ==
X-Google-Smtp-Source: ACHHUZ5Zu6JBSjwmINQDKUtIcahDxpmKHXodYC2lqIyuKqZL4e7Pd3b00VZy7nQ5kCBe7qVZ7NygVQ==
X-Received: by 2002:a2e:780d:0:b0:2a7:8b35:8270 with SMTP id t13-20020a2e780d000000b002a78b358270mr10375545ljc.35.1684330697871;
        Wed, 17 May 2023 06:38:17 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id k2-20020a2e8882000000b002addd80bc8csm1784844lji.66.2023.05.17.06.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 06:38:17 -0700 (PDT)
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
To:     bjorn@mork.no, joneslee@google.com, oliver@neukum.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        stable@vger.kernel.org,
        syzbot+9f575a1f15fc0c01ed69@syzkaller.appspotmail.com
Subject: [PATCH] net: cdc_ncm: Deal with too low values of dwNtbOutMaxSize
Date:   Wed, 17 May 2023 13:38:07 +0000
Message-ID: <20230517133808.1873695-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
In-Reply-To: <87wnklivun.fsf@miraculix.mork.no>
References: <87wnklivun.fsf@miraculix.mork.no>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently in cdc_ncm_check_tx_max(), if dwNtbOutMaxSize is lower than
the calculated "min" value, but greater than zero, the logic sets
tx_max to dwNtbOutMaxSize. This is then used to allocate a new SKB in
cdc_ncm_fill_tx_frame() where all the data is handled.

For small values of dwNtbOutMaxSize the memory allocated during
alloc_skb(dwNtbOutMaxSize, GFP_ATOMIC) will have the same size, due to
how size is aligned at alloc time:
	size = SKB_DATA_ALIGN(size);
        size += SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
Thus we hit the same bug that we tried to squash with
commit 2be6d4d16a084 ("net: cdc_ncm: Allow for dwNtbOutMaxSize to be unset or zero")

Low values of dwNtbOutMaxSize do not cause an issue presently because at
alloc_skb() time more memory (512b) is allocated than required for the
SKB headers alone (320b), leaving some space (512b - 320b = 192b)
for CDC data (172b).

However, if more elements (for example 3 x u64 = [24b]) were added to
one of the SKB header structs, say 'struct skb_shared_info',
increasing its original size (320b [320b aligned]) to something larger
(344b [384b aligned]), then suddenly the CDC data (172b) no longer
fits in the spare SKB data area (512b - 384b = 128b).

Consequently the SKB bounds checking semantics fails and panics:

skbuff: skb_over_panic: text:ffffffff831f755b len:184 put:172 head:ffff88811f1c6c00 data:ffff88811f1c6c00 tail:0xb8 end:0x80 dev:<NULL>
------------[ cut here ]------------
kernel BUG at net/core/skbuff.c:113!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 57 Comm: kworker/0:2 Not tainted 5.15.106-syzkaller-00249-g19c0ed55a470 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/14/2023
Workqueue: mld mld_ifc_work
RIP: 0010:skb_panic net/core/skbuff.c:113 [inline]
RIP: 0010:skb_over_panic+0x14c/0x150 net/core/skbuff.c:118
[snip]
Call Trace:
 <TASK>
 skb_put+0x151/0x210 net/core/skbuff.c:2047
 skb_put_zero include/linux/skbuff.h:2422 [inline]
 cdc_ncm_ndp16 drivers/net/usb/cdc_ncm.c:1131 [inline]
 cdc_ncm_fill_tx_frame+0x11ab/0x3da0 drivers/net/usb/cdc_ncm.c:1308
 cdc_ncm_tx_fixup+0xa3/0x100

Deal with too low values of dwNtbOutMaxSize, clamp it in the range
[USB_CDC_NCM_NTB_MIN_OUT_SIZE, CDC_NCM_NTB_MAX_SIZE_TX]. We ensure
enough data space is allocated to handle CDC data by making sure
dwNtbOutMaxSize is not smaller than USB_CDC_NCM_NTB_MIN_OUT_SIZE.

Fixes: 289507d3364f ("net: cdc_ncm: use sysfs for rx/tx aggregation tuning")
Cc: stable@vger.kernel.org
Reported-by: syzbot+9f575a1f15fc0c01ed69@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=b982f1059506db48409d
Link: https://lore.kernel.org/all/20211202143437.1411410-1-lee.jones@linaro.org/
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/net/usb/cdc_ncm.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 6ce8f4f0c70e..db05622f1f70 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -181,9 +181,12 @@ static u32 cdc_ncm_check_tx_max(struct usbnet *dev, u32 new_tx)
 	else
 		min = ctx->max_datagram_size + ctx->max_ndp_size + sizeof(struct usb_cdc_ncm_nth32);
 
-	max = min_t(u32, CDC_NCM_NTB_MAX_SIZE_TX, le32_to_cpu(ctx->ncm_parm.dwNtbOutMaxSize));
-	if (max == 0)
+	if (le32_to_cpu(ctx->ncm_parm.dwNtbOutMaxSize) == 0)
 		max = CDC_NCM_NTB_MAX_SIZE_TX; /* dwNtbOutMaxSize not set */
+	else
+		max = clamp_t(u32, le32_to_cpu(ctx->ncm_parm.dwNtbOutMaxSize),
+			      USB_CDC_NCM_NTB_MIN_OUT_SIZE,
+			      CDC_NCM_NTB_MAX_SIZE_TX);
 
 	/* some devices set dwNtbOutMaxSize too low for the above default */
 	min = min(min, max);
@@ -1244,6 +1247,9 @@ cdc_ncm_fill_tx_frame(struct usbnet *dev, struct sk_buff *skb, __le32 sign)
 			 * further.
 			 */
 			if (skb_out == NULL) {
+				/* If even the smallest allocation fails, abort. */
+				if (ctx->tx_curr_size == USB_CDC_NCM_NTB_MIN_OUT_SIZE)
+					goto alloc_failed;
 				ctx->tx_low_mem_max_cnt = min(ctx->tx_low_mem_max_cnt + 1,
 							      (unsigned)CDC_NCM_LOW_MEM_MAX_CNT);
 				ctx->tx_low_mem_val = ctx->tx_low_mem_max_cnt;
@@ -1262,13 +1268,8 @@ cdc_ncm_fill_tx_frame(struct usbnet *dev, struct sk_buff *skb, __le32 sign)
 			skb_out = alloc_skb(ctx->tx_curr_size, GFP_ATOMIC);
 
 			/* No allocation possible so we will abort */
-			if (skb_out == NULL) {
-				if (skb != NULL) {
-					dev_kfree_skb_any(skb);
-					dev->net->stats.tx_dropped++;
-				}
-				goto exit_no_skb;
-			}
+			if (!skb_out)
+				goto alloc_failed;
 			ctx->tx_low_mem_val--;
 		}
 		if (ctx->is_ndp16) {
@@ -1461,6 +1462,11 @@ cdc_ncm_fill_tx_frame(struct usbnet *dev, struct sk_buff *skb, __le32 sign)
 
 	return skb_out;
 
+alloc_failed:
+	if (skb) {
+		dev_kfree_skb_any(skb);
+		dev->net->stats.tx_dropped++;
+	}
 exit_no_skb:
 	/* Start timer, if there is a remaining non-empty skb */
 	if (ctx->tx_curr_skb != NULL && n > 0)
-- 
2.40.1.606.ga4b1b128d6-goog

