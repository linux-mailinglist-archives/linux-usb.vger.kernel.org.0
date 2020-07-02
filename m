Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B809C2126EB
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729990AbgGBOs7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729987AbgGBOqs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:46:48 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10538C08C5E3
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:46:47 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f18so28295037wml.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sONund+v6m72UXA2k3mTvsnzOlUrvp8LHJR6S/5dS2c=;
        b=A7SXqjqrCM16AVWVbtxBs+8Q7KGVv5itBId7jsXn1AHLh3Veja6uzD8SFiMxl2t4vW
         rRF59UeX210MC4awzP8qxatLAoLaTqe+g6NZB5Y9eStTCYo9NLjEoQKDNzzXMjoXbeok
         CiVBADgITsgHMUKr55N6uCwjVEVtVYDES7xmS/ui20fUJ1IbAEhYec63OQgoF1LafLc0
         5SV9rFD21yf03RMLcybreux5P78eLRfpg6B+F6tQv7FYQOagpviBnjHwu0Pw0RRSZyfX
         jlsCnKv9/Ig3pejOEJF3CzbQdz/Ab06ku9zTCfDTG3urmvKVx1uSkSnq22manAl0mLN8
         eTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sONund+v6m72UXA2k3mTvsnzOlUrvp8LHJR6S/5dS2c=;
        b=FFWeFwO87AnhRWnH5oygUCyEG92nEMj8/PWunQs/niiWJCMOQ0+Um3stb9+++06eIk
         bU3SxLQibG1JXkwmbuLcTpgJTf3KeHR+r4djTYResxnO8kkItAiY7sgwW+Fg9/dMqL6E
         v6quFBoX3vJFFnQbV9g7+pzmy8NZdNqcYWS8MEE1/9SYSjorIw9JHbJ6xIrtLNK62j0V
         gdkRE3gBXBc1MP1p9RmT7gYHpsPPUFv5rqMC7VBD+8Yo01kZV0p40vQ9axwsWVGL8f6X
         hO/m/kY22YkeVdDEoKK42OiYCUmuPB1Ytw1KqyQ7gjthF+f6m2ApAeHFdc/9eNiJiIut
         SDug==
X-Gm-Message-State: AOAM531r8KGQNEQzw7LDmnEF3pIlmrpDqLI/mLuXIK82bkDIi8QhmuHC
        0NfjMyPPaDZO0UAT/WfchETfDA==
X-Google-Smtp-Source: ABdhPJzRi4BPfjzXaW8qFukfmFtIxWbM/JfxYDBuDyf0+vYOnyYhbkx/MYyV1XQriU0Sd2wBnDG/MA==
X-Received: by 2002:a1c:b4c2:: with SMTP id d185mr30552073wmf.57.1593701204872;
        Thu, 02 Jul 2020 07:46:44 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:46:43 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Ben Dooks <ben@simtec.co.uk>
Subject: [PATCH 10/30] usb: dwc2: gadget: Remove assigned but never used 'maxsize'
Date:   Thu,  2 Jul 2020 15:46:05 +0100
Message-Id: <20200702144625.2533530-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The value of 'maxsize' has not been checked since commit 729cac693eecf
("usb: dwc2: Change ISOC DDMA flow") back in 2018, so remove the set but
unused variable, which fixes the following W=1 kernel build warning:

 drivers/usb/dwc2/gadget.c: In function ‘dwc2_gadget_fill_isoc_desc’:
 drivers/usb/dwc2/gadget.c:885:6: warning: variable ‘maxsize’ set but not used [-Wunused-but-set-variable]
 885 | u32 maxsize = 0;
 | ^~~~~~~

Cc: Minas Harutyunyan <hminas@synopsys.com>
Cc: Ben Dooks <ben@simtec.co.uk>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc2/gadget.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 14c422ee6a069..116e6175c7a48 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -880,11 +880,10 @@ static int dwc2_gadget_fill_isoc_desc(struct dwc2_hsotg_ep *hs_ep,
 	struct dwc2_dma_desc *desc;
 	struct dwc2_hsotg *hsotg = hs_ep->parent;
 	u32 index;
-	u32 maxsize = 0;
 	u32 mask = 0;
 	u8 pid = 0;
 
-	maxsize = dwc2_gadget_get_desc_params(hs_ep, &mask);
+	dwc2_gadget_get_desc_params(hs_ep, &mask);
 
 	index = hs_ep->next_desc;
 	desc = &hs_ep->desc_list[index];
-- 
2.25.1

