Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEBB1213EDA
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbgGCRnV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbgGCRm5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:42:57 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70283C08C5DF
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:42:57 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k6so33581878wrn.3
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SYWwkgSPDIgouMfzyNf8caHaLbWDeyv2rcH01GGvlwk=;
        b=FIagus93ZBIMXIzVrgZHDBEEUg/b5rSvyh4Hjl1apX65iTrYxfN7M6m0U1se57NfwG
         AMAnabxTOjXzH+qeXftOTmXkt6iVi+tFloOT1b75k5tBrPL4F3Pz6ByWaNMda2fUKvBQ
         Nfsvnq9vuXjPog2ODt9TYrvxJcIRCbWYQYwc0PBNoUrXDPhB44nPxdeBnvVmzqSzxgTD
         LJV4eItrfpTRuqhRhIkWVigXqwyl+VrP/HaPOwOJ7p2s3AXAkJUopVPwmD8gGCG4RfJr
         TMTV7FTl1+RO7WMt+3zzPXGZ11hrR3JJ4e0srVy5hAsMi1qcO0shJjmlXn4otHv5LVZZ
         JC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SYWwkgSPDIgouMfzyNf8caHaLbWDeyv2rcH01GGvlwk=;
        b=GrWCw3nWVlAr4KouNIDWw2gYEvstLN3/4x0KzUYQL6CqSDeDEYIQFs75HzEqK6aeDe
         7gomRbfufwSL9crwsyCFhdbex8goU+U1RJV0YeydA3kaj0nXVjnAPenyT5XQsoqa/7IM
         a1meBlTd6Fq1/hecEIEbPuJ6ATN2EoKWk2SF7zfsW+sWwFuv9TJywzu11FGBVNw+hPZc
         LzJX+AmAx4/fbOgEjUwREHNUp6BOU+0A/XagJevKkNZWy7V1AicfwujakGsFY1S3M5SF
         4LuzaqF0R+il2p89r49o3XSIYXPXBYxTkFGFwxpQHDVa3/F/E8F4BUdjbyRKB6hnHAdB
         qZYA==
X-Gm-Message-State: AOAM5326kvF5Jjf05fH4h6LiNbl8eQNXXV894jjKUHPb7Wv6KdfzYkFO
        A7TrQQoEBJsqkbigRsIK4Hbo6g==
X-Google-Smtp-Source: ABdhPJx0xhAIeeMVJ7701j/QMOLoGiJ8xgSFIS82zFsNrKSO5MmnhpfCqseg2k0p0otT85xs0+B7GA==
X-Received: by 2002:a05:6000:1008:: with SMTP id a8mr39019528wrx.416.1593798176240;
        Fri, 03 Jul 2020 10:42:56 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:42:55 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Al Borchers <alborchers@steinerpoint.com>,
        Peter Berger <pberger@brimson.com>
Subject: [PATCH 26/30] usb: gadget: function: u_serial: Repair misdocumented function argument
Date:   Fri,  3 Jul 2020 18:41:44 +0100
Message-Id: <20200703174148.2749969-27-lee.jones@linaro.org>
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

Looks as though this has been an issue since the driver's
inception back in 2014.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/gadget/function/u_serial.c:538: warning: Function parameter or member 'port' not described in 'gs_start_io'
 drivers/usb/gadget/function/u_serial.c:538: warning: Excess function parameter 'dev' description in 'gs_start_io'

Cc: Felipe Balbi <balbi@kernel.org>
Cc: "Michał Mirosław" <mirq-linux@rere.qmqm.pl>
Cc: Al Borchers <alborchers@steinerpoint.com>
Cc: Peter Berger <pberger@brimson.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/gadget/function/u_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 3cfc6e2eba71a..c295defe7ecd3 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -527,7 +527,7 @@ static int gs_alloc_requests(struct usb_ep *ep, struct list_head *head,
 
 /**
  * gs_start_io - start USB I/O streams
- * @dev: encapsulates endpoints to use
+ * @port: port to use
  * Context: holding port_lock; port_tty and port_usb are non-null
  *
  * We only start I/O when something is connected to both sides of
-- 
2.25.1

