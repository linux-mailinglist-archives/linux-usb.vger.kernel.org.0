Return-Path: <linux-usb+bounces-29001-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D7677BC3692
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 08:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B903E4E2B1B
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 06:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7DE2EA157;
	Wed,  8 Oct 2025 06:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ka3L04dx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f73.google.com (mail-oo1-f73.google.com [209.85.161.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA29217704
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 06:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759903214; cv=none; b=lix4iEekzuQaRDFmTQ52SFjyUwQXpWrRlqeAVR9enhDs19pVX6Y365bhobej84YVMul7u+Edt4Y0qKTtALAO9kxMNMEsAlwM6n/+/r175PXz1e0P2XfqcPbikIUTz/zCvXkjXlyt/Qm4E831N2aGcc+EzMEZDL9C4QlnWLOrSSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759903214; c=relaxed/simple;
	bh=Re4aYmVY4+mRn8xwwmfbfR8Zw01dBZqm91ZI3IkjBPA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=VhULBPcvos2k0hs4OgMx/n1qd8bFJikAMesOltC9Lp1cAYyeR+wI1JXpsmzbH8Jjx9Bl/5ZH+mkxtUHArGYTUSu5jLQsTnYivZtf3PNBB9PMx8C/yCvyY1YYp7SG7gyeu/+5Vu548Sosu0zzeGS6mR+uSzeFE5ROs6aJlGt3/88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ka3L04dx; arc=none smtp.client-ip=209.85.161.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Received: by mail-oo1-f73.google.com with SMTP id 006d021491bc7-61bfe5cccadso1370247eaf.1
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 23:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759903210; x=1760508010; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AP6DiX2vSgFvsuE3fKRpRDJbOdj4dqy4q7VW/8dnF2Y=;
        b=Ka3L04dxu3SenDU+iB50QOyc4oTm1wtaJPJxc/OQh29r0I2vqrAi75Vp6TROGXeuHv
         RkNG5vpi5Xk7EkUgdALUuwPYNterzOdzi2Q09JUxPMf95dXC8F6yyOUb6wQqFvXKezd4
         bhvPccBnwoYNccM7QV1LRmU8IL+OCK1kH0OpFLVHXUnYiY4lXw8hNuAgKWrg+7XrRfPN
         mRrkoxDXHi1jIdqxmXGctwShhn9lxOvgta49PlJ8mSiwK1Yvs5Z2h0DOfzPII6sFQNz7
         WWyUtgzePI6vtaf/FX4wAQqmDCn6UX5VJnl6/SdCEFsumdOpWw4VPV/R2F+4OwlKpeLu
         zbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759903210; x=1760508010;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AP6DiX2vSgFvsuE3fKRpRDJbOdj4dqy4q7VW/8dnF2Y=;
        b=kO6fTt2Fr3oRS/bC2pHL03AfWkKaEulLUHDxo4u7v8loGG5ECJkyvkRWFAYtyWLmKt
         6jvZEJxJgDFofDNy86b6o37A9i1dZn5poPLv7yi82T4e/31XbMKhCUuUhdTheu1ApTKu
         YGkLThhQ5qvswOk3AGhK/gc5SruWM/b4lw0Vsl+nJr4fmYbPUye5TYNeU0RMvdxZphA+
         lxDZxLrWIvGt9jAz38EEtzTbBZ8NGMt+ilQ0tjtJWoBuB6E82X40s+7trW9wsc4lfRVq
         HA7GXT+QbHl6wUUm/FtF/YOIqOGSxSls5Lnh/CSoyo9diUSH6qDyDgP0/DVnhapd0109
         1ayA==
X-Forwarded-Encrypted: i=1; AJvYcCVK+NBXFHEytrK2v2cvUD35ZhdMv2YFFgS1ce7/RbDZ84zigOHhlzfOszgsFJkQpRAVn+xbbjz+fMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzLkIGDMiG9ZVtTiRMThQ5rKVC7y5V5beM9bJKe2L1R/QpkDgP
	81zUkZHHmbpO/ZAAJErXAMZK+qr3mPZaGtmuaWtc8lbwAzB6CwsqtQixX1jZpBpmTDxibxv6nd9
	xInZbjg==
X-Google-Smtp-Source: AGHT+IExUaS0sEpy2tAXscJ/2X+pom3EjFHo1AYYt3+9hKmXEYWCEaP2JPhBawFpp4MTEQMwGSBBqKvOJGE=
X-Received: from oacoo38.prod.google.com ([2002:a05:6871:4526:b0:331:9a49:4dbe])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6871:2b25:b0:36d:287c:694f
 with SMTP id 586e51a60fabf-3c0f80edcd7mr1302345fac.30.1759903210532; Tue, 07
 Oct 2025 23:00:10 -0700 (PDT)
Date: Wed,  8 Oct 2025 05:59:56 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008060000.3136021-1-royluo@google.com>
Subject: [PATCH v2 0/4] Add Google Tensor SoC USB support
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This series introduces USB controller and PHY support for the Google
Tensor G5 SoC (codename: Laguna), a new generation of Google silicon
first launched with Pixel 10 devices.

The Tensor G5 represents a significant architectural overhaul compared
to previous Tensor generations (e.g., gs101), which were based on Samsung
Exynos IP. Although the G5 still utilizes Synopsys IP for the USB
components, the custom top-level integration introduces a completely new
design for clock, reset scheme, register interfaces and programming
sequence, necessitating new drivers and device tree bindings.

The USB subsystem on Tensor G5 integrates a Synopsys DWC3 USB 3.1
DRD-Single Port controller with hibernation support, and a custom PHY
block comprising Synopsys eUSB2 and USB 3.2/DP combo PHYs.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
Changes in v2:
- Reorder patches to present bindings first.
- Update dt binding compatible strings to be SoC-specific (google,gs5-*).
- Better describe the hardware in dt binding commit messages and
  descriptions.
- Adjust PHY driver commit subjects to use correct prefixes ("phy:").
- Move PHY driver from a subdirectory to drivers/phy/.
Link to v1: https://lore.kernel.org/linux-usb/20251006232125.1833979-1-royluo@google.com/
---
Roy Luo (4):
  dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
  usb: dwc3: Add Google Tensor SoC DWC3 glue driver
  dt-bindings: phy: google: Add Google Tensor G5 USB PHY
  phy: Add Google Tensor SoC USB PHY driver

 .../bindings/phy/google,gs-usb-phy.yaml       |  96 +++
 .../bindings/usb/google,gs-dwc3.yaml          | 145 +++++
 drivers/phy/Kconfig                           |  14 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-google-usb.c                  | 286 +++++++++
 drivers/usb/dwc3/Kconfig                      |  10 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-google.c                | 597 ++++++++++++++++++
 8 files changed, 1150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/google,gs-usb-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
 create mode 100644 drivers/phy/phy-google-usb.c
 create mode 100644 drivers/usb/dwc3/dwc3-google.c


base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
2.51.0.710.ga91ca5db03-goog


