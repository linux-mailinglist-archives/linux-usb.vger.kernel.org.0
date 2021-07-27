Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6493D728D
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 12:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236088AbhG0KFj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 06:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236121AbhG0KFi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jul 2021 06:05:38 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CE55C061764
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 03:05:38 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id b7so14498671wri.8
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 03:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JOagArgEWpixkvsrs3w9VqgA+Mdd1pGQqUhf0Rf7SZQ=;
        b=hyk43kr+3uM67W2MUwA4XTVln3qP01fL2KawL072h32O6Lj5SZ0fCb7ba2VZAKB/bh
         mYqORToiB5XFJHfhHrhPPpAhqxZJaBfV3W0Pwy2LaXguVwPuNRd4a+UHCAr9SPg1NhZK
         5q+mdnGMnuFbVGWxtyuo546miyNlJGd/QCCztFYHzc1S7ytueW1J8exdtv2q/OKVAXPJ
         vBivfl88TmUZSBo+VU/ELfDayWIS8Oh6Zb0TVGdtJwJ6s0gr6iptZYx43E3MAj4lQ+uQ
         QjOViUspXXtAv4rpr859W07do3ZtSCfnv74xN3mIFBvVWWv7IxIYFKRhK3slJCM3qwUM
         bvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JOagArgEWpixkvsrs3w9VqgA+Mdd1pGQqUhf0Rf7SZQ=;
        b=Yea/H2MhdA5FH4yd2gSJRArPqDd6h9ibtRigVXEMCSjvRZ+NN4uekAUiPI9e0xDQl2
         ChmboVBzY/qjWqseS7USz31YFfr3CWo5w0LUsuasd0kLOc0DnS5egpAQAcx4cUVO9I8v
         Bg1RLMsE3GQwQQ5gyH2waR2nF/7rjv83zt97kuuE8ynxoiTYjMHAZ969p11fcW9sEJmV
         cxLSmfd/9zu6qPGKdIeiFHMF2g7dI7+flhN7hZbjCA6BBrJSYcGhHceA439iUptOrH/4
         Zot+oLWb8dGgYhxRE/DrEvbAdbCa1GMnJAe1m0yfIh219E/TIDtjw47o0nAvtAPEjagT
         AGVA==
X-Gm-Message-State: AOAM533xLi84/0pvDbKpA0DuzRVsdl9r8ppSHIkeHTHVbt/elYaEs/Pp
        H0XuoxKRFuX1SYHB++0FxrPaxPSicJvf1A==
X-Google-Smtp-Source: ABdhPJzgRAj/n0LUzSMtt5BWmpiizfNx3oF4JxdlGCfPjY27Slun+44arg7RT1/wzMi/EMV3bwZu/Q==
X-Received: by 2002:adf:e10c:: with SMTP id t12mr23492506wrz.36.1627380336714;
        Tue, 27 Jul 2021 03:05:36 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id v5sm2813221wrd.74.2021.07.27.03.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 03:05:36 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 2/3] usb: isp1760: do not sleep in field register poll
Date:   Tue, 27 Jul 2021 11:05:15 +0100
Message-Id: <20210727100516.4190681-3-rui.silva@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727100516.4190681-1-rui.silva@linaro.org>
References: <20210727100516.4190681-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When polling for a setup or clear of a register field we were sleeping
in atomic context but using a very tight sleep interval.

Since the use cases for this poll mechanism are only in setup and
stop paths, and in practice this poll is not used most of the times
but needs to be there to comply to hardware setup times, remove the
sleep time and make the poll loop tighter.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/isp1760-hcd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index a745c4c2b773..a018394d54f8 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -250,7 +250,7 @@ static int isp1760_hcd_set_and_wait(struct usb_hcd *hcd, u32 field,
 	isp1760_hcd_set(hcd, field);
 
 	return regmap_field_read_poll_timeout(priv->fields[field], val,
-					      val, 10, timeout_us);
+					      val, 0, timeout_us);
 }
 
 static int isp1760_hcd_set_and_wait_swap(struct usb_hcd *hcd, u32 field,
@@ -262,7 +262,7 @@ static int isp1760_hcd_set_and_wait_swap(struct usb_hcd *hcd, u32 field,
 	isp1760_hcd_set(hcd, field);
 
 	return regmap_field_read_poll_timeout(priv->fields[field], val,
-					      !val, 10, timeout_us);
+					      !val, 0, timeout_us);
 }
 
 static int isp1760_hcd_clear_and_wait(struct usb_hcd *hcd, u32 field,
@@ -274,7 +274,7 @@ static int isp1760_hcd_clear_and_wait(struct usb_hcd *hcd, u32 field,
 	isp1760_hcd_clear(hcd, field);
 
 	return regmap_field_read_poll_timeout(priv->fields[field], val,
-					      !val, 10, timeout_us);
+					      !val, 0, timeout_us);
 }
 
 static bool isp1760_hcd_is_set(struct usb_hcd *hcd, u32 field)
-- 
2.32.0

