Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9991C799B29
	for <lists+linux-usb@lfdr.de>; Sat,  9 Sep 2023 22:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240514AbjIIUbE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Sep 2023 16:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239398AbjIIUbD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Sep 2023 16:31:03 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69DB31BD;
        Sat,  9 Sep 2023 13:30:59 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-5733d11894dso627159eaf.0;
        Sat, 09 Sep 2023 13:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694291458; x=1694896258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9bSsVwvcYJSR91sbcGOhHvsuo7oedVyOBVQO8Wtvh8=;
        b=fHf7d4vivTR2XCDXijni919sogHI9EfCIXAFwFgFFAMq9H1bERNErC4NwVv4kxb4Zw
         KV1CB7THQLI38CFOwSgiVlpkjT7JUmasb3UFeHgmKXYsfAexYkF4lQUTYhM1JYALSbX9
         ZCFP0tV0dVJ3moErVwJf4zTzDHCOu+75ppIZ0m10e1/eFjbm8gENTSNXZuXJO5dXvwti
         DBGnceJH3PgJHqjtCCjYf15M1wHsxOVffSQ2ZrIFu8pUvZXScTbsiXdr+MmuSuaDOE0u
         +PZmZrYZxqf91nA5Y2KMecZ7lUp1Ckayh+kVgggx7CpvxHRQYtn7lkRsLR3pnu85A3Nd
         daIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694291458; x=1694896258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9bSsVwvcYJSR91sbcGOhHvsuo7oedVyOBVQO8Wtvh8=;
        b=K1AWlV7VVEdVZVv9+oZAmUcB7xS2+5yiOczQN1d5UD2dfQhq+kRb6jWFqy3Tq6YfHw
         gJrrssmRHE0d7wsPShP4Zq0BcGyHzJniB+D7jcdYPBLuO3qCH8HkZeKO9pqtjnFwaFtw
         Dazuzwx9Yt3kBbUwSgZE0qHpxYPih5HxTRlXTBZj2tAspszTRdHs2FzQEDOMRmD9ZWJH
         pGyI18nOWfCB58yRrGi3aeQzOEs67EQqh99CQoXTQPyb297ol92FvNxamZX4Mu45wBFb
         jSdjyzTMQ+zjpwzP6O+O/FB4plMYjcylv8vFw8iSgC54x4TK6IKLtvl4VfiWz0PPVV0W
         2aag==
X-Gm-Message-State: AOJu0YyZLBlGlx7iwDTz0yAPFZt45pY0h7cJI5Pd67x07XkxOSRhDKaP
        qVRQ0r3TNN82/lFfuU+JkT7nqV0Cn/I=
X-Google-Smtp-Source: AGHT+IGxykv0GlpNnUw/BxblyhhHhJaF3hcZcGq/YOAdaUhjGk7bklnzAIkQD1/qc8Qw2m1FEaAnDA==
X-Received: by 2002:a05:6808:3c86:b0:3a9:f25d:d917 with SMTP id gs6-20020a0568083c8600b003a9f25dd917mr5750939oib.4.1694291458669;
        Sat, 09 Sep 2023 13:30:58 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8ae8:e729:67d1:f8d9])
        by smtp.gmail.com with ESMTPSA id d12-20020a05680813cc00b00396050dca14sm1873509oiw.28.2023.09.09.13.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 13:30:58 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     andersson@kernel.org, linux-usb@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-imx@nxp.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH 3/3]  arm64: dts: imx8qxp-mek: Pass gpio-sbu-mux mode-switch
Date:   Sat,  9 Sep 2023 17:29:57 -0300
Message-Id: <20230909202957.1120153-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230909202957.1120153-1-festevam@gmail.com>
References: <20230909202957.1120153-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

Per gpio-sbu-mux.yaml, the 'mode-switch' property is mandatory.

Pass it to fix the following schema warning:

imx8qxp-mek.dtb: gpio-sbu-mux: 'mode-switch' is a required property
	from schema $id: http://devicetree.org/schemas/usb/gpio-sbu-mux.yaml#

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index a06a6491ef20..f95b58c69c6a 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -36,6 +36,7 @@ gpio-sbu-mux {
 		pinctrl-0 = <&pinctrl_typec_mux>;
 		select-gpios = <&lsio_gpio5 9 GPIO_ACTIVE_HIGH>;
 		enable-gpios = <&pca9557_a 7 GPIO_ACTIVE_LOW>;
+		mode-switch;
 		orientation-switch;
 
 		port {
-- 
2.34.1

