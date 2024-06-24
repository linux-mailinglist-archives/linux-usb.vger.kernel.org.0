Return-Path: <linux-usb+bounces-11575-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DEE91458C
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 10:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF51E1F21ABF
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 08:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8CD412F5A0;
	Mon, 24 Jun 2024 08:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tW6dTo48"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0C27FBA4
	for <linux-usb@vger.kernel.org>; Mon, 24 Jun 2024 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719219509; cv=none; b=qUIgtRsDZkbDeKkprDCSLHG6bJqba4YMCfmGEBFEkmnlIUK6brAlfwe3I8ScfqqWRXo2hby5w+RjyrOgO13dG4a6TUCLGIwwCobtpyeMnBG5Ll7o+7IiW0bRpCOgeyltze7DuYFaa8rmpPQncdCAgW9tgTqwk5030nKgERgu2kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719219509; c=relaxed/simple;
	bh=HhbGnewHH9Uu5MACNtsI7hL6taZoEp9t874dm8z0TXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eDfITVKW/F0dlFmaOBVHG0ScHtqObLxDv8aiYORnhh7nb+lUCb3ycv0HUuzD80luSn1ChBaLZ9oIQDkcjt05VKkBs9UUbou9EhSrZUGiYjLIDZTsZcM/wgbB9iay/kCaZP0H6hUSdG5IhBz2VzpYEDtn63ixqXWRIQnb9hq6Dh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tW6dTo48; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-421bb51d81aso33770195e9.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Jun 2024 01:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719219505; x=1719824305; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tVw8ud05vNai0bHEiiP1EC9bB93mXMciruGH+Ndm/CY=;
        b=tW6dTo48s93OT29kM2qx0s+08LFy1oLrXICImp7lSHLwwCkcZggOy8vkpb5ZnLsK16
         BhWbKvXHzXWcm/OYaHB8RsjEqXCXZEliVVypAYuXUedNXE2R/VHhN+ebW2prSf+/3dAP
         dUhcobL6VE0ZsBDUnWdaw2PIgnEO90Yqs3A/Z5ndDbyum/M2IdKZFsNx5EZqYcoiT0zV
         cec3hr20XJlfHjhPKoGjkrkIGTjbJMyPD+BubbcoAR11dYiiyrQ9NqqA2WcUPS6RdF+O
         Snd6pwbbvGHcoWRUa+2U5N2+XswYerOpHMZWTMEEcn2mAfCJPX5VnBBaaCDoTh6zNoo9
         9tLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719219505; x=1719824305;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVw8ud05vNai0bHEiiP1EC9bB93mXMciruGH+Ndm/CY=;
        b=h7aQ2BVhIlZk4dhHlz0BqWIK7xkww3DdEjSkTQ1+YJBSrb+GroKjFp1Ek7aAMOIsiM
         zX517OPOzqqT+v4Hugo3Xc4dfifJ/3KiKecGNSCUDOxgg25e0t64xjCTbFok+DQasI3Z
         Dr9N14g7zXjCTF/kOIQ6QBbRwvho/4B/Xd2WwbzLUQTacy7T5g/WajFqe0g8xqe02LhZ
         wzC3WG1e4eMx6cCZ9ahgxPeB76ue2wxXC1OnuthuCqzoY1qYy2dRcJUsNESU6YB81nkg
         7DBvLt3jOYSkhG9eihbf12JwZEbfa/9jfBW9+fc+8O8BZih87Uj2ObMSXV/gsPaaHsjp
         400w==
X-Gm-Message-State: AOJu0YwZ2VAHjnypZQxI/dVh5TrCYwl9ReqKs6GfCNVrq/9TEmw5a/TI
	ih2dAXXKhI7wo6FScw2ixAywagq8+A/uMI73blaCZ1Lne9E9mGolaEKxMd42ERXNR0URfRpGVr+
	uqP2eXA==
X-Google-Smtp-Source: AGHT+IGNkagBrvsH8nOB+3/sE84TJcZvnooSGwYbnRolWo4YrTDq+wywjT/bpCQT52wRLGxrKi6PLg==
X-Received: by 2002:adf:eac1:0:b0:354:fa57:a0c5 with SMTP id ffacd0b85a97d-366e94d572emr2539787f8f.38.1719219504534;
        Mon, 24 Jun 2024 01:58:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f696csm9465642f8f.82.2024.06.24.01.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 01:58:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 24 Jun 2024 10:58:23 +0200
Subject: [PATCH] dt-bindings: usb: dwc2: switch to unevaluatedProperties
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-topic-amlogic-upstream-bindings-fixes-dwc2-subnodes-v1-1-f2544f21f594@linaro.org>
X-B4-Tracking: v=1; b=H4sIAC41eWYC/x3MSwrDMAxF0a0EjStwTAihWykd+CO7gsY2VpIWQ
 vZe0dHjwOOeINSZBO7DCZ0OFq5FMd4GCC9XMiFHNVhjJzPbCbfaOKBb3zXr7k22Tm5FzyVyyYK
 JvyQYP8Gi7L7UqErLMlvjgxuTAy23Tv+bhh/P6/oBAjE9UIUAAAA=
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=HhbGnewHH9Uu5MACNtsI7hL6taZoEp9t874dm8z0TXU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmeTUvQBX+/LL0KlvF0sk7F0SSU5OmhhuAGnzX8N5y
 gZRcjZaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZnk1LwAKCRB33NvayMhJ0dH1D/
 wN+F67QwUrO7hcPZhIIB8xWI4gDnTe5WcXxYlGwTCdk7OrsYQUDlSZKFfreq6W/jvYYt0mDkWb61qE
 gVr/nl2sTPvbio5eNJr8ORJ/2LOmom9dfsSuIkQp49kjVD8R8N4qtrCUpJ1ZFsqZl/Hby0vTzmsnZy
 kJnPZ7pUtfD1UhbW/j/o+bkkH475mZ5wtszKqnDF1ssq+QW3JAvt+iAuRCzC4c8P/WhM0k4yFzqEgg
 3EzAMUCQVtHHhDrLXDmNjByEUYxSGUbCTzi8/jUAGbBX4Jb54sdWE3hGAbWsiqrdrUa5whagxlfOW3
 Iq4c/ryt9iZ4uP+5aWGWyVvPWOm21ILGrBKKkTk4K2LDeDsfHpwI3SF4zNUga7/AZBAH2WZL9a7EY5
 yTOzafSYSTSjCpVT0f3Z5BrG4aFJLnz9DcCr80KV9ScbJtKM9N9FutPaov/LPt+Iw/K9NKvUgDMFgt
 SYcCqmjIr+K4CKZ3SkCSHrx352AGj5h3UgK5FGu1YMHlaKrzbM6t6nrNDjLep2bbKCqUEjxKm18Lrz
 uddCgVJ1lcN/XAmkJUJf3aOR3Dp9dxodPvjnZQdhtA1XhH2fX8qYnAfEltbwNjl0acGrobX1YUXmXH
 EQJ5YxF/crwZ42n+1fjk7/CD4FHHWleFeQyKHdmGBT7XVa3N9CENNO+jkGFA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Define "unevaluatedProperties" instead of "additionalProperties"
to allow properties from common schemas but still disallow undefined
properties.

This allow defining a device subnode and fixes:
meson-gxbb-odroidc2.dtb: usb@c9100000: '#address-cells', '#size-cells', 'hub@1' do not match any of the regexes: 'p
inctrl-[0-9]+'
        from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#

Fixes: bb88dbbee2c9 ("dt-bindings: usb: dwc2: Add reference to usb-drd.yaml")
Fixes: 54bd6c9a3b7b ("dt-bindings: usb: dwc2: document TPL support")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 4f36a22aa6d7..a5f2e3442a0e 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -188,7 +188,7 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

---
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
change-id: 20240624-topic-amlogic-upstream-bindings-fixes-dwc2-subnodes-f88620bca1fa

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


