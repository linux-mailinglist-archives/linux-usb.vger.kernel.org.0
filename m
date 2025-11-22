Return-Path: <linux-usb+bounces-30812-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 25218C7CB85
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 10:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1281E4E400B
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 09:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02AD2F3C13;
	Sat, 22 Nov 2025 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pJcBN3uO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6429286422
	for <linux-usb@vger.kernel.org>; Sat, 22 Nov 2025 09:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763803941; cv=none; b=bp/reyzP3GOuQCcxYPbx9pnaNXII6sPFT3fR3pwPLrSL3mDu//p0IlLjtJ+HfB1B1Js82PCbrB5FhxW+XumKahSqkmiMQvZ96xy5W4D22tZGcO5MWvfTonqDSssNbaaLJzcse0cvzS1JMut+uGadVfgtugjP+rQP0GAZqQuVVDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763803941; c=relaxed/simple;
	bh=oJgoRCcsl7Ld3GyB5zmfSn3D/dubRzVSvimNvflfqL8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=If6/sJQYEAZLZKp5V0PyP4eIBd/HSGY+fzxPL+kX/PbAUU7vR9LYbv9DbzS42kN6pRzNBQG0BjEvdEtpzx+0Z7418Gnt+EAGrT+YxBMlSvEegD9WCWSgRLti2uEa8B49Djiaq7bCHZcqWyJsTupwd0rYFsPPqI3TTZEdr8wJ+mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pJcBN3uO; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7b89ee2c1a4so6304388b3a.2
        for <linux-usb@vger.kernel.org>; Sat, 22 Nov 2025 01:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763803938; x=1764408738; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0Qr1XZc6ev5PJXNcXgSUGaM77iliFZ4AKyDLqJnKDJg=;
        b=pJcBN3uO52dQ7X0bVIv2KZY8edbgkmS22D2j2rToESd+V6SLSwvBID/wSSloH0PyGi
         ieGDdo4W8NEGk0WhMb54Utu1EqbfrHDVLjw6LzpbgokUdDaomuhNPRduz5gB3jB80FBM
         prlcocy8SyZcbpO2DV7r8guXyc53wat5IcVHFsKwKskZfpOJbUxuLDeGDx65BlSMBc4P
         3Q6JBDwN2pY320x5jPkSJjnxGbHNlskiT0/SPENveRPT1OW69hgqjcKlO4JxEBDdR/bT
         YTVGcptLRApKBmBVdPvGbud7sqpmitQbYra936vjf5y1E/JnMZrawbvCMDSTuMrT0ovH
         wBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763803938; x=1764408738;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Qr1XZc6ev5PJXNcXgSUGaM77iliFZ4AKyDLqJnKDJg=;
        b=FGABqIN5s+qa80LW8p2YbiRfdw9L7nHBk8GCB3EyMnRxBJA4Wp74B35+6QWHnU6+qx
         47+gjSs4nn4ymyTCu9kvhB+tTXP5rs5CjTfaSSxEcm32g2JqVARGbC+DE1jC4TeYs9jO
         zDdkUQUgJbQUMjrVAVt96qAf6oYU9TJdgW7gc4c89SsNBs5Ov/gQxE5gDrNoQyXcUQH0
         ba5mcMc1QwJbiBtD0ZnFvb4Jrg5tu5crAW39/jd+tSkDJa7CvXU80/n3R4pkOTHotdlD
         /uyj3AjH7qG/2ffg18iHkJSpC2aR4h1dAgeiBIpCbcaJNrSAyiQP0gvJhHmW8TVmEuqv
         YHrA==
X-Forwarded-Encrypted: i=1; AJvYcCWYVy+D/0v5gGVKDSCZZeaxb6kJDbypuzYvh+vL67LeccF1IQejsU8XXO2Ekz6gmxyRYrlRBEV8a0w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0xGKISiaB5n+AFkE0xdgIfwub3Exx752cL8FYfCtd2a6iLMjz
	KkhYo9ImB8HNAP/VH/I+fP0TJ9AYRZ2LKYFa6VIzz6tdnZ7g45dNHrgPZsvTTos4IkP45T/z2Uh
	X767aMA==
X-Google-Smtp-Source: AGHT+IFg6ZgrRXBiJXLQPAtRI2PxbDQWmg0QRjQGMj3ytZs2rF/E1F4c8P3UFoCetAorKDd9pzUqpyTHP9U=
X-Received: from dlbcq18.prod.google.com ([2002:a05:7022:2492:b0:119:78ff:fe0f])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4288:b0:119:e569:f270
 with SMTP id a92af1059eb24-11c9d8530c2mr2454577c88.25.1763803938044; Sat, 22
 Nov 2025 01:32:18 -0800 (PST)
Date: Sat, 22 Nov 2025 09:32:04 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABWDIWkC/03MQQ7CIBCF4as0s5YGsBVx5T2MiwpTSkKZZqhG0
 /TuElfmrb7F+zcoyBELXJoNGF+xRMoV50MDbhpyQBF9NWipe6W0Fo7yypQSslDaPqT3vRlMB/W wMI7x/Yvd7tUj0yzWiXH4Sygr7dF0ttW27iSUYPqkJ10DUUjYOpph37/ydFcomAAAAA==
X-Change-Id: 20251122-controller-129b0dd57a74
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763803936; l=3975;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=oJgoRCcsl7Ld3GyB5zmfSn3D/dubRzVSvimNvflfqL8=; b=eXkpcKtxNEknJRDqkFeDEcWxN1Qv5VDUMbjbIGCYpqoA3dLbDO6Nf86SkmHY4nPpnk9jNbl+8
 KMHTxP0/FLGBBgaDMmnRJpARGwDDNL6MWqFuzfqTC8I3+6/h6b5LBBg
X-Mailer: b4 0.14.2
Message-ID: <20251122-controller-v8-0-e7562e0df658@google.com>
Subject: [PATCH v8 0/2] Add Google Tensor SoC USB controller support
From: Roy Luo <royluo@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="utf-8"

This series introduces USB controller support for the Google Tensor G5
SoC (codename: Laguna), a new generation of Google silicon first
launched with Pixel 10 devices.

The Tensor G5 represents a significant architectural overhaul compared
to previous Tensor generations (e.g., gs101), which were based on Samsung
Exynos IP. Although the G5 still utilizes Synopsys IP for the USB
components, the custom top-level integration introduces a completely new
design for clock, reset scheme, register interfaces and programming
sequence, necessitating new drivers and device tree bindings.

The USB subsystem on Tensor G5 integrates a Synopsys DWC3 USB 3.1
DRD-Single Port controller with hibernation support, and a custom PHY
block comprising Synopsys eUSB2 and USB 3.2/DP combo PHYs. The PHY
support is sent as a separate patch series.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
Changes in v8:
- Add COMPILE_TEST to dependencies for build coverage.
- Drop redundant default n in Kconfig.
- Update Kconfig help text to explicitly state the module name.
- Use container_of_const() in the to_dwc3_google() macro for type safety.
Link to v7: https://lore.kernel.org/linux-usb/20251119093749.292926-1-royluo@google.com

Changes in v7:
- Follow driver naming convention and rename the driver as "dwc3-google".
Link to v6: https://lore.kernel.org/linux-usb/20251112123257.3755489-1-royluo@google.com

Changes in v6:
- Use "lga" as SoC name instead of "gs5" to align with Tensor G5 device
  tree https://lore.kernel.org/lkml/20251111192422.4180216-1-dianders@chromium.org
Link to v5: https://lore.kernel.org/linux-usb/20251111130624.3069704-1-royluo@google.com

Changes in v5:
- Use syscon to access host_cfg and usbint_cfg MMIO space per
  discussion in https://lore.kernel.org/linux-phy/89733ddf-8af3-42d0-b6e5-20b7a4ef588c@kernel.org
- Make warn logs in dwc3_google_resume_irq() dev_dbg.
Link to v4: https://lore.kernel.org/linux-usb/20251017233459.2409975-1-royluo@google.com

Changes in v4:
- Separate controller and phy changes into two distinct patch series.
- Rename dwc3 core interrupt as "core".
- Remove u2phy_apb clk/reset (moved to PHY)
- Configure usb2only mode when usb3 phy is not present.
- Adopt pm_ptr PM macros to fix build warnings.
Link to v3: https://lore.kernel.org/linux-usb/20251010201607.1190967-1-royluo@google.com

Changes in v3:
- Align binding file name with the compatible string
- Simplify the compatible property in binding to a single const value.
- Add descriptive comments and use item list in binding.
- Rename binding entries for clarity and brevity.
Link to v2: https://lore.kernel.org/linux-usb/20251008060000.3136021-1-royluo@google.com

Changes in v2:
- Reorder patches to present bindings first.
- Update dt binding compatible strings to be SoC-specific (google,gs5-*).
- Better describe the hardware in dt binding commit messages and
  descriptions.
- Adjust PHY driver commit subjects to use correct prefixes ("phy:").
- Move PHY driver from a subdirectory to drivers/phy/.
Link to v1: https://lore.kernel.org/linux-usb/20251006232125.1833979-1-royluo@google.com/

---
Roy Luo (2):
      dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
      usb: dwc3: Add Google Tensor SoC DWC3 glue driver

 .../devicetree/bindings/usb/google,lga-dwc3.yaml   | 140 +++++
 drivers/usb/dwc3/Kconfig                           |  13 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/dwc3-google.c                     | 628 +++++++++++++++++++++
 4 files changed, 782 insertions(+)
---
base-commit: 8b690556d8fe074b4f9835075050fba3fb180e93
change-id: 20251122-controller-129b0dd57a74

Best regards,
-- 
Roy Luo <royluo@google.com>


