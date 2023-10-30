Return-Path: <linux-usb+bounces-2345-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7837DB643
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 10:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B632B20DCC
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 09:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7E1DDB6;
	Mon, 30 Oct 2023 09:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INbjt/C9"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB97CA64
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 09:42:04 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962DAB3
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 02:42:02 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32d80ae19f8so2925750f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 02:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698658921; x=1699263721; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mHCzSs2m/7vvAzZ4U/1F4bROTWnWkwS/Z4dOeVlDxw8=;
        b=INbjt/C9Hu3EBqTPbfkBELrjK1oX9kuKmm5JbfPzbSKBtBTY6s3ThiAYPBDbJn7Inz
         PlcEjezcUD9hOGpXifkcKaebE+ey73y2OJLL8LCXRwjjfTaSfhI+++xoSRCHBuUXy7ND
         42y4Lxhc6GKmeUkpU0R0Yw7z2uFIIxcKDNOpxxps1Tzn+aQxIqbHhUNRTyoq+zU0pMDR
         xjexdzke4NcmouQ6Wm8yAueHoDLHVoUJg3pWW0zaW9uGdhi2synCeKRf3XD9TlK2loit
         HmCULPpJ2TJ2wa+yxRrwM5HQWTNt9yETBzJAIM+oRUXL78QkZUg+s6hBb42y34eXRUbT
         4rTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698658921; x=1699263721;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHCzSs2m/7vvAzZ4U/1F4bROTWnWkwS/Z4dOeVlDxw8=;
        b=oYuP/ll3b3WQpcZF+V4qn/GaKaj2aYyNvKbH4fQrT/9czsj8J5tu4m2Xm2MDVrwCNQ
         2Zvc66R2hKPsQ8b29uJPZdT3fyZ2nvo/r2Ut8oGeyOctwQBVhEgWDnI6AEgSyuILzJsI
         pfo7YwksGehGS0v9ClmWQg9/MJR/rSWzJ9KSAqh16/bjuf1ZED3/s1xStKoFYU7CFBXF
         f3JQSyguoC1JRenPaVl97TD2fsv2T02v8GX1t2pUOVMIBnC0cKoPz3ioNR0O56aTJbIw
         FtUtv0gAJn5TaSdIS4DGrvoKosOPQRRYBlAsgHe6POFbkxcgwZR4w4j2sIjI9qYJ4FlM
         O/4g==
X-Gm-Message-State: AOJu0YyJs01OzdDfKDXZFU4b4SjRGrisBO4uVhj82mmy0v8ZY4aCqo1B
	+QNYjNoScjR4Cu9efF8gzAvnqQ==
X-Google-Smtp-Source: AGHT+IHLgy9Q1AjccPV9eytZ6NH+Dla7RFVhMBMQh5mG7MjRyocjMfF0BY5Tfwgt+/qe0cXXGpHjKQ==
X-Received: by 2002:a5d:6d49:0:b0:32d:e478:9d70 with SMTP id k9-20020a5d6d49000000b0032de4789d70mr7033797wri.14.1698658920952;
        Mon, 30 Oct 2023 02:42:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id k6-20020adff286000000b0031984b370f2sm7825761wro.47.2023.10.30.02.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 02:42:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 30 Oct 2023 10:41:59 +0100
Subject: [PATCH v2] dt-bindings: usb: qcom,dwc3: document the SM8560
 SuperSpeed DWC3 USB controller
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231030-topic-sm8650-upstream-bindings-dwc3-v2-1-60c0824fb835@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGZ6P2UC/42NQQ6CMBBFr0K6dgwtBS0r72FYIJ3CJNKSKaKGc
 Hcr8QAu38/Pe6uIyIRR1NkqGBeKFHwCdchEN7S+RyCbWKhcFTKXFcxhog7ieK7KHB5TnBnbEW7
 kLfk+gn12BVSolTRaOuOcSKaJ0dFrr1ybxAPFOfB7jy7yu/78qvzLv0iQ4KzV+oTGpOflTr7lc
 Azci2bbtg/5Np/U1wAAAA==
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zky0TkPIaRnd/kBELZVgvTZFXaQ9ut5+Gj+VY7VDrlU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlP3pn9T+FLYxLhEGFImi+fii7bJu5r6jkSsKl4ZG5
 q9XMQLyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZT96ZwAKCRB33NvayMhJ0R4cD/
 0SONkZGHDIfhfTCxzKHsbTodzrq1NTDDhHSqiN03KhESjN1C4pxIQqIXgajqTNVEypnob2LyYYGBnm
 vdVbrYsGoDjX7ddCXDSy6AYobWcBEYQrN8kr9TUkQnu28xJpvMGfGLI1ttZFjjw0j429Bd0qOD701q
 QG0GxG7+iBmtLDiajg6JNRRs/sO0vpQRApmAwbmsx4SGdtSjrCLYJn6SaOpkNhOgCZbik11Ycj8AVe
 pdGL3fpjKiiwS6mLgf7teyI6bMzuef93go/rFQIpAonZMXIZDkYDesKvXOHwpHOb8IUfS44110uSyx
 iWnMJOcUwrZJD2ViijcRJYpGaIWmovwhD5xIJLuisJmZHo8/kfRTO72H6qumvanAYc1iN+4u4k9XcT
 6aTouhRTj0crI9hOPsjo+UR7n2uhq2tDN+OZyZNesqEguTtV6auqTQEKKGte2rbnIkiIUpRZbW44tW
 n1V5GMN3SC8Hv/Hg+0vWOk5ZEOCwPbMQwySxi/CGQVf8cj1XK1xBD32mKrgHb/AsI6KUCbqe3Qmbeb
 TS7e7gnbVYAZVPBRq7fXkcgh1sJsr8adin4eAoIRtguDZE9pYNoeZ6gDXCt7HR14ZCh+Z7VmpFudst
 t24JfISVafVlrdrG0zsiL+u2SO0cypGmjDSE2mZVCXBIgcV5zxCnoifsHV3A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the SuperSpeed DWC3 USB controller on the SM8650 Platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
For convenience, a regularly refreshed linux-next based git tree containing
all the SM8650 related work is available at:
https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm8650/upstream/integ
---
Changes in v2:
- Fixed typo in patch subject
- Added missing sm8650 entry in allOf:if:then for clocks and interrupts
- Link to v1: https://lore.kernel.org/r/20231025-topic-sm8650-upstream-bindings-dwc3-v1-1-fdd447e99865@linaro.org
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index e889158ca205..ccce57e4290d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -46,6 +46,7 @@ properties:
           - qcom,sm8350-dwc3
           - qcom,sm8450-dwc3
           - qcom,sm8550-dwc3
+          - qcom,sm8650-dwc3
       - const: qcom,dwc3
 
   reg:
@@ -318,6 +319,7 @@ allOf:
               - qcom,sm8250-dwc3
               - qcom,sm8450-dwc3
               - qcom,sm8550-dwc3
+              - qcom,sm8650-dwc3
     then:
       properties:
         clocks:
@@ -377,6 +379,7 @@ allOf:
               - qcom,sm8350-dwc3
               - qcom,sm8450-dwc3
               - qcom,sm8550-dwc3
+              - qcom,sm8650-dwc3
     then:
       properties:
         interrupts:

---
base-commit: fe1998aa935b44ef873193c0772c43bce74f17dc
change-id: 20231016-topic-sm8650-upstream-bindings-dwc3-6e421941f9ff

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


