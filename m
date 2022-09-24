Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C560E5E8A57
	for <lists+linux-usb@lfdr.de>; Sat, 24 Sep 2022 10:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbiIXI7U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Sep 2022 04:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233437AbiIXI7T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Sep 2022 04:59:19 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A62D219F
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 01:59:18 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id t3so2142376ply.2
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 01:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaul.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ZeXdtwy3Yv/zxts7snaA6HbOFxTLg7KLB5BOsTPDQlY=;
        b=hwb04X+SWSWCUrJIsskRP7RsFi0uYdBFDG5EAA/XjtHs7UD8ECGDn7gq4WdNtqNMWy
         LXAkrOM7PEapcD0ziY1Zr725mNKg2BqNxM9NHVvu4c3MvTLHjtfOI7ydd1TXIgcY39KN
         GN1YfTrcIhJ7JddAYQiC1snci9r/ghYcEeL+Sf7Xpyt3BayQEKDTYwjsHZepbkV9REYJ
         pHABsYttbDJ9x9izK4nW4hyTYV4yQYyQ6nept6PDbC9ql2yS0+PpFu2yNYhk1pcxcjCy
         ykgl16To9mTYlmnKRBzMQzf48dNH0/LWCafSGbf1qAq/rY2flAZsi59l0izU17MO6NhG
         07BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ZeXdtwy3Yv/zxts7snaA6HbOFxTLg7KLB5BOsTPDQlY=;
        b=gH6tjuTI+1GIx2e6+sfxPNTcYiaI0c6YTYiaeVgk5oUJkdq4biEbiQbnNmkaN/agfG
         soJpo4dbDhQAGy8csD5bsYCh0RQKKc+INV+N8SprOaZnaRDimqvmmK5t/+k+c09Yh4UA
         sLA8HQoQnC5NndaI4xZDJqYX9+ns73KokGw0L7+DA6r5aRbClvY33x8xziq+TGS2W3qN
         V/bP6uNen++X70NTY+4JBekEqyzKZR+MetZtY0sDXhLq1ur+hb1v93ttHJ4PLGXE7ZwR
         YKRtaFhUqavq7zyXTuZit0gk28rosIbvGWaIuxOx7lPdGrg1b6xjuDW1ijkGrczG+8lf
         BEcg==
X-Gm-Message-State: ACrzQf3o584JRA0ZEN+7v2itMvHRDtA6BHO/zcalQmcg93vjbNL+MQZN
        WIzyYtX+mV0u2uueGmxnPl5V2sjGIxLDRdOg
X-Google-Smtp-Source: AMsMyM4UfjwshO2BGJsWvHyWM1OUjSB/1MakDMsnrH7V9G8nHekZfGBLHN3ifCnihVJxlf3o6olRBg==
X-Received: by 2002:a17:90b:390e:b0:202:affa:1c91 with SMTP id ob14-20020a17090b390e00b00202affa1c91mr26034992pjb.233.1664009957403;
        Sat, 24 Sep 2022 01:59:17 -0700 (PDT)
Received: from watson.. (58x5x227x72.ap58.ftth.ucom.ne.jp. [58.5.227.72])
        by smtp.googlemail.com with ESMTPSA id l16-20020a170903121000b00176b3d7db49sm7502717plh.0.2022.09.24.01.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:59:16 -0700 (PDT)
From:   Andrew Gaul <gaul@gaul.org>
X-Google-Original-From: Andrew Gaul <gaul@google.com>
Cc:     linux-usb@vger.kernel.org, hayeswang@realtek.com,
        Andrew Gaul <gaul@google.com>
Subject: [PATCH] r8152: Rate limit overflow messages
Date:   Sat, 24 Sep 2022 17:57:31 +0900
Message-Id: <20220924085731.628073-1-gaul@google.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

My system shows almost 10 million of these messages over a 24-hour
period which pollutes my logs.

Signed-off-by: Andrew Gaul <gaul@google.com>
---
 drivers/net/usb/r8152.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 688905ea0a6d..e7b0b59e2bc8 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -1874,7 +1874,9 @@ static void intr_callback(struct urb *urb)
 			   "Stop submitting intr, status %d\n", status);
 		return;
 	case -EOVERFLOW:
-		netif_info(tp, intr, tp->netdev, "intr status -EOVERFLOW\n");
+		if (net_ratelimit())
+			netif_info(tp, intr, tp->netdev,
+				   "intr status -EOVERFLOW\n");
 		goto resubmit;
 	/* -EPIPE:  should clear the halt */
 	default:
-- 
2.37.3

