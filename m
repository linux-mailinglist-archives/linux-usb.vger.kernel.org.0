Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 177DD213EB2
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgGCRmB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgGCRl7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:41:59 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B470C08C5DD
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:41:59 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l2so33372431wmf.0
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YSysemk6/m3rdKU2ySMi9uU8qYuK0kuhW6Pw5qHpSnI=;
        b=DiTMT+9THBotFZ8hAPsnuIbDSlmH+WPn87U6MQV2wdUqBmGs3uF0tKCXEfU7478vwj
         hwRiHYDh4JpRpasNgymyRlZRKZYPomrYM9TJPmqWfJcxMLGduvnehwmmmjtysVHuv640
         iQFbD58SHTQRqL/gBV171cuR8/WTeYhTRVk7h0EI46cXLbxvMZRbUIA5L7SH2rCkEbw6
         NET+ildSzhaQAlJxNoSvdavC9aTyR7AzdS74FkZ+BefFZx0zPt+xwBXdSFYStsHg0rDd
         ky0+csRp4oiOhk+Bjw68pqKMRSCnHLd+2J+YF8NR5NMSJyMbowwOIgMWQhjToihJ5crY
         Azhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YSysemk6/m3rdKU2ySMi9uU8qYuK0kuhW6Pw5qHpSnI=;
        b=ZV8MoVGz3eUNC/rNj5S++KSvpXWJ6psZyBVtP7NgrQo82VlzbsVHBv7vaQMbLi8Yad
         z8froIra3elLihf0ZCek6P7e1yiO179LVkReLRHO8TKtqKeC+IDdExYzFxr0r0e6EnhS
         x09/o5mzXkBijlw+wYqk5gJmafl+8nnzJB3f1NrUrpaI0ePCS0rwsIrGYFmoLCDxhmjF
         DQHeSvG+EUy1sf+WNVRroHNJp2kd72/l3KVx+wIlewgQWw+a4TyHRu4Z1azD8uRA5gCF
         aA9aXlgPY2JaFQ02IOgogAQtus1QrMwpMkiYHL/YIvEnhQ1RW1OVRFGEyF20sOYFXsi2
         PMUw==
X-Gm-Message-State: AOAM532MZuFLZAtq4dZv1Unw0JLYHX5PeYcVV/xipfU8kfe/F+U/wPUN
        zkduZa2WhKdr9TnLAwtZhX3uPA==
X-Google-Smtp-Source: ABdhPJwq6EJ8i4c07CyyjVONmZU0HR1br30HC+HrU3hY5Q/iNyS39dh2n8CRaJSQcQXq5fDuEcoNRg==
X-Received: by 2002:a1c:9a02:: with SMTP id c2mr8726718wme.16.1593798117749;
        Fri, 03 Jul 2020 10:41:57 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:41:57 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 01/30] usb: mtu3: mtu3_debug: Add forward declaration of 'struct ssusb_mtk'
Date:   Fri,  3 Jul 2020 18:41:19 +0100
Message-Id: <20200703174148.2749969-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Without it, the build system complains that it was declared inside
the parameter list.

Fixes the following W=1 kernel build warning(s):

 In file included from drivers/usb/mtu3/mtu3_trace.c:11:
 drivers/usb/mtu3/mtu3_debug.h:29:36: warning: ‘struct ssusb_mtk’ declared inside parameter list will not be visible outside of this definition or declaration
 29 | void ssusb_dev_debugfs_init(struct ssusb_mtk *ssusb);
 | ^~~~~~~~~
 drivers/usb/mtu3/mtu3_debug.h:30:35: warning: ‘struct ssusb_mtk’ declared inside parameter list will not be visible outside of this definition or declaration
 30 | void ssusb_dr_debugfs_init(struct ssusb_mtk *ssusb);
 | ^~~~~~~~~
 drivers/usb/mtu3/mtu3_debug.h:31:39: warning: ‘struct ssusb_mtk’ declared inside parameter list will not be visible outside of this definition or declaration
 31 | void ssusb_debugfs_create_root(struct ssusb_mtk *ssusb);
 | ^~~~~~~~~
 drivers/usb/mtu3/mtu3_debug.h:32:39: warning: ‘struct ssusb_mtk’ declared inside parameter list will not be visible outside of this definition or declaration
 32 | void ssusb_debugfs_remove_root(struct ssusb_mtk *ssusb);
 | ^~~~~~~~~

Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/mtu3/mtu3_debug.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_debug.h b/drivers/usb/mtu3/mtu3_debug.h
index fb6b28277c9b1..3084c46017c37 100644
--- a/drivers/usb/mtu3/mtu3_debug.h
+++ b/drivers/usb/mtu3/mtu3_debug.h
@@ -12,6 +12,8 @@
 
 #include <linux/debugfs.h>
 
+struct ssusb_mtk;
+
 #define MTU3_DEBUGFS_NAME_LEN 32
 
 struct mtu3_regset {
-- 
2.25.1

