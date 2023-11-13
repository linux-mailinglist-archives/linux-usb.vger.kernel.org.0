Return-Path: <linux-usb+bounces-2817-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EA07E9E94
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 15:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 006671C20962
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 14:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADEE21116;
	Mon, 13 Nov 2023 14:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nVdhVCUL"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01520210EF;
	Mon, 13 Nov 2023 14:27:04 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22DB3D59;
	Mon, 13 Nov 2023 06:27:00 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 266C41C0007;
	Mon, 13 Nov 2023 14:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699885619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x/vcYfbmrCl2/iFXdAu/GqVZlYhoqhCpshthYgoXXWU=;
	b=nVdhVCULSDjsp9z6AP86jPhGmku9Exz1YuO7aUG5D3bxAV25trNO7UbUIbIKjLn6pO58XU
	Q015wDW7S3B0ZH3aBMk9IapaqSZlEXp1739X3DOxLDOz5gslxGoiYuaQUSVv3bWXIbmexe
	VtFWOO0LHDRhnZs9BgPdle3PY4YhpQiQWrLQNyGJx0Agj55WcsMkebHipDAZQBh63BlyoR
	/7cV2M/iPQVdaKK/4yLPqPdN48PV26RhPHUGeStoxTKY6ncKcF8Rpnu3n4SPzVtR+9lei4
	fLfaKloIVo9coEMojXoaYv6oxwe7Zmji7dUYDUdeqAYGzxCoF/M4lhyOneahWA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH 0/6] usb: cdns: fix suspend on J7200 by assuming reset on
 resume
Date: Mon, 13 Nov 2023 15:26:55 +0100
Message-Id: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAC8yUmUC/x3MPQqAMAxA4atIZgNNLCheRRz8STUOVRoUQby7x
 fEb3nvAJKkYtMUDSS413WMGlQVM6xAXQZ2zgR1XRFThVrNzeNqIdtohcUYefB2YGxLnIXdHkqD
 3/+z69/0Alpv3dmMAAAA=
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.12.3
X-GND-Sasl: theo.lebrun@bootlin.com

Hi,

Suspend on the TI J7200 platform is broken currently. There are two
components that need to be patched so that they assume reset on
resume: (1) the TI wrapper cdns3-ti & (2) the HOST role of the
controller.

Both only did their hardware configuration at probe time. We are talking
about suspend-to-RAM but also suspend-to-idle; we have power-domains
that turn off the controller in the second case which explains why
s2idle doesn't work either.

For cdns3-ti, we implement suspend & resume procedures only targeting
our newly created compatible (ti,j7200-usb). The goal is to avoid
breaking other platforms; it's unclear to me if power-domains are
toggling at s2idle on those as well. About S2R I don't think it's
targeted for those platforms.

For the HOST role, we add a quirk flag which gets passed as auxiliary
data by our wrapper TI driver. That avoids touching the behavior of
other platforms; again I'm unsure what is expected and I wouldn't want
to break stuff by re-initializing the role.

Those patches have been tested on the TI J7200 EVM GP. No need to
mention that other patches are required for S2R to work, but those will
be sent later down the road. Those USB patches are rather standalone.

Thanks,
Théo

--
Théo Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Théo Lebrun (6):
      dt-bindings: usb: ti,j721e-usb: add ti,j7200-usb compatible
      usb: cdns3-ti: move reg writes from probe into an init_hw helper
      usb: cdns3-ti: add suspend/resume procedures for J7200
      usb: cdns3: support power-off of controller when in host role
      usb: cdns3-ti: notify cdns core that hardware resets across suspend on J7200
      arm64: dts: ti: k3-j7200: use J7200-specific USB compatible

 .../devicetree/bindings/usb/ti,j721e-usb.yaml      |   1 +
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi          |   2 +-
 drivers/usb/cdns3/cdns3-ti.c                       | 141 +++++++++++++++------
 drivers/usb/cdns3/core.h                           |   1 +
 drivers/usb/cdns3/host.c                           |  20 +++
 5 files changed, 127 insertions(+), 38 deletions(-)
---
base-commit: 1d42d5c8f1ca11106579dcaadef4161fee03419e
change-id: 20231113-j7200-usb-suspend-2a47f2281e04

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


