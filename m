Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 296D36F4048
	for <lists+linux-usb@lfdr.de>; Tue,  2 May 2023 11:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233526AbjEBJkM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 May 2023 05:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233151AbjEBJkL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 May 2023 05:40:11 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6507F4C13
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 02:40:10 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-63b620188aeso4109332b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 02 May 2023 02:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683020410; x=1685612410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p0EM1KfEkWdmbenmmKTmndNQvUH4fhO8eMeYu5/GCBA=;
        b=CcW+T0V+YCJiGfqC3N51BuI7OGprNz3ll0jCqRG9PepX1Hnd8e9CuYcbWSQI13YIeK
         pYD+c/mRcFLh4xHW2eh4cmzJF3JbGi35yMohxKhNkcQh9baTgxwn8abtunikcJgHWzdA
         NzzJFr/aSW+JpJl49GG/yD/bSc/l9sHxoQ/b/rxjPf8rg7GYTeeOXZhNzTH1199DrzKN
         IeskilqAblrKSpUdFgDt7poc3spkR5qpIexKlfw646vrFRHHBL0k1adWYmaVEmtRcO4e
         GZe0cT6GPs2cNa+9CjaWzktTyANRcxVEqUw21whJL62WNCfZVjd3Ei+H8sAroW1e48ej
         spLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683020410; x=1685612410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0EM1KfEkWdmbenmmKTmndNQvUH4fhO8eMeYu5/GCBA=;
        b=jhAtGjjBX1kJ7LizAYtudwsnW1xZKdq5/LV2CzBcZgSPuzhZOPMqoB/wNBulnJ3QRA
         ZXrCXfNHZOheAc8L+laJvE8vpRslxwNBUzbKtlJ6/pap5zCNCJc2cfvwC9R9rNTGNtZc
         BRYpAgBnqj985i/QV+QiwwNsYgi0xVHIy3hq8kXBkXisMmCLuJfAR6MK3mm00s9rZwXf
         KIWGHz9hi2l0s3j7NvaCvuVzpAFb82xDtm0k0k1uGTQ53YIS/enX7+0+0BpfS/oZ7ect
         wumMhjKTCprta3NJ1aGrBatY6kn8pbYdBYTtFrrZ8JUzHEdo1Kv06biQKHlISw7e3LKr
         RLfA==
X-Gm-Message-State: AC+VfDwng5A3tkiXWqJYqBAhZaq2ONoSrWQlQdOTsZJYwFoxjkLGn6u0
        wlWOT3ddNj12RZR0GCk9j9kQmw==
X-Google-Smtp-Source: ACHHUZ5VXg2nqQCwv/AlCxkqiRBLo6bI1j9hoX7TYxNQaIxXF69693k1ls6Q+JfRbKR+GkOLO+gk8w==
X-Received: by 2002:a05:6a20:158c:b0:f2:e399:b114 with SMTP id h12-20020a056a20158c00b000f2e399b114mr20821046pzj.1.1683020409833;
        Tue, 02 May 2023 02:40:09 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3b:58fa:39f6:37e1:bb9a:a094])
        by smtp.gmail.com with ESMTPSA id r78-20020a632b51000000b00520f316ebe3sm18201585pgr.62.2023.05.02.02.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 02:40:09 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v2 0/2] Qualcomm EUD: Some cleanups
Date:   Tue,  2 May 2023 15:09:57 +0530
Message-Id: <20230502093959.1258889-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Changes since v1:
----------------
- v1 can be seen here: https://lore.kernel.org/linux-arm-msm/20230104091922.3959602-2-bhupesh.sharma@linaro.org/
- Changed the commit log for [PATCH 2/2] as per Rob's observation.

This patchset targets some cleanups for the EUD dt nodes present
in sc7280.dtsi and also adds a missing space in the compatible string
in the example used in eud dt-binding document.

Bhupesh Sharma (2):
  arm64: dts: qcom: sc7280: Fix EUD dt node syntax
  dt-bindings: soc: qcom: eud: Fix compatible string in the example

 .../bindings/soc/qcom/qcom,eud.yaml           |  4 ++-
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 36 +++++++++----------
 2 files changed, 21 insertions(+), 19 deletions(-)

-- 
2.38.1

