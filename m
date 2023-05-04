Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55E0E6F6774
	for <lists+linux-usb@lfdr.de>; Thu,  4 May 2023 10:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbjEDIab (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 May 2023 04:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjEDIaG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 May 2023 04:30:06 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D4D26A6F
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 01:27:15 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6434e65d808so292945b3a.3
        for <linux-usb@vger.kernel.org>; Thu, 04 May 2023 01:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683188835; x=1685780835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmaLfLchQ4rAHy5t1YFYbHdQn/tu5s+YbDZEOcELexg=;
        b=O7IuTY7Xl9h8/AUCgL62GBsuZuAifKLapHZk0H3kSWhURmopInl7dQRbIUQFLLaGGT
         +upT51N7E6oc3pYoumUAmRx2jlrBlQSnbgfmsqLJM83Vmg/L7IJlbrR4E0WZg4VE4PcY
         d7QMdIOjxqCjuapOqfvNXiu4eq9MKyhPlrwhVCIfn8MxcGdVCrwF1XyoEJZp04QbFp6E
         xJ3sPrcn+oafKDbam5T1VEdVVcE6iajwK8nGZNrpR3TDieatgML4eMd7uzz8NMzDo/Ae
         UPsYdVb5nLKBgM4IH/i+wRibcO1PANAHmBE52xxe8qunM4jz0yvqOa75zDcG5pzzQTRR
         pGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683188835; x=1685780835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmaLfLchQ4rAHy5t1YFYbHdQn/tu5s+YbDZEOcELexg=;
        b=e5ihEPwjyqAk76DTFmYOWefAToEgA3RbS4UKpwJywUU88ntf2qIXHW5Xx9bHluttSj
         meV+7F72mCm7/sh/hj/ZWXrot537zHMCaYfr8v/gp5U0lMuQYpjSqXqhAfWCYWtAfzSp
         m3k/Gh5z272EWqVtEl32g2Yzhp/E3X6x7W9VVjZwgTYOgMUpx2UbShDGbRvrs9glEZ39
         qqWE5MLcw0BuECrlKtQKmKwbdq5WhoFwmQBQkGSDNNWuk3Yz3nvnzwC1yoCp66o6Lz4A
         Ft7WYcQqJkp5FKk02MCysXREwdlx66L0yI/89R2How71RqUlaFeutKlmQLhaEmlNy1Vx
         kvXA==
X-Gm-Message-State: AC+VfDyzLl9q35MmQfh5zCw3VWX24dg6Sv+NXVYQrOlIukdPGmlk6Axe
        /fxhcvTt5NTymuwIidlnRwPI7w==
X-Google-Smtp-Source: ACHHUZ435F//tL0eS3YIpLg+RkgxRAGF5zZHKtthn+XkXKTItns7c2uRorHCLxqq+IpPQBJjnslLxA==
X-Received: by 2002:a05:6a00:88b:b0:63d:3a18:49ed with SMTP id q11-20020a056a00088b00b0063d3a1849edmr1603633pfj.15.1683188834701;
        Thu, 04 May 2023 01:27:14 -0700 (PDT)
Received: from localhost.localdomain ([223.233.65.180])
        by smtp.gmail.com with ESMTPSA id s1-20020a056a00178100b00625d84a0194sm24913973pfg.107.2023.05.04.01.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 01:27:14 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        krzysztof.kozlowski@linaro.org
Subject: [PATCH v3 1/5] usb: misc: eud: Fix eud sysfs path (use 'qcom_eud')
Date:   Thu,  4 May 2023 13:56:40 +0530
Message-Id: <20230504082644.1461582-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230504082644.1461582-1-bhupesh.sharma@linaro.org>
References: <20230504082644.1461582-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The eud sysfs enablement path is currently mentioned in the
Documentation as:
  /sys/bus/platform/drivers/eud/.../enable

Instead it should be:
  /sys/bus/platform/drivers/qcom_eud/.../enable

Fix the same.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/ABI/testing/sysfs-driver-eud | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
index 83f3872182a4..2bab0db2d2f0 100644
--- a/Documentation/ABI/testing/sysfs-driver-eud
+++ b/Documentation/ABI/testing/sysfs-driver-eud
@@ -1,4 +1,4 @@
-What:		/sys/bus/platform/drivers/eud/.../enable
+What:		/sys/bus/platform/drivers/qcom_eud/.../enable
 Date:           February 2022
 Contact:        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
 Description:
-- 
2.38.1

