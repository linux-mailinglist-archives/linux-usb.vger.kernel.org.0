Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB207073E8
	for <lists+linux-usb@lfdr.de>; Wed, 17 May 2023 23:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjEQVTE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 17:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbjEQVTA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 17:19:00 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A48B17D93
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 14:18:35 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-64388cf3263so928257b3a.3
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 14:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684358289; x=1686950289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XpAvosdd1eXz6xBGZNhl2uL6xAQHXk+cg9rPnks65Ww=;
        b=A8/qm8Uu1A8hzu7WEGSSdRCugGYhdHhkr9HpMFBbuoDod8Y+mPSfuDNYU6vvbeWz9A
         eVkWFtprc7WxQCXBREnaC0qPUP7qwEY6+hRVNGMk8SJa5uyQj5bZD2d0XEOcqyypCo21
         EyxA5YJ/KN0Lk81JJp+i1e/UOjOhhIrYS/Xckvsv3Q0PvS8OJa5Pmddo1aeDPd2L11aA
         CCa5by/kUJzZZTDXSbaWRRzKHqXlJWFKJZk7eZkutF6SW6KN8sT+U7HM5q1fwujDgVpf
         +Zzz9VbIeJhJnla9Gt7dQb1cr7IQlGltD6asn1Js0ZL4u9qj4bQch4gEMXccKezPJiPE
         K3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684358289; x=1686950289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpAvosdd1eXz6xBGZNhl2uL6xAQHXk+cg9rPnks65Ww=;
        b=cV0esf0B2iA0CyTsUFy/sUTpHI3fESuPHvLyWxTSUmMHaekWP4nQylX1m4bZCe2vr9
         B8cuO1N0DeDVww4Y6WiBuD87bmON2qrsvdjxamdMn7HDJOPQnIUzIL/ttA9bR7A/TjVX
         YqEUmmAV4ZnX2Vpq8Dg+I/00o6ylrs7cCevtGLil78cj+J/Q/ygqU6/2dxQUGPbrb00h
         hLzkh6/iRpxCUd0ct0JjbdLETqtKUhDhqc6GpZDTrPcXLot3odlQlQ46kf2gCQ68fmB/
         TwQD/z4xfLhgqwQDnXtdaOKfbSr/AdpcZxADcfTI9ofoJ5HT2qsnysuW2keWzuCXso9X
         kbHw==
X-Gm-Message-State: AC+VfDznLc76YSmxQ5CcK8fb+2+ycz+avm520/ABNZf4zIUFF4YfREcN
        GWOJFiz6oTFOQrFkuB2B0AJRGw==
X-Google-Smtp-Source: ACHHUZ4HuP1vid4GoKR3tu25xffmcTE3jioteGTBdN1SzeMexxdb+WNA0yll9epS1r1c8XfrLhoq7w==
X-Received: by 2002:a05:6a00:198b:b0:624:2e60:f21e with SMTP id d11-20020a056a00198b00b006242e60f21emr1277364pfl.29.1684358288668;
        Wed, 17 May 2023 14:18:08 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:6bed:7a51:340a:a439:1b87])
        by smtp.gmail.com with ESMTPSA id n18-20020aa79052000000b0064cb6206463sm4359210pfo.85.2023.05.17.14.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 14:18:08 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
        quic_schowdhu@quicinc.com, gregkh@linuxfoundation.org
Subject: [PATCH v6 0/6] Add Qualcomm SM6115 / SM4250 EUD dt-bindings & driver support
Date:   Thu, 18 May 2023 02:47:50 +0530
Message-Id: <20230517211756.2483552-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Changes since v5:
----------------
- v5 can be viewed here: https://lore.kernel.org/linux-arm-msm/20230516213308.2432018-1-bhupesh.sharma@linaro.org/
- Addressed Mani's comment and added Fixes tag for [PATCH 1/6].
  Also collected his Ack for this patch.
- Fixed [PATCH 4/6] as per Greg's comments and added a separate patch
  for identation issues -> [PATCH 3/6].

Changes since v4:
----------------
- v4 can be viewed here: https://lore.kernel.org/linux-arm-msm/20230505064039.1630025-1-bhupesh.sharma@linaro.org/
- Addressed Konrad's review comments regarding EUD driver code.
- Also collected his R-B for [PATCH 4/5 and 5/5].
- Fixed the dt-bindings as per Krzysztof's comments.

Changes since v3:
----------------
- v3 can be viewed here: https://www.spinics.net/lists/linux-arm-msm/msg137025.html 
- Addressed Konrad's review comments regarding mainly the driver code.
  Also fixed the .dtsi as per his comments.
- Also collected his R-B for [PATCH 1/5].

Changes since v2:
----------------
- v2 can be viewed here: https://www.spinics.net/lists/linux-arm-msm/msg137025.html 
- Addressed Bjorn and Krzysztof's comments.
- Added [PATCH 1/5] which fixes the 'qcom_eud' sysfs path. 
- Added [PATCH 5/5] to enable EUD for Qualcomm QRB4210-RB2 boards.

Changes since v1:
----------------
- v1 can be viewed here: https://lore.kernel.org/linux-arm-msm/20221231130743.3285664-1-bhupesh.sharma@linaro.org
- Added Krzysztof in Cc list.
- Fixed the following issue reported by kernel test bot:
  >> ERROR: modpost: "qcom_scm_io_writel" [drivers/usb/misc/qcom_eud.ko] undefined!

This series adds the dt-binding and driver support for SM6115 / SM4250
EUD (Embedded USB Debugger) block available on Qualcomm SoCs.

It also enables the same for QRB4210-RB2 boards by default (the user
still needs to enable the same via sysfs).

The EUD is a mini-USB hub implemented on chip to support the USB-based debug
and trace capabilities.

EUD driver listens to events like USB attach or detach and then
informs the USB about these events via ROLE-SWITCH.

Bhupesh Sharma (6):
  usb: misc: eud: Fix eud sysfs path (use 'qcom_eud')
  dt-bindings: soc: qcom: eud: Add SM6115 / SM4250 support
  usb: misc: eud: Fix indentation issues
  usb: misc: eud: Add driver support for SM6115 / SM4250
  arm64: dts: qcom: sm6115: Add EUD dt node and dwc3 connector
  arm64: dts: qcom: qrb4210-rb2: Enable EUD debug peripheral

 Documentation/ABI/testing/sysfs-driver-eud    |  2 +-
 .../bindings/soc/qcom/qcom,eud.yaml           | 42 ++++++++++-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts      | 27 +++++++-
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 50 ++++++++++++++
 drivers/usb/misc/Kconfig                      |  2 +-
 drivers/usb/misc/qcom_eud.c                   | 69 +++++++++++++++++--
 6 files changed, 179 insertions(+), 13 deletions(-)

-- 
2.38.1

