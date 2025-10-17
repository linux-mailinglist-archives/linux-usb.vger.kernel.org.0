Return-Path: <linux-usb+bounces-29421-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B133BEC036
	for <lists+linux-usb@lfdr.de>; Sat, 18 Oct 2025 01:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 45B384EA3CE
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 23:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E04F2DA763;
	Fri, 17 Oct 2025 23:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QFsWNFaY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E6B2D94A4
	for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 23:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760744106; cv=none; b=Uu5QLYDQaDnLfxAXJlHg6fvpq+c5/dU2+DTFxzLH8IMcHqNOq8S/SXiodLHZQxHVMFggNG9RPmwoLrnucZ03UssNmqZPmahXv/+I9zx+g/VXqUBMCh7bxHAuqYavcne31YUc1W3lWrVTq7HEme8irfHpVACwRihQ0nJrkEnpjmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760744106; c=relaxed/simple;
	bh=RtIfXss6eIKXPLj3ncfE4505sTF0A4And7X+BcVgVZE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=RDjTavXtC8j8cJqSFUbKP3aQJEVjKTSpJeg0yMtMO/nuofwEZh9GDztVsL4SLEb97NVBnnDMqICVxepvtVr2GpNHM+EFEmqwiWrgwrneYwYjYcPsMcmXGDl5zmbDUjm2chG4WPrlOlB97ZMVFd8EjuiR6dtoDRoGLdfo/VN0kGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QFsWNFaY; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-27c62320f16so25721995ad.1
        for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 16:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760744103; x=1761348903; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SE2EEGb0HouxauO/aNI7gyJ7SeBT6HKDFtX26SdNI+k=;
        b=QFsWNFaYfmeHlULGysriKzn5ca/Jsr9d01MiJXHFgpEqXkTuZ/5vKB2kc6ZUn0uP00
         ZetfR94XcEyfI/2l5T/AtlIe8eHrMpo1osI/czUEgM2umQ3pUQJ6xpFKx/jrL1ENO9Gn
         mydUN5M+g9LIsab6JNupi6+nOKHBXx4XqEBVmybQwkIhwcxEWrsjMQln4Ewtw63xosbx
         tIKoLHx1ygqAP2BoiuV9VyVqEE/5iCwmGZPHnZgWEc31lbdys9XgUp5FjEv/PL1zFARU
         JxUHpMvSpbd2SqiMJTr49O/PHX1yHWF8eyWkIchlT+3Z9aHqtQmchV5iVeZhe4wfSx3/
         IjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760744103; x=1761348903;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SE2EEGb0HouxauO/aNI7gyJ7SeBT6HKDFtX26SdNI+k=;
        b=p3FR+OddK2RtYvhr0d4HUojtWPmiJkCdijxjyc0E2WAhcBjmJQe1e95v8Cl5CwruqG
         sFBL1W6rB9QdDXflziHOAz+Xxtk5sTYjBJz0+DNV7kTt14V823ikzdYAyn7dB8rzuktr
         hz+NsKOCuoRohEGyARNVh8r/INSd/Xypsu9LAtYSP9uuuuNRBAzxc0tQhgZD30Y9O0CQ
         ZmAVjAbIjhm00H4VaL7W/5afkuy5tmdPjMWc7D/kVt5ITKCDRbrbK0n4BWlddl8dW/8b
         7S4NpRuS1FIBiMon8CBm5s6BGBVp9hFA9jLcYigAPHgYUJcUWWo2v2A4LMCYG1BAQFwB
         AEwA==
X-Forwarded-Encrypted: i=1; AJvYcCUcgpHPKc3Xjl3d00YOf9dYX4x2jlIWZUnCx8uavNZPZsMGnCbkAFYlhczy5Yj8+dZTKZCevcJQjak=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoYz5pd02AXnMkiJHXpa2HlDAFGqK462gwpROOiL12xiZBHIiH
	zDSQJr4Skvfc+sg/f4PcaoywISHwH5o0AIatbOBXbAdHF78J843EHeCgyDDC+jkwZLPQp9jHU16
	6CqJ+yg==
X-Google-Smtp-Source: AGHT+IFz9LrlEbh/GEOZE08yXGgYI/4R0E7gunWHRVlyUcEr6QWUdol+r9ZsCt+kLhqmYgnF5LBEIR69e4Y=
X-Received: from pll21.prod.google.com ([2002:a17:902:c215:b0:290:cd84:e7c])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:22c1:b0:278:704:d6d0
 with SMTP id d9443c01a7336-290c9cb2666mr71637135ad.19.1760744103403; Fri, 17
 Oct 2025 16:35:03 -0700 (PDT)
Date: Fri, 17 Oct 2025 23:34:57 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017233459.2409975-1-royluo@google.com>
Subject: [PATCH v4 0/2] Add Google Tensor SoC USB controller support
From: Roy Luo <royluo@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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

 .../bindings/usb/google,gs5-dwc3.yaml         | 135 ++++
 drivers/usb/dwc3/Kconfig                      |  10 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-google.c                | 608 ++++++++++++++++++
 4 files changed, 754 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
 create mode 100644 drivers/usb/dwc3/dwc3-google.c


base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
2.51.0.858.gf9c4a03a3a-goog


