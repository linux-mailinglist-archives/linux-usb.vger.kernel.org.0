Return-Path: <linux-usb+bounces-24556-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DD1AD0EEC
	for <lists+linux-usb@lfdr.de>; Sat,  7 Jun 2025 20:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06A653AED67
	for <lists+linux-usb@lfdr.de>; Sat,  7 Jun 2025 18:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6335E218AB0;
	Sat,  7 Jun 2025 18:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pROam3FP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8785202960;
	Sat,  7 Jun 2025 18:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749321734; cv=none; b=UofjH4JerhUsdCXCQlXNrHFOInWIjT9GOnoxkMAFRIl4oPtfefIlf3ljzQMCGX+vxGC0o0s7du4N2JHxoCLg7OjCRMD+OL67mIPUJzAfhbno4+1kGCD0bATFizhZUhopkmz4oS1A5g2RTtQqFz0WGryC+DOfJHInGWgjiPzL8gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749321734; c=relaxed/simple;
	bh=/bdP5Y4XIkeFFzTKAV1RK/3leIObSWu65+5yj+3skYA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WAGUFXmHzOkE3zEGPgYN7F+pGqOh7/rxHTq0Xngt3RDxkv+U1XL4vbBm049q84bRK9nMdUOFrl3wHNHU2lK3a6EK68uOuo+KBFuCrRoAdDKEN65Gbn0Vp38C37byT3/QmUdPVPD2nNI2S1956bX3T3+Fzeznyw7FofwfXM3jU68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pROam3FP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24832C4CEE4;
	Sat,  7 Jun 2025 18:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749321734;
	bh=/bdP5Y4XIkeFFzTKAV1RK/3leIObSWu65+5yj+3skYA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pROam3FPpojQo9hU28/X3W/rbHg5YVhVQRsUUqSOwC0Ot5OYSPP1/++1MY4XR+xrS
	 4+rG4S161f28LVH3cKBKHEKvG0reOhoGEhr64r8M7+lDh/7ufkcYC+/ABE/QnCMxX8
	 sHkiKJufIar98I60q9cSi+LQNBctxc6EUTJBR8tYFo6Y+sRfMlVxeBIvB8RQsEq51r
	 33d4AN6GDTU/ghDlCuXbLv8BOL22K9lPpR5pHq0/Y4+WmscKrQtagGWULWkboDU16X
	 oL5TNCahsjePhQH0hN0X42r+N+K5SsvZ58Mn4+QFb0v2E7foSU76ilwtMd/kIMQ9KR
	 bZujgXvC+Kf5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1232BC61CE8;
	Sat,  7 Jun 2025 18:42:14 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v5 0/4] arm64: dts: qcom: Add Lenovo ThinkBook 16 device
 tree
Date: Sat, 07 Jun 2025 20:41:58 +0200
Message-Id: <20250607-tb16-dt-v5-0-ae493364f525@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPaHRGgC/33OywrCMBCF4VeRrI1kcmvqyvcQFzYztYFipKnFC
 313Y0HbjS7/w/AxT5aoC5TYdvVkHQ0hhXjOYdYr5pvj+UQ8YG4mhTTCAPC+Asux5+S010qhKyp
 g+frSUR1uk7Q/5G5C6mN3n+AB3uvHMF9jAC44euO0PUrjtdvFFpNvYmxTbK99/iVtqvBgb3CQS
 8TOiMxI4XVZWjSO0P5F1AKRekZURqAgabFUhgr1F9E/EJ0R6YGsAIeqFj+RcRxfra9QAnoBAAA
 =
X-Change-ID: 20250511-tb16-dt-e84c433d87b1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749321732; l=5507;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=/bdP5Y4XIkeFFzTKAV1RK/3leIObSWu65+5yj+3skYA=;
 b=qu7Mu3ZpUTkmFFfiYvRG/H02cRBGAxbtrro34NWY+SJNzN8u3TPWLlhM/DwNOvg8RkPEcTd6H
 G71iwbbsh/+B/sOx40Dgb4inmrESsjccHknfn7tQn/7UaU/PH4OOmOz
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

Device tree for the Lenovo Thinkbook 16 G7 QOY

The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].

Supported features:

- USB type-c and type-a ports
- Keyboard
- Touchpad (all that are described in the dsdt)
- Touchscreen (described in the dsdt, no known SKUss)
- Display including PWM backlight control
- PCIe devices
- nvme
- SDHC card reader
- ath12k WCN7850 Wifi and Bluetooth
- ADSP and CDSP
- GPIO keys (Lid switch)
- Sound via internal speakers / DMIC / USB / headphone jack
- DP Altmode with 2 lanes (as all of these still do)
- Integrated fingerprint reader (FPC)
- Integrated UVC camera

Not supported yet:

- HDMI port.
- EC and some fn hotkeys.

Limited support yet:

- SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
but not UHS-I (SD104) and UHS-II.

- The GPU is not yet supported. Graphics is only software rendered. However, the 
node is defined and active since the available of the X1-45 support is soon-ish
and the Laptop boots with it enabled, too.

Notes:

- Putting the camera behind usb_2_dwc3 results in the camera switched of after 30 
seconds. With the stand-alone node as previously defined it stays usable and 
suspends, as intended. Sincethe sole reason for the USB camera to be in the 
devicetree is the required extra supply (which is guessed, as mentioned), and
its handling by power management, I would propose to keep it this way.

- The gpi_dma nodes appear to be implicitly enabled when a serial device is used.
I added them, no change in behaviour, though. Since this would be the only X1 
device adding them afaik, I left them out.

- The cma-memory is removed, it is not on all x1 devices as I assumed. 
Haven't found a case where it is required.

- i2c2 defines the keyboard and 4 different touchpad interfaces. With the bundling
of the pinctrl it seems to work better. I've had issues with only clock and touchpad
pinctrl on the i2c2 node, and not keyboard.

This work was done without any schematics or non-public knowledge of the device.
So, it is based on the existing x1 device trees, dsdt analysis, using HWInfo
ARM64, and pure guesswork. It has been confirmed, however, that the device really
has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a reset GPIO (eusb5
@43).

I have brought up the Thinkbook over the last 4 months since the x1p42100-crd
patches were available. The laptop is very usable now, and quite solid as a dev/
test platform. GPU support would be nice, though :)

Big thanks to Aleksandrs Vinarskis for helping (and sort of persisting) on the
fingerprint, camera and HDMI issues.

[1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7_QOY/ThinkBook_16_G7_QOY_Spec.pdf

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Changes in v5:
- removed patch for the CMN N160JCE-ELL panel, got reviewed
- re-ordered code in onboard_usb_dev as requested by Dmitry Baryshkov
- amended device tree with review notes from Dmitry Baryshkov where possible
  and resuting in a working laptop - added notes section
- Link to v4: https://lore.kernel.org/r/20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz

Changes in v4:
- squashed Makefile and dts commits to one
- picked up r-b from Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
- Link to v3: https://lore.kernel.org/r/20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz

Changes in v3:
- removed changes in x1e80100.dtsi and x1p42100.dtsi - resolved with [2]
- fixed schema errors with correct compatible string for the model
- added power management for the camera via onboard_usb_dev.c
- amended node ordering
- changed the panel driver used to edp-panel, added panel in the driver
- amended x1e80100.dtsi for exposing PM8010: This one is not present in the design, 
  added /delete-node/ for it.
- removed commented-out lines for sdhc, specified which don't work.
- corrected ZAP shader firmware name
- Link to v2: https://lore.kernel.org/r/20250516-tb16-dt-v2-0-7c4996d58ed6@oldschoolsolutions.biz

Changes in v2:
- removed nodes that gave DTC compile errors (pm8010_thermal, edp0_hpd_active)
- amended qcom.yaml
- shortened the commit titles to fit 75 chars
- Link to v1: https://lore.kernel.org/r/20250515-tb16-dt-v1-0-dc5846a25c48@oldschoolsolutions.biz

[2]: 20250520-topic-x1p4_tsens-v2-1-9687b789a4fb@oss.qualcomm.com

---
Jens Glathe (4):
      dt-bindings: arm: qcom: Add Lenovo TB16 support
      usb: misc: onboard_usb_dev: Add Bison Electronics Inc. Integrated Camera
      firmware: qcom: scm: Allow QSEECOM on Lenovo Thinkbook 16
      arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY device tree

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    2 +
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    2 +-
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1648 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 drivers/usb/misc/onboard_usb_dev.c                 |    2 +
 drivers/usb/misc/onboard_usb_dev.h                 |    8 +
 7 files changed, 1663 insertions(+), 1 deletion(-)
---
base-commit: 475c850a7fdd0915b856173186d5922899d65686
change-id: 20250511-tb16-dt-e84c433d87b1

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



