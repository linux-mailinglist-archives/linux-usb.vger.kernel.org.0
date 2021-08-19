Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6E023F1F97
	for <lists+linux-usb@lfdr.de>; Thu, 19 Aug 2021 20:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234306AbhHSSKe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Aug 2021 14:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234246AbhHSSKc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Aug 2021 14:10:32 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE09C061575
        for <linux-usb@vger.kernel.org>; Thu, 19 Aug 2021 11:09:55 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id q11so10378334wrr.9
        for <linux-usb@vger.kernel.org>; Thu, 19 Aug 2021 11:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pMSofRuLOOEM7S4GLf+GNrXNSMWfOcGXM1C31TKENBk=;
        b=az+O+V4GOiSZhHL7uvCPOkIyBa8xVmKZrl3tWgHLCmOjeqf6KknZHqU68B41Fhr2ur
         Ios8Ca0LKJRRSYNdfWN3Y0s8Ud5D5JRnAjkvIGH75LYDdPiGgBpWYsdG9e8Joi8K/T2N
         w8ZhQH48K+A0MBjdUxhfCasrSbp+Dgqge0U6zFZopi35HYr/P11eG6K21cSx02I7vqiF
         QNgJoDj9OXqufwi08TftkfJRnMc8yjbESRNiYh4ZVuvGo/CPVbABd9LZTdc+QP0tOTmq
         QOAzIj6oTiQq1I5443TENPhiR06jdVK6Y+nDMsa1IRIVjjhGfkzwcBfRHXFxMP2NBzIX
         UckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pMSofRuLOOEM7S4GLf+GNrXNSMWfOcGXM1C31TKENBk=;
        b=j9IHTqqnTQyzwi4qQdPAM5gLOg8R5MsaS0BsWwJ+cjLDK64edEu452z8+TxJIFlfPy
         lYbAlu3+zIC3QSKKVEWpovqVwq8MsadpiCSH1w8U+HltfabZEt3NeDTWikbR98R+VmNZ
         pQWkIpm9vK37DfaghT+7bDybNG2PexLMqVVf+x8fpgJHi1M6sxyrVJvBc4scgNQbjI72
         qjCHgrEvsS5CAfzMMlTreKuz7bPYmZgFDqCkjdZgOR1UR2N9/gb8ybmIUieGN4/hpZje
         yo5FgFCdq32utdxqvMiWEWOguJK1Bs0wBC1OdPpZ/bez9ub6Ty9XEzPo6oPX15FNPy6z
         pNRQ==
X-Gm-Message-State: AOAM533HOVfBHQ9JS9shGqASd3j/En8vEgaSIEednFkXqgTwLfkVgFy4
        rdCfNOYZORiFoYKwPhJQtQMutA==
X-Google-Smtp-Source: ABdhPJxWQhiOG2sZdGOBg7F/TsBsSBomEuQfVHoZFtDHuMyUUovWvR4bzDYBHn9vtAIxb81LSi3Mag==
X-Received: by 2002:a5d:6301:: with SMTP id i1mr5271775wru.423.1629396594614;
        Thu, 19 Aug 2021 11:09:54 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id h16sm3625668wre.52.2021.08.19.11.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 11:09:54 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 4/5] usb: isp1760: do not shift in uninitialized slot
Date:   Thu, 19 Aug 2021 19:09:28 +0100
Message-Id: <20210819180929.1327349-5-rui.silva@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210819180929.1327349-1-rui.silva@linaro.org>
References: <20210819180929.1327349-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Even though it is not expected, and would trigger a WARN_ON, killing a
transfer in a uninitialized slot this sequence is warned by clang
analyzer, twice:

drivers/usb/isp1760/isp1760-hcd.c:1976:18: warning: The result of the left shift is undefined because the right operand is negative [clang-analyzer-core.UndefinedBinaryOperatorResult]
                skip_map |= (1 << qh->slot);
drivers/usb/isp1760/isp1760-hcd.c:1983:18: warning: The result of the left shift is undefined because the right operand is negative [clang-analyzer-core.UndefinedBinaryOperatorResult]
                skip_map |= (1 << qh->slot);

Only set skip map if slot is active.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/isp1760-hcd.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index aed2714ce0cf..bf8ab3fe2e5a 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -1974,16 +1974,20 @@ static void kill_transfer(struct usb_hcd *hcd, struct urb *urb,
 	/* We need to forcefully reclaim the slot since some transfers never
 	   return, e.g. interrupt transfers and NAKed bulk transfers. */
 	if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
-		skip_map = isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
-		skip_map |= (1 << qh->slot);
-		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP, skip_map);
-		ndelay(100);
+		if (qh->slot != -1) {
+			skip_map = isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
+			skip_map |= (1 << qh->slot);
+			isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP, skip_map);
+			ndelay(100);
+		}
 		priv->atl_slots[qh->slot].qh = NULL;
 		priv->atl_slots[qh->slot].qtd = NULL;
 	} else {
-		skip_map = isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
-		skip_map |= (1 << qh->slot);
-		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP, skip_map);
+		if (qh->slot != -1) {
+			skip_map = isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
+			skip_map |= (1 << qh->slot);
+			isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP, skip_map);
+		}
 		priv->int_slots[qh->slot].qh = NULL;
 		priv->int_slots[qh->slot].qtd = NULL;
 	}
-- 
2.33.0

