Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60112126AD
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730004AbgGBOqv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729989AbgGBOqt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:46:49 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392F2C08C5F3
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:46:47 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g10so9234394wmc.1
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ekU/9fToolV+bnxY6uX+/NgRtkggBCTFheSpOeaBTsQ=;
        b=y+Hz7s1H9c6E1muboBIQnKa1duyLm9Puyw0SItMBVefMB9XgGsxNMgUvs1xGrvIgYE
         RobvU+GQKeiKScPwvyKiIuVUYUcLaE1/nvfdKccNfyv5+MvA5wCwfQcKVx7zK139D7Jq
         ZJUwxai3KootCSJFle1ffk2k5vJ0aiBsqqJkOf4gPxUh/FsKJownzbYSvOU8wUkV2kBu
         WAfo0c9r1FtOS3RpnmvBUg+i4NU0VPGXBUIm7ORvIkZowhL8kNJlVkVdsGFOiWxADhCF
         PK3W1qdTIqxSrOrWTRaurHqtBvnHIyZ+Wty4zVcZOHLl2ktHh3fjxQS5H1I+pgpOIXQz
         1kjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ekU/9fToolV+bnxY6uX+/NgRtkggBCTFheSpOeaBTsQ=;
        b=X1UZZSWvNQP+MtYd646QTP/6cUURa0MnysRcfP65eIVOLB1Ufp4OZWJvh1M1624xUj
         ZWviyjHz6gxcaNL31TGVyU9c7Hsd/M29KpW1FbncyrhQjUx2HgdFKnOD21mUf10gnoEz
         FWR4/xW65Nhltn+N2U2HPc5Of67SWIoscevpHeiS8fALJ8oeIk3IZJoHuqH0DnVHY79z
         vAK3efL79++8Ab6I/oLs2zJ8qVccTto3npMYeoW8dORN1l8vDzQ/vNbAtL0w7YKnVG3J
         jilXRH5IIsJ8YK8Eseu04K16h/ztTGzDw4QJJE+MwQRIxnpW/Yjr0SewCJkXZ602HIFj
         rJqg==
X-Gm-Message-State: AOAM530hPg3o7Lgu/HtJa7gO0VxsON8bMz/NHAOAEkknEba3r3L5k61C
        yMZuv6KUST7jaLdhCZX57vQLOQ==
X-Google-Smtp-Source: ABdhPJyOOLDdd4ToMUJ/Ps2rddIfsLpgMyUtYk7cO7KTC+3Mst0iapsfhCWCGek0yCKObOQbs9rkww==
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr34759591wmj.117.1593701205836;
        Thu, 02 Jul 2020 07:46:45 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:46:45 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Ben Dooks <ben@simtec.co.uk>
Subject: [PATCH 11/30] usb: dwc2: gadget: Avoid pointless read of EP control register
Date:   Thu,  2 Jul 2020 15:46:06 +0100
Message-Id: <20200702144625.2533530-12-lee.jones@linaro.org>
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

Commit ec1f9d9f01384 ("usb: dwc2: gadget: parity fix in isochronous mode") moved
these checks to dwc2_hsotg_change_ep_iso_parity() back in 2015.  The assigned
value hasn't been read back since.  Let's remove the unnecessary H/W read.

Fixes the following W=1 warning:

 drivers/usb/dwc2/gadget.c: In function ‘dwc2_hsotg_epint’:
 drivers/usb/dwc2/gadget.c:2981:6: warning: variable ‘ctrl’ set but not used [-Wunused-but-set-variable]
 2981 | u32 ctrl;
 | ^~~~

Cc: Minas Harutyunyan <hminas@synopsys.com>
Cc: Ben Dooks <ben@simtec.co.uk>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc2/gadget.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 116e6175c7a48..fa07e3fcb8841 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2975,10 +2975,8 @@ static void dwc2_hsotg_epint(struct dwc2_hsotg *hsotg, unsigned int idx,
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

