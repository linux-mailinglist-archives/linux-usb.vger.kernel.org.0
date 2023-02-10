Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EECE692185
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 16:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232674AbjBJPDK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 10:03:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbjBJPCe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 10:02:34 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46FEA233EB
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 07:02:23 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso6476974wmp.3
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 07:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvOBAwwV60ZD2h7rbngoovNR8grtWCnCAwynEM/2Dd8=;
        b=WZndIevqsL/POGAtdUehX6x2NY8Xlry1rr0CgVySmTtxHR+gyRd4GMXyl/7AS1LBwi
         eKoN50QbpNSKIJTs3U+36EoIZxz+sqYW8HyzbfgM599bTeebbsGbEweSvmoxP9PxFx1W
         XvPO9ZW1XCOy61NiBP0srpGb2AZxILYXzhxUr6HUsLy+2Qe3xwZk0lzP/bGcq4TW2YY4
         WVrSjJwHvv+PZpYXOHivw6wZfJUqTEi0zckAJdc4HGsjv2Zp8M17Dx4o1rj8MZQUSmno
         oZZXKqNLJXCZQoavm2F5QBaW3+/brLWWgYYELkB9M/8se0A8p7uQ82vchdKtx9ii4Oc2
         aLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvOBAwwV60ZD2h7rbngoovNR8grtWCnCAwynEM/2Dd8=;
        b=cN/31SNOrdc8bGW3m+R9kXl6pm3FLme+JwFkfrMsg6zNhp9Y9V0K6gsaOVsIoaqoNo
         FoqhapPfarYSvR9ScB3xTnT2Wnx9gTVrjYTLf/PuRNNbdd7g/fxkgPill5AC0PkeDKwD
         8SyWdDr/Rs3H1FWXCMt56pYlL4l4EAuUp8hwyO7RusgiF+85Gx9iOt1WH/s720e0dFOh
         CE/xY1z1PeCHpi0drbFhTdBdTomfIH94DdhMQp2BT91gPvKUG+Qbw4OyxjUVrJ/DqKvQ
         lNMmourNaR8mtNUkjNBiuE+0D80F6hNlOAzl6xhX0ICPSEF0oIyqhY3nVxF9Fhc0FgcX
         0f4w==
X-Gm-Message-State: AO0yUKWcwTTsGIGIMj4vPD7T2Zm4vc+nAzQHE6Tb7gWtAjcs5UCptZhr
        dPdXI4D1udjBPTY366Ypg6nMTQ==
X-Google-Smtp-Source: AK7set+RY5YCyTtc4HcGm5wOlP+232l9/FS2ziabwpUVjm1HAgiLSuDpxr7UDO9oqkNNCH/IONZbJg==
X-Received: by 2002:a05:600c:4d92:b0:3df:dea7:8e3 with SMTP id v18-20020a05600c4d9200b003dfdea708e3mr14391119wmp.21.1676041341843;
        Fri, 10 Feb 2023 07:02:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id w23-20020a1cf617000000b003db1d9553e7sm8282482wmc.32.2023.02.10.07.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 07:02:21 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 10 Feb 2023 16:02:14 +0100
Subject: [PATCH v2 11/11] arm64: defconfig: add PMIC GLINK modules
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v2-11-71fea256474f@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v2-0-71fea256474f@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v2-0-71fea256474f@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable the PMIC GLINK core, altmode, battery and UCSI
aux drivers as module to enable USB Type-C management
over the PMIC GLINK protocol on modern Qcom platforms.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e7e42bf79a26..1773254de7fb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -287,6 +287,10 @@ CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_NVME=m
 CONFIG_QCOM_COINCELL=m
 CONFIG_QCOM_FASTRPC=m
+CONFIG_BATTERY_QCOM_BATTMGR=m
+CONFIG_QCOM_PMIC_GLINK=m
+CONFIG_TYPEC_UCSI=m
+CONFIG_UCSI_PMIC_GLINK=m
 CONFIG_SRAM=y
 CONFIG_PCI_ENDPOINT_TEST=m
 CONFIG_EEPROM_AT24=m

-- 
2.34.1

