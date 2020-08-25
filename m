Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F264A2511CC
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 07:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728962AbgHYFzp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 01:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgHYFzo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 01:55:44 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D66C061574
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 22:55:42 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id x6so13609776ybp.10
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 22:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=/BQ21twV62wm0lZCEx/wKH14rKu7noBUW7yQqP/JfhU=;
        b=lmEWcWpnlFoqZ2r3egJI/eCTh8HJeoidQqPC4IDXzbIPUonPCTCog/KZsG7iWNs9l6
         +9u5qiqfNsnXqNyNRq/WhTS3aODErN8aytXabqqVEYrJT51KRq0YLBoezu9wV/mi6im/
         ZHovk//hkliJiWqs7184C6+/fBWjZ2JCAJVXLZsNInkgMTFUeatr1Yw2vg8jIi628i+W
         xIFnNmFMnVcKBNNrh2KwTlldYWPuO7GICsFrG5r32P3OuUpAJxo1kYSjBsClDta1nnej
         FkfVCQSsQ9JulF0JNwvE9wScNJOk+J2UCa3y0qPisxQFSB1G+MS8t7zmtJZUu2az0Emm
         zfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=/BQ21twV62wm0lZCEx/wKH14rKu7noBUW7yQqP/JfhU=;
        b=OiEuyxPT0ZkJXbWSj+BaESdCQ6MiwjEz7HHGCVHjDZHoj7X7JxHFXFE++IXRXCaMhk
         i0RhIwR/ooDvDyTxpiiw6DJEi7G++xEXp8Bq76lkkHJyf61ssh6IU5luYgUx9xEBdjob
         CANIr2eboFcX64BAwJlKg7t/eHNz/+/DF1Olk0qe0H0n975csqVJINiiOYKDgooc4SuM
         mC1odyS2ZzmjzrpFq3b+pZiCc/KL/Mo82nUGBP3egobFMcxU5ltndigwdj0XzMjdMPUn
         z5RK/19TBhRXOt2ifQMOyVKotdIlPDFM82gB33Loa7VXYQZTBE9bMCxs6wb4fG/kBw0c
         /W7w==
X-Gm-Message-State: AOAM530F0As9wy86cWYhgUoZnmmXFaOkmdBcQ+z725itv0mgceprjxi0
        Ia6gbbGOYz0pKIKuE+oGSsqriJ1oJRhUbwD94xJ0OBM7LI5Hg6n3jlNOi9oOUAuc51gyUBJiaM3
        WEtdc2iZtwHipNLYTWtADHGCboqiNGV4sCT+XZh3ZQQ//GdpN+14MiXTLB5K75OqI7uBH
X-Google-Smtp-Source: ABdhPJzadoyLYQdE6j5NlFGhrC7eALNHGQ8wWGZBnYhwqbrWUNSA1uK3hbCvj2mRrSkrLBD146fiLIM/O19A
X-Received: from lorenzo.tok.corp.google.com ([2401:fa00:8f:2:eeb1:d7ff:fe57:b7d5])
 (user=lorenzo job=sendgmr) by 2002:a25:c791:: with SMTP id
 w139mr12018913ybe.345.1598334942114; Mon, 24 Aug 2020 22:55:42 -0700 (PDT)
Date:   Tue, 25 Aug 2020 14:55:05 +0900
In-Reply-To: <20200825055505.765782-1-lorenzo@google.com>
Message-Id: <20200825055505.765782-4-lorenzo@google.com>
Mime-Version: 1.0
References: <20200825055505.765782-1-lorenzo@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v3 3/3] usb: gadget: f_ncm: allow using NCM in SuperSpeed Plus gadgets.
From:   Lorenzo Colitti <lorenzo@google.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        zenczykowski@gmail.com, Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently, enabling f_ncm at SuperSpeed Plus speeds results in an
oops in config_ep_by_speed because ncm_set_alt passes in NULL
ssp_descriptors. Fix this by re-using the SuperSpeed descriptors.
This is safe because usb_assign_descriptors calls
usb_copy_descriptors.

Tested: enabled f_ncm on a dwc3 gadget and 10Gbps link, ran iperf
Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
---
 drivers/usb/gadget/function/f_ncm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index cad3c9dd61..87f548bd97 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1505,7 +1505,7 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 		fs_ncm_notify_desc.bEndpointAddress;
 
 	status = usb_assign_descriptors(f, ncm_fs_function, ncm_hs_function,
-			ncm_ss_function, NULL);
+			ncm_ss_function, ncm_ss_function);
 	if (status)
 		goto fail;
 
-- 
2.28.0.297.g1956fa8f8d-goog

