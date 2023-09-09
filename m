Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1BEC799B27
	for <lists+linux-usb@lfdr.de>; Sat,  9 Sep 2023 22:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239702AbjIIUbB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Sep 2023 16:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239398AbjIIUbA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Sep 2023 16:31:00 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8FC19F;
        Sat,  9 Sep 2023 13:30:56 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5733d11894dso627151eaf.0;
        Sat, 09 Sep 2023 13:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694291455; x=1694896255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1l/MFkk2nisyvIIR1hIhVrSYLlCvsOuM+mCe0mJqGOk=;
        b=fHgaVsGZ9+cUypPupI9CIqY4UcAISvNwTA1eDbn4zk7mhbUSL+q9ZzzfntsR2i6MIn
         Q813XaAwQJuUcO5RbGyg/rTNmkavJ+wI/MVUOoTfc7YJ1R8zlaaryrqnUTVL8pWilWE3
         SEejknrzFs7jnn/e93bAOcQLqhxhJJenxiL/Lg5VLNNt4dCrfgZejn4e+34PcwdDYcOp
         mEbfnxsPvQc1qdQc8CXl+FphDKzXQt7Tp1ONx56Chc1ifCYQdj0+JmbbyB79NFt5ae6H
         8hYrFrxSL2wcTZqvDlc1RLCLRerR7iqTVk3AINdDYlQMFY62zqAFkh2JxZ6MkoWpoShw
         yqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694291455; x=1694896255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1l/MFkk2nisyvIIR1hIhVrSYLlCvsOuM+mCe0mJqGOk=;
        b=P8g1BigyF1lrRWgVrranj86e6LZ97CSOxNejvYxsURj0wICcF6TNuJezS/e/SF+mdg
         ai8h4ocx6Uoyf7ja/cGEYCsk0xjzNY1MU+07ea9j16UuwVYZaBDBrRY0N5AHCOdgyLY7
         iV78WAQnhn9B8e0cZqgGtwERuZEFBvqg9AerDS3FzQmQkhqz/7qCKRpfIJqSMqWw5iIs
         H7N5D2W6ms+s+CcTBNyFZc2o3XA7nk/FwgufNBxuIvLelUO00wpw/oDiKfWo43iPnucp
         YtxuMlZOxZvaexzx541oPnW6riCyDeIyMZEMWpanhnt0mPSxCYCdMEoYUnzIOeXCoNo1
         FiPQ==
X-Gm-Message-State: AOJu0Yxp4I3tEikd5m18V1D2fhbz0hlb0zZdZk3HLC7U8rUPbEF3Tr2E
        /R6XTm6EEpWhTQ/qe5x+o7c=
X-Google-Smtp-Source: AGHT+IGUz/nvLT50r/rkSKMYKw+D1jGdtUKVkOlEktAuqBd/H5sFIaXHSUuaHtQvhHYyCqct+JJg1w==
X-Received: by 2002:a05:6808:218f:b0:3a1:d457:83b5 with SMTP id be15-20020a056808218f00b003a1d45783b5mr6904548oib.3.1694291455462;
        Sat, 09 Sep 2023 13:30:55 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8ae8:e729:67d1:f8d9])
        by smtp.gmail.com with ESMTPSA id d12-20020a05680813cc00b00396050dca14sm1873509oiw.28.2023.09.09.13.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 13:30:55 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     andersson@kernel.org, linux-usb@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-imx@nxp.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/3] arm64: dts: imx8qxp-mek: Fix gpio-sbu-mux compatible
Date:   Sat,  9 Sep 2023 17:29:56 -0300
Message-Id: <20230909202957.1120153-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230909202957.1120153-1-festevam@gmail.com>
References: <20230909202957.1120153-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

Per gpio-sbu-mux.yaml, the compatible entry is incomplete.

The imx8qxp-mek board uses a CBDTU02043, so complete the gpio-sbu-mux
compatible accordingly.

This fixes the following schema warning:

imx8qxp-mek.dtb: gpio-sbu-mux: compatible:0: 'gpio-sbu-mux' is not one of ['onnn,fsusb43l10x', 'pericom,pi3usb102']
	from schema $id: http://devicetree.org/schemas/usb/gpio-sbu-mux.yaml#
	
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 7924b0969ad8..a06a6491ef20 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -31,7 +31,7 @@ reg_usdhc2_vmmc: usdhc2-vmmc {
 	};
 
 	gpio-sbu-mux {
-		compatible = "gpio-sbu-mux";
+		compatible = "nxp,cbdtu02043","gpio-sbu-mux";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_typec_mux>;
 		select-gpios = <&lsio_gpio5 9 GPIO_ACTIVE_HIGH>;
-- 
2.34.1

