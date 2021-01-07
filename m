Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 382A72ECC49
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jan 2021 10:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbhAGJG6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jan 2021 04:06:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbhAGJG4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jan 2021 04:06:56 -0500
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899EEC0612F4
        for <linux-usb@vger.kernel.org>; Thu,  7 Jan 2021 01:06:15 -0800 (PST)
Received: by mail-qk1-x749.google.com with SMTP id u17so5298612qku.17
        for <linux-usb@vger.kernel.org>; Thu, 07 Jan 2021 01:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=Ax6g/HtSztG4IFRRlChAFWW26f6FAbiNEq7tx3MzI/c=;
        b=UGC0NfIw6VwxqUMytMX/RaseYmVf+EYCOYuEGJX2bcfC8/Hd5tJR+Xk4Su/iCKLgKQ
         QarbJHQtBieOAS+IuBdDZ/Rli6C9mVSXe+UNSqeTdf95Uoo6rV0FZ8Rc9Nmwk7KrqXLP
         e48trSKI3ZRx+vcgEdhXQfp96XeZrYD+rUtA2kim2vcFY2pczfLroJpjl9wFzAuYa4HQ
         cAOMGVuE64gvLaPD2FSLu1S4Sm1Sjvw/SgpgNntqSHlcIT+4JezsOoAaumNVIuzSFuKF
         7ueo/S3ueRzZsyrDnTi4GPzvcNWfe50Tlm/luF1gSgZ3/Re3Z84DmkiqMeuR+HMCER9q
         ZW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=Ax6g/HtSztG4IFRRlChAFWW26f6FAbiNEq7tx3MzI/c=;
        b=XBKNvIbU6AQI4Xaj0O861GN8sZzfYhlCrTnxU86h7fJxXN62UV+/iEzQxndvnptwXD
         V2u4L/Rc6543zAxOmOO99LlSRT4wb9j1HH0QF+JxIgjcK5Ib4R0vrDzzfg4A5KDTJurN
         gDMtvnbBzM7cQmiHNx4CxCdFda0sRivaVFnHGAGIcWgSB0t7ueL6Hzt41GuKnVVPGn7P
         KtSy8XUf0OGdH2jNly8bKagLuibuCLRKgY51sXf921qYJ1AA8sQt4NxT8i7RNWwDpyQb
         lMd3nYbnbaVZuBnJ/qZdjnXJFZwFRzo9EO17mdlBabuaA8O8cWtEliUY5f/Bc334hdFh
         o4fw==
X-Gm-Message-State: AOAM531IsTVJxdlX0LGMcZjP4dZ4lcBAV2/60W5soCqlHXzIDX44uaSw
        30U2vf1swB897N4B3kCcWXdbm0adhY4mnDBiErU=
X-Google-Smtp-Source: ABdhPJywUKEB7B2fPgiIHPbveN2HCYf4CJlV4BmTDO77pUl7gycUiiPuDROtbx3i/K4PBp3Akbt+FJWHhZHkvGMCziY=
Sender: "albertccwang via sendgmr" <albertccwang@albertccwang.c.googlers.com>
X-Received: from albertccwang.c.googlers.com ([fda3:e722:ac3:10:3:22c1:c0a8:83d])
 (user=albertccwang job=sendgmr) by 2002:ad4:5b82:: with SMTP id
 2mr7824860qvp.28.1610010374712; Thu, 07 Jan 2021 01:06:14 -0800 (PST)
Date:   Thu,  7 Jan 2021 09:06:04 +0000
Message-Id: <20210107090604.299270-1-albertccwang@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH] Revert "usb: gadget: Quieten gadget config message"
From:   Albert Wang <albertccwang@google.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Albert Wang <albertccwang@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit 1cbfb8c4f62d667f6b8b3948949737edb92992cc.

The log of USB enumeration result is a useful log and only occupies
one line especially when USB3 enumeration failed and then downgrade
to USB2.

Signed-off-by: Albert Wang <albertccwang@google.com>
---
 drivers/usb/gadget/composite.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index c6d455f2bb92..5b0d6103a63d 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -840,9 +840,9 @@ static int set_config(struct usb_composite_dev *cdev,
 		result = 0;
 	}
 
-	DBG(cdev, "%s config #%d: %s\n",
-	    usb_speed_string(gadget->speed),
-	    number, c ? c->label : "unconfigured");
+	INFO(cdev, "%s config #%d: %s\n",
+	     usb_speed_string(gadget->speed),
+	     number, c ? c->label : "unconfigured");
 
 	if (!c)
 		goto done;
-- 
2.29.2.684.gfbc64c5ab5-goog

