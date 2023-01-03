Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B815A65CA59
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 00:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238330AbjACXfa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Jan 2023 18:35:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233437AbjACXf1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Jan 2023 18:35:27 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26C131659C
        for <linux-usb@vger.kernel.org>; Tue,  3 Jan 2023 15:35:26 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id f34so47915433lfv.10
        for <linux-usb@vger.kernel.org>; Tue, 03 Jan 2023 15:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fm8GAHA4wHOZ6aH5j10PuHm5s/aZ6TljNeVHuGhMRwk=;
        b=QTSUiaPpbGJceQRcTqfXW+fhAp/0bRlZ9/jR1kVkMF+m6O0/Jhj2v/E3CtGWtHhJTc
         fGUPGKXKsuxbDkIniisGJjvVwfpYAFdd1BMCkZyGe0WZPVJrV8vIvsSjZpmGrRfIDG4u
         Bq1I9EzxVDuFg3E1KO2iZjZCukYVUzG9h47QzdrWK60Bp/HUy8pxWGC4wC1hZvR4dRaM
         RMV8U/TRiXzw279/8nS29dYjLEBl8azTEBmpwtUWsZl+iYh+tjE8ZPKxST+ymIriz6Gb
         9Ug0ED9JU3UPSPU8IbR7cJ7/mdS3pcAZ2cZturYPUU6RU90dWgUx53Z6NQrAIuvrpJRN
         vF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fm8GAHA4wHOZ6aH5j10PuHm5s/aZ6TljNeVHuGhMRwk=;
        b=TKA6uZUftpw/uohUwMYjxvFISoYbFCVYSrfMX9jFuc0ghRjwnHH0TRtXUDjVRlCCj4
         v3oklMHGWi/KGqyR0sGS+SMIN/GK4/7Scwhi6DhOQb3pryDsqLOmbtQzKGvQV3kLq8ZB
         ub563v3S1Swqcm/k4YtLar1p34EcT50ttB+sEO9O5fxXPoBiL3AfrnnHDQZmzPAWD7b4
         MIDby4xzmC/KhJN7vyw6pXSjN1Mjw2EPHyLxA/D3cPnCGyt1tV6rDuA/gAg4eDMJ/bCA
         mVf6ZKSDGXPFsp8+HZQcYixA6q69v1cPRvqQhjR8CVsFR/OI+UIe1326BwRJLuWCnIwt
         QIQQ==
X-Gm-Message-State: AFqh2kqEGIkc5p5DI+m3PcD1463z3rgMtrwxGWok9Fwf/OUv9a34w4zE
        4PjQsANHHjqcs5TXreioteUb2A==
X-Google-Smtp-Source: AMrXdXvUEMqhAGEePbJwzuMHSc4UTdEcNlNqP3IyR3XvRSGdbrV9sdapS0Q41zVldzt3iZHk82Lqfw==
X-Received: by 2002:a05:6512:220f:b0:4bf:982f:f63b with SMTP id h15-20020a056512220f00b004bf982ff63bmr15779860lfu.21.1672788924538;
        Tue, 03 Jan 2023 15:35:24 -0800 (PST)
Received: from Fecusia.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id b11-20020a056512070b00b004a45edc1de2sm4939801lfs.239.2023.01.03.15.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 15:35:23 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 04 Jan 2023 00:35:18 +0100
Subject: [PATCH 2/7] usb: fotg210: List different variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-gemini-fotg210-usb-v1-2-f2670cb4a492@linaro.org>
References: <20230103-gemini-fotg210-usb-v1-0-f2670cb4a492@linaro.org>
In-Reply-To: <20230103-gemini-fotg210-usb-v1-0-f2670cb4a492@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fabian Vogt <fabian@ritter-vogt.de>,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There are at least two variants of the FOTG: FOTG200 and
FOTG210. Handle them in this driver and let's add
more quirks as we go along.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/fotg210/fotg210-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/fotg210/fotg210-core.c b/drivers/usb/fotg210/fotg210-core.c
index 8a54edf921ac..cef12827e797 100644
--- a/drivers/usb/fotg210/fotg210-core.c
+++ b/drivers/usb/fotg210/fotg210-core.c
@@ -127,7 +127,9 @@ static int fotg210_remove(struct platform_device *pdev)
 
 #ifdef CONFIG_OF
 static const struct of_device_id fotg210_of_match[] = {
+	{ .compatible = "faraday,fotg200" },
 	{ .compatible = "faraday,fotg210" },
+	/* TODO: can we also handle FUSB220? */
 	{},
 };
 MODULE_DEVICE_TABLE(of, fotg210_of_match);

-- 
2.38.1
