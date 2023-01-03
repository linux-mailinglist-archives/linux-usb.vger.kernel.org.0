Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 747B165CA54
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 00:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238056AbjACXf1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Jan 2023 18:35:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234189AbjACXfZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Jan 2023 18:35:25 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D821659D
        for <linux-usb@vger.kernel.org>; Tue,  3 Jan 2023 15:35:23 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id j17so38489903lfr.3
        for <linux-usb@vger.kernel.org>; Tue, 03 Jan 2023 15:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P8v/Sj/X5KiOx/wkpfi7/cXq7ufsg9Eb2/gL5FeExVU=;
        b=lZo5X85dn9IoD9hH6dzyKS5qQsUttihsDJCwSHm+iUxjf6OAN8lkuRZ78nwrs51zep
         vy8MX3KNwgRz7mWHl5SVjeBIV6YOEwPX6zabIUJyEk7ImkRkgxqIxTZPI5TqpSdNmXRW
         RegrmN2f8aOcs8RDF55NG5FANhvR8dThgOTUiAX5rOtjdMhGBTgCXtYj8UGRZASB1mgA
         Wq7tpdiYyiUeDt4omgWuPBcrUvDQ9hxExY4fxCrY+Y0ICsrr1aLDCEiOf2tz6kEE2KD7
         0bS/oznERD+4/6dhGP3GbAxUW2Idolx3cPN4l35FQXqmSap0lk3o5BS2PJorJQowRshP
         JWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P8v/Sj/X5KiOx/wkpfi7/cXq7ufsg9Eb2/gL5FeExVU=;
        b=cMNtLDfW8j5OyLSUH5RSZYpeKJMCag0+DhK0920jA3+vPeXWyR4D1WJRWUYBTTWGSy
         lsqvl2lSEc2omjlZyd7YoQl9U8yDaI3qV4vmnqIF4KC1iv61Pvm1KhiNkZk/qAfP0R/r
         OUnalEM/Q67Mj9QWS7vnrqwjvqS44c3fIyySjQ/nLYffFNoNA0QnMYSsqpfxEaWgxsaM
         GGOhPQYkpLI0H3NtT9GhuhYqtoMSCqgXvhZRi8Nm38y3UzVq0JYaj3Xnz9l50moE8GYx
         +8uxmJeyOHRuP/ySm+yMJDLDt8Xa32nlNx0d3JwqVMHm9pT34zjI1PbHanfB5qe13/zG
         hL/Q==
X-Gm-Message-State: AFqh2koWopXHCbAJaRaFpHI31t1JccUS4AvdBYjyEhJL+ziuyzYlXoh2
        TGJhXZ8EMPMPLSX2EsrYJjjM/tAIxVti3+EB
X-Google-Smtp-Source: AMrXdXvqf6dS9jJfAmR7RmNVGzv4JmseSjNjYQSyoMbvN/YObznPsnpR68X2Xvd1JLlQtp7SGedzQw==
X-Received: by 2002:a05:6512:2344:b0:4cb:90d:41b1 with SMTP id p4-20020a056512234400b004cb090d41b1mr9099547lfu.56.1672788922157;
        Tue, 03 Jan 2023 15:35:22 -0800 (PST)
Received: from Fecusia.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id b11-20020a056512070b00b004a45edc1de2sm4939801lfs.239.2023.01.03.15.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 15:35:20 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/7] usb: fotg210: Various improvements
Date:   Wed, 04 Jan 2023 00:35:17 +0100
Message-Id: <20230103-gemini-fotg210-usb-v1-0-f2670cb4a492@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALW7tGMC/x2NQQqDMBAAvyJ77kISqan9SulhY9e4B2PZ1VIQ/
 97Y4zAMs4OxChvcmx2UP2KylAr+0sAwUcmM8qoMwYXWeddi5lmK4LisOXiHmyXsrxS72N+i6whq
 mMgYk1IZpjOdyVbWU7yVR/n+b4/ncfwAMEvlbX0AAAA=
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fabian Vogt <fabian@ritter-vogt.de>,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is some gradual improvements to the FOTG210 dual-mode
USB host/gadget driver.

- Create stricter device tree bindings fixing some mistakes.
  We have at least FOTG200 and FOTG210 out there. A third
  variant named FUSB220 is probably related but has a separate
  driver in the vendor code trees.

- Start to break out common code for remapping of memory and
  clock handling to begin with, move this to the core file.

- Check that the block is in the right role before
  proceeding, don't abort registration but print a warning
  if it's not.

- Assing some default speed and the OF node when the UDC
  starts. This is based on the similar pattern in the DW
  controllers.

- Implement a proper VBUS session handler calling down to
  the hardware VBUS control handler in the Gemini variant.
  This makes everything work on my hardware.

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Fabian Vogt <fabian@ritter-vogt.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

---
Linus Walleij (7):
      dt-bindings: usb: Correct and extend FOTG210 schema
      usb: fotg210: List different variants
      usb: fotg210: Acquire memory resource in core
      usb: fotg210: Move clock handling to core
      usb: fotg210: Check role register in core
      usb: fotg210-udc: Assign of_node and speed on start
      usb: fotg210-udc: Implement VBUS session

 .../devicetree/bindings/usb/faraday,fotg210.yaml   |  7 +-
 drivers/usb/fotg210/fotg210-core.c                 | 81 +++++++++++++++++++---
 drivers/usb/fotg210/fotg210-hcd.c                  | 48 ++-----------
 drivers/usb/fotg210/fotg210-hcd.h                  |  1 +
 drivers/usb/fotg210/fotg210-udc.c                  | 68 ++++++++----------
 drivers/usb/fotg210/fotg210-udc.h                  |  2 +-
 drivers/usb/fotg210/fotg210.h                      | 27 ++++++--
 7 files changed, 136 insertions(+), 98 deletions(-)
---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230103-gemini-fotg210-usb-95a76798706a

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>
