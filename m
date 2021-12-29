Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7E448103C
	for <lists+linux-usb@lfdr.de>; Wed, 29 Dec 2021 07:01:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238881AbhL2GBI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Dec 2021 01:01:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238877AbhL2GBI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Dec 2021 01:01:08 -0500
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FDE3C06173E
        for <linux-usb@vger.kernel.org>; Tue, 28 Dec 2021 22:01:08 -0800 (PST)
Received: by mail-pf1-x449.google.com with SMTP id x128-20020a628686000000b004ba53b6ec72so11141873pfd.9
        for <linux-usb@vger.kernel.org>; Tue, 28 Dec 2021 22:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=tQelzoARs5ra+pSWLPhaNJDMAtSK+jHnIMtEXaTxZ84=;
        b=tajqY5NjUcaY8lTtNNrIXtWpibx6s8oiWhvC2kChhIjnWlk1XI3SQsXycdIeyHksBY
         LsgZElbl3ds+8TZIm3ct/Annr7d5xGx2SqmuTAtYMVNhveCYw353U7ekdnryBjQ+4lTm
         jE/BxHwrpNYddsK5R0L2eP779/ZoNdqqq6iE8i1F8Wv8ymuay/EVXxCjPYoIJskd7FTt
         dJmVMAgfvmFbRgkXBy7GmBY5yCO2zsIqf4gIzEoNkZ1aiVgfOzDzaPcCixW41nTDHMhh
         8OkR1hGn+5rIHVldVuhPpIe4PLQF6ftruhOyMFlPxcFLl1i2XCYxdeAE1g0T8mPjG5my
         ai+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=tQelzoARs5ra+pSWLPhaNJDMAtSK+jHnIMtEXaTxZ84=;
        b=k5O50CMJRBmBYaidy9GpEGwhFF+lYVAgL+PW3Q0tNJRJySUhIqThbf5jwspJWNLXg0
         z21WrDB7CUXZxpmr9vHHGH7jN4xBKRpmBOWdyK4cWq7bYopk3LzV52wMARU9RLagyfzF
         g0VOv1Qyzfn/rCF1h62P+dbfpZ1ZaRAnpV+7P0w7RuCq0toQ4oH6316OcQD+IbGRdaaa
         K68ydc4cox5GxhZN1SrnFYLVAnW/lOiZrnxUuPAujRZ+3CrDOCr04qIw/4BS0VQE/paO
         +T2a5X5bV2M1w+vAmTQ0Z5m8K/YvAKKYdJ0Fn+/bEwBx+UA7neTEHtn0DP470RusFqN+
         sbXA==
X-Gm-Message-State: AOAM530aJuX5VXtFiXebOC9PFInF6Di2o6Dibj9pzsUOWg/2FJYdw/ut
        FsYeeT8CsmDUPKpwAzg+hoMEogFYPM/k
X-Google-Smtp-Source: ABdhPJxRvmN18eh1dLSwUNAh64RdQLY2KNOiIVk1dse7p0r77U6eYtX15Qg6TCJuwcaaS1n5DRMDntNTDq+r
X-Received: from pumahsu.ntc.corp.google.com ([2401:fa00:fc:202:51fc:cf30:243:df6e])
 (user=pumahsu job=sendgmr) by 2002:a05:6a00:10cf:b0:4a3:124d:bb81 with SMTP
 id d15-20020a056a0010cf00b004a3124dbb81mr25771116pfu.75.1640757667499; Tue,
 28 Dec 2021 22:01:07 -0800 (PST)
Date:   Wed, 29 Dec 2021 14:00:14 +0800
Message-Id: <20211229060013.3366166-1-pumahsu@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH v2] xhci: re-initialize the HC during resume if HCE was set
From:   Puma Hsu <pumahsu@google.com>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc:     s.shtylyov@omp.ru, albertccwang@google.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Puma Hsu <pumahsu@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When HCE(Host Controller Error) is set, it means an internal
error condition has been detected. It needs to re-initialize
the HC too.

Signed-off-by: Puma Hsu <pumahsu@google.com>
---
v2: Follow Sergey Shtylyov <s.shtylyov@omp.ru>'s comment.

 drivers/usb/host/xhci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index dc357cabb265..ab440ce8420f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1146,8 +1146,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		temp = readl(&xhci->op_regs->status);
 	}
 
-	/* If restore operation fails, re-initialize the HC during resume */
-	if ((temp & STS_SRE) || hibernated) {
+	/* If restore operation fails or HC error is detected, re-initialize the HC during resume */
+	if ((temp & (STS_SRE | STS_HCE)) || hibernated) {
 
 		if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
 				!(xhci_all_ports_seen_u0(xhci))) {
-- 
2.34.1.448.ga2b2bfdf31-goog

