Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED79C6B5475
	for <lists+linux-usb@lfdr.de>; Fri, 10 Mar 2023 23:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232094AbjCJWbI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Mar 2023 17:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232087AbjCJWar (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Mar 2023 17:30:47 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECDAD123CD1
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 14:29:40 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id cw28so26496754edb.5
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 14:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zZBiSBh/uMHLxNGMJD5/x7iKpfjagyjpgEMbyA0c4IY=;
        b=kI8tbYpRepNoWUOIKSEz3YzOMlaj+FiVTekSncMStWDI5O7kelt7UpFXprP2HySvV1
         /8uVzvFEtlcvTuPOkrWbbOL3zZrTmcV7uMKQO0j1YcNm3UYdT4vBQhvY+YUpuA7pqmuv
         WxeNVsD7qw9YZZ68yAAPsoiYQTCkD+//U41hA5Ij7xx2Yf8CK35RtWTwy4WLTPqr89ON
         9eygPHgv6mxlMhxleYm1MlBp71KBVomYKgGcgONPmUJsCd2rvy4uu2jeESLevIctmwka
         nMAPxEb1MykjP7rfo8HywrvX0tihJGGiMW1X5jvUnetfWU9NVQ2Qc+tt9+J/2mYGcth3
         HR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZBiSBh/uMHLxNGMJD5/x7iKpfjagyjpgEMbyA0c4IY=;
        b=vlCFNwqf6EJ0SXY/s5oTd04hsma1kSeF/rw+qqntgB7xFwfqfx+T2mY/zIGNWSmxG0
         qn+CWXy/kstBYqnWcpiYrlgt0x/hYUdFsRIGRn49wZ2WV/mBBsRp5uydLnNHYHt3UeGP
         z/GUr1Nc5LW9Qc9LKOmIhTI0nynbbvaYzlrZuoUdvrjUPCW3xUt47tQ0Hka+aCqdwq6f
         /hEvrWYpMf7L5yWvtIf3K3A19DcM+c5e6v1nmxqhEVm+OxTYHxYQS2sFPiqWxljx0XjU
         MXDzanCS44+NPggUoj1MWI8I6RG8jqHmmZx3caWkXPk0/0hlFqOhxQA1wb5uKNZxqETI
         q9VA==
X-Gm-Message-State: AO0yUKXauehYPVygC/QIOMheJ7ifG+W9pZgHF2lUihCrdFG1NeFIbHNO
        PpaJaDtuPxPnXlCUz1ZOuHjJxlhhK2DdLbUzk3A=
X-Google-Smtp-Source: AK7set+U/X5h1L8f+O6dk2UpzKGGJkAH3/87LaLO1bo9+b2A4dcWda14m+u/RspMEgdY+VIIzKQCRQ==
X-Received: by 2002:a17:907:98d2:b0:8af:54d0:181d with SMTP id kd18-20020a17090798d200b008af54d0181dmr23195756ejc.35.1678487378977;
        Fri, 10 Mar 2023 14:29:38 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id d5-20020a170906370500b008e17dc10decsm371201ejc.52.2023.03.10.14.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:38 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] usb: typec: hd3ss3220: Drop of_match_ptr for ID table
Date:   Fri, 10 Mar 2023 23:29:36 +0100
Message-Id: <20230310222937.315773-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
matching via PRP0001, even though it is not relevant here).

  drivers/usb/typec/hd3ss3220.c:284:34: error: ‘dev_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/typec/hd3ss3220.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 746ef3a75b76..8bbeb9b1e439 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -290,7 +290,7 @@ MODULE_DEVICE_TABLE(of, dev_ids);
 static struct i2c_driver hd3ss3220_driver = {
 	.driver = {
 		.name = "hd3ss3220",
-		.of_match_table = of_match_ptr(dev_ids),
+		.of_match_table = dev_ids,
 	},
 	.probe_new = hd3ss3220_probe,
 	.remove =  hd3ss3220_remove,
-- 
2.34.1

