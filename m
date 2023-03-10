Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E58A6B5476
	for <lists+linux-usb@lfdr.de>; Fri, 10 Mar 2023 23:31:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232182AbjCJWbJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Mar 2023 17:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232106AbjCJWas (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Mar 2023 17:30:48 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B363E13F6BB
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 14:29:42 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id ec29so26472690edb.6
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 14:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/fmpCgDpxvA8LWrln8hMWcUkIUbZl0gDdryYs66ZNM=;
        b=R0rVkOFTK01I8PkQgLEcrcN8h1z1TXzJ4sTyCu1Dc/T0d3rgGrCdfCJhUKaPz5ufdr
         TX5GuQRbGajeSaex+o6jv92Y1mM2L9hji0967HOwVSVHQZLiBGNkNE7YL1z3PVto2o7E
         jIzTNU/HR45d4Lc79wXyGiFz7u4MJd0reZLtsSmEKdZ+PYqwSHamhtlepZeIcnS/6eV+
         fzaMtkMZX/ZD/ZwnKY5XesQoREsOIOUWeCkkUZXVpt2Pf2NnZJmOwY5XoMxZe+3ybWPD
         CsTJzM5Lgl9HX2VmgJq1fUqPxjgwKUD2zPQueLzmEZOVa5HyJW3Iugkagtp3eqBfPpbD
         Fclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/fmpCgDpxvA8LWrln8hMWcUkIUbZl0gDdryYs66ZNM=;
        b=R5EdohRajfaONlOMtuu70PeJqYfk/zO08QVyYopARxaXPo4wA6fm/doh8HhV/x59K7
         9GB85RZy4wzFZz0msUMZdLynSFnoexQAJl1sAqMwobfWslzZEzSMFJKncfCnxmfrWxx0
         QBwa8W8YTDBmW9zApFOPGBFOaBXmm4S4yI0HxyuuR7ahZPp+A1DHAdGJuCygcHrIZ30X
         i04rtN51fG7SbAxVo+jq2X4zOcR8Ga4BxHcKGH4+X/AorBqxql39BflJg+2jw0c8l+1P
         Zh87R3vs1NF/ty+z2+vGHwnd8r/DH75uSbqvw8luVH+izEdTucilnj0iAUVp9wkc70c3
         Z0MA==
X-Gm-Message-State: AO0yUKVdQJsEZZNoY4bU/XFzg34nHkAN919XU+wjSgsrS93G2CrZrebG
        FVnTbgZRr7HwwOLT9Gzw6rRWQw==
X-Google-Smtp-Source: AK7set9dImNV/KN8EiLdY5EpM2XCsDXv1qyUfw+n5R9ekVwcaPaRxhGQLlDaSANKhoPsd9Ret83tWQ==
X-Received: by 2002:a17:907:6e0f:b0:907:672b:736a with SMTP id sd15-20020a1709076e0f00b00907672b736amr33289494ejc.31.1678487380294;
        Fri, 10 Mar 2023 14:29:40 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id d5-20020a170906370500b008e17dc10decsm371201ejc.52.2023.03.10.14.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:40 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] usb: typec: fusb302: mark OF related data as maybe unused
Date:   Fri, 10 Mar 2023 23:29:37 +0100
Message-Id: <20230310222937.315773-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222937.315773-1-krzysztof.kozlowski@linaro.org>
References: <20230310222937.315773-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/usb/typec/tcpm/fusb302.c:1816:34: error: ‘fusb302_dt_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/typec/tcpm/fusb302.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 1ffce00d94b4..592b0aec782f 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1813,7 +1813,7 @@ static int fusb302_pm_resume(struct device *dev)
 	return 0;
 }
 
-static const struct of_device_id fusb302_dt_match[] = {
+static const struct of_device_id fusb302_dt_match[] __maybe_unused = {
 	{.compatible = "fcs,fusb302"},
 	{},
 };
-- 
2.34.1

