Return-Path: <linux-usb+bounces-24373-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAA2AC71C7
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 21:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD7D21C03E28
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 19:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925332206BE;
	Wed, 28 May 2025 19:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JCfi0B6U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D681E8332
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 19:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462240; cv=none; b=GgbTr7mF+jkL0PVAV76nRk8Yfz7fX/jrBSC4kQUWGN6U+h+oZuEfgUsKnxT4AltVoRsy2wN2s1B9RUUZcV+HzlwDeZJ4SALKaZVGkxf2+wNOXpBcgH3mIhQTmpXJNo6Eq+tUXZbD1rWHieg0JolHYMCb+ScMidybDZhSoPY+Qo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462240; c=relaxed/simple;
	bh=pVQoY2tMvY1bG+KKCYoQBM+7JiHkA5uoBLgsR0UXjf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mca+7CwVnG85RNiXeIXaJx/Y98r3iMw6HccVVmPa/tHVsPbdUXpK3buEkioCE+SULcrqY2kaDSPhvZyA1UGraX1RUzd5oXepwy+CV8V0qnyYkCw4xnTcV2PMatie3qWlqf60T8S4rIFmimgvk5zV59faUAspAXP9NvUTXVB/j2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JCfi0B6U; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a37d24e607so183678f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 12:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462236; x=1749067036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uZkzIt+VTNDuOeuHZJXYBs4wfX/HzzJDRDfTN1kT4V4=;
        b=JCfi0B6UVftMUrPg88K/tbg7gcIb/TByL6ZVTPSwsnAQXuTUJPd9if8Fy79+nVD9c5
         wZ2BSUPHbi44tu3zFFZu4MWm6PwIQwARKGKbiO9FbTqKXKaH7yc+kN344C24BZyEcLyK
         l8GIRZJbTcpVp/hCzSALzzS43M0WDTSZu+87KCLHrOs0G0bvSQOY6rpuTLE8ndD2WkeI
         od8Bl8wDwHfGJmT4EJQ1Lc//UNvYMR3slCvzOr+y0wkIrJRsTLrqEOwFmDWtoP8luZpy
         ILCTxNK13Qfv0F7VCbYDfzo33jzQPkpxJVw3QXDjhDqgQulBp7s+tP7Lnk1iY0C6GutU
         NYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462236; x=1749067036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZkzIt+VTNDuOeuHZJXYBs4wfX/HzzJDRDfTN1kT4V4=;
        b=Jo1AhfXh+xZzy1aiLLmxek9/2NEEaBFQDSJhFLzkc/vLKfEDk0UqVDmSl5MJOUWHKy
         xkwjZSRHZu+vERNQcCdwi0NH8m5XWaDH23O/EWNRhWZ/G+kBrqp1LMhXA0P4GE4w7FT4
         erk42NVOoiKHm41rNzYN2voX8tNqfd6uwOj1XYKkqkiLiFo3MheyNXHtCxhUYCi7mVE9
         msn5yvgHGVZXA4umUj6//eXnElceGAPVs68S1uj9ax0kUhqCy5jMebkiUza5PrMubuXm
         9332nyWQNPQ5zzCC7IFPtyaHmoDTomCAKJ/uuWSgypjn8PuoHhbL2OjazVKcFuu9mjTB
         yZcw==
X-Forwarded-Encrypted: i=1; AJvYcCUwSOgyyAXnOScvEPLW9bdqvHse/RN0wE5qzDPoWIf84kHGs7b97rE0JX2KOOT1JERw8Cde9Ijs+Co=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo+EeSwT6c9g4yNve8siQT2ZS0IUFBoRoLvL1zTa0LmBTqnUrS
	so9X+Lq5vDzJqyyqdKsLnp4BwOwn/+5wKjpYFJX2RyyN2yau6sjZUH6yVLp03L/pujQ=
X-Gm-Gg: ASbGncvDIgKZwOv0EEwAQczUtOrwIADiY90VoADG7RbrdPpV+kdv60ChpAMjw3GeD1Z
	2ixPTbBV70MosAat8E5zeCoz4E1LC3tBiCL4571ItnHFR6GjajlfSVlbqB6w/0jPUuJ0FpYmuX0
	NMYIUgl0HdYfSdT4EcHZq3NgV+R/XGUWGl8g2164WFQQVI58buG/WNc6XWLQbfzQ+EA6WIMZTrA
	P87WhJNKEA6xkM+yla/NRZMiZdoeVZOe1bMXF0/XZLsrVPMwSBx1LFA7IiLpB/pK0IbyM3TXLhh
	bhSRjg/pj/FQMwS6PXGQix9eEz5Sxz+/Sr6b/3RYm2Hid3t5zQ8NOZetSYslOywBrA==
X-Google-Smtp-Source: AGHT+IHIxmmykQrqu735nSLQ1ET0rx6h2/v3wuHEtKjqqdqG51esqr6GYjEdXnpcisfuQFGupRBg5w==
X-Received: by 2002:a05:6000:178d:b0:3a0:a0d1:1131 with SMTP id ffacd0b85a97d-3a4cb43dae1mr15437245f8f.7.1748462235728;
        Wed, 28 May 2025 12:57:15 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eace3bc1sm2360397f8f.99.2025.05.28.12.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:57:15 -0700 (PDT)
Date: Wed, 28 May 2025 22:57:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>
Subject: [PATCH 1/4] dt-bindings: usb: Add compatible strings for s32g2/s32g3
Message-ID: <2a4317353557e4fac2a7bfa4261a75886eebe41b.1748453565.git.dan.carpenter@linaro.org>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1748453565.git.dan.carpenter@linaro.org>

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Add the compatible strings for the NXP s32g2 and s32g3.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 2 ++
 Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index cc5787a8cfa3..400d885fea96 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -24,6 +24,8 @@ properties:
           - nvidia,tegra114-udc
           - nvidia,tegra124-udc
           - qcom,ci-hdrc
+          - nxp,s32g2-usb
+          - nxp,s32g3-usb
       - items:
           - enum:
               - nvidia,tegra114-ehci
diff --git a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
index 019435540df0..ca677d1a8274 100644
--- a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
+++ b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
@@ -21,6 +21,8 @@ properties:
           - fsl,imx53-usbmisc
           - fsl,imx6q-usbmisc
           - fsl,vf610-usbmisc
+          - nxp,s32g2-usbmisc
+          - nxp,s32g3-usbmisc
       - items:
           - enum:
               - fsl,imx6ul-usbmisc
-- 
2.47.2


