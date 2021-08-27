Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A44B43F95EA
	for <lists+linux-usb@lfdr.de>; Fri, 27 Aug 2021 10:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244502AbhH0IW1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Aug 2021 04:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232409AbhH0IW0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Aug 2021 04:22:26 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43BE7C061757
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 01:21:38 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id g135so3309769wme.5
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 01:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4quR9ThIRPYQbS8Ifbodvt1W0T6Q/h5o2e7waNnSENc=;
        b=FlLhaZownM7wlqV75LN/q8RevQYUBQoiCG/qB3gPu7NzIMm5VRLHwORCgbic9v6f9o
         0hEmxoGdrcgZHidumlo7S5VbEuWzqPsXCyvk4M5o9s5csuashKfUWMxDhLwTuwM2GHyI
         ET2/etOlnr8qxNrD/+6aiuyeEIyVucOHCJUVvjYsbZsT9VtNomNO0M/8594yzqg4Gpue
         iipmWEvniNpKvmb3yVtIH60XkuLoV4ZbgQzWyX5roTACKmUPmOShq0r9aAYwt7ak2r86
         HNbXE2JSmxawDCOTqjnRVBvlu839Oa5ftsxdeidk2vLbXB1DLbfDeXzwuhwNSRwPmwJq
         xj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4quR9ThIRPYQbS8Ifbodvt1W0T6Q/h5o2e7waNnSENc=;
        b=gGPZRQCkFbMlWiHhx5v9AbnnNKajQTpOcAxIsgIZcdL8cpWNXWDEhM+dAHKgeatFsz
         bxuDcarCBAvPZyO1pmBKE66AZNb6XS+mhs0o8vUVpLUta83FFrP1tG/kI4n4xQKooENB
         wuAtAdh7gmQ/cTf7vxmEnqaiQKwd/QGUDydozU5qgXDh9LBnqmXn0QE7/TCipiVNFRQo
         L5bTQYZzUouoBOb1s+GLFie2wj05aPT4ZDfrFsmDftj3x99Mv5jcTTAdv3Ws4bwpCdBj
         yJDGlARw6YvsL794QVmV0XZV5TPBqgRCxlLwW3NylTcqP/WUNRys7E0CUWdWiqdq67oO
         dxfw==
X-Gm-Message-State: AOAM531PjHmlkpVDavAW2f3XxDh5DA3rYcxx2azmjyDzQSA++z84EeVZ
        5YDa2tjva0ixRe1UEb9CSqrXmAZ1Bf9HFQ==
X-Google-Smtp-Source: ABdhPJwOd8aHMqciNWJJ8h4LCZK37/gZNfbaS86EAAbN4yiSllDMG81r2fDINycBJ1Yk237J7SKRfQ==
X-Received: by 2002:a1c:2702:: with SMTP id n2mr7551425wmn.78.1630052496922;
        Fri, 27 Aug 2021 01:21:36 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id y1sm5177725wmq.43.2021.08.27.01.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 01:21:36 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dietmar Eggemann <deggeman@gmx.de>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 1/5] usb: isp1760: fix memory pool initialization
Date:   Fri, 27 Aug 2021 09:21:08 +0100
Message-Id: <20210827082112.4061086-2-rui.silva@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210827082112.4061086-1-rui.silva@linaro.org>
References: <20210827082112.4061086-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The loops to setup the memory pool were skipping some
blocks, that was not visible on the ISP1763 because it has
fewer blocks than the ISP1761. But won testing on that IP
from the family that would be an issue.

Reported-by: Dietmar Eggemann <deggeman@gmx.de>
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/isp1760-hcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index bf8ab3fe2e5a..b3a55c5d2155 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -588,8 +588,8 @@ static void init_memory(struct isp1760_hcd *priv)
 
 	payload_addr = PAYLOAD_OFFSET;
 
-	for (i = 0, curr = 0; i < ARRAY_SIZE(mem->blocks); i++) {
-		for (j = 0; j < mem->blocks[i]; j++, curr++) {
+	for (i = 0, curr = 0; i < ARRAY_SIZE(mem->blocks); i++, curr += j) {
+		for (j = 0; j < mem->blocks[i]; j++) {
 			priv->memory_pool[curr + j].start = payload_addr;
 			priv->memory_pool[curr + j].size = mem->blocks_size[i];
 			priv->memory_pool[curr + j].free = 1;
-- 
2.33.0

