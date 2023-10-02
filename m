Return-Path: <linux-usb+bounces-911-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E7A7B501F
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 12:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 0805DB20D7B
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 10:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72EBDF9C3;
	Mon,  2 Oct 2023 10:20:40 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCFEF9EE
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 10:20:37 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FE86101
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 03:20:35 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3214cdb4b27so15285159f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Oct 2023 03:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696242033; x=1696846833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LuTDO2UtRAcpC24/4lfh4kk2F6UtSieH79vQHBHYa/Q=;
        b=K1R7rsJ4sB4Xf1Nu76NeBMcvqTjmiVBX3E7Me21ez064c4WzMUboM+nhL8U0ud3gnc
         QcRnuD54wbDvMZExPsjYx9a5y7h0CWcMoFiv2Yq4VCaPYZSMle9tu5NxWF/gBx8hjTk6
         StzfVzi8jlJB5I2RYknOlAM/LBRTRmig3s9hTroSzEfI14xGB73epzP5EOYyJ73zaFFH
         Pbszt2Zs5qjCIIdw1ogWKJLIKe8wzJwsS/Vc/8x9RB3KrUf4TlWA1hrXPdMDg21hPQzX
         NF4d+GqrvsFh1Dph2Dff2XsaBZZnhTu9tXw4LBjO+tlVTcHo2msx8aApFfII3UUUempM
         rVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696242033; x=1696846833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LuTDO2UtRAcpC24/4lfh4kk2F6UtSieH79vQHBHYa/Q=;
        b=qvCIzUegpZqANFnJ992uBQES3mTDjmbD7a4ifaLxIv77HCXRxWaF0UHs+5e+iNuaID
         CFgjD5nsdd6ZPEmCFGssEsT52BV3YJI9ifI+UJPnWu7iH7phQ27qjp/ZGOi6ReoB9Udq
         GFt5guqrlxa0/CQMf0xUthDJAlR0JoLOGMEK9cV/20gz5/K+AhlfsYACIHnvK/KsH5bQ
         SzFu2kPG9ZABAi9QLMKlYFVwexkZICkA4fUOcB2haOQgSK+LSAGerWLTMIPMUg+M/8o9
         jv9jAES24xN6awrllNjwK2ontTCDyIYKh9iuGYBM2mhGcexvrLDSSyGJzkljlp4pRw8y
         GR6Q==
X-Gm-Message-State: AOJu0YykzgN9gCJHSlh/opWb3EWJoYf6l3ocjRmaaMewBXaifXzSce1G
	2HwRNxm33ggdjVEpXd9kG4ptyA==
X-Google-Smtp-Source: AGHT+IHvdZzboqTNcWMUXKapPwP+mmyT1kY5+yZyTt0GY/CXbUeVkH0AQW/PZQmmx/dEX2/n2pQf4g==
X-Received: by 2002:a5d:460a:0:b0:319:775f:d553 with SMTP id t10-20020a5d460a000000b00319775fd553mr10708012wrq.9.1696242033571;
        Mon, 02 Oct 2023 03:20:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id g18-20020a5d5552000000b003196b1bb528sm27822901wrw.64.2023.10.02.03.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 03:20:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 02 Oct 2023 12:20:23 +0200
Subject: [PATCH v2 3/4] arm64: dts: qcom: sm8550-mtp: add orientation gpio
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231002-topic-sm8550-upstream-type-c-orientation-v2-3-125410d3ff95@linaro.org>
References: <20231002-topic-sm8550-upstream-type-c-orientation-v2-0-125410d3ff95@linaro.org>
In-Reply-To: <20231002-topic-sm8550-upstream-type-c-orientation-v2-0-125410d3ff95@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=699;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=BjxzEAOolZvc3hk0QYwVsWUnWZ+uxvbK+ElgxTWpJAY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlGpls2htFZ7e2V383rkmhJZZlvLxnYXYfAq2ds4CP
 lm1rmLyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZRqZbAAKCRB33NvayMhJ0a2iEA
 DFmamBgsZs6dLATDCTDk9lgHv6pdSl7E3CE0CToy+y/WEnoOTW7WCDbthsE1r9a9vJFGJhypAPdqGE
 9Yg3FZ/4zt5vc69TecXbbCn55fqblAzioJsSb5+HGs7aBivyzb0VShPyWBQzyrboYA4xY49HSwgcJA
 B861/bBvTxY81/dDyeJF5r0nLXASJqWJVFea5qtAiue/fVot5FPsPDZ42BtlQ5h36goNBveNacBKp5
 sG6goFi84uiR8rHkzLx3mEp3UHchCLF7uAAK8SmZjDcsYvMYAKygJz+MTn9K7FsAyYgZzNY4QfiLCe
 TmjbZcJdDEI7V2Fu6LF8XhYleG79Hdlxlv4w2MHJxwO9tsZKnN64NI7C9AJX7rk2Do4t+64y64FGfP
 o8sJZLa0CLwChW0m2KcgoenecPbA3ORLdeX9eu6wgV5FpYgGiUnVdZED6FmmxoR+XOOF7QdAeNocLy
 hf+NEi6+UJTtHOh2C+l1tjXeTzAumdhnk1kykbTDhIwPH7e5O11a+s3/3LcmudgkvW6ntnC4Qk8mNm
 5STIxEwMKpbS/oVSnqyruehDnRFohydGtmfwFnCvP04FIBhA2o4VnG90qmPXPTPbN8HtobGhRqC1zU
 sjgCGzyqOyZCws/0oFQQzqQwx+O4ccEojKA+E82RVOU4JVQNL4Ma4VfuMcYw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Specify orientation GPIO in the PMIC GLINK node.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 5b3488736fbe..9a70875028b7 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -59,6 +59,7 @@ pmic-glink {
 		compatible = "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
 		#address-cells = <1>;
 		#size-cells = <0>;
+		orientation-gpios = <&tlmm 11 GPIO_ACTIVE_HIGH>;
 
 		connector@0 {
 			compatible = "usb-c-connector";

-- 
2.34.1


