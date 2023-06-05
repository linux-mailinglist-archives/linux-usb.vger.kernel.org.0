Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9C4722573
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jun 2023 14:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233337AbjFEMU4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Jun 2023 08:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233145AbjFEMUy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Jun 2023 08:20:54 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30EB3E8
        for <linux-usb@vger.kernel.org>; Mon,  5 Jun 2023 05:20:53 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f60a27c4a2so5429359e87.2
        for <linux-usb@vger.kernel.org>; Mon, 05 Jun 2023 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685967651; x=1688559651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqeY5bs+DmWzjxzftaET35zW0fUGL+nVoWcLOApDUo0=;
        b=GUceVYkewS4eA83dNeuAXQFncXhR3YH77cDA1ge4l7UMy0fIes8EaAQTVKO+pqg813
         0XNnn1z/HznlV7Q+gC+9FLZhgK/T3BK1O9eznG2yJ3wZFNfOIzFYH8jhSmSWTQ4irRto
         OQbN5hVCiDJoPba5IaYARmgXy9Vw8lNRYGGvITO7803uDapU8LjDtZY3VL1p8iJQzuOY
         wMpnraSA2WQwH4yP36WZXnnIUmWmJ5vwp+ZjaclFZn9AoIyMRQIqzBIDZEJhCO6HDoJa
         t/r2GMXO0YcsvvUM/AtWp5XDm4xTPsCeYa1VZgs6JHC2Shn1waBkIosmgefCt4dvoorp
         mnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685967651; x=1688559651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqeY5bs+DmWzjxzftaET35zW0fUGL+nVoWcLOApDUo0=;
        b=aqd7y/Qk5rUVJl1+0xlFd4Mf/sqxCEyT4r+llWToppkfj3+Nh1QoVK6+5/9vlOhMc7
         6j40LfVmjbW1Q+XicjL3gVE/tncfLG02TO4LRCMTScD4hFdus9zvKB7TIYKV7oR0AlhF
         qnYoxzre1lHTQfYPUSLgW5umo9JOAwUrAf2t/amVWgsTiMUAy/pDmw4dggKdmg5TGAKN
         pUwbJ5gTiK6qoR5np67JOQhjSlCe+1+uVY4zaZPZWibf4EV7CGinPvb3dwScO0kXcq9y
         IdT+UpykDFqGK9iqLAu6mIPmjdrvipCYsUjwwxlGBydIHmGkPGwrds3T3Bxw69sAxifL
         PTGA==
X-Gm-Message-State: AC+VfDyT4wR/jEQ0eatyAb/eLsb0Brll7ug5sSmrgyjBY2u4/DOhxcWf
        z5yVdEODdkug/aZzFnG+BTHWUA==
X-Google-Smtp-Source: ACHHUZ5fD8+QgzKrSmdXFVRKBwtF7kMAY7MX8UQf5NTkXe0CMQkNqckaxRvK4Rra4k/1/UBiKw6QAg==
X-Received: by 2002:ac2:51b1:0:b0:4ee:5aeb:e2f2 with SMTP id f17-20020ac251b1000000b004ee5aebe2f2mr5060466lfk.38.1685967651045;
        Mon, 05 Jun 2023 05:20:51 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id e8-20020a056512090800b004f20d0ebe50sm1106952lft.94.2023.06.05.05.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 05:20:50 -0700 (PDT)
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
To:     gregkh@linuxfoundation.org, stable@vger.kernel.org
Cc:     kuba@kernel.org, simon.horman@corigine.com, joneslee@google.com,
        oliver@neukum.org, davem@davemloft.net, bay@hackerdom.ru,
        linux-usb@vger.kernel.org, netdev@vger.kernel.or,
        linux-kernel@vger.kernel.org,
        Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH][stable-4.{14,19}.y 2/3] cdc_ncm: Fix the build warning
Date:   Mon,  5 Jun 2023 12:20:44 +0000
Message-ID: <20230605122045.2455888-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
In-Reply-To: <20230605122045.2455888-1-tudor.ambarus@linaro.org>
References: <20230605122045.2455888-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Alexander Bersenev <bay@hackerdom.ru>

[ Upstream commit 5d0ab06b63fc9c727a7bb72c81321c0114be540b ]

The ndp32->wLength is two bytes long, so replace cpu_to_le32 with cpu_to_le16.

Fixes: 0fa81b304a79 ("cdc_ncm: Implement the 32-bit version of NCM Transfer Block")
Signed-off-by: Alexander Bersenev <bay@hackerdom.ru>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/net/usb/cdc_ncm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 631c32e4bcc3..ae2a44ceb23d 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -1175,7 +1175,7 @@ static struct usb_cdc_ncm_ndp32 *cdc_ncm_ndp32(struct cdc_ncm_ctx *ctx, struct s
 		ndp32 = ctx->delayed_ndp32;
 
 	ndp32->dwSignature = sign;
-	ndp32->wLength = cpu_to_le32(sizeof(struct usb_cdc_ncm_ndp32) + sizeof(struct usb_cdc_ncm_dpe32));
+	ndp32->wLength = cpu_to_le16(sizeof(struct usb_cdc_ncm_ndp32) + sizeof(struct usb_cdc_ncm_dpe32));
 	return ndp32;
 }
 
-- 
2.41.0.rc0.172.g3f132b7071-goog

