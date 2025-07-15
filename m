Return-Path: <linux-usb+bounces-25815-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ACEB0500F
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 06:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9915B189B667
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 04:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715982D9788;
	Tue, 15 Jul 2025 04:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOzBX4Bd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7712D46DD;
	Tue, 15 Jul 2025 04:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752552232; cv=none; b=lyEVlMUhgnAThPE/0RVO2+6h8+y3SR+A6Ne/owWGxrHQHmPz+umL6eEJgKpZ2LKluQRZjWE7mx5D6GB+dvuretyPLw1bBkS2ailhrzBK5OwWsyvjQcfkEua/KEUKCaNSzydocbo5p/iJUnINA7bt0cv/6GNvRqx9RF6F/QyvQbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752552232; c=relaxed/simple;
	bh=3vbgZyoOzJWVkFYh6VTooz49lAPSd9vdeX5UjyFPhdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sUuIvPlc4WeUuxeXa1nmrB3l3KF+dmfyWqRpQH3uYy0onjferDiAIqsjHjVL9MGswlPtVYr9lOTjS873cztM/620Bno9Orw3mPd6vsYG9O0eD84I//k25gfVa8GhRdlZ+t9CaH7ZMMQbuesmZr+y0rGzhw5YSvTfqdXgrmL7wvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOzBX4Bd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C21EBC19423;
	Tue, 15 Jul 2025 04:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752552231;
	bh=3vbgZyoOzJWVkFYh6VTooz49lAPSd9vdeX5UjyFPhdY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MOzBX4BdkcEz1YZONKBIEBKm/w63+UQs7+AuRythm/Oh8nX4jKclbXU2uyYqKwNbi
	 jXlnYJXn3SFwn3XP06aAp7vt9pTpchoBGrPJw/OW2d0WS/JKznKLGbjRAlTTjC00Bm
	 yaX5eixlb3BpOuWlPqvisE5ztzJriVD8kVVS+ksFQ9A8b5AZKhsIifXTL1xJ5yqMpc
	 Vf8YK94TD1ZGwmHhn/TM6Qtm+7FRsWG+88mQfam/J2tdeWFAhwT7S6/UM3WQnzIJkx
	 2wUSJZXwKmj+alB3yltpgfW32X4kXABTrj0+tNnG0cBQn1phPRVKNpki/0LpZw32/v
	 jEn+Dgr4Ec40g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC16C83F22;
	Tue, 15 Jul 2025 04:03:51 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 14 Jul 2025 23:02:59 -0500
Subject: [PATCH 16/17] arm64: tegra: Add Tegra210B01 support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-t210b01-v1-16-e3f5f7de5dce@gmail.com>
References: <20250714-t210b01-v1-0-e3f5f7de5dce@gmail.com>
In-Reply-To: <20250714-t210b01-v1-0-e3f5f7de5dce@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nagarjuna Kristam <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-usb@vger.kernel.org, Thierry Reding <treding@nvidia.com>, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752552229; l=1982;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=ttd5rUNPwZRMhsRQKkGWJfHHoJfZzc3FeVaJMr3kaiQ=;
 b=V7YYm/8SDSYxjrFYhexfVPwU4NHOHbtDeT+FeEtB/40Estcu06tC7OoY8L2RhzQQt7UBi+nCE
 Zd3vX2DCKITDJpzTW6DEKqcIEz1JpK6PE86u8kC+TU0LoKY3WEMTEnX
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Also known as Tegra X1+, the Tegra210B01 has higher CPU and GPU clocks
than the original Tegra210.

Add a SoC-level device tree file that describes most of the hardware
available on the SoC. This is derived from the Tegra210 dtsi, as they
share a lot.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210b01.dtsi | 64 +++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210b01.dtsi b/arch/arm64/boot/dts/nvidia/tegra210b01.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..87e55af3ed2466c5d353dbd8706230aef97b90f7
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra210b01.dtsi
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "tegra210.dtsi"
+
+/ {
+	compatible = "nvidia,tegra210b01", "nvidia,tegra210";
+
+	host1x@50000000 {
+		/delete-node/ sor@54540000;
+		/delete-node/ dpaux@545c0000;
+
+		dc@54200000 {
+			nvidia,outputs = <&dsia &dsib &sor1>;
+		};
+
+		dc@54240000 {
+			nvidia,outputs = <&dsia &dsib &sor1>;
+		};
+	};
+
+	clock@60006000 {
+		compatible = "nvidia,tegra210b01-car";
+	};
+
+	i2c@7000d100 {
+		/delete-property/ pinctrl-0;
+		/delete-property/ pinctrl-1;
+		/delete-property/ pinctrl-names;
+	};
+
+	pmc@7000e400 {
+		compatible = "nvidia,tegra210b01-pmc";
+	};
+
+	bpmp@70016000 {
+		status = "okay";
+	};
+
+	usb@70090000 {
+		compatible = "nvidia,tegra210b01-xusb";
+	};
+
+	padctl@7009f000 {
+		compatible = "nvidia,tegra210b01-xusb-padctl";
+	};
+
+	usb@700d0000 {
+		compatible = "nvidia,tegra210b01-xudc";
+	};
+
+	thermal-sensor@700e2000 {
+		compatible = "nvidia,tegra210b01-soctherm";
+
+		throttle-cfgs {
+			heavy {
+				nvidia,cpu-throt-percent = <0>;
+				nvidia,gpu-throt-level = <TEGRA_SOCTHERM_THROT_LEVEL_NONE>;
+			};
+		};
+	};
+
+	clock@70110000 {
+		compatible = "nvidia,tegra210b01-dfll";
+	};
+};

-- 
2.50.0



