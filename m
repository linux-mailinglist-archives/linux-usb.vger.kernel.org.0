Return-Path: <linux-usb+bounces-22912-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9DEA844D0
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 15:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAE8A7AE244
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 13:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2926C28A3ED;
	Thu, 10 Apr 2025 13:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRcyMX/K"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC7513D521;
	Thu, 10 Apr 2025 13:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291876; cv=none; b=KO08I4ETcYcGIdJp8Com7ef5y8GPASETwvMG5VPXFERJlScckliACT1AbV286pCFIKX/7UkP8IOGgEzJ/vD8sptxj3RtikPjbuWByagYVPfGdNXEEpHGENCpxy1snYi4hR6rtvKuiEN9D8l+7bDousw+LgoMao2jcR4toO853iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291876; c=relaxed/simple;
	bh=eIiMQKgW0qfKrtRv/tR0lIwLvAMOXUX5bVeXgJKz98U=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GIr88tp1j+yDdDsN63J/nEr+Od6rPg3bjYhx7xplqhoeyTdqt0kmU1SXxcyaC46evAq/ZWtL1qTKCSB6pyA4HnBNTufaDRaTVHxxWs+crkNN20bqSC4aBTpiQ5M201k+bxgcBNnbPsPS4m0v9yIqVcC/D85TfsE0Ea08cyWpB7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRcyMX/K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA583C4CEDD;
	Thu, 10 Apr 2025 13:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744291876;
	bh=eIiMQKgW0qfKrtRv/tR0lIwLvAMOXUX5bVeXgJKz98U=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FRcyMX/KrIb/8c2x9MAeXGAvMdQsG9AAgynCDamw0lp4za/jMxm2J08haa5fdbZDW
	 O2iy/8gKXU6i2V+Uwk35/0mBjliaqeXSJob0LhaQ+94NfJOXZ8ExVCzxP2HO634bXW
	 Rs3Rs6aZQD8U8IH81lpxqJOJyIITQBAr0tV29tysLN3irXHyfaPEBGqycb5AlS0Nbp
	 dSePgqT/u1NuM3gajIuJSIcQ69C0cOeC4HingR/+PeMLKBCwJ8QUeXCYR8V3MEVeK9
	 9tlCfo6XoiyWIM6OBIknsKBktYi7XrLlplWED5LyiUCcm0bjTpvkMtlSr0sjUWOxtx
	 y/4ujTsCHsKsw==
Date: Thu, 10 Apr 2025 08:31:14 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: imx@lists.linux.dev, kernel@pengutronix.de, linux-usb@vger.kernel.org, 
 krzk+dt@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
 shawnguo@kernel.org, devicetree@vger.kernel.org, jun.li@nxp.com, 
 conor+dt@kernel.org
To: Xu Yang <xu.yang_2@nxp.com>
In-Reply-To: <20250410064907.3372772-1-xu.yang_2@nxp.com>
References: <20250410064907.3372772-1-xu.yang_2@nxp.com>
Message-Id: <174429181452.3723388.8550778680032077798.robh@kernel.org>
Subject: Re: [PATCH v6 1/3] arm64: dts: imx95: add USB2.0 nodes


On Thu, 10 Apr 2025 14:49:05 +0800, Xu Yang wrote:
> Add USB2.0 controller and phy nodes.
> 
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa95xxSA
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v6:
>  - no changes
> Changes in v5:
>  - no changes
> Changes in v4:
>  - add Tb tag
> Changes in v3:
>  - no changes
> Changes in v2:
>  - add Rb tag
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 30 ++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250410 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250410064907.3372772-1-xu.yang_2@nxp.com:

arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: usb@4c200000 (fsl,imx95-usb): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx95-usb', 'fsl,imx7d-usb', 'fsl,imx27-usb'] is too long
	'fsl,imx95-usb' is not one of ['fsl,imx27-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx23-usb', 'fsl,imx25-usb', 'fsl,imx28-usb', 'fsl,imx35-usb', 'fsl,imx50-usb', 'fsl,imx51-usb', 'fsl,imx53-usb', 'fsl,imx6q-usb', 'fsl,imx6sl-usb', 'fsl,imx6sx-usb', 'fsl,imx6ul-usb', 'fsl,imx7d-usb', 'fsl,vf610-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx8dxl-usb', 'fsl,imx8ulp-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx8mm-usb', 'fsl,imx8mn-usb', 'fsl,imx93-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx6sll-usb', 'fsl,imx7ulp-usb']
	'fsl,imx27-usb' was expected
	'fsl,imx7ulp-usb' was expected
	'fsl,imx6ul-usb' was expected
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: usb@4c200000 (fsl,imx95-usb): interrupts: [[0, 176, 4], [0, 174, 4]] is too long
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: usb@4c200000 (fsl,imx95-usb): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: /soc/usb@4c200000: failed to match any schema with compatible: ['fsl,imx95-usb', 'fsl,imx7d-usb', 'fsl,imx27-usb']
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: usbmisc@4c200200 (fsl,imx95-usbmisc): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx95-usbmisc', 'fsl,imx7d-usbmisc', 'fsl,imx6q-usbmisc'] is too long
	'fsl,imx95-usbmisc' is not one of ['fsl,imx25-usbmisc', 'fsl,imx27-usbmisc', 'fsl,imx35-usbmisc', 'fsl,imx51-usbmisc', 'fsl,imx53-usbmisc', 'fsl,imx6q-usbmisc', 'fsl,vf610-usbmisc']
	'fsl,imx95-usbmisc' is not one of ['fsl,imx6ul-usbmisc', 'fsl,imx6sl-usbmisc', 'fsl,imx6sx-usbmisc', 'fsl,imx7d-usbmisc']
	'fsl,imx95-usbmisc' is not one of ['fsl,imx7ulp-usbmisc', 'fsl,imx8mm-usbmisc', 'fsl,imx8mn-usbmisc', 'fsl,imx8ulp-usbmisc']
	'fsl,imx6sll-usbmisc' was expected
	'fsl,imx6q-usbmisc' was expected
	'fsl,imx6ul-usbmisc' was expected
	from schema $id: http://devicetree.org/schemas/usb/fsl,usbmisc.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: usbmisc@4c200200 (fsl,imx95-usbmisc): reg: [[0, 1277166080, 0, 512], [0, 1275133972, 0, 4]] is too long
	from schema $id: http://devicetree.org/schemas/usb/fsl,usbmisc.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: /soc/usbmisc@4c200200: failed to match any schema with compatible: ['fsl,imx95-usbmisc', 'fsl,imx7d-usbmisc', 'fsl,imx6q-usbmisc']
arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: usb@4c200000 (fsl,imx95-usb): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx95-usb', 'fsl,imx7d-usb', 'fsl,imx27-usb'] is too long
	'fsl,imx95-usb' is not one of ['fsl,imx27-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx23-usb', 'fsl,imx25-usb', 'fsl,imx28-usb', 'fsl,imx35-usb', 'fsl,imx50-usb', 'fsl,imx51-usb', 'fsl,imx53-usb', 'fsl,imx6q-usb', 'fsl,imx6sl-usb', 'fsl,imx6sx-usb', 'fsl,imx6ul-usb', 'fsl,imx7d-usb', 'fsl,vf610-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx8dxl-usb', 'fsl,imx8ulp-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx8mm-usb', 'fsl,imx8mn-usb', 'fsl,imx93-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx6sll-usb', 'fsl,imx7ulp-usb']
	'fsl,imx27-usb' was expected
	'fsl,imx7ulp-usb' was expected
	'fsl,imx6ul-usb' was expected
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: usb@4c200000 (fsl,imx95-usb): interrupts: [[0, 176, 4], [0, 174, 4]] is too long
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: usb@4c200000 (fsl,imx95-usb): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: /soc/usb@4c200000: failed to match any schema with compatible: ['fsl,imx95-usb', 'fsl,imx7d-usb', 'fsl,imx27-usb']
arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: usbmisc@4c200200 (fsl,imx95-usbmisc): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx95-usbmisc', 'fsl,imx7d-usbmisc', 'fsl,imx6q-usbmisc'] is too long
	'fsl,imx95-usbmisc' is not one of ['fsl,imx25-usbmisc', 'fsl,imx27-usbmisc', 'fsl,imx35-usbmisc', 'fsl,imx51-usbmisc', 'fsl,imx53-usbmisc', 'fsl,imx6q-usbmisc', 'fsl,vf610-usbmisc']
	'fsl,imx95-usbmisc' is not one of ['fsl,imx6ul-usbmisc', 'fsl,imx6sl-usbmisc', 'fsl,imx6sx-usbmisc', 'fsl,imx7d-usbmisc']
	'fsl,imx95-usbmisc' is not one of ['fsl,imx7ulp-usbmisc', 'fsl,imx8mm-usbmisc', 'fsl,imx8mn-usbmisc', 'fsl,imx8ulp-usbmisc']
	'fsl,imx6sll-usbmisc' was expected
	'fsl,imx6q-usbmisc' was expected
	'fsl,imx6ul-usbmisc' was expected
	from schema $id: http://devicetree.org/schemas/usb/fsl,usbmisc.yaml#
arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: usbmisc@4c200200 (fsl,imx95-usbmisc): reg: [[0, 1277166080, 0, 512], [0, 1275133972, 0, 4]] is too long
	from schema $id: http://devicetree.org/schemas/usb/fsl,usbmisc.yaml#
arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: /soc/usbmisc@4c200200: failed to match any schema with compatible: ['fsl,imx95-usbmisc', 'fsl,imx7d-usbmisc', 'fsl,imx6q-usbmisc']






