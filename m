Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDCC6774BEB
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 23:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234194AbjHHVAY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 17:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234162AbjHHVAB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 17:00:01 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6803C8C0C
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 09:55:09 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fe55d70973so63261e87.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Aug 2023 09:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691513703; x=1692118503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BGR/FDAz6QwzMVqhMqlOHMf82ldcSZKkfY2QM99zIzc=;
        b=ATjvR7pkq9tD9JmBVswvuI5mNN8ecYp01MHlxnNonWVvBEgbRmL0rQhip9kxYRhKBQ
         AGa95ay1Yy17SnWZUHsdziAxdnmFWq7xa783lrnSHx2eumLZZn3gBb8hYJhowJ00gsYB
         5u6ECiHdAAzYWkby1IBTfyV34MOJ3ZYFPjVzNlXLiFm0R3Oifqv7KnAOHYx2siWn6aPX
         qbEi7JU1a7p6LEuxoSd+o+6AN4+rbyN/ir8TmYZJRZbU1EmXofMLS8ornGk+Ns7QeSFj
         TpMFMsV0vYT2ja5/G3WlODX6KSoLHfCA+O9tzj5Eqv65fMWvWMD80ZHtdG+IkFoawMOo
         Tobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691513703; x=1692118503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BGR/FDAz6QwzMVqhMqlOHMf82ldcSZKkfY2QM99zIzc=;
        b=VVv+RyK44JUihuPyzfgx3LsyPQPN7afcdQmovvJPGWNxBSMtjLetUgtWYd+dUigKij
         EEZ8/sd7U4OZkk53RZ3NmoLDykNQUHq7Zid+1aEv2Ikbp73055iCAb0Du4sB64JipWnt
         PvqxCihl07Qte8vvqyC1qWRrJkxDjfIFlbLb/G5ClGiLMHrnt4YQmkbfbD0h7E5RnoCC
         ji3uBtbsUjMK4mClaP3zeOyN/neSGvdGq9oj8u5CakSnq2VWJJbvZgvVcmV3fRph1dx4
         8QItkGvhBD3fbGbX45D/mn6zoDiZb9x+uguueyF9aRE4iEJ3FXSQGExpPoqKxnkozRKu
         AwEg==
X-Gm-Message-State: AOJu0YxYWE8CtoQpZCMt/PP3AFbCvJphG30PLnw12jLhyR43+5nokqWp
        fhQu7fn4Nzbc6tMdbLpMFWlq40ojs9pVoZrdX0E=
X-Google-Smtp-Source: AGHT+IFzDPeVzQZoYJKpnuTnwP9ABSYbuSXkjD6PnqoZvzUu25vMVnUvTGUH/D3RmOCcWmeDluW3cg==
X-Received: by 2002:adf:f984:0:b0:313:e391:e492 with SMTP id f4-20020adff984000000b00313e391e492mr7187996wrr.17.1691489278679;
        Tue, 08 Aug 2023 03:07:58 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:efd4:f3df:2c50:1776])
        by smtp.googlemail.com with ESMTPSA id e11-20020a5d500b000000b003143c9beeaesm13109420wrt.44.2023.08.08.03.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 03:07:58 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, Da Xue <da@libre.computer>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] usb: misc: onboard_usb_hub: add gl3510 support
Date:   Tue,  8 Aug 2023 12:07:44 +0200
Message-Id: <20230808100746.391365-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patchset adds the bindings and driver support to trigger the reset
pin of the Genesys Logic gl3510 usb hub.

Jerome Brunet (2):
  dt-bindings: usb: add device for Genesys Logic hub gl3510
  usb: misc: onboard_usb_hub: add Genesys Logic gl3510 hub support

 Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 3 ++-
 drivers/usb/misc/onboard_usb_hub.h                        | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.40.1

