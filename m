Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15FEC6B5F31
	for <lists+linux-usb@lfdr.de>; Sat, 11 Mar 2023 18:38:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbjCKRiH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Mar 2023 12:38:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbjCKRiC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Mar 2023 12:38:02 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA0CCB67E
        for <linux-usb@vger.kernel.org>; Sat, 11 Mar 2023 09:37:36 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id x3so32969499edb.10
        for <linux-usb@vger.kernel.org>; Sat, 11 Mar 2023 09:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678556195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AA/7TzUbUtidDqRHpHd82dpik34r4cCW1rem2TpGlkc=;
        b=kS28bmJvIRgUqxsDSIFRumkkyb0+Yr7PTRHD/xgOg8rM9MGCZO8wkTvyBd8wCBOBb7
         JKYS/neVWEbfDPUgv3EITMvamCix3VUDC77bSUhPhxlhVOoyWC3fL+lOkBFyiSXBBxUk
         aPVfTnACgSRbW+tA0slArAt2BHfrebH6hUYm7Q1DvRU2QXafmbJQlO5nCkAYgmSS1D5c
         CTDUTxU69LknhWPmZGSb7knKb+AqOklo/JxOMJgn+TQ1lwePHpOiBWVc6FwvYDxdW6Dc
         9MuRmh3EQXFqkb8A6syv9jYmLX9EEZ69bjcJc5Q6mCVI2zpM3s8kxRpVguYrtAtjsWwY
         Vcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678556195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AA/7TzUbUtidDqRHpHd82dpik34r4cCW1rem2TpGlkc=;
        b=lSU4P6FPf4VDYp05XtJ9zGrpOVJiqV0djzrAUS1qzVGBAGrKoBFjxdZGMx9lOwCkc7
         2ftbZnBsWxhqr1j9vA1xpuFsR/94yCfPEfRDr49eKcC/cKk4v8j/F+IeiM0QYtIrzEb0
         TwMKwVbri5VmK3roLiv3yslMsF7kpmcrrVaGmPju7LvEFNzLUNChC+SFZBYksVVrDvBz
         oOy7KuEmydkCrqtBXOctnG+FPiBJscscWWOenqlEYwk9M3Kvv1BTFzV2X1qQKZJZJeKC
         XAteGtISJ1yBVrqpWIU9feU9WOygU+nWlT/6gzJV5rL6AXwcV50L/uLocp90F+1/x3fD
         N7bg==
X-Gm-Message-State: AO0yUKXOle7SWdeTHrvwY5p87q8+atF1bP9u1g76oSe/+cCf1I/Mvpru
        ZjGY5xJ6yHy7M6Q5sTXklTJxCg==
X-Google-Smtp-Source: AK7set8YRyIDU65T+c9e+spjMLyVYQQMb679cFzPtTuclharU5ugxZphybZdPkldQ6pftwD0+Z/Brg==
X-Received: by 2002:a17:906:66cd:b0:8e8:602f:847a with SMTP id k13-20020a17090666cd00b008e8602f847amr27771691ejp.24.1678556194970;
        Sat, 11 Mar 2023 09:36:34 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6927:e94d:fc63:9d6e])
        by smtp.gmail.com with ESMTPSA id jy2-20020a170907762200b008de729c8a03sm1315253ejc.38.2023.03.11.09.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 09:36:34 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Richard Leitner <richard.leitner@skidata.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/7] usb: gadget: renesas_usb3: drop of_match_ptr for ID table
Date:   Sat, 11 Mar 2023 18:36:22 +0100
Message-Id: <20230311173624.263189-5-krzysztof.kozlowski@linaro.org>
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

  drivers/usb/gadget/udc/renesas_usb3.c:2811:34: error: ‘usb3_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index bee6bceafc4f..24ff3bce68df 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -3039,7 +3039,7 @@ static struct platform_driver renesas_usb3_driver = {
 	.driver		= {
 		.name =	udc_name,
 		.pm		= &renesas_usb3_pm_ops,
-		.of_match_table = of_match_ptr(usb3_of_match),
+		.of_match_table = usb3_of_match,
 	},
 };
 module_platform_driver(renesas_usb3_driver);
-- 
2.34.1

