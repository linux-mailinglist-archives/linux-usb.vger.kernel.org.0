Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8870214C6F9
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2020 08:39:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgA2Hjp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jan 2020 02:39:45 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43521 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbgA2Hjo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jan 2020 02:39:44 -0500
Received: by mail-lj1-f194.google.com with SMTP id a13so17320302ljm.10
        for <linux-usb@vger.kernel.org>; Tue, 28 Jan 2020 23:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xgwM+w6XVZYo71U2Uq6kyQ57Gx39td3yB0DOJ1qIVpQ=;
        b=SWt6s2ULx3P/vOeg0KoXKyIMwzqV0zJJGUVtcXddM29q0InoH5e3OtW77FI0m8Sd0L
         XksV527Mx8FFbeLRSAZF/11NnZTddhTOVA5i74i9r8XkwT4UHm82ySa8l3SauKBelDtV
         iHrVxCB9/rUgX/WQKAe06J0gBQui5/euFhQRJbLReRZ1MQgFQ1ujBBjIIIj4iegyfprX
         syHXNw6Qb16TbAaslu1mySjTtj9545lIRwm8S38iREHpd0iDRTSsQ4t6DVJbKuwAh7KI
         3swlxeY561C0hSfEXLmm240pQXOF9PMynIXkQKMkD5UfSJnjBq8q9Ua4j8KHW+Ay3DMj
         nvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=xgwM+w6XVZYo71U2Uq6kyQ57Gx39td3yB0DOJ1qIVpQ=;
        b=dUqwAp25bbkHjWTeN+91sbBpqA0VjxgNrJCL8QsYiO1OQQpKzjihTLvVaaB1kyJdgE
         uWp6PLGMIYMLu1Odc7Bfh2pcY8T6EmbLZsp8CoJjJoRuv/az/HwuHkBVULsOiCa/v3Yb
         JCKoWxzYMb+WAml9z55YRZdRESUAJ3ec8Iz14KfQvY2nNhtUJh+I9C3fxXJshGaDlYSh
         x1tBYwCTNwuEI8KPQqRW/XZ2Bqlo0VYjsjxgehxRAkN7CBiDHkIvrx1onTX3NCQAeMOx
         7nkv4j+EQtUYiexeBfY0mS8BFZyFfz9E3MsTPOuwzxfGsdYJdSTpAI8uoXq8V7kyV2eD
         Bcpw==
X-Gm-Message-State: APjAAAXiNrvXgLbHENCQvm6ohHdZyc19NKnSuDlwKeO82QLGo5hwo1pd
        0jkiMlJAjfCheheetAKibS/IkgdgdGM=
X-Google-Smtp-Source: APXvYqxcJsh+VM1W5cnzzKNpoyXyPEUdJyYOxfAPuZw2837FXahjdhKJ9K8WmUJ1zdO7T1RcLddNSg==
X-Received: by 2002:a05:651c:232:: with SMTP id z18mr16074297ljn.85.1580283582525;
        Tue, 28 Jan 2020 23:39:42 -0800 (PST)
Received: from saruman.home (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id m16sm432526ljb.47.2020.01.28.23.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2020 23:39:42 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Linux USB <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>
Subject: [PATCH] usb: dwc3: trace: print enqueue/dequeue pointers too
Date:   Wed, 29 Jan 2020 09:39:39 +0200
Message-Id: <20200129073939.56001-1-balbi@kernel.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

By printing enqueue/dequeue pointers, we can make sure that our TRB
handling is correct. We've had a recent situation where we were not
always dequeueing all TRBs in an SG list and this helped figure out
what the problem was.

Signed-off-by: Felipe Balbi <balbi@kernel.org>
---
 drivers/usb/dwc3/trace.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/trace.h b/drivers/usb/dwc3/trace.h
index 9edff17111f7..b2f5a504a5af 100644
--- a/drivers/usb/dwc3/trace.h
+++ b/drivers/usb/dwc3/trace.h
@@ -227,6 +227,8 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 		__field(u32, size)
 		__field(u32, ctrl)
 		__field(u32, type)
+		__field(u32, enqueue)
+		__field(u32, dequeue)
 	),
 	TP_fast_assign(
 		__assign_str(name, dep->name);
@@ -236,9 +238,12 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 		__entry->size = trb->size;
 		__entry->ctrl = trb->ctrl;
 		__entry->type = usb_endpoint_type(dep->endpoint.desc);
+		__entry->enqueue = dep->trb_enqueue
+		__entry->dequeue = dep->trb_dequeue
 	),
-	TP_printk("%s: trb %p buf %08x%08x size %s%d ctrl %08x (%c%c%c%c:%c%c:%s)",
-		__get_str(name), __entry->trb, __entry->bph, __entry->bpl,
+	TP_printk("%s: trb %p (E%d:D%d) buf %08x%08x size %s%d ctrl %08x (%c%c%c%c:%c%c:%s)",
+		__get_str(name), __entry->trb, __entry->enqueue,
+		__entry->dequeue, __entry->bph, __entry->bpl,
 		({char *s;
 		int pcm = ((__entry->size >> 24) & 3) + 1;
 		switch (__entry->type) {
-- 
2.25.0

