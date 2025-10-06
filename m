Return-Path: <linux-usb+bounces-28932-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0D2BBFC39
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 01:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C90354E1595
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 23:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D6A1D54FE;
	Mon,  6 Oct 2025 23:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uDHvzIw+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA231A9FA1
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 23:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759792908; cv=none; b=kUVEsBRozx2IGAFXWYnlhP+LkmEu7qWJS6u9B4GYQr88q8Am4BDb8TUaWEJn4ryW+rSyKyRtCmDS77rN+c0M/nNG6H6eQ4JSur/QREktXKpbhqPQnrEpwQq5NYnRD4wxrOtPPOkZow8b8D4Wa1qBxwS7WRdpLiIXqnTSQ4CMXGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759792908; c=relaxed/simple;
	bh=1qMbcIpf0Z3Ab03rwmeKct8kSYRJGu8/jk5K/4kkiK0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=OhAjohISsNJMh71RWmjVjgbVymilf1Qht6N3FosywUAdYX1nlOyna/6jQaHxJ1Chrssc0S11sb/L16O6EHZ7ayQadnr4CF7W5bDZ97PZR2kDlEZ+Hrk8IUOdt8uIoX5V4nUKsYCkVzwN2OrSHyg/c8dPUqrcTraBh4q0fTmW5Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uDHvzIw+; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b55283ff3fcso3779349a12.3
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 16:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759792906; x=1760397706; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XzfK1528ICmc0tXAsZYoRPv5AMX4H8ddjdDCNZ7iAFo=;
        b=uDHvzIw+AHaP65gAVE8yvZoZJOpGoCb1wZ7HrGR55Wf5C5Mqg8vo5L8Ssrkif1UVjK
         U47iYDZrLCm/g1meLeuNUc8ET7eYnyJN6sa8/z7qNEwSGtjJUTjXIpWu8LY9JAb232c6
         hEVR+mPRK9WBJBO3Uh07YWXyaafPOcNil9D1XTNn1JZfAGsnJhwJu9U8G67okTrsZTtE
         nkrA4kVvR+UEMLAGv/0uj+eiyUcOkUM4HjPycFoXu51zCcdAYjH5qj0uTuaIlsVGnsVk
         oH9c90qJsniby9EwfZj1uITIeHQm2+oDChmCP5FsfC1usqaKGYXRQpRB2Yu5D3go32ov
         L1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759792906; x=1760397706;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XzfK1528ICmc0tXAsZYoRPv5AMX4H8ddjdDCNZ7iAFo=;
        b=oz5Uxn5DJEHYuX8ivWG9nHDqMvdeRtIBu3vDdHLFa5Ylj3uH5BCsrte3+0+YRIuVbm
         QX5N4jNHd0Jfpp4u47rW0Cvro2cYvVbJ62DbgGCWIziL8g08XhK/4D41JvoTQXpQicT7
         zXzcEfGUEYHat0gff9eClA7BJfiRRPFbC5Bz9gMkgy9WtY6GnlOeDmqnQuTXfU+yJrM5
         jw46mKEoxxIIYunSbRu2D0UlcHEG7QjNpBN/aWUpDdeUkOKOm8PsMb742Vzb82kmZ2m1
         jqJ/ynuVNQ/WTj+zkfDOdG9tdkh8jxqY+KltRZYzGRR+3iVnh+61JAbbIwIldyUAWOYu
         h+Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUPVdECwgn5mnQfXLcpsppYCAz/OecxFw1IM67k0ea6XuDzvykOdJGwgi4f+/eyEszgxENF6UhGrcw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh8SNcEbHv5viswc5F3o37ytbZiIIB1Zh+QvH+pFQyAKBXjnfT
	MxXGI4TqLBx83zTp+0kp0nL8EzceYxab3zykBohAPzhNtTwImuJFBDwnjwUQgGqd5zZ7hkdCi9Q
	jpfv30g==
X-Google-Smtp-Source: AGHT+IFQk/JRlFBeeVilrRKrIrWvH98VXOUhHqyPMmczUypQ4yLO+zGXFQ3cFbalFp6SbZeQtiGfVA0tVYA=
X-Received: from pfbgj18.prod.google.com ([2002:a05:6a00:8412:b0:77d:12a5:d3dc])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:99a3:b0:261:b20d:3ee5
 with SMTP id adf61e73a8af0-32b61e65fb4mr17776464637.23.1759792905892; Mon, 06
 Oct 2025 16:21:45 -0700 (PDT)
Date: Mon,  6 Oct 2025 23:21:21 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251006232125.1833979-1-royluo@google.com>
Subject: [PATCH v1 0/4] Add Google Tensor SoC USB support
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This series introduces support for the USB controller and PHY found on
Google Tensor SoCs (G5 and newer). This includes:

1.  DWC3 Glue Driver: A new glue layer for the Synopsys DesignWare USB 3.0
    controller (DWC3) as integrated into Google Tensor SoCs, including
    hibernation support.
2.  DWC3 DT Bindings: Device Tree binding documentation for the Google
    Tensor SoC DWC3 controller.
3.  USB PHY Driver: A new driver for the Google Tensor SoC USB PHY,
    initially supporting high-speed operations.
4.  USB PHY DT Bindings: Device Tree binding documentation for the Google
    Tensor SoC USB PHY.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
Roy Luo (4):
  usb: dwc3: Add Google SoC DWC3 glue driver
  dt-bindings: usb: dwc3: Add Google SoC DWC3 USB
  usb: dwc3: Add Google SoC USB PHY driver
  dt-bindings: phy: google: Add Google SoC USB PHY

 .../bindings/phy/google,usb-phy.yaml          |  91 +++
 .../bindings/usb/google,snps-dwc3.yaml        | 144 +++++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/google/Kconfig                    |  15 +
 drivers/phy/google/Makefile                   |   2 +
 drivers/phy/google/phy-google-usb.c           | 286 +++++++++
 drivers/usb/dwc3/Kconfig                      |   8 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-google.c                | 597 ++++++++++++++++++
 10 files changed, 1146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/google,usb-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
 create mode 100644 drivers/phy/google/Kconfig
 create mode 100644 drivers/phy/google/Makefile
 create mode 100644 drivers/phy/google/phy-google-usb.c
 create mode 100644 drivers/usb/dwc3/dwc3-google.c


base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
2.51.0.618.g983fd99d29-goog


