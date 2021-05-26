Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7EA391859
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235012AbhEZNCo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234915AbhEZNCe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:34 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580EAC061348
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:00 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id p7so1021401wru.10
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qOQPZ7P2+d7bQl1bhkEaXoufFGWie1gF+nljkJu9wC0=;
        b=sKCa9Z5UGvS37C92I4u+KIUCl0wzXAzjIP7bBogERl5FuUyOPPKclkJJw06G1h822n
         Qmfo5qvZZPCgUB5+vngf8BRnUzXFdWmoekhArA15G2QU7E0Gny0aj1kTcgvkrB22tCsb
         6LCpj/Epfo+c1p3HHg7gpXf/W3FTVaYwyMomjJyZKeyODiTncWS/i3PGUR/qCXtnLFdo
         tx6btx+Ul9mYh2MxVuI+7AewtWlwl1XrrL2P/z/HiDtodvogUfsdFhf8zC2FrfdgiJ4s
         ERiGPcmn8FSG3YdQfVAVfbLXUDW/XupGyx26HrxD6pf1oWhAsIoOoz2+6bERIeaWrV1s
         uZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qOQPZ7P2+d7bQl1bhkEaXoufFGWie1gF+nljkJu9wC0=;
        b=fgahQAgaIakA06oggGu+lEYZJS5XsotIVQh2BZwnJCsBWuqCtpMyEeBhwfIvt2S3md
         2YOXp/KfseqQXvAvbMyiiNnLJBodKbnPb+auS5YwhUD68V5ETpbvKtzkq5eh7l6v6nrv
         Xh5CYknS0Q7m+IxKiKiLGJ3nWz4n+HchJHaTuiHkYxUu/APZf+mnx5fy2hkk5eUWSTKu
         gLORXQ/DUsj5FxfIyj/lhNhMYrjz7Zn4LnTFhEIfCX47eBWyj0LnZo4HjTxqGXr0MYLx
         wZYPBsx0me4tEH6j5truc9pobjQGukJcX6huYLlYyxiA/ZCC+b3qKTitBCVaIS8jObUF
         64sw==
X-Gm-Message-State: AOAM533d0c5FHB8ssAtfumtezF3oLa3St+IHSV/ghQyf5Run5rMtxpow
        b2zaW0TOQpu43Wm7QL/kIF6pZw==
X-Google-Smtp-Source: ABdhPJxU9uTEqIWW9yn8i9bsD/tIXZXZwWSIhy2p/Ss0S2v8A+QUQiF+aS1Ux0gOmb1wMwf5cEidAA==
X-Received: by 2002:adf:ea8e:: with SMTP id s14mr14015140wrm.135.1622034058258;
        Wed, 26 May 2021 06:00:58 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:00:57 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH 11/24] usb: dwc2: hcd_queue: Fix typeo in function name 'dwc2_hs_pmap_unschedule()'
Date:   Wed, 26 May 2021 14:00:24 +0100
Message-Id: <20210526130037.856068-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/dwc2/hcd_queue.c:686: warning: expecting prototype for dwc2_ls_pmap_unschedule(). Prototype was for dwc2_hs_pmap_unschedule() instead

Cc: Minas Harutyunyan <hminas@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc2/hcd_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd_queue.c b/drivers/usb/dwc2/hcd_queue.c
index 621a4846bd05a..89a788326c562 100644
--- a/drivers/usb/dwc2/hcd_queue.c
+++ b/drivers/usb/dwc2/hcd_queue.c
@@ -675,7 +675,7 @@ static int dwc2_hs_pmap_schedule(struct dwc2_hsotg *hsotg, struct dwc2_qh *qh,
 }
 
 /**
- * dwc2_ls_pmap_unschedule() - Undo work done by dwc2_hs_pmap_schedule()
+ * dwc2_hs_pmap_unschedule() - Undo work done by dwc2_hs_pmap_schedule()
  *
  * @hsotg:       The HCD state structure for the DWC OTG controller.
  * @qh:          QH for the periodic transfer.
-- 
2.31.1

