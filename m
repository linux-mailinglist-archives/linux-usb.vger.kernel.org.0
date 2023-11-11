Return-Path: <linux-usb+bounces-2796-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9502F7E8B25
	for <lists+linux-usb@lfdr.de>; Sat, 11 Nov 2023 15:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5325E1F20F8F
	for <lists+linux-usb@lfdr.de>; Sat, 11 Nov 2023 14:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7CD156CD;
	Sat, 11 Nov 2023 14:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0qdyuO/"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C733614F77
	for <linux-usb@vger.kernel.org>; Sat, 11 Nov 2023 14:20:00 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DCC73AA6
	for <linux-usb@vger.kernel.org>; Sat, 11 Nov 2023 06:19:59 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-53e2308198eso4645829a12.1
        for <linux-usb@vger.kernel.org>; Sat, 11 Nov 2023 06:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699712397; x=1700317197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ptbiafykJ7pRIMqCQZ06p889hMKKC590ILuJm+wGBD4=;
        b=B0qdyuO/jUCpcDtPvNLuwdV38f5yqma60rauBCnaq2ysK7eOpMku3EGkNSnUbzTFfM
         37MKFNqPHx7yzdet44hHrdMaSuoY08KOzuaZnaZSIb8eUS56dL8vvEpc7lk2Bx3dRC6a
         prt4r+VI2V7hs3HgMgbNKX+NGB8+HViayYM+S/QARLnxwh8KKe6fpYGmxqXJnq3uNWS9
         ZV33sFTOJY2N+rcXN5ly2Ts4H1or0+JwkLDcaaOFlKyWy6ue+LDqD/dbuxHgj/XwLZEP
         xVN+dLKXFecjODi+PyRwPRcmIYZSvN7tPXP3Bg1dPg/TqF3NRX4wnAyVktE7KAexPPEI
         NuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699712397; x=1700317197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptbiafykJ7pRIMqCQZ06p889hMKKC590ILuJm+wGBD4=;
        b=AhfULePbHZIXRuhHw1sz3XG/tBnkZMYqWFviCUaB+6DvcElZuVnHBbrisurEz/HrLL
         uvrsaMzmy1DQmL9drFn4kEZw39QgJkrYfdztoKfIJmcSrtnSiuVgtqe9iQOaSvG8AzEa
         LMBu27QKcXAC9IsHnAh09r9G2QHIav0gWd+GN5vd87BS3IDq5mVSQfzVnu8RPyWAEJl6
         vi+80CVRa1I3mU7uHHwZ0KMNE3kB2pMe89Yy3KAQej7ZCaugthOGOgF4R6v81nW8WBwn
         hGyt1b43+qNx1+pbIHd9Dsd6p107+tl9KSc94bgxspxmNk4aWGckax1bMZY94aOubq+A
         RAQQ==
X-Gm-Message-State: AOJu0YwaeqQ8FOPNti8Ufg9WjftlBCNq7VlBstwf5EMeSf6NTeQSVnx5
	NKAQC+fKY0gx3S979kzzqJwquQ==
X-Google-Smtp-Source: AGHT+IF6WuaSFh+2WoYZFrNj5cszOB/hqZsoJg0oXGWaqi+IL9O7EVOR6XOKlu/R5PzGbWOpD3GPlQ==
X-Received: by 2002:aa7:dd56:0:b0:53e:7781:2279 with SMTP id o22-20020aa7dd56000000b0053e77812279mr1490668edw.36.1699712397566;
        Sat, 11 Nov 2023 06:19:57 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id dm20-20020a05640222d400b00537666d307csm1035408edb.32.2023.11.11.06.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 06:19:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: usb: qcom,dwc3: adjust number of interrupts on SM6125
Date: Sat, 11 Nov 2023 15:19:53 +0100
Message-Id: <20231111141953.51841-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm SM6125 DWC3 USB controller comes with two interrupts (verified
with downstream/vendor code of Trinket DTSI from Xiaomi Laurel device).
Move the qcom,sm6125-dwc3 to appropriate place in allOf:if:then blocks
constraining interrupts.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 64043b91ffb9..3f41362b2a91 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -375,7 +375,6 @@ allOf:
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
               - qcom,sm4250-dwc3
-              - qcom,sm6125-dwc3
               - qcom,sm6350-dwc3
               - qcom,sm8150-dwc3
               - qcom,sm8250-dwc3
@@ -408,6 +407,7 @@ allOf:
               - qcom,msm8996-dwc3
               - qcom,msm8998-dwc3
               - qcom,sm6115-dwc3
+              - qcom,sm6125-dwc3
     then:
       properties:
         interrupts:
-- 
2.34.1


