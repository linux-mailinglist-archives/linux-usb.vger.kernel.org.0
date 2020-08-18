Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5F3248C3E
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 18:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728630AbgHRQ7Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 12:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728619AbgHRQ7I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 12:59:08 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD7FC061343
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 09:59:08 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id g127so22753680ybf.11
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 09:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=4TNVRkUNpf58TBKmVZYhNfFRkuTY8ErhDLTbq/+6hn0=;
        b=HcYnvq2GokDgKc0+3PZZ5eU9OA01Q4KV/8pd5sIq76IGFHPn66c2TdAA9JDUBTLbMV
         SPHNusvk82GSewYMFfTWW6L75oBGi31v9e5lAoZk2JuYMpS/xwfu2MS+X6xeXpDarzPc
         48m3yG4Pou73rAD0uXGCY8jjTNDmXnJDCpUNtEAopHRT3fJx2Z2RMOabAab8OKqs8E6W
         fq/GntjrhV7vAfoY2egy+Z9jnUr3b1wPRVCkOAjJ4GKLyIuLs9S2X9kJ76hdxt1ZiYSG
         fuamdFcewmS2sPRPq2oC87GhNRuhd48CqnGdZmsY+4jFmjJE/RkbYYwF/Pl6grmnbCo6
         +DrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=4TNVRkUNpf58TBKmVZYhNfFRkuTY8ErhDLTbq/+6hn0=;
        b=LxPh+h27Kbu5UuHX3S3vcS3dsDYSAAsUQz3fQITCqiBoaop/qL7N53wgNqR7jDlb/U
         zJX33GdAvew9iLIq5b7+zKgO5tMdbR4zBZUtTjxNBLxvITJ9P15xgRG21anlG6XUd/z8
         vmxec7lW3J6t3mrVFn6414hRWiGfU7voWmUNPiuWDv6ulJdzUZUuhSsPxCC0bIqT/FBA
         KeapLKwUxQvEOZ0BVdHSytlSLqpgzaEUBU6Huqh3dsw0sgzm9R56JPQsNJmbg/70/iJj
         WDbQs6Y849huJp4G8Yk7M82pEhDFMENKpMIlX/OE6uqk9dyvVgY/fD3nf70jtVSyQkWE
         2Q1Q==
X-Gm-Message-State: AOAM531xCezECG2mVsUmOiFRDwtXxOJb2HUIkzg/Jffx9jiBfs0EVaJT
        /jQU0BDYbzt5JJc+nNk4v5yJBJWmMHIaZ525WGeqW0RCXz2xc9Vj16ZIqU5YedygDE28oRwWUMp
        ZS9sKTZuElMArZcJbHaco5LUWrHG8ORf7vzgq5P0g4mZ2CvqAwZtrRNeoDXx+82l3j90v
X-Google-Smtp-Source: ABdhPJydyJZlrJJ3njpf3gLvZql1zqcFyw0O968Ki/+fTJZdIZpBvwOtkYuDXnztzckwpivUVcDhDjf0ywNs
X-Received: by 2002:a25:870a:: with SMTP id a10mr29775609ybl.257.1597769947110;
 Tue, 18 Aug 2020 09:59:07 -0700 (PDT)
Date:   Wed, 19 Aug 2020 01:58:47 +0900
In-Reply-To: <20200818165848.4117493-1-lorenzo@google.com>
Message-Id: <20200818165848.4117493-2-lorenzo@google.com>
Mime-Version: 1.0
References: <20200818165848.4117493-1-lorenzo@google.com>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
Subject: [PATCH v2 2/3] usb: gadget: f_ncm: set SuperSpeed bulk descriptor
 bMaxBurst to 15
From:   Lorenzo Colitti <lorenzo@google.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        zenczykowski@gmail.com, Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This improves performance on fast connections. When directly
connecting to a Linux laptop running 5.6, single-stream iperf3
goes from ~1.7Gbps to ~2.3Gbps out, and from ~620Mbps to ~720Mbps
in.

Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
---
 drivers/usb/gadget/function/f_ncm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 0c073df225..57ccf30c6c 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -348,7 +348,7 @@ static struct usb_ss_ep_comp_descriptor ss_ncm_notify_comp_desc = {
 	.bDescriptorType =	USB_DT_SS_ENDPOINT_COMP,
 
 	/* the following 3 values can be tweaked if necessary */
-	/* .bMaxBurst =		0, */
+	.bMaxBurst =		15,
 	/* .bmAttributes =	0, */
 	.wBytesPerInterval =	cpu_to_le16(NCM_STATUS_BYTECOUNT),
 };
@@ -376,7 +376,7 @@ static struct usb_ss_ep_comp_descriptor ss_ncm_bulk_comp_desc = {
 	.bDescriptorType =	USB_DT_SS_ENDPOINT_COMP,
 
 	/* the following 2 values can be tweaked if necessary */
-	/* .bMaxBurst =		0, */
+	.bMaxBurst =		15,
 	/* .bmAttributes =	0, */
 };
 
-- 
2.28.0.220.ged08abb693-goog

