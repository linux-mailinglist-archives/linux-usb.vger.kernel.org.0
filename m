Return-Path: <linux-usb+bounces-27100-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43693B2FEF4
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 17:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F201A24312
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 15:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310072D2384;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCadD0RF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A081277C8D;
	Thu, 21 Aug 2025 15:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755790803; cv=none; b=nl2v2X8CKegQvXCQRktcbbQoskk4IZC/24VGZ6G7qbLGjBKGxM4+/3o8aokMLZEuURlO3WRlf1z+RWKcH9WRDFWiXliS7l2RthhvTerBLbPgk0a9+cjUoJLtNY0jh5tRVWrGWDPd981LjUbc2TjpseWVPIIL6+WtEWsTI8KaWpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755790803; c=relaxed/simple;
	bh=Ffhri9SjHSf/0JyrOM8P9yB5VxqUTJqas+Uuy3v7zJ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EjmvhbqBVBWyxseDeNbS9AE0tZ1+5R2fRMsNa88FX6gPYf+9L9mcjUS+eoyh0FyM9JAtznL09+sDlZ+/ZgIb+OJwxCl3J2sGwyaHDmyYeqJ85MUXkQZm9FlBn2yM+YVdxLNZNLPaQPC3LbCUNsqiDa8p+gG/ARkS8yQpXtNoUww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCadD0RF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE573C4CEEB;
	Thu, 21 Aug 2025 15:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755790803;
	bh=Ffhri9SjHSf/0JyrOM8P9yB5VxqUTJqas+Uuy3v7zJ8=;
	h=From:Subject:Date:To:Cc:From;
	b=ZCadD0RFHlKN5iyFo7ll/4qzPl87fAwXHR5iDeI086x32ktz4C681VTsa97Bqx0W5
	 HEoHuxQZgFUKlAzRWCnWI06i4lmCkVE56zImxz7He9EUjJ8cSl6vOFaUpiQOCUdzga
	 zcDQjgiymTmBsGvolsl8RbP7K2MZzStCCKH1Gmsu3/R47RmAmVCd9ZQ/LtEmAD7xTp
	 +iPFMtMjEpCIQM1wgYvOwVbYJJwwCNnzW+It+vLe+iKj4+nlu2/uMKDQUeEUrBEtJP
	 UKsibveOCTg3i7TIK36yGVPyzrWmypyDOYEeeXXVPaitQDXY3YMqbUzl1BGS326v5L
	 lh2RkOPiWSeuQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FF1CA0FE1;
	Thu, 21 Aug 2025 15:40:02 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH RFC 00/22] Apple Silicon USB3 support
Date: Thu, 21 Aug 2025 15:38:52 +0000
Message-Id: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIw9p2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyMD3cSS5IKMSl0zXUNz3STz1MQ0I+OkVEPzZCWgjoKi1LTMCrBp0Up
 Bbs5KsbW1ABc+4BViAAAA
X-Change-ID: 20250820-atcphy-6-17-b7eaf23be17c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Hector Martin <marcan@marcan.st>, 
 stable@kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6416; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=Ffhri9SjHSf/0JyrOM8P9yB5VxqUTJqas+Uuy3v7zJ8=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8Zy27nOvKsmrbr5ZHFFULWSbmqNU6Cf/GdhsxZJDpOlr
 /YtNZzUUcrCIMbBICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZhITQTD/yApX4eCr+cqeRw1
 T5XvdD0t9Tg+mjlFZc70zo2Kl85v5WVkWPFqbkp+4sUwCT7P/bIazrIej3UUzwgFLfKW/b+uw4u
 PBQA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Hi,

This series includes changes to dwc3, tipd and a new phy driver to enable
USB3 on these machines. There's also some preparations to eventually enable
DisplayPort AltMode and Thunderbolt but those need future work.
Overall, this entire setup is quite a mess and we've tried to make it work
for quite a while now and finally came up with this solution here.

The USB3 controller is a very special kind of broken: It never sees any port
plug/unplug events that should normally arrive directly at dwc3.
Additionally, it needs to go through a full hard reset for every new connection
and most mode change. Details on why this is required are in the commit
description.

On top of that we need to keep the Type-C PHY bringup and dwc3 bringup tightly
synchronized. If there's a race between the two systems at best the port stops
working until a system reboot and at worst there's a watchdog somewhere that 
forcefully resets the entire SoC after ~5 seconds. I've only seen the latter
when bringing up thunderbolt so far but wouldn't be surprised if it happens
with just usb3 as well.

The entire bringup/bringup is orchestrated by a TIPD variant called CD321x
found on these machines. Unlike the original chips we however get no control
over which mode is negotiated or are even able to see the PDOs or VDOs. We only
get to know once the mode has been negotiated and have to act accordingly. I
even went as far as dumping the firmware from the chip to confirm this [1][2].

Hector wrote another summary of this early in January as well [3] and this
series is the only way we've been able to bring these ports up reliably.
It's not pretty in some places but I have no other idea how to implement this,
hence the RFC tag. Happy to discuss other approaches as well.

Both the PHY and the TIPD driver already include changes for DisplayPort
AltMode and USB4/Thunderbolt. These need additional work though but
since we can't control the mode devices end up in we can already merge
them now.

I used phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml as a template for the dt-binding
for atcphy (especially the ports). That was the most recent binding I found for
a PHY with similar features.

In order to test this you need to run the latest m1n1 master [4] because the
1.5.0 release does not include the code that lifts the tunables from Apple's
device tree. A kernel tree for testing is also tagged as apple-usb3-v1 at [5].

If the overall approach here is fine and no one can think of a better way to
support this SoC I'll drop the RFC and include the dts changes for the other
M1 and M2 machines as well.

Best,

Sven

[1] https://social.treehouse.systems/@sven/111092587315536174
[2] https://social.treehouse.systems/@sven/111096589846468888
[3] https://lore.kernel.org/all/fda8b831-1ffc-4087-8e7b-d97779b3ecc5@marcan.st/
[4] https://github.com/AsahiLinux/m1n1
[5] https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git

Signed-off-by: Sven Peter <sven@kernel.org>
---
Hector Martin (7):
      usb: dwc3: apple: Use synchronous role switch for apple
      usb: dwc3: apple: Adjust vendor-specific registers during init
      usb: typec: tipd: Update partner identity when power status was updated
      usb: typec: tipd: Use read_power_status function in probe
      usb: typec: tipd: Read data status in probe and cache its value
      usb: typec: mux: Introduce data_role to mux state
      usb: typec: tipd: Handle mode transitions for CD321x

Janne Grunau (1):
      usb: dwc3: apple: Do not use host-vbus-glitches workaround

Sven Peter (14):
      dt-bindings: usb: snps,dwc3: Allow multiple iommus
      dt-bindings: usb: Add Apple dwc3
      dt-bindings: phy: Add Apple Type-C PHY
      usb: dwc3: apple: Reset dwc3 during role switches
      usb: typec: tipd: Clear interrupts first
      usb: typec: tipd: Move initial irq mask to tipd_data
      usb: typec: tipd: Move switch_power_state to tipd_data
      usb: typec: tipd: Trace data status for CD321x correctly
      usb: typec: tipd: Add cd321x struct with separate size
      usb: typec: tipd: Read USB4, Thunderbolt and DisplayPort status for cd321x
      usb: typec: tipd: Register DisplayPort and Thunderbolt altmodes for cd321x
      soc: apple: Add hardware tunable support
      phy: apple: Add Apple Type-C PHY
      arm64: dts: apple: t8103: Add Apple Type-C PHY and dwc3 nodes

 .../devicetree/bindings/phy/apple,atcphy.yaml      |  210 ++
 .../devicetree/bindings/usb/apple,dwc3.yaml        |   82 +
 .../devicetree/bindings/usb/snps,dwc3.yaml         |    2 +-
 MAINTAINERS                                        |    3 +
 arch/arm64/boot/dts/apple/t8103-j274.dts           |   12 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |   12 +
 arch/arm64/boot/dts/apple/t8103-j313.dts           |   12 +
 arch/arm64/boot/dts/apple/t8103-j456.dts           |   12 +
 arch/arm64/boot/dts/apple/t8103-j457.dts           |   12 +
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi          |  137 ++
 arch/arm64/boot/dts/apple/t8103.dtsi               |  105 +
 drivers/phy/Kconfig                                |    1 +
 drivers/phy/Makefile                               |    1 +
 drivers/phy/apple/Kconfig                          |   14 +
 drivers/phy/apple/Makefile                         |    4 +
 drivers/phy/apple/atc.c                            | 2537 ++++++++++++++++++++
 drivers/soc/apple/Kconfig                          |    4 +
 drivers/soc/apple/Makefile                         |    3 +
 drivers/soc/apple/tunable.c                        |   77 +
 drivers/usb/dwc3/core.c                            |   85 +-
 drivers/usb/dwc3/core.h                            |   26 +
 drivers/usb/dwc3/drd.c                             |   11 +-
 drivers/usb/dwc3/host.c                            |    8 +-
 drivers/usb/typec/tipd/core.c                      |  569 ++++-
 drivers/usb/typec/tipd/tps6598x.h                  |    5 +
 drivers/usb/typec/tipd/trace.h                     |   39 +
 include/linux/soc/apple/tunable.h                  |   64 +
 include/linux/usb/typec_mux.h                      |    1 +
 28 files changed, 3987 insertions(+), 61 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250820-atcphy-6-17-b7eaf23be17c

Best regards,
-- 
Sven Peter <sven@kernel.org>



