Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7727E2DFE05
	for <lists+linux-usb@lfdr.de>; Mon, 21 Dec 2020 17:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbgLUQ1V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Dec 2020 11:27:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33410 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725849AbgLUQ1V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Dec 2020 11:27:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608567955;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=KgDwPayZceRj0ay5WxA4Idk2hKnb73d2HewcvKPRHSI=;
        b=XHfR1s9wZcAMCr7fYLMQxKrHfsA47F2pnBdTb+FpX4425ihnzd2OHYBrUR+l3CU3G9MpH9
        3gmbalz9Y3CgZNNLFVeTSJSFYsTsFhHenUtxBQKTxCg12h9EUDxU1etOxjakjdEsryyPmp
        wDY0OPCPTxEtB9AqrtmHztml/bPtcVc=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-kFZIui-uPw6h3yxdDPtScQ-1; Mon, 21 Dec 2020 11:25:53 -0500
X-MC-Unique: kFZIui-uPw6h3yxdDPtScQ-1
Received: by mail-oi1-f200.google.com with SMTP id f15so5682156oig.11
        for <linux-usb@vger.kernel.org>; Mon, 21 Dec 2020 08:25:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KgDwPayZceRj0ay5WxA4Idk2hKnb73d2HewcvKPRHSI=;
        b=H8X8e+vdfVLB4xjwjBrDZaPEENXfPnE3efg9Vl6h/Zu0oJtYfYSm2qlwpWqQDatzQS
         kdiM8d53UOshIuNw2iuQ5vbnilE0OqFn6C25xYqy4+4n4T8HtUFdXOm9IaaNa85NwuRl
         x5lVRzAakg2Be+L1/+JkCScfPEQLcVhGkLNpdvmm8UMn5njmV5nNbqcvch+IfQINdmni
         OCtDIq89bDPw2feenZ702pZm+Fbjob2ycwcwT5wmxZuyAJTo+2V7UXPYz0mZqqmwB+Oa
         kj6ykIfK31oA8df2Qn3pvc7AK49pIRoe/Vzgn2AvTWzQJPDD0C4S1HruwtX7zFOqMGKD
         9rzw==
X-Gm-Message-State: AOAM53133QuKTM6a8X/SIOVtbKfNaA/4XafwIFXC92Ihkn0e8TUfhdrI
        oqgqAvUO9sd92NpRlsLuQZL7M8cRO3I4MABqt+2/9YodYMtnBXKftVvysvxKQXk/KyJp1oVZ4sT
        haDeZi9OJ7Ugay24cRCyN
X-Received: by 2002:a4a:11c2:: with SMTP id 185mr12124316ooc.85.1608567952624;
        Mon, 21 Dec 2020 08:25:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFJxJULTiskpg9tHuVN2y6KgrzO2t2HGJPJ0ft+RMn1qj5mMl9GLBJUBmnPWOaE+zJBPpY1g==
X-Received: by 2002:a4a:11c2:: with SMTP id 185mr12124312ooc.85.1608567952470;
        Mon, 21 Dec 2020 08:25:52 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id b188sm137341oif.49.2020.12.21.08.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 08:25:51 -0800 (PST)
From:   trix@redhat.com
To:     b-liu@ti.com, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] usb: musb: add printf attribute to log function
Date:   Mon, 21 Dec 2020 08:25:47 -0800
Message-Id: <20201221162547.3756889-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Attributing the function allows the compiler to more thoroughly
check the use of the function with -Wformat and similar flags.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/musb/musb_debug.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/musb/musb_debug.h b/drivers/usb/musb/musb_debug.h
index e5b3506c7b3f..dfc0d02695fa 100644
--- a/drivers/usb/musb/musb_debug.h
+++ b/drivers/usb/musb/musb_debug.h
@@ -17,6 +17,7 @@
 #define INFO(fmt, args...) yprintk(KERN_INFO, fmt, ## args)
 #define ERR(fmt, args...) yprintk(KERN_ERR, fmt, ## args)
 
+__printf(2, 3)
 void musb_dbg(struct musb *musb, const char *fmt, ...);
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.27.0

