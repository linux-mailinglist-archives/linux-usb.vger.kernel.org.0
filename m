Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E3BE6993FF
	for <lists+linux-usb@lfdr.de>; Thu, 16 Feb 2023 13:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjBPMMe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Feb 2023 07:12:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbjBPMMd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Feb 2023 07:12:33 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3309055E77
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 04:12:28 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id w11so2467745lfu.11
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 04:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVCq6lHS/CHxq2o92t02WFbDs1x/4MriZ2pVh/ml078=;
        b=GT0zI11nQsYbo+UexU1rb28lnW4Qp6QQkHmHkdl32vfmW2ETzyl589vAKn/Z8w5Kjt
         zx5NSNSwudtqv1Cbjz7a0CmxChEc97RjeBTQMVSmdgS9LeqUFtSKyW2wq7Coce16O6MA
         P3ZXwIs0iq0cznD1uUnSV8hwTJCVBtiYgY33eiSu4n6MZjBvyv2ayMvIEG+9GcyqQnD6
         JPj7i5b9eUjAGlX6BIeiKf0M3W/AZaI8cp9bBuZ7hJA0KyOTABeXAHwR8Pc1t7MPR7l1
         2+mkthVO5dg+fPFBF+izuav0q5ABDmLmxCIhwVcMuxOD4gsyggsasJOp4QpawJaLKXtm
         IvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVCq6lHS/CHxq2o92t02WFbDs1x/4MriZ2pVh/ml078=;
        b=wl5ViAHTzN0k3E9iYXbmLgzwHljLNArT5+FEz01IWWtrtxDYFkihv9uLfmBkFd5GmR
         96zsuml+7qDGB7K6c8cYWsKmM61H+pEsPKz3dfqAuh68FtM8PNlgqUoK5FjcpDj4ug2u
         qIb997lyoIEd7J0R7k/8mB39Kv7Q+FkUQrfUS+YiNNoSjhcDbScjNFbREfsO8qNaNo0s
         Mm3+IlKQlBrs6P2nXyfotEHiDiWCpT909OWsc8usIHfN+FAvt9ZEP1lqkIh2U0fT/W4t
         y8FAGNdlqi0y8/rW9zoq724MCpDi0EJwtofmLK7YnEC+mTI83lc8I9hj2RXKJKI9GPI4
         FcGA==
X-Gm-Message-State: AO0yUKXfC8KTWyteEMtCtMgdt767yAeynJA5eDfjEetwURVbRM/gHSBl
        uuMs3OQHChKYuYqfbi4SM2KuyA==
X-Google-Smtp-Source: AK7set9gNvY29CAFoRTQKz85HdNGTa/94AB2XUkp7q/2z4EC8JpowsmCRlUP+fXwyTE7B5YnD9vjcQ==
X-Received: by 2002:a05:6512:1156:b0:4db:787:e43b with SMTP id m22-20020a056512115600b004db0787e43bmr810143lfg.8.1676549546330;
        Thu, 16 Feb 2023 04:12:26 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id l2-20020ac24302000000b004dc4b00a1f3sm278509lfh.253.2023.02.16.04.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:12:26 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Gene Chen <gene_chen@richtek.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wei Xu <xuwei5@hisilicon.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: hisilicon: hikey960: Use generic node name for rt1711h
Date:   Thu, 16 Feb 2023 13:12:11 +0100
Message-Id: <20230216121211.3964433-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216121211.3964433-1-konrad.dybcio@linaro.org>
References: <20230216121211.3964433-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Align the name with what schema expects.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index 3f13a960f34e..98a87ba4d70f 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -527,7 +527,7 @@ &i2c0 {
 &i2c1 {
 	status = "okay";
 
-	rt1711h: rt1711h@4e {
+	rt1711h: typec-portc@4e {
 		compatible = "richtek,rt1711h";
 		reg = <0x4e>;
 		status = "okay";
-- 
2.39.1

