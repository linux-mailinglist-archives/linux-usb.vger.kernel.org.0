Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5A382208DA
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 11:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730863AbgGOJct (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 05:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730768AbgGOJcQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 05:32:16 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96691C061755
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 02:32:16 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id f18so4873130wml.3
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 02:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aGkX+E1EBfqRr0rfaGdLhwyAcBiQ16E9WQER7VbVHB0=;
        b=B9eGyNDCvcRazQ5Vt4bCO10YvxegSYTM59WaGhCMmKF1ntTqI0zxMbYoNhBkEWX6+u
         Q/bcBNCzP/NiyAp1huYTJNpJcx0WdrEb56Rkp5DQRWi7GJPA4qNC2nOe1shHedItKyw6
         3OrZOdisEymzmeJLiYQ+pmiZ96mEIhootgO4sR9Ci94A0kJzd3MQ7+em+CZmN+XMU0bv
         Itkn84N4qTA3X3ge6IF1QJwxgLZ5oB523cWAJtAWZa9ztHkAhjwA+FMCGpHv3mFGJeGh
         bAIgVniOn+Dt6KpDNO9N3MtF4zQRMy+UZcXk9qotI5EeRahzIe/Gmm3D4sIsBdKJt4Km
         jJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aGkX+E1EBfqRr0rfaGdLhwyAcBiQ16E9WQER7VbVHB0=;
        b=eWNlw6MTF6LicYONm/viihE8tcmL16oigE8yErMMH1G+pmpF/UJQridSUak6n/L5dn
         gahJdZVBRaWk58kQFl/xfsKiKowff2RMcJc9KIIVPPYTuJnvuvTVizFM5m1YLcvVMMyu
         auPm5ZgiR7sSLAacb+xmQiPlScFLedAjRfiqXcCNcFImjKMJ2y6aUwCIxAaTE8W8HRGo
         /OqNImMh2x/3+Wq4ZBP2zFqxifc8Rbncn5ODQaWcjDiok95qbDSfkdVS2KnvbV3U0DUQ
         EfEtHOj2SkdDAd9SrbjchnvReb0jJM+S48MMZzOujzYxsFQq9L7iE05lQMomyoXYFSIm
         1dQg==
X-Gm-Message-State: AOAM533r/xGc/h73Z+OvebH+NBlxK/3DFwzHE/D83mr0qn10NUjhrxK7
        bDNlgGKjpUy9LGdK6Sg8QHsrnw==
X-Google-Smtp-Source: ABdhPJzy0kAtC0mAb9N9Nk0jBlEslSi+EyKpZKizI1grPl6nIG7Ij66G9kluURFmeTpNfzFWlDbOcQ==
X-Received: by 2002:a05:600c:2050:: with SMTP id p16mr7507657wmg.44.1594805535285;
        Wed, 15 Jul 2020 02:32:15 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
        by smtp.gmail.com with ESMTPSA id s203sm2686991wms.32.2020.07.15.02.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 02:32:14 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Ben Dooks <ben@simtec.co.uk>,
        Minas Harutyunyan <hminas@synopsys.com>
Subject: [PATCH v2 2/8] usb: dwc2: gadget: Avoid pointless read of EP control register
Date:   Wed, 15 Jul 2020 10:32:03 +0100
Message-Id: <20200715093209.3165641-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200715093209.3165641-1-lee.jones@linaro.org>
References: <20200715093209.3165641-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit ec1f9d9f01384 ("usb: dwc2: gadget: parity fix in isochronous mode") moved
these checks to dwc2_hsotg_change_ep_iso_parity() back in 2015.  The assigned
value hasn't been read back since.  Let's remove the unnecessary H/W read.

Fixes the following W=1 warning:

 drivers/usb/dwc2/gadget.c: In function ‘dwc2_hsotg_epint’:
 drivers/usb/dwc2/gadget.c:2981:6: warning: variable ‘ctrl’ set but not used [-Wunused-but-set-variable]
 2981 | u32 ctrl;
 | ^~~~

Cc: Ben Dooks <ben@simtec.co.uk>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Minas Harutyunyan <hminas@synopsys.com>
---
Changelog

v2: No change - added Acked-by

drivers/usb/dwc2/gadget.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 03cf1fa856219..5b9d23991c99d 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2978,10 +2978,8 @@ static void dwc2_hsotg_epint(struct dwc2_hsotg *hsotg, unsigned int idx,
 	u32 epctl_reg = dir_in ? DIEPCTL(idx) : DOEPCTL(idx);
 	u32 epsiz_reg = dir_in ? DIEPTSIZ(idx) : DOEPTSIZ(idx);
 	u32 ints;
-	u32 ctrl;
 
 	ints = dwc2_gadget_read_ep_interrupts(hsotg, idx, dir_in);
-	ctrl = dwc2_readl(hsotg, epctl_reg);
 
 	/* Clear endpoint interrupts */
 	dwc2_writel(hsotg, ints, epint_reg);
-- 
2.25.1

