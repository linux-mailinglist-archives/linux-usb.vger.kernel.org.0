Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A67305A10
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jan 2021 12:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237037AbhA0Llg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jan 2021 06:41:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236726AbhA0La6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jan 2021 06:30:58 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6553BC061222
        for <linux-usb@vger.kernel.org>; Wed, 27 Jan 2021 03:26:14 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id z6so1460838wrq.10
        for <linux-usb@vger.kernel.org>; Wed, 27 Jan 2021 03:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bv5N/W3oq+FZm8qEBRC53aadCUOUoa7ywZlmGmPMg74=;
        b=NK2TtYcdpOgyLLkQQic5gvtjp3/8VGKQr5GZThUNTjyAfO1pmjo7MWJNPtXgzp1KIO
         CH/gxQzwk618UaXMef+p+VpwV1+QCL7qpDSmAyPucEumV1UqiaH7DTDaqgKHXTvsrUuq
         ZUV2LNHehwRytkJXIroTKPhKVxMIngXvRJfqY/Wrg5MAML2J4nVbAAoxUBrB5mRfqGUS
         +M5GjKENRT4PYmWk32VwYzjagB4eh9lvBW2p+NjtmmLlIWF1zDnthz+zIGboKEoFARXI
         H9zMDaWg2I/bBlN5rCXNsQbgDte/Vr1K57tlWuH+JI4XrfgQYSwMz8vPtcQZqu1PXzvf
         WQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bv5N/W3oq+FZm8qEBRC53aadCUOUoa7ywZlmGmPMg74=;
        b=uCADXv71/7JUgwAenTsOb115cl3z9kWiQOF+U2kw9fxo9JCrdZNrhQEuwg3cHMclYw
         j5Fr3icq7/5283JwOfJpvag52NnrPXxaw/OWTAn/Wl6KKyC4mbBfhEoitWo6iVapqFke
         xd1eqA6QHML7113ShX7nwcE/zaUIFRs2DbMkP8BsD4gGcoKpQhrAACZUq+5fTCxKKu2y
         SzKEbLfI7/M8Sw/+kZvtpy/NyURXxoIGNocDYd5SkbMWsGNRvDLcXXCB97243zZvHqhx
         rj5mO4X88Ati4fX5bZ2GU5OGtczk9Sf7KgG6xEjl30J9WIRlDz+yIJC10ZC1Emb7qU6G
         zjqA==
X-Gm-Message-State: AOAM533vKEjZA1A6Xfhz9Ssd/gIHV8rn9+nxpEgatVepFzXNj8zsJ6xs
        XNENtzkrdMiqvgrsjDyUzv9lcA==
X-Google-Smtp-Source: ABdhPJybnAUfr55viAi3nE368goiE4XSTFzPj50nTPATCsP9WDIBu1EsnC6PAvP3slyBbDvstAJUXg==
X-Received: by 2002:adf:f8c1:: with SMTP id f1mr10664387wrq.76.1611746773216;
        Wed, 27 Jan 2021 03:26:13 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id m2sm2040065wml.34.2021.01.27.03.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 03:26:12 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 12/12] thunderbolt: swit: Fix function name in the header
Date:   Wed, 27 Jan 2021 11:25:54 +0000
Message-Id: <20210127112554.3770172-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210127112554.3770172-1-lee.jones@linaro.org>
References: <20210127112554.3770172-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/thunderbolt/switch.c:1322: warning: expecting prototype for reset_switch(). Prototype was for tb_switch_reset() instead

Cc: Andreas Noever <andreas.noever@gmail.com>
Cc: Michael Jamet <michael.jamet@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/thunderbolt/switch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index ce1b120d1cd46..6a3d5608431f6 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1313,7 +1313,7 @@ static void tb_dump_switch(const struct tb *tb, const struct tb_switch *sw)
 }
 
 /**
- * reset_switch() - reconfigure route, enable and send TB_CFG_PKG_RESET
+ * tb_switch_reset() - reconfigure route, enable and send TB_CFG_PKG_RESET
  * @sw: Switch to reset
  *
  * Return: Returns 0 on success or an error code on failure.
-- 
2.25.1

