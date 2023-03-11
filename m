Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBB4F6B5F2D
	for <lists+linux-usb@lfdr.de>; Sat, 11 Mar 2023 18:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbjCKRiE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Mar 2023 12:38:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbjCKRh4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Mar 2023 12:37:56 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 296EEB32B1
        for <linux-usb@vger.kernel.org>; Sat, 11 Mar 2023 09:37:35 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id k10so32951332edk.13
        for <linux-usb@vger.kernel.org>; Sat, 11 Mar 2023 09:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678556191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyv/Ot8W77P43I7crwiy1gRRQ+CJGNpQ8ExpT2cUljE=;
        b=i2PRkfHTxKwOaApCmbdBDXXomfd/yMBu1xJfGVyWQ4GGTJZJeUm2SCV+wUW7/S788K
         QlHeG6UH31x3KebDimUYOqGUIVG7jUrpDvuv0VMJ7fKpRhm/XwUr75QsrgAhXHk8k1Kd
         rLWy9QWPVd8Mfw9jylDRI+49godbsHbW3IZSrSDzyqgiZTiAUJ52uChEuCT1MpfjL8+m
         FTgeOilF7vVNwlA/ZwQIfQBdiRRNKtEWFUbdaW1aubJ11u5cbbWwMccDztU4Q6fxAxqm
         lGYkfQCoPaszs/Bcde74oCib9k9mDiGTsDyu1MtvISRKMz+osby21mCFmXsmUUCC7X1M
         UIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678556191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyv/Ot8W77P43I7crwiy1gRRQ+CJGNpQ8ExpT2cUljE=;
        b=Iyqmow77WCPzv2tEl8ZK3yUTlMAI0N8CFWUcusRmpuz9Xz+GVB2UTWS+9+rXUu5STG
         1Mi7IPZeSrDPPesWTyyAZC0iVOb2YY30yIzZbVK+hO9QKi3BLLlxhiyE8YE2m8GVbwlw
         aDD81HB/6R4Yo2f2PT2qvSzoopuYBzV3aOXe5/xj9Y2OGBG38NRbUQ0Ah6t64HgaFaTG
         1xHLiMSGS+N5AIuQIkZYd+DJn14MAKaUVtsbOGvfnbqHYMOTf3+DDvG5BZVGBdCUVG02
         FmBLCdfmq7+EIaOOvxpKlk0/YVZDfs43pttLG33NjiZoNbMpeeugBRnqZ6P9kUrZloId
         kAmA==
X-Gm-Message-State: AO0yUKX9gZNHUzLocRSLFCw+wXNfy5i/ST99sDvzdcnHl7aDtVA8Vgs8
        mAcLjWXHBTgKzgSG0O8thq10mA==
X-Google-Smtp-Source: AK7set8/ddWXTFvR83RNYypGa0WBBDqK9TW8JW4bID1syStw8CQae7CdIFT3RRXevMHmabYbISlaMQ==
X-Received: by 2002:a17:906:4783:b0:8af:2107:6ce5 with SMTP id cw3-20020a170906478300b008af21076ce5mr40384100ejc.35.1678556191866;
        Sat, 11 Mar 2023 09:36:31 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6927:e94d:fc63:9d6e])
        by smtp.gmail.com with ESMTPSA id jy2-20020a170907762200b008de729c8a03sm1315253ejc.38.2023.03.11.09.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 09:36:31 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Richard Leitner <richard.leitner@skidata.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/7] usb: host: max3421-hcd: drop of_match_ptr for ID table
Date:   Sat, 11 Mar 2023 18:36:19 +0100
Message-Id: <20230311173624.263189-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311173624.263189-1-krzysztof.kozlowski@linaro.org>
References: <20230311173624.263189-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).

  drivers/usb/host/max3421-hcd.c:1943:34: error: ‘max3421_of_match_table’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/host/max3421-hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index 28d1524ee2fa..d152d72de126 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1951,7 +1951,7 @@ static struct spi_driver max3421_driver = {
 	.remove		= max3421_remove,
 	.driver		= {
 		.name	= "max3421-hcd",
-		.of_match_table = of_match_ptr(max3421_of_match_table),
+		.of_match_table = max3421_of_match_table,
 	},
 };
 
-- 
2.34.1

