Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE4A34B8E2
	for <lists+linux-usb@lfdr.de>; Sat, 27 Mar 2021 19:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbhC0S3I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Mar 2021 14:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbhC0S2W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Mar 2021 14:28:22 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC68C0613B2
        for <linux-usb@vger.kernel.org>; Sat, 27 Mar 2021 11:28:22 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id v186so6110322ybe.5
        for <linux-usb@vger.kernel.org>; Sat, 27 Mar 2021 11:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=kBTrnovsJTjktUY0EImjz441nnzZDwHzrqZdw8K7lUM=;
        b=XaG99HhlymUYSpLhoY7iG8qg2FQ0jWc0UK5CKWTx0hIZet6OPWvbgtuUNlDy+i70AJ
         gq1uVoe7TKh3OBsDaxkVoywnT5E7+DDhVBd7at9QSICSiwcPusEVQ3rcpKNc4XrAPH+d
         o0VofgDVdy84fWjTlsSOgGv5IEGi/+Xmoun00YI5XL5gzv1Fg36wJzjZWO+RtCr6outo
         sPAQMF9kbMr89kwrz3S7ELtspDEHEk/Ya0TnlQDMKiYGDm1ne5oULbuhRik5Z7KatDNX
         KEr7eVzwrqnuJPNy0fgX8PQX5XBUeESZjsnrOEfYVdq098bugJ1e/hL66GlILClVsFO1
         5P+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=kBTrnovsJTjktUY0EImjz441nnzZDwHzrqZdw8K7lUM=;
        b=IKnvx9LBiK03pilSh9oF9fgLLlbplaI9iS73t9RkBYjW84vzRO1KFquYOzed1SelQf
         7KX1qau/rBRY2kc/bBpHE2+t53eBis5ZB2oQC0NLtNnGAowKB76Ne8KdcaAd13tlXygu
         K5DcCn5AL3eqWke9iTl1eK84ckpmUQxS9fZsq0ydYqOdKBOTRNcNr+0jvMHEHNBkH4zB
         1U4ApQ7aB2aliB7+2137ZpeBpRVcS/fniWVfYN8TLs839rN6m2LiF/VST4PqD/P/Ysmj
         cEok4/qGrIpOFTW3wWzxPQ5MMOR3g7MVupCz7EXdr+sH0jYa/Anc7hAFB/KbMRrC4y1i
         jo4A==
X-Gm-Message-State: AOAM533mG0xclcSzqpBDA6EHxZgwrlqZ+lkP1xZ5l7lOaY7NhPGS5/Qn
        bqsr+nujKOgEVG6A4IhZAcagrCxOsNo=
X-Google-Smtp-Source: ABdhPJxkzoGreeV6D3MgL0kgP9jcvFhWrOamEkI1ZLXO0cqd5vQrF7cEJIx92FU+4DZkCxIPCMUJBD+6Hw0=
X-Received: from raychi.tao.corp.google.com ([2401:fa00:fc:202:493c:e5b:69c:54cb])
 (user=raychi job=sendgmr) by 2002:a25:6fc6:: with SMTP id k189mr26162957ybc.171.1616869701634;
 Sat, 27 Mar 2021 11:28:21 -0700 (PDT)
Date:   Sun, 28 Mar 2021 02:28:08 +0800
In-Reply-To: <20210327182809.1814480-1-raychi@google.com>
Message-Id: <20210327182809.1814480-2-raychi@google.com>
Mime-Version: 1.0
References: <20210327182809.1814480-1-raychi@google.com>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [PATCH 1/2] usb: dwc3: gadget: modify the scale in vbus_draw callback
From:   Ray Chi <raychi@google.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, sre@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kyletso@google.com, badhri@google.com, Ray Chi <raychi@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently, vbus_draw callback used wrong scale for power_supply.
The unit of power supply should be uA.
Therefore, this patch will fix this problem.

Fixes: 99288de36020 ("usb: dwc3: add an alternate path in vbus_draw callback")
Reported-by: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Ray Chi <raychi@google.com>
---
 drivers/usb/dwc3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index e1442fc763e1..8a361f07e045 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2536,7 +2536,7 @@ static int dwc3_gadget_vbus_draw(struct usb_gadget *g, unsigned int mA)
 	if (!dwc->usb_psy)
 		return -EOPNOTSUPP;
 
-	val.intval = mA;
+	val.intval = 1000 * mA;
 	ret = power_supply_set_property(dwc->usb_psy, POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT, &val);
 
 	return ret;
-- 
2.31.0.291.g576ba9dcdaf-goog

