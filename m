Return-Path: <linux-usb+bounces-2158-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F4D7D6270
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 09:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F32251F213B3
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 07:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232CF171B7;
	Wed, 25 Oct 2023 07:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sqmNC0bJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C39C168C7
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 07:25:38 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 379DA138
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 00:25:36 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-507b96095abso7945717e87.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 00:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698218734; x=1698823534; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8UZhJQSD0Uc3f3xdHOo042gWQWkDiJjvPAwU+g19bRs=;
        b=sqmNC0bJf4GCWLgJ/1QtejJzsUxiCtfSPDiNNFnSaHEReUpBReRKKghY7qxlHij6FS
         npgvJ3x7fMS4QNy15y4SPOatCQ2aHuhVydptANJ39ArJ2NBsh3DA+QfW1peByqpBa+iC
         +h8unQxL2gHXp0hJZAY9VCKTyHDWLKk13fdhdSncJgWXFW+PxvD2Ang16uz2I4pe288o
         TqHA3cNXyNSBwpbT5WDKk84rtMopZ7Z/MxOyX++43nJOtpQmxJg75ME/nZ9mbOmCM1ZO
         JB5EM2jwjDf7pd2q4po3Bch8JGhlypXti8LtS4xCPazY59bKf/ObZ/Fv/uEiMp/DL5lJ
         c0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698218734; x=1698823534;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8UZhJQSD0Uc3f3xdHOo042gWQWkDiJjvPAwU+g19bRs=;
        b=UpTGoaQVvP1Nw7QEJYPUcbzhbvyAqOJ4TPRaVSApIhv2mUTTYenKzfaOtsX2DUQOhP
         MG0WPiQnUNWjoxVNBRTL0+XM+Fo3DIv2DI4RA2zWvX2LM/H1XUo/Q/Ud0fOi/zNlxoSu
         1kHlZ0PqUjSRzmXexZTkpPBHaoLU6P7UzFhqqjF5izZGpfKBVflTgcl1xG0XMyJxfBEo
         PVcXp8dFDLABdB4FvXlDHASe5SrZqM4Yjb4sGP094rHW7OvQXrsVuK4es9n0Jk66SKdu
         xxg5Yp0M8oysZvxLPWDHyoFnCUYsDYCEFzm6t+1L/EpkM8JOST1Iu2V1zWr+1rXPkXf0
         LG0A==
X-Gm-Message-State: AOJu0YxfVn4M9iEyj5af0CAnKry3H2054W+hKCJzlo724TULRI4yt7cH
	ewig2pKBltbVBzTQNl15B57LlQ==
X-Google-Smtp-Source: AGHT+IEv00dbc7BJHQBIE96AgaQVZe4kY9vbKpsd0Znwe5esaLt0vb15E2rFC6uN1ffp4/9tIaouCg==
X-Received: by 2002:a05:6512:65:b0:507:9e56:5b1c with SMTP id i5-20020a056512006500b005079e565b1cmr9300064lfo.13.1698218734417;
        Wed, 25 Oct 2023 00:25:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id g17-20020a5d5551000000b0032cc35c2ef7sm11462557wrw.29.2023.10.25.00.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 00:25:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Oct 2023 09:25:31 +0200
Subject: [PATCH] dt-bindings: usb: qcom,dwc3: document the SM8560
 SuperSpeed DWC3 USB controller
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231025-topic-sm8650-upstream-bindings-dwc3-v1-1-fdd447e99865@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOrCOGUC/x3NPQ6DMAxA4asgz1iKA41Kr4I60MShHghRTH8kx
 N2JGL/lvR2Ui7DCo9mh8FdU1lRBbQP+PaWZUUI1WGM7MuRwW7N41OXubgY/WbfC04IvSUHSrBh
 +vkPHvaWhpzjECLWUC0f5X5fxeRwnz0d2oHUAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=94slVde3c1MdIK5l3UGMWWvmzVgx8QGqBtuDrQplXMg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlOMLtED6TIvM9aOKsOTTkKEpJ1fTNDtge5B2SpsiC
 Q0Lp7H2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZTjC7QAKCRB33NvayMhJ0VAWEA
 C2keWT9ubyCYrE7fyYYR+SNXUB7+iOYVpKfOiWWvYZU9Sd0yMUK82VZWDfLuXoi+n8DztcJqvmi46o
 hiEbK7UqZqCbUPZH+PKwBtKLtPNHCBD0TlCcru72ENA4jKGN+a34U81uaTEMv6mVokHMIsmhKSkC81
 LFUF3BC1TTDsNzhDHHbL+zKOuplUFFGSKGsSJnBKX2q3gVgbcTpObieed/sgIuHsWwQcsZBGffGDs/
 2dsMvvcAwW9sWndev8CuHx409T1bX1qW0R2u65CRQVroIAlQYFDN/YIyJ3pbN+90ykjBbNf/QIYHE7
 J8plPEIB/TshABj7uN1ZMfx/2kU+LZBBWjXAJi7XRlArfr8Nklepq2DHpYCkXFHG8h0H1R1t4uFTIV
 t4dE52DC1gFYaqWSlN0m3hEnEfijbxblN4oPsMdnSC4zdcKvM/PB8Z5lhvsubMzHma4I2A27ddiivp
 TjfxIi1kC7FShak3aIc8c4SSM430FG/AMdigNFHZtOqyi6zKlwLOAxidsDwN1DX703yOOCnj68rGvZ
 iyjU0EZ9CeJPJGKEzBca51vXNN/esy1b5DnaTvf6L+EI7o1L5ioyiQA45iKOJ75mHMZ9KeWBvgtenu
 uNuYdzthiVwAeF3/zvtVO2IMiZYWMolktZ6TIxCgqtFTc98JlAp8/jDunnDg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the SuperSpeed DWC3 USB controller on the SM8650 Platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
For convenience, a regularly refreshed linux-next based git tree containing
all the SM8650 related work is available at:
https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm85650/upstream/integ
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index e889158ca205..ea2c663ddc52 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -46,6 +46,7 @@ properties:
           - qcom,sm8350-dwc3
           - qcom,sm8450-dwc3
           - qcom,sm8550-dwc3
+          - qcom,sm8650-dwc3
       - const: qcom,dwc3
 
   reg:

---
base-commit: fe1998aa935b44ef873193c0772c43bce74f17dc
change-id: 20231016-topic-sm8650-upstream-bindings-dwc3-6e421941f9ff

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


