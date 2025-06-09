Return-Path: <linux-usb+bounces-24628-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82754AD21E9
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 17:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 515B816D547
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 15:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342452192FA;
	Mon,  9 Jun 2025 15:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UG5uRvRG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966391DED4C;
	Mon,  9 Jun 2025 15:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481272; cv=none; b=hSinulFyG2Bv7o8pGFwxmicTNH6cNLTrYUSTBLl+OoS5Vd58/6lyVUfLyScmV6qeA8q63GPmfH0U17DHAbNPQDBhpGh9SJ39o7CjMpwncXCx+PjiZLavRNsoyJUkWTDKFbnikB3q/CBILpj6oJbaN7pVqa4zPH5SDt540NOH4Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481272; c=relaxed/simple;
	bh=GA9g7su1rgItZeBKFi4D2CqG/aw5r2xEBNpdq598jpk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=UPmA8Zj2v/mU2dFGYG7DtZHrTTJlLsnG0jto9OwXFmVfjV/+y84wjLLat80end5NpQw19bO8tZbL9RwiRPFBf2aspghBpIdi+3vh4jURjjoSOwecZgS3d7mX4u4mfJhY/kdc7QEz30Urw2dtyNM25UaJcsiKuov7YhivkpSYKm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UG5uRvRG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBD3C4CEFC;
	Mon,  9 Jun 2025 15:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749481272;
	bh=GA9g7su1rgItZeBKFi4D2CqG/aw5r2xEBNpdq598jpk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=UG5uRvRGFrGG7sdXfXt1JvZw8hh64OBYvxqbTedbbTxCQR3S/29/6novY1+bhgoo9
	 UBXEdLKhKTeyc1hTZPHcfZ7fJn3LDCgvVTP4iYjqTEtaNQ1c3kPxciAn5K7ONu1IuG
	 137yuyNtdFm+EO6GG0BSRP0Y4fICsF1BdJ9o10m8tmZ6yt9HS1x0qtIeNwlOv4O+P8
	 M3lm6QcHli7kbQyO0bcYNSukctWhwXhyUAfRKP/Wc6DJrrRFYI7lZ/8Mg6C86NAiHv
	 pQTDWYM2A5Fuks95pR1SZ3ru14whbsp35AE7+u50R8qmhkJPro9JDqOi5vqoyJcRgK
	 e8eOpFAsrmZjA==
Date: Mon, 09 Jun 2025 10:01:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250607-tb16-dt-v6-0-61a31914ee72@oldschoolsolutions.biz>
References: <20250607-tb16-dt-v6-0-61a31914ee72@oldschoolsolutions.biz>
Message-Id: <174948104927.2282557.9698249260002459893.robh@kernel.org>
Subject: Re: [PATCH v6 0/4] arm64: dts: qcom: Add Lenovo ThinkBook 16
 device tree


On Sat, 07 Jun 2025 21:19:35 +0200, Jens Glathe wrote:
> Device tree for the Lenovo Thinkbook 16 G7 QOY
> 
> The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].
> 
> Supported features:
> 
> - USB type-c and type-a ports
> - Keyboard
> - Touchpad (all that are described in the dsdt)
> - Touchscreen (described in the dsdt, no known SKUss)
> - Display including PWM backlight control
> - PCIe devices
> - nvme
> - SDHC card reader
> - ath12k WCN7850 Wifi and Bluetooth
> - ADSP and CDSP
> - GPIO keys (Lid switch)
> - Sound via internal speakers / DMIC / USB / headphone jack
> - DP Altmode with 2 lanes (as all of these still do)
> - Integrated fingerprint reader (FPC)
> - Integrated UVC camera
> 
> Not supported yet:
> 
> - HDMI port.
> - EC and some fn hotkeys.
> 
> Limited support yet:
> 
> - SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
> the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
> but not UHS-I (SD104) and UHS-II.
> 
> - The GPU is not yet supported. Graphics is only software rendered. However, the
> node is defined and active since the available of the X1-45 support is soon-ish
> and the Laptop boots with it enabled, too.
> 
> Notes:
> 
> - Putting the camera behind usb_2_dwc3 results in the camera switched of after 30
> seconds. With the stand-alone node as previously defined it stays usable and
> suspends, as intended. Sincethe sole reason for the USB camera to be in the
> devicetree is the required extra supply (which is guessed, as mentioned), and
> its handling by power management, I would propose to keep it this way.
> 
> - The gpi_dma nodes appear to be implicitly enabled when a serial device is used.
> I added them, no change in behaviour, though. Since this would be the only X1
> device adding them afaik, I left them out.
> 
> - The cma-memory is removed, it is not on all x1 devices as I assumed.
> Haven't found a case where it is required.
> 
> - i2c2 defines the keyboard and 4 different touchpad interfaces. With the bundling
> of the pinctrl it seems to work better. I've had issues with only clock and touchpad
> pinctrl on the i2c2 node, and not keyboard.
> 
> This work was done without any schematics or non-public knowledge of the device.
> So, it is based on the existing x1 device trees, dsdt analysis, using HWInfo
> ARM64, and pure guesswork. It has been confirmed, however, that the device really
> has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a reset GPIO (eusb5
> @43).
> 
> I have brought up the Thinkbook over the last 4 months since the x1p42100-crd
> patches were available. The laptop is very usable now, and quite solid as a dev/
> test platform. GPU support would be nice, though :)
> 
> Big thanks to Aleksandrs Vinarskis for helping (and sort of persisting) on the
> fingerprint, camera and HDMI issues.
> 
> [1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7_QOY/ThinkBook_16_G7_QOY_Spec.pdf
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
> Changes in v6:
> - removed compatible for qcom,sm8550-pmic-glink" in pmic-glink
> - fixed malformed gpu node
> - Link to v5: https://lore.kernel.org/r/20250607-tb16-dt-v5-0-ae493364f525@oldschoolsolutions.biz
> 
> Changes in v5:
> - removed patch for the CMN N160JCE-ELL panel, got reviewed
> - re-ordered code in onboard_usb_dev as requested by Dmitry Baryshkov
> - amended device tree with review notes from Dmitry Baryshkov where possible
>   and resuting in a working laptop - added notes section
> - Link to v4: https://lore.kernel.org/r/20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz
> 
> Changes in v4:
> - squashed Makefile and dts commits to one
> - picked up r-b from Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> - Link to v3: https://lore.kernel.org/r/20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz
> 
> Changes in v3:
> - removed changes in x1e80100.dtsi and x1p42100.dtsi - resolved with [2]
> - fixed schema errors with correct compatible string for the model
> - added power management for the camera via onboard_usb_dev.c
> - amended node ordering
> - changed the panel driver used to edp-panel, added panel in the driver
> - amended x1e80100.dtsi for exposing PM8010: This one is not present in the design,
>   added /delete-node/ for it.
> - removed commented-out lines for sdhc, specified which don't work.
> - corrected ZAP shader firmware name
> - Link to v2: https://lore.kernel.org/r/20250516-tb16-dt-v2-0-7c4996d58ed6@oldschoolsolutions.biz
> 
> Changes in v2:
> - removed nodes that gave DTC compile errors (pm8010_thermal, edp0_hpd_active)
> - amended qcom.yaml
> - shortened the commit titles to fit 75 chars
> - Link to v1: https://lore.kernel.org/r/20250515-tb16-dt-v1-0-dc5846a25c48@oldschoolsolutions.biz
> 
> [2]: 20250520-topic-x1p4_tsens-v2-1-9687b789a4fb@oss.qualcomm.com
> 
> ---
> Jens Glathe (4):
>       dt-bindings: arm: qcom: Add Lenovo TB16 support
>       usb: misc: onboard_usb_dev: Add Bison Electronics Inc. Integrated Camera
>       firmware: qcom: scm: Allow QSEECOM on Lenovo Thinkbook 16
>       arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY device tree
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    2 +
>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    2 +-
>  .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1650 ++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.c                   |    1 +
>  drivers/usb/misc/onboard_usb_dev.c                 |    2 +
>  drivers/usb/misc/onboard_usb_dev.h                 |    8 +
>  7 files changed, 1665 insertions(+), 1 deletion(-)
> ---
> base-commit: 475c850a7fdd0915b856173186d5922899d65686
> change-id: 20250511-tb16-dt-e84c433d87b1
> 
> Best regards,
> --
> Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 475c850a7fdd0915b856173186d5922899d65686

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250607-tb16-dt-v6-0-61a31914ee72@oldschoolsolutions.biz:

arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: pmic-glink (qcom,x1e80100-pmic-glink): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,x1e80100-pmic-glink', 'qcom,pmic-glink'] is too short
	'qcom,x1e80100-pmic-glink' is not one of ['qcom,qcm6490-pmic-glink', 'qcom,sc8180x-pmic-glink', 'qcom,sc8280xp-pmic-glink', 'qcom,sm8350-pmic-glink', 'qcom,sm8450-pmic-glink', 'qcom,sm8550-pmic-glink']
	'qcom,x1e80100-pmic-glink' is not one of ['qcom,sm7325-pmic-glink']
	'qcom,qcm6490-pmic-glink' was expected
	'qcom,sm8550-pmic-glink' was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,pmic-glink.yaml#






