Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D03E828B376
	for <lists+linux-usb@lfdr.de>; Mon, 12 Oct 2020 13:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387918AbgJLLKv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Oct 2020 07:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387903AbgJLLKv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Oct 2020 07:10:51 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07400C0613D1
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2020 04:10:51 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id c196so5976405ybf.0
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2020 04:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=UiZTe0hNJEZBhvy5sPpwLF0YFNJITcggb/JZNqgpb6w=;
        b=jXEEx1KGc/FeUJ7GltQartt5fDhaDAJXH3tSR9PGaHNlMdR0YJnBqWjwlMnQM2banV
         WyoYqqR0uTdi+WAm1TvDilr3TPJumYqxxDhY0JnFcdPFdEr6GWGwqMP3NYjI6OZQv0Mk
         ZL2SdmfkBUrdFAbUcnrdDTjaH6+JGJy6z/yeLEYFc2+K4L8pFsPr+zXIqLyLI0JcvksR
         XjtVBORsXHz76H36TSaeleae5tbGeqyJgwIm2SnH6XvmrYYr8Xqg1AY1xStQTCnsbDn9
         9m4l7OrCosayzvA3snSaC5JAQLcCoDSPL0R58pKBu22dbWRfCdz3IYlW42iEDsaSY0aB
         M0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=UiZTe0hNJEZBhvy5sPpwLF0YFNJITcggb/JZNqgpb6w=;
        b=mCzKkzxmoYcXRyLeGKW6H99llctCtU8tjxAI01BR9weFidQbiB3NkjzHmJPC/MkJGI
         pKhmVLkKYlcNQVETCGdGoBHtQr+FW8kqSaKSiLV1Ola7Pd7d1XP8BkqYK2adCPvSJdQQ
         2dPK7zjz0HW744iEDDJGfDdurmqHFSs7kEaW+M3nHpQqoKlr3trFWmYjrEWw3Xs2hpvk
         3Ts1X9uxRUF3cZZM78nJDUQpYtDQEMYOjAh9IGCWkfodflau9RizQwxj8bsgss2cNfCH
         SexvH2z9mMbhOYnA+PAZTfXYfMbrUZrWG8AeZBUt0qym4TqrvSEKAwQRJ02KUxy2+emM
         TJ8w==
X-Gm-Message-State: AOAM530HZ+cto3sdvaQ1W842GJ8kRcGC3HXwVUEuhGC7BW+be4giKHJ3
        rXCnDiV31k5XYqqkmDPs+UB1eNdOsoZvmg==
X-Google-Smtp-Source: ABdhPJyse4mSydUwIxr1oQxcxPgAueimKkMkMMn1k2XHcX1+bIGoxdnzyQGNhA5E9wPUUbgCo1IpYsd6OwLNqw==
Sender: "rickyniu via sendgmr" <rickyniu@rickyniu.ntc.corp.google.com>
X-Received: from rickyniu.ntc.corp.google.com ([2401:fa00:fc:1:3e52:82ff:fe5e:efef])
 (user=rickyniu job=sendgmr) by 2002:a25:9805:: with SMTP id
 a5mr27151617ybo.446.1602501050181; Mon, 12 Oct 2020 04:10:50 -0700 (PDT)
Date:   Mon, 12 Oct 2020 19:10:23 +0800
In-Reply-To: <20201012111024.2259162-1-rickyniu@google.com>
Message-Id: <20201012111024.2259162-3-rickyniu@google.com>
Mime-Version: 1.0
References: <20201012111024.2259162-1-rickyniu@google.com>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
Subject: [PATCH 2/3] ANDROID: USB: f_accessory: Check dev pointer before
 decoding ctrl request
From:   rickyniu <rickyniu@google.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, astrachan@google.com,
        rickyniu@google.com, amit.pundir@linaro.org, lockwood@android.com,
        benoit@android.com, jackp@codeaurora.org, vvreddy@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        kyletso@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Vijayavardhan Vennapusa <vvreddy@codeaurora.org>

In case of poweroff charging mode, accessory function instance
is not created and due to this, _acc_dev will be NULL. If target
is connected to Accessory dock in poweroff charging mode, there
is a chance dev pointer is accessed, which is NULL. Hence add a
check before processing control request and return error if it is
NULL.

Signed-off-by: Vijayavardhan Vennapusa <vvreddy@codeaurora.org>
Signed-off-by: Jack Pham <jackp@codeaurora.org>
Signed-off-by: rickyniu <rickyniu@google.com>
---
 drivers/usb/gadget/function/f_accessory.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/function/f_accessory.c b/drivers/usb/gadget/function/f_accessory.c
index 514eadee1793..5ed80940b9bf 100644
--- a/drivers/usb/gadget/function/f_accessory.c
+++ b/drivers/usb/gadget/function/f_accessory.c
@@ -833,6 +833,12 @@ int acc_ctrlrequest(struct usb_composite_dev *cdev,
 	u16	w_length = le16_to_cpu(ctrl->wLength);
 	unsigned long flags;
 
+	/*
+	 * If instance is not created which is the case in power off charging
+	 * mode, dev will be NULL. Hence return error if it is the case.
+	 */
+	if (!dev)
+		return -ENODEV;
 /*
 	printk(KERN_INFO "acc_ctrlrequest "
 			"%02x.%02x v%04x i%04x l%u\n",
-- 
2.28.0.1011.ga647a8990f-goog

