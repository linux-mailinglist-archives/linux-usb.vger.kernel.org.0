Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C368770245
	for <lists+linux-usb@lfdr.de>; Fri,  4 Aug 2023 15:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbjHDNu2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Aug 2023 09:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbjHDNuY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Aug 2023 09:50:24 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 879CA195
        for <linux-usb@vger.kernel.org>; Fri,  4 Aug 2023 06:50:22 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-307d58b3efbso1804205f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Aug 2023 06:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691157021; x=1691761821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Tu3tdlF/aAxTGoYq/qN0EAxQ8wdVfdldt4icc67yX0=;
        b=UyACFL8IjwAoSaTzEG9qPM43FDhJIY8bul/FU86VLecfYVtC2cXhJRHKRGLTL2NSo7
         7DVVdbtbZjbQGRT08srQxQpTrC1ZeYg9hmyeby/VlEJpynqTu+195SJGnKpNZDLL4B5m
         zHbmIH2Geb5MafmhVfMLzmctdP60msPvsjbMlx4yVyLXJcSsgHHGCiUJ0IGpa3IGHZve
         C9q1U1kf/MNmoAtazd3MQ0BWFB8AJQlvq2Nxsaioxd4HHEEkMLgjCsE/+IWIg66DH1s8
         momCp45X1AUfZuAFQEENJgUm/iahLgR19ixidA+Pdh0UJ9F8XephViAuhCkrbvEiclIV
         tp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691157021; x=1691761821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Tu3tdlF/aAxTGoYq/qN0EAxQ8wdVfdldt4icc67yX0=;
        b=F/Q/oUiVqJ/X/4LB9pV6rxbEYoQMtGQrCLmc8KhSJdRvqCVHBcLdv0NaDb+xDrk7++
         kxpPE61FO9rj9GtxIJCiUs0afdL1be97sxHTZu6su63dI6tGU3/fAx/7fTYSXttQQs1b
         6NI01lMNRtJuVpqmWGq7TSnyqrWU2g8OQZ9nxTR7TE+OkT2FWx3Twn+pZBDIkFyIonh4
         hCIjVO7do8gN3LrIsBpyB2npJKi2iAPMXzpJuaIShbou6Q8F1MtMhcKHxVXtaxmiKpqF
         TUDFZ1VI4RatshZbsLUFySIb+TVYyfH3dA5XdvnqMjoEz4KyrePiLFv77EAaIEjUa8Zr
         /i2g==
X-Gm-Message-State: AOJu0Yy3GwzU3mwjIdWWvVedby6wyE5S8yZcGZiIBUHvpaYuxYxtPLRs
        ySefxfkyzimoVhzkL3mTnJ3uHQ==
X-Google-Smtp-Source: AGHT+IHF5R484MMjp3EGi3ZFAji+XidBlqg5GylB8vJOGFX00rXYq+BnoQupjIaHsRakpYPKN8SBtQ==
X-Received: by 2002:a5d:4144:0:b0:315:a1f9:8667 with SMTP id c4-20020a5d4144000000b00315a1f98667mr1497099wrq.23.1691157021056;
        Fri, 04 Aug 2023 06:50:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id u25-20020a7bcb19000000b003fe1cac37d8sm6894793wmj.11.2023.08.04.06.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 06:50:20 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 04 Aug 2023 15:50:09 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: sm8550-mtp: add orientation gpio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230804-topic-sm8550-upstream-type-c-orientation-v1-3-36dd3edec7bf@linaro.org>
References: <20230804-topic-sm8550-upstream-type-c-orientation-v1-0-36dd3edec7bf@linaro.org>
In-Reply-To: <20230804-topic-sm8550-upstream-type-c-orientation-v1-0-36dd3edec7bf@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=699;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8sOCuRERwUcxQw8tCkw2c2ZONty+Zkv1ZtdLhzF/Vbs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkzQIYzDAKZU1oHG/gRLDaqzKk4eITl/Gy6z7Re7PZ
 MUmBQlKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZM0CGAAKCRB33NvayMhJ0Y0xD/
 wLpus4Fixy+gfvlLXIiWrZL70mpal3ErmjZ4h6vbinmuA5P01TT1SxvqengxyVtpC4ELcI1i/6UU9X
 Wgy2wGMDwWYrsKVyJqCzu79nktfdgPVdyhA2SAKkk8g/mCbZEjvoJBep7dICA8WOEUu1oSGpS7YtQT
 /6BABwCIUqneFnBRCPe+3vqKiuyifCPNQK5JDPEWiygFDrvRbgGPRg7HUG5jcrLpz/iP6BeXInl1Ij
 hK9PQQsXx46e0hXQSmPZwisIn5AFo+zK0BzjAK27HsF7BmOem5qtSsA0pKzwleOqcbVOphgktZAjST
 KAur1Qz+kPBClxpAcEoSXtIjeAvvaaZOQd8ZTnPq6mlKjng9Ng+Ln2HwxCB3DvQV1z4navicYQUXc+
 ox2oipGv1bm+Z8syGwSQ9olHjCB7rgFxRxY/Yr+w2jrt1RsXDc17M85R885v3ZTiaiirSUtMM63JXH
 zUw057z/fcA7ck8hGAOpXPMot/2SJUQOBTJdS6cQ7ORGwTlROMDwRr0OkNV2BTaNPVZW3ePnoAbY+4
 r99nZEbua1ogJosh618d2VfbuFV/lvdwZMZB3LSqBxXM7lUoGe/P+crPcFgviAO+vln75kJKwYsBEI
 wv+BFaaYps51NfusLLuY3VUpijVTqg3ajkZUhPYNjFrKtGnoXFGVEBygKVyw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Specify orientation GPIO in the PMIC GLINK node.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 39a43db26ea1..4fef4eef6575 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -58,6 +58,7 @@ pmic-glink {
 		compatible = "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
 		#address-cells = <1>;
 		#size-cells = <0>;
+		orientation-gpios = <&tlmm 11 GPIO_ACTIVE_HIGH>;
 
 		connector@0 {
 			compatible = "usb-c-connector";

-- 
2.34.1

