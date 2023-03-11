Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66C426B5F38
	for <lists+linux-usb@lfdr.de>; Sat, 11 Mar 2023 18:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbjCKRim (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Mar 2023 12:38:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjCKRib (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Mar 2023 12:38:31 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D70C47ECD
        for <linux-usb@vger.kernel.org>; Sat, 11 Mar 2023 09:37:49 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id er25so4913216edb.5
        for <linux-usb@vger.kernel.org>; Sat, 11 Mar 2023 09:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678556197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVsRHvp4v2BZsDFyVhp2lzWzUanEACS05jvKHMEi9Oc=;
        b=tcexlUBsPwBVa0P2zR4E94lM2KxLiHbo5zOn6DBz7gZup6TVuvKaQ15pB5QxlYCMzq
         ercJh40HVV3I8+BKPJU8THwCnmxiWWPNpVLer6OQtcxk24qS2yeAqCVeK91eQRq6xB0d
         Ge25egWdeMznxKjF62VVua/KyHwWxKLn3sApSQSewMnUe1QKfltxt+7GKIlQQvu1ZPEx
         B2+/J5BBrI37z/xPOqoJ9R/m13PlunBJlZ5L9mx3fl7HyxpRA7HFEoO+2EY1CRMk6hBq
         UJ0lDg5llQr9ic0G/R7YgDI+AUg95Zse6lmhXUGrizUaiKyf0QyykKncGC3JkjeYf8sW
         ioSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678556197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVsRHvp4v2BZsDFyVhp2lzWzUanEACS05jvKHMEi9Oc=;
        b=53mQDlVpNq8fmaaH9mVxlK+v+a2CSjY1PGKe9ZQ+BS9g8WTrIKCEwwwNfOR3l50Px6
         44PcpnWapjBFvaAwq0d6Dn7HPJfFSv0PlRINYwDcP3hz4G+Y+bQcPvN/SE0ODpzikSeB
         BP9yG6aNcbLI87UmAdv3ZF0vlxldTitC6LJrOr8iQNzSoR8VRo5NQWsUqqxzwox8zcCa
         5kzmvXKgG1aSwVr6ZRfvu7n5qd+w0QkltGPonVCtPJZaDy0Dy9DUPzUZBmGx/uxuz/3M
         xqRDBRU9eajAhpEcrUQM7QlAzDkV5axUvNISH27pHqrjsyrseCPw+CNoi6eCXBEXDxGL
         lrVA==
X-Gm-Message-State: AO0yUKWl7YA9VDNzaK6wC7bwFMmvnvJ3Lu49BMtkq99aRsd92J03lUeb
        IHlxFsnYIrAX6qE0Z4Zq4zyu1A==
X-Google-Smtp-Source: AK7set8PKIRd72z9/UuyBVH8cin+ES99J/ZpkTTo9AKpqnbFqTCWzYzgZiDEH2cYJ9q5Jc0kJo82kQ==
X-Received: by 2002:a17:906:fe4c:b0:906:4739:d73e with SMTP id wz12-20020a170906fe4c00b009064739d73emr5828323ejb.2.1678556197023;
        Sat, 11 Mar 2023 09:36:37 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6927:e94d:fc63:9d6e])
        by smtp.gmail.com with ESMTPSA id jy2-20020a170907762200b008de729c8a03sm1315253ejc.38.2023.03.11.09.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 09:36:36 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Richard Leitner <richard.leitner@skidata.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 7/7] usb: misc: usb251xb: drop of_match_ptr for ID table
Date:   Sat, 11 Mar 2023 18:36:24 +0100
Message-Id: <20230311173624.263189-7-krzysztof.kozlowski@linaro.org>
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

The driver will match mostly by DT table (even thought there is regular
ID table) so there is little benefit in of_match_ptr (this also allows
ACPI matching via PRP0001, even though it might not be relevant here).

  drivers/usb/misc/usb251xb.c:223:35: error: ‘usb2517i_data’ defined but not used [-Werror=unused-const-variable=]
  drivers/usb/misc/usb251xb.c:215:35: error: ‘usb2517_data’ defined but not used [-Werror=unused-const-variable=]
  drivers/usb/misc/usb251xb.c:207:35: error: ‘usb2514bi_data’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/misc/usb251xb.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index e3abe67a155d..c36e04aa5a82 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -377,7 +377,6 @@ static int usb251xb_connect(struct usb251xb *hub)
 	return err;
 }
 
-#ifdef CONFIG_OF
 static void usb251xb_get_ports_field(struct usb251xb *hub,
 				    const char *prop_name, u8 port_cnt,
 				    bool ds_only, u8 *fld)
@@ -626,13 +625,6 @@ static const struct of_device_id usb251xb_of_match[] = {
 	}
 };
 MODULE_DEVICE_TABLE(of, usb251xb_of_match);
-#else /* CONFIG_OF */
-static int usb251xb_get_ofdata(struct usb251xb *hub,
-			       const struct usb251xb_data *data)
-{
-	return 0;
-}
-#endif /* CONFIG_OF */
 
 static void usb251xb_regulator_disable_action(void *data)
 {
@@ -754,7 +746,7 @@ MODULE_DEVICE_TABLE(i2c, usb251xb_id);
 static struct i2c_driver usb251xb_i2c_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
-		.of_match_table = of_match_ptr(usb251xb_of_match),
+		.of_match_table = usb251xb_of_match,
 		.pm = &usb251xb_pm_ops,
 	},
 	.probe_new = usb251xb_i2c_probe,
-- 
2.34.1

