Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 090D0472298
	for <lists+linux-usb@lfdr.de>; Mon, 13 Dec 2021 09:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233062AbhLMI1d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Dec 2021 03:27:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231698AbhLMI1T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Dec 2021 03:27:19 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09838C061751
        for <linux-usb@vger.kernel.org>; Mon, 13 Dec 2021 00:27:18 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id v1so49794332edx.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Dec 2021 00:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oedXg2lxmGvWLjE8gS+GIHwgIjgA4Ou1mgFQP0pqkc4=;
        b=XjxPGaI3AvVgGOYiAgXRlnyAJXWzgvlbPKjDzJim5hV0mBDX+ZAS14uZZscf0UP2Uy
         M1YBbgcg1lI8wgKZsZwbpQQvPpspIpMzJyD3s5usV47RgEkyONh8x3MWBmP2XZbHXep2
         rgT79mjWW1IdmAgKx9c9aQy8swbcZj8rS6+LE2I+2Vj2m4GvOiRG63Z5dHJPVg47awEz
         MbQy8WGQDinSk3CWltw6YwyQCYFJ226oterGrPPBfdlGTNK59VOOSPJj1hWmPBFfCM4J
         8Ba4pX2gXHa0FVcMe23nG44PhgDcix93UCGeNR7DTe/Rq/tYjWMMi+teiAeKYGNz74Gy
         RG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oedXg2lxmGvWLjE8gS+GIHwgIjgA4Ou1mgFQP0pqkc4=;
        b=4qsX/IP3VvN5rQJ0ALCPqDpxgunK8FkhsSPRwjMURPwAzMS+PYaBHaUJggQGw44ic7
         0FGavnf9EmPBa42s2rR8lTuTU5qz8JI1ZrUlHBnwkQJ134PxAz89gGp5B0T3LE4ozNBk
         96WVvIVhCCuuSNhRaz/Qxtq274i0QQUuYQschnr0rXJnUGPwaiqDiwzv9qZsFnzUfNsg
         dhXQSdylRPIVDFzm7BMXG80X/htFJ42T7CPt+MSQvfEkFfWsElpC+XTxdA7O7kwP8hqh
         LNNX4Zfpq38kkpMaorPCd6B0V1T1EGBLg8suIoAJjqXeOaHSmAfsfGyluzOpMjY4K0t2
         vVCA==
X-Gm-Message-State: AOAM532ArwIzcX7tk+MpauMBKmwx9MPGmOudu9LR3IzSeVTdWZNP8VYP
        WgjhYHF4ng3OpGrtcMUnwkaExw==
X-Google-Smtp-Source: ABdhPJyDFbDfxyri6g9cB3e6COym7Bqg0NSm5p0P65g+Yj35yXc+G1fpioiZga2hphDfON6gcI2hKw==
X-Received: by 2002:a17:906:eda3:: with SMTP id sa3mr43271332ejb.51.1639384036677;
        Mon, 13 Dec 2021 00:27:16 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id b11sm6062432ede.62.2021.12.13.00.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 00:27:16 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] dt-bindings: usb: qcom,dwc3: Add SM6350 compatible
Date:   Mon, 13 Dec 2021 09:26:07 +0100
Message-Id: <20211213082614.22651-7-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213082614.22651-1-luca.weiss@fairphone.com>
References: <20211213082614.22651-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add devicetree compatible for dwc3 on SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Acked-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 2bdaba023c01..fb79ea518696 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -23,6 +23,7 @@ properties:
           - qcom,sdx55-dwc3
           - qcom,sm4250-dwc3
           - qcom,sm6115-dwc3
+          - qcom,sm6350-dwc3
           - qcom,sm8150-dwc3
           - qcom,sm8250-dwc3
           - qcom,sm8350-dwc3
-- 
2.34.1

